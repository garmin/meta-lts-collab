import os
from typing import List, Tuple

import regex
from oelint_parser.cls_item import Variable
from oelint_parser.cls_stash import Stash
from oelint_parser.rpl_regex import RegexRpl

from oelint_adv.cls_rule import Rule, Classification


class LTSCollabRulePatchUpstreamStatus(Rule):
    def __init__(self) -> None:
        super().__init__(id='oelint.ltscollab.upstreamstatus',
                         severity='warning',
                         run_on=[Classification.BBAPPEND,
                                 Classification.RECIPE],
                         message="Patch '{FILE}' should contain an Upstream-Status entry")

    def _get_recipe(self, items: List[Variable], path: str) -> List[Variable]:
        # Find matching SRC_URI assignment
        return [x for x in items if x.VarValue.find(os.path.basename(path)) != -1]

    def check(self, _file: str, stash: Stash) -> List[Tuple[str, int, str]]:
        res = []
        patches = stash.GetFiles(_file, '*.patch')
        patches.extend(stash.GetFiles(_file, '*.diff'))
        items = stash.GetItemsFor(filename=_file, classifier=Variable.CLASSIFIER,
                                   attribute=Variable.ATTR_VAR, attributeValue='SRC_URI')

        valid_class = {
            'Backport': r'Backport',
            'Inactive-Upstream': r'Inactive-Upstream(\s+\[.*\])*',
            'Submitted': r'Submitted(\s+\[.*\])*',
        }
        if _file.endswith('.bb'):
            valid_class['Inappropriate'] = r'Inappropriate(\s+\[.*\])*'

        for i in patches:
            with open(i) as input_:
                found = False
                recipe_match = self._get_recipe(items, i)
                if recipe_match:
                    recipe_match = recipe_match[0]
                else:
                    continue  # pragma: no cover
                try:
                    cnt = input_.read()
                    for m in RegexRpl.finditer(r'^Upstream-Status:\s*(?P<class>.*)', cnt, flags=regex.regex.MULTILINE):
                        found = True
                        if not any(RegexRpl.match(v, m.group('class')) for k, v in valid_class.items()):
                            _msg = "Upstream-Status in '{FILE}' doesn't pick from valid classifiers {cls}".format(
                                FILE=os.path.basename(i), cls=','.join(sorted(valid_class.keys())),
                            )
                            res += self.finding(recipe_match.Origin,
                                                recipe_match.InFileLine,
                                                override_msg=_msg)
                    if not found:
                        res += self.finding(recipe_match.Origin,
                                            recipe_match.InFileLine,
                                            self.Msg.replace('{FILE}', os.path.basename(i)))
                except UnicodeDecodeError:  # pragma: no cover
                    pass  # pragma: no cover
        return res
