# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-info xorg-2

DESCRIPTION="X.org input driver based on libinput"

KEYWORDS="alpha amd64 arm hppa ~ia64 ~ppc ~ppc64 x86"
IUSE=""

RDEPEND=">=dev-libs/libinput-1.2.0:0="
DEPEND="${RDEPEND}"

DOCS=( "README.md" "conf/60-libinput.conf" )

pkg_pretend() {
	CONFIG_CHECK="~TIMERFD"
	check_extra_config
}
