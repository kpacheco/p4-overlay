# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Port of Striped VS for GTK+2, Emerald, and Xfce"
HOMEPAGE="http://lassekongo83.deviantart.com/art/Striped-GTK-and-Emerald-110989539"
SRC_URI="http://7clams.org/distfiles/p4-overlay/Striped_GTK_and_Emerald_by_lassekongo83.7z
	http://www.deviantart.com/download/110989539/Striped_GTK_and_Emerald_by_lassekongo83.7z
	xfce? (
		http://7clams.org/distfiles/p4-overlay/104275-Striped.tar.gz
		http://xfce-look.org/CONTENT/content-files/104275-Striped.tar.gz
	)"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="emerald xfce"

RDEPEND=">=x11-themes/gtk-engines-murrine-0.60.1
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	emerald? (
		x11-wm/emerald
	)
	xfce? (
		xfce-base/xfwm4
	)"

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/Striped"

src_unpack() {
	unpack Striped_GTK_and_Emerald_by_lassekongo83.7z
	if use xfce; then
		unpack 104275-Striped.tar.gz
	fi
}

src_install() {
	if use emerald; then
		insinto "/usr/share/emerald/themes/Striped"
		doins ../Striped.emerald || die
	fi
	insinto "/usr/share/themes/Striped"
	if use xfce; then
		doins -r xfwm4 || die
	fi
	doins -r gtk-2.0 || die

}
