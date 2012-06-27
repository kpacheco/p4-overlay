# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

LINGUAS="cs de es fr gl hu it ja nl pl pt pt_BR ru sk sv tl tr zh_CH zh_TW"

DESCRIPTION="GTK+2 paint program to create pixel art and edit digital photos"
HOMEPAGE="http://mtpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gif jpeg jpeg2k lcms nls tiff threads truetype $(printf 'linguas_%s ' ${LINGUAS})"

DEPEND=">=x11-libs/gtk+-2.6.4:2
	>=x11-libs/pango-1.8.0
	>=dev-libs/atk-1.9.0
	>=media-libs/libpng-1.2.7:0
	>=sys-libs/zlib-1.2.1
	virtual/pkgconfig
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg:0 )
	jpeg2k? ( media-libs/jasper )
	lcms? ( >=media-libs/lcms-1.16:0 )
	nls? ( >=sys-devel/gettext-0.13.1 )
	tiff? ( >=media-libs/tiff-3.6.1 )
	truetype? ( >=media-libs/freetype-2.1.7 )"

RDEPEND="${DEPEND}"

DOCS=( "README" "NEWS" )

src_configure () {
	local myconf="${myconf} --prefix=/usr \
		man --mandir=/usr/share/man/man1"

	if use nls; then
	# remove references to unused language files
		myconf="${myconf} intl --localedir=/usr/share/locale"
		sed -i -e "3c langs = ${LINGUAS}" po/Makefile
	else
		rm -r po
	fi

	if use truetype; then
		sed -i -e "	71c \"ft\" ) NFT=YES;;" configure
		myconf="${myconf} ft"
	else
		myconf="${myconf} noft"
	fi

	use gif && myconf="${myconf} GIF" || myconf="${myconf} nogif"
	use jpeg && myconf="${myconf} jpeg" || myconf="${myconf} nojpeg"
	use jpeg2k && myconf="${myconf} jasper" || myconf="${myconf} nojp2"
	use lcms && myconf="${myconf} lcms" || myconf="${myconf} nolcms"
	use tiff && myconf="${myconf} tiff" || myconf="${myconf} notiff"
	use threads && myconf="${myconf} thread" || myconf="${myconf} nothread"
#	use truetype && myconf="${myconf} ft" || myconf="${myconf} noft"

	myconf="${myconf} gtk2"

	sh configure ${myconf} || die
}

src_install() {
	make DESTDIR=${D} install || die
}
