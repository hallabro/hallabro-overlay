# Copyright Robin Hallabro-Kokko <robin@hallabro.nu>
# Distributed under the terms of the GNU General Public License v3 or later
# $Header: $

EAPI=7

inherit git-r3 eutils autotools

DESCRIPTION="Do live calculations in rofi!"
HOMEPAGE="https://github.com/svenstaro/rofi-calc"
SRC_URI=""
EGIT_REPO_URI="https://github.com/svenstaro/rofi-calc.git"
# PATCHES="${FILESDIR}/Makefile.patch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
  >=x11-misc/rofi-1.5
  >=sci-libs/libqalculate-2.0
"

src_prepare() {
  default
  eautoreconf -i
}