# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit font

DESCRIPTION="TrueType font which mimics DEC VT220 terminal glyphs"
HOMEPAGE="http://sensi.org/~svo/glasstty/"
SRC_URI="http://7clams.org/distfiles/p4-overlay/Glass_TTY_VT220.ttf
	http://sensi.org/%7Esvo/glasstty/Glass_TTY_VT220.ttf"

LICENSE="as-is"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86"
IUSE=""
RESTRICT="mirror strip"

RDEPEND=""

S=${DISTDIR}
FONT_S=${S}
FONT_SUFFIX="ttf"
