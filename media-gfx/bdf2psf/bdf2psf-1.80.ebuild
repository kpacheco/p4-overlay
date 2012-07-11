# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Converts BDF fonts to PSF"
HOMEPAGE="http://packages.debian.org/sid/bdf2psf"
SRC_URI="mirror://debian/pool/main/c/console-setup/${P/-/_}_all.deb"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	pwd
	tar xf data.tar.gz
}

src_install() {
	dodoc usr/share/doc/bdf2psf/README.fontsets
	doman usr/share/man/man1/bdf2psf.1.gz
	dobin usr/bin/bdf2psf || die
	mkdir -p ${D}/usr/share
	cp -r usr/share/bdf2psf ${D}/usr/share/ || die
}
