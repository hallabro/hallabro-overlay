# Copyright Robin Hallabro <robin@hallabro.nu>
# Distributed under the terms of the GNU General Public License v3 or later
# $Header: $

EAPI=6

inherit git-r3 eutils

DESCRIPTION="Ly is a lightweight, TUI (ncurses-like) display manager for GNU/Linux"
HOMEPAGE="https://github.com/cylgom/ly"
SRC_URI=""
EGIT_REPO_URI="https://github.com/cylgom/ly.git"
PATCHES="${FILESDIR}/Makefile.patch"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="systemd"

DEPEND="
  sys-devel/make
  sys-libs/ncurses
  systemd? ( sys-apps/systemd )
"

RDEPEND="sys-apps/util-linux
  sys-apps/sysvinit
  virtual/pam
  x11-apps/xauth
  x11-apps/xinit
"

src_compile() {
  emake
}

src_install() {
  dobin bin/ly
  doinitd "${FILESDIR}/ly"

  insinto "/usr/share/${PN}"
  doins res/config.ini
  doins xsetup.sh

  if use systemd; then
	systemd_newunit ly.service
  fi
}
