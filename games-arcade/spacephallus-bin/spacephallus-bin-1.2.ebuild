# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit games

DESCRIPTION="Fun shoot-em-up with a retro 8-bit theme"
HOMEPAGE="http://www.charliesgames.com/wordpress/?page_id=18"
SRC_URI="http://7clams.org/distfiles/p4-overlay/SpacePhallusLinux.tar.gz
	http://www.charliesgames.com/phallus/SpacePhallusLinux.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
RESTRICT="mirror strip"

RDEPEND="media-libs/mesa
	virtual/opengl
	x11-base/xorg-server[-minimal]
		amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-xlibs
		)"

S=${WORKDIR}/SpacePhallusLinux
dir=/opt/charliesgames/phallus

src_install() {
	mkdir -p ${D}/${dir}
	mv "Space Phallus" ${D}/${dir}/spacephallus || die
	dodoc Readme.txt
	doicon phalluslogo.png
	make_desktop_entry "${dir}/spacephallus" "Space Phallus" "phalluslogo" "Game;ArcadeGame" "Comment=${DESCRIPTION}"

	prepgamesdirs
}
