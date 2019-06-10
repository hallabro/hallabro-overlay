# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

SRC_URI="https://github.com/deadc0de6/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
DESCRIPTION="Save your dotfiles once, deploy them everywhere"
HOMEPAGE="https://github.com/deadc0de6/dotdrop"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="dev-python/jinja dev-python/pyyaml"
DEPEND=""
