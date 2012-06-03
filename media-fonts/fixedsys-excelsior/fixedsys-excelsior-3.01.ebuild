# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit font

DESCRIPTION="Pan-unicode bitmap font based on Microsoft's Fixedsys"
HOMEPAGE="http://www.fixedsysexcelsior.com/"
SRC_URI="http://7clams.org/distfiles/p4-overlay/FSEX300.ttf
	http://www.fixedsysexcelsior.com/fonts/FSEX300.ttf"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86"
IUSE=""
RESTRICT="mirror strip"

RDEPEND=""

S=${DISTDIR}
FONT_S=${S}
FONT_SUFFIX="ttf"
