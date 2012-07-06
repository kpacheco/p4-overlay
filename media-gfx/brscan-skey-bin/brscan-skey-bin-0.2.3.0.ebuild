EAPI=4

inherit versionator

DESCRIPTION="Add your PC to Brother multifunction device \"Scan to PC\" menu"
HOMEPAGE="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_scn.html"

MY_PN="${PN%-bin}"
MY_PV="$(replace_version_separator 3 -)"


SRC_URI="amd64? ( http://www.brother.com/pub/bsc/linux/dlf/${MY_PN}-${MY_PV}.amd64.deb )
	x86? ( http://www.brother.com/pub/bsc/linux/dlf/${MY_PN}-${MY_PV}.i386.deb )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="gimp"

# brscan1 2 and 4 can also be used here but they are not in the tree
DEPEND="media-gfx/sane-backends[usb]
	media-gfx/brscan3"
RDEPEND="${DEPEND}
	gimp? ( media-gfx/gimp )"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	tar xzf data.tar.gz
}

src_install() {
	cp -pr opt ${D} || die
	dosym ${D}/opt/brother/scanner/brscan-skey/brscan-skey /usr/bin/brscan-skey || die
}

pkg_postinst() {
	${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-${MY_PV}.sh 0
}

pkg_prerm() {
	${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-${MY_PV}.sh R
}
