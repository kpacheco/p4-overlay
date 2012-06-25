# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

linguas="$(printf 'linguas_%s ' \
        cs de es fr gl hu it ja nl pl pt pt_BR ru sk sv tl tr zh_CH zh_TW)"

DESCRIPTION=""
HOMEPAGE="http://mtpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gif jpeg jpeg2k lcms nls tiff ${linguas}"

DEPEND=">=x11-libs/gtk+-2.6.4:2[introspection]
	>=media-libs/libpng-1.2.37:0
	sys-libs/zlib
	>=media-libs/freetype-2.1.7
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg:0 )
	jpeg2k? ( media-libs/jasper )
	lcms? ( >=media-libs/lcms-1.16:0 )
	nls? ( sys-devel/gettext )
	tiff? ( >=media-libs/tiff-3.6.1 )"

RDEPEND="${DEPEND}"

DOCS=( "README" "NEWS" )

src_configure () {
	local myconf="${myconf} --prefix=/usr \
		man --mandir=/usr/share/man/man1"

	if use nls; then
	# remove references to unused language files
		myconf="${myconf} intl --localedir=/usr/share/locale"
			for h in ${linguas}; do
				if use ${h}; then
					langs="${langs} ${h//linguas_/}"
				fi
			done
		sed -i -e "3c langs = ${langs}" po/Makefile
	else
		rm -r po
	fi

	use gif && myconf="${myconf} GIF" || myconf="${myconf} nogif"
	use jpeg && myconf="${myconf} jpeg" || myconf="${myconf} nojpeg"
	use jpeg2k && myconf="${myconf} jasper" || myconf="${myconf} nojp2"
	use lcms && myconf="${myconf} lcms" || myconf="${myconf} nolcms"
	use tiff && myconf="${myconf} tiff" || myconf="${myconf} notiff"

	myconf="${myconf} cflags asneeded gtk2 ft"

	sh configure ${myconf} || die
}

src_install() {
	make DESTDIR=${D} install || die
}
