from typing import List, Tuple

from oelint_parser.cls_stash import Stash

from oelint_adv.cls_rule import Rule, Classification


class LTSCollabRuleBackportsOnly(Rule):
    def __init__(self) -> None:
        super().__init__(id='oelint.ltscollab.backportsonly',
                         severity='error',
                         run_on=[
                             Classification.BBCLASS, Classification.DISTROCONF, Classification.MACHINECONF],
                         message="meta-lts-collab should not contain any distro, machine configs or bbclasses")

    def check(self, _file: str, stash: Stash) -> List[Tuple[str, int, str]]:
        return self.finding(_file, 1)
