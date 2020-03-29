# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils

DESCRIPTION="licenseutils is for creating copyright and license notices."
HOMEPAGE="https://savannah.nongnu.org/p/licenseutils"
SRC_URI="mirror://nongnu/licenseutils/licenseutils-${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="sys-apps/coreutils"
DEPEND="
	media-libs/libpng
	net-misc/curl
	dev-util/source-highlight
"
RDEPEND="${DEPEND}"
BDEPEND=">=sys-devel/autoconf-2.63"

src_prepare() {
	eapply -p0 "${FILESDIR}/${PN}-0.0.9-autotools.patch"
	eapply -p0 "${FILESDIR}/${PN}-0.0.9-fix-gnulib-fseterr.patch"

	default
	eautoreconf
}
