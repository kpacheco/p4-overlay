# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

WX_GTK_VER="2.8"

inherit games

DESCRIPTION="A Playstation 2 emulator (binary package)"
HOMEPAGE="http://www.pcsx2.net/"
SRC_URI="http://7clams.org/distfiles/p4-overlay/pcsx2-${PV}-r4594-linux.tar.gz
	http://pcsx2.net/files/28277 -> pcsx2-${PV}-r4594-linux.tar.gz
	http://pcsx2.googlecode.com/svn/trunk/pcsx2/gui/Resources/AppIcon64.png -> pcsx2.png"
RESTRICT="mirror strip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
LANGS="cs_CZ de_DE es_ES hu_HU it_IT ja_JP pt_BR ru_RU sv_SE tr_TR zh_CN zh_TW"
IUSE="$(printf 'linguas_%s ' ${LANGS})"
if use amd64; then
	ABI="x86"
fi

RDEPEND="
	x86? (
		app-arch/bzip2
		sys-libs/zlib
		media-libs/alsa-lib
		media-libs/glew
		media-libs/libsdl
		media-libs/portaudio
		media-gfx/nvidia-cg-toolkit
		virtual/jpeg
		virtual/opengl
		x11-libs/gtk+:2
		x11-libs/libICE
		x11-libs/libX11
		x11-libs/wxGTK[X]
	)
	amd64? ( media-gfx/nvidia-cg-toolkit[multilib]
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-gtklibs
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-soundlibs
		app-emulation/emul-linux-x86-wxGTK
	)"

S=${WORKDIR}/pcsx2-${PV}-r4594-linux
dir=${D}/opt/pcsx2

src_prepare() {
	for h in ${LANGS}; do
		if ! use linguas_${h}; then
			rm -r Langs/${h}
		fi
	done
}

src_install() {
	newman docs/pcsx2.man pcsx2.1
	dodoc docs/*.pdf
	rm -r docs
	mkdir -p ${dir}
	mv ${S}/* ${dir} || die
	doicon "${DISTDIR}/pcsx2.png"
	make_desktop_entry "/opt/pcsx2/launch_pcsx2_linux.sh" "PCSX2" "pcsx2" "Game;Emulator" "Comment=${DESCRIPTION}"

	prepgamesdirs
}
