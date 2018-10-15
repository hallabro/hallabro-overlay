# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit git-r3 cmake-utils bash-completion-r1 python-single-r1

EGIT_REPO_URI="https://github.com/jaagr/polybar"

DESCRIPTION="A fast and easy-to-use tool for creating status bars."
HOMEPAGE="https://github.com/jaagr/polybar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+alsa i3 mpd curl network pulseaudio bash-completion zsh-completion"

RDEPEND="
  x11-base/xcb-proto
  x11-libs/cairo[xcb]
  x11-libs/libxcb[xkb]
  x11-libs/xcb-util-image
  x11-libs/xcb-util-wm

  alsa? ( media-libs/alsa-lib )
  bash-completion? ( app-shells/bash )
  curl? ( net-misc/curl )
  i3? ( dev-libs/jsoncpp || ( x11-wm/i3 x11-wm/i3-gaps ) )
  mpd? ( media-libs/libmpdclient )
  network? ( net-wireless/wireless-tools )
  pulseaudio? ( media-sound/pulseaudio )
  zsh-completion? ( app-shells/zsh )
"

DEPEND="${RDEPEND}"

src_configure() {
  local mycmakeargs=(
    -DENABLE_ALSA="$(usex alsa)"
    -DENABLE_CURL="$(usex curl)"
    -DENABLE_I3="$(usex i3)"
    -DENABLE_MPD="$(usex mpd)"
    -DENABLE_NETWORK="$(usex network)"
    -DENABLE_PULSEAUDIO="$(usex pulseaudio)"
  )

  cmake-utils_src_configure
}

src_install() {
  doman man/polybar.1

  dobin "${BUILD_DIR}/bin/polybar"
  dobin "${BUILD_DIR}/bin/polybar-msg"

  insinto "/usr/share/doc/${P}"
  doins doc/config

  if use zsh-completion; then
    insinto /usr/share/zsh/site-functions
    doins doc/zsh/_polybar
    doins doc/zsh/_polybar_msg
  fi

  if use bash-completion; then
    newbashcomp doc/bash/polybar ${PN}
  fi
}