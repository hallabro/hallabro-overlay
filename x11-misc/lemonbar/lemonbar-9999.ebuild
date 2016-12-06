# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Ebuild forked from soft overlay.
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb. This fork contains xft support."
HOMEPAGE="https://github.com/krypt-n/bar"
SRC_URI=""
EGIT_REPO_URI="https://github.com/krypt-n/bar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libxcb
		x11-libs/libXft
		>=dev-lang/perl-5"
RDEPEND="x11-libs/libxcb"

src_prepare() {
	epatch_user
	sed -i -e 's/-Os//' Makefile || die "Sed failed"
}
