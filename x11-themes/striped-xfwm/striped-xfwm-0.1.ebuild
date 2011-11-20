# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Xfwm4 port of lassekongo83's Emerald theme of the same name"
HOMEPAGE="http://xfce-look.org/content/show.php?content=104275"
SRC_URI="http://7clams.org/distfiles/p4-overlay/104275-Striped.tar.gz
	http://xfce-look.org/CONTENT/content-files/104275-Striped.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="gtk"

RDEPEND="xfce-base/xfwm4
		gtk? (
		>=x11-themes/gtk-engines-murrine-0.60.1
		x11-libs/gdk-pixbuf
		x11-libs/gtk+:2
		)"

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/Striped"

src_install() {
	insinto "/usr/share/themes/Striped"
	doins -r xfwm4 || die
	if use gtk; then
		doins -r gtk-2.0 || die
	fi
}
