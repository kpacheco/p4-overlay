# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games eutils

DESCRIPTION="Action RPG similar to the Legend of Zelda"
HOMEPAGE="http://www.bindingofisaac.com/"
SRC_URI="binding-of-isaac_${PV}_i386.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
RESTRICT="fetch strip"

RDEPEND=">=media-libs/libsdl-1.2
	>=dev-db/sqlite-3
	>=media-libs/libpng-1.5
	>=x11-libs/gtk+-2[-aqua,introspection]
	dev-libs/expat
	media-libs/alsa-lib
	media-libs/mesa
	media-libs/libsndfile[-minimal]
	media-libs/mesa
	www-plugins/adobe-flash
	x11-libs/cairo
	x11-libs/libXinerama
	x11-libs/pango[X]
		amd64? (
	app-emulation/emul-linux-x86-baselibs
	app-emulation/emul-linux-x86-gtklibs
	app-emulation/emul-linux-x86-opengl
	app-emulation/emul-linux-x86-sdl
	app-emulation/emul-linux-x86-soundlibs
	app-emulation/emul-linux-x86-xlibs 
		)"

S=${WORKDIR}
dir=${D}/opt/isaac

pkg_nofetch() {
	elog "Fetch ${SRC_URI} and move or link it"
	elog "to ${DISTDIR}. You can play a demo at:"
	elog "http://www.newgrounds.com/portal/view/581168"
}

src_unpack() {
	unpack "${A}"
}

src_install() {	
	mkdir -p ${dir} ${D}/usr/games/bin
	mv isaac ${dir} || die
	ln -s ${dir}/isaac ${D}/usr/games/bin/isaac
	doicon ${FILESDIR}/isaac.png
	make_desktop_entry "isaac" "Binding of Isaac" "isaac" "Game;RolePlaying" "Comment=${DESCRIPTION}"

	prepgamesdirs
}
