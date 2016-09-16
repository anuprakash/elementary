# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

VALA_MIN_API_VERSION=0.20

inherit vala cmake-utils

DESCRIPTION="A sharing service that allows source apps to send their data to registered destination apps"
HOMEPAGE="https://launchpad.net/contractor"
SRC_URI="https://launchpad.net/${PN}/0.3/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE=""

RDEPEND="
	dev-libs/libgee:0.8
	dev-libs/glib:2"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig"

src_prepare() {
	cmake-utils_src_prepare
	vala_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DVALA_EXECUTABLE="${VALAC}"
	)
	cmake-utils_src_configure
}
