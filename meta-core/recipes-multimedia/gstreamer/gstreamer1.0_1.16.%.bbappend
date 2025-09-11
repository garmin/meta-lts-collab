FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://CVE-2024-47606.patch \
"

# fixed-version
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47600
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47600"

# fixed-version
# Patched in gstreamer1.0-plugins-bad_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-40474"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-40474"

# fixed-version:
# Patched in gstreamer1.0-plugins-bad_1.16.%.bbappend
# with CVE-2023-40474.patch
# https://security-tracker.debian.org/tracker/CVE-2023-40475"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-40475"

# fixed-version:
# 1.16.3 gst-plugins-bad not-affected (AV1 parser introduced in 1.17.1)
# https://security-tracker.debian.org/tracker/CVE-2024-0444"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-0444"

# fixed-version:
# Patched in gstreamer1.0-plugins-bad_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-40476"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-40476"

# fixed-version:
# 1.16.3 gst-plugins-bad not-affected (AV1 parser introduced in 1.17.1)
# https://security-tracker.debian.org/tracker/CVE-2023-44429"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-44429"

# fixed-version:
# Patched in gstreamer1.0-plugins-bad_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-44446"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-44446"

# fixed-version:
# 1.16.3 gst-plugins-bad not-affected (AV1 parser introduced after 1.18.4)
# https://security-tracker.debian.org/tracker/CVE-2023-50186"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-50186"

# fixed-version:
# Patched in gstreamer1.0-plugins-bad_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-37329"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-37329"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-37327"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-37327"

# fixed-version:
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2023-37328"
CVE_CHECK_CVE_WHITELIST += "CVE-2023-37328"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47613"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47613"

# fixed-version:
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47615"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47615"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47537.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47537"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47537"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47537.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47539"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47539"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47537.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47597"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47597"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47537.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47598"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47598"

# fixed-version:
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# with patch CVE-2024-47607.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47607"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47607"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47538.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47538"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47538"

# fixed-version:
# Patched in gstreamer1.0_1.16.%.bbappend
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47606"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47606"

# fixed-version:
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# with patch CVE-2024-47775.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47775"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47775"

# fixed-version:
# Patched in gstreamer1.0-plugins-base_1.16.%.bbappend
# with patch CVE-2024-47775.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47776"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47776"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47775.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47777"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47777"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47775.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47778"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47778"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47774"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47774"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# https://security-tracker.debian.org/tracker/CVE-2024-47540"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47540"

# fixed-version:
# Patched in gstreamer1.0-plugins-good_1.16.%.bbappend
# with patch CVE-2024-47540.patch
# https://security-tracker.debian.org/tracker/CVE-2024-47834"
CVE_CHECK_CVE_WHITELIST += "CVE-2024-47834"
