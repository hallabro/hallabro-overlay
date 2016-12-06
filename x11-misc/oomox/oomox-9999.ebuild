# Copyright Robin Hallabro <robin@hallabro.nu>
# Distributed under the terms of the GNU General Public License v3 or later
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Graphical application for generating different color variations of Numix theme (GTK2, GTK3)."
HOMEPAGE="https://github.com/actionless/oomox"
SRC_URI=""
EGIT_REPO_URI="https://github.com/actionless/oomox.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygobject dev-ruby/sass"
RDEPEND="x11-libs/gdk-pixbuf x11-themes/gtk-engines-murrine"

src_configure() {
	true
}
src_compile() {
	true
}
src_install() {
	mkdir "${D}/usr/lib" "${D}/usr/bin" -p
	cp -R "${S}/" "${D}/usr/lib/oomox" || die
	cp "${FILESDIR}/oomox-gui" "${D}/usr/bin/" || die
	cp "${FILESDIR}/oomox-cli" "${D}/usr/bin/" || die
}
