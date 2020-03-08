# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils git-r3

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

src_unpack() {
	default

	EGIT_REPO_URI="https://git.savannah.gnu.org/r/gnulib.git" \
		EGIT_CHECKOUT_DIR="${WORKDIR}/gnulib" \
		git-r3_src_unpack
}

src_prepare() {
	eapply -p0 "${FILESDIR}"/${PN}-0.0.9-autotools.patch

	local bootstrap_opts=(
		--gnulib-srcdir=../gnulib
		--copy
		--skip-po
	)

	sh ./bootstrap "${bootstrap_opts[@]}" || die

	default
	eautoreconf
}
