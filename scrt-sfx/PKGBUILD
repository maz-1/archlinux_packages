# Maintainer : maz-1 <loveayawaka at gmail dot com>
# https://github.com/maz-1/archlinux_packages/tree/master/scrt-sfx

_ubuntuver=20
pkgname=scrt-sfx
pkgver=9.0.2
pkgrel=1
pkgrev=2496
pkgdesc="Bundle of two Remote Clients : SecureCRT and SecureFX"
#arch=('x86_64' 'i686')
arch=('x86_64')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')

depends=('openssl' 'icu63' 'qt5-base' 'python2' 'glibc')
source=()
md5sums=()

makedepends=("xxd")

source_x86_64=("${pkgname}-${pkgver}.${pkgrev}.ubuntu${_ubuntuver}-64.tar.gz")
md5sums_x86_64=('SKIP')
#source_i686=("${pkgname}-${pkgver}.685.ubuntu13.tar.gz::http://storage.live.com/items/EED7455B8FCA288F%211035?a.tar.gz")
#md5sums_i686=('ad85b53b115414d77935fb31a6292cca')
options=('!strip')

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	
	install -Dm 755 ./SecureCRT ${pkgdir}/usr/lib/scrt-sfx/SecureCRT
	install -Dm 755 ./SecureFX ${pkgdir}/usr/lib/scrt-sfx/SecureFX
	install -Dm 755 ./sfxcl ${pkgdir}/usr/bin/sfxcl
	
	echo '#!/bin/sh' > "${pkgdir}/usr/lib/scrt-sfx/run.sh"
	echo '[[ -z "$LD_LIBRARY_PATH" ]] && export LD_LIBRARY_PATH=/usr/lib/scrt-sfx || export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/openssl-1.0-compat/:/usr/lib/scrt-sfx' >> "${pkgdir}/usr/lib/scrt-sfx/run.sh"
	echo 'exec /usr/lib/scrt-sfx/`basename "$0"` "$@"'  >> "${pkgdir}/usr/lib/scrt-sfx/run.sh"
	chmod +x "${pkgdir}/usr/lib/scrt-sfx/run.sh"
	ln -s /usr/lib/scrt-sfx/run.sh "$pkgdir/usr/bin/SecureCRT"
	ln -s /usr/lib/scrt-sfx/run.sh "$pkgdir/usr/bin/SecureFX"
	
	#install -Dm 644 ./libQtCore.so.4  ${pkgdir}/usr/lib/scrt-sfx/libQtCore.so.4
	#install -Dm 644 ./libQtDBus.so.4  ${pkgdir}/usr/lib/scrt-sfx/libQtDBus.so.4
	#install -Dm 644 ./libQtGui.so.4  ${pkgdir}/usr/lib/scrt-sfx/libQtGui.so.4
	#install -Dm 644 ./libQtNetwork.so.4  ${pkgdir}/usr/lib/scrt-sfx/libQtNetwork.so.4

	install -Dm 644 ./libClientConfigUiQt.so  ${pkgdir}/usr/lib/scrt-sfx/libClientConfigUiQt.so
	install -Dm 644 ./libCommonUiQt.so  ${pkgdir}/usr/lib/scrt-sfx/libCommonUiQt.so

	install -Dm 644 ./SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop
	install -Dm 644 ./SecureFX.desktop ${pkgdir}/usr/share/applications/SecureFX.desktop
	install -Dm 644 ./securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
	install -Dm 644 ./securefx_64.png ${pkgdir}/usr/share/vandyke/data/securefx_64.png

	install -Dm 644 ./SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_HISTORY.txt
	install -Dm 644 ./SecureCRT_README.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_README.txt
	install -Dm 644 ./SecureCRT_SecureFX_EULA.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_SecureFX_EULA.txt
	cp -r ./SecureCRTHelp ${pkgdir}/usr/share/doc/scrt/

	install -Dm 644 ./SecureFX_HISTORY.txt ${pkgdir}/usr/share/doc/sfx/SecureFX_HISTORY.txt
	install -Dm 644 ./SecureFX_README.txt ${pkgdir}/usr/share/doc/sfx/SecureFX_README.txt
	install -Dm 644 ./SecureCRT_SecureFX_EULA.txt ${pkgdir}/usr/share/doc/sfx/SecureCRT_SecureFX_EULA.txt
	cp -r ./SecureFXHelp ${pkgdir}/usr/share/doc/scrt/

	install -Dm 644 ./changelog.Debian.gz ${pkgdir}/usr/share/doc/scrt-sfx/changelog.Debian.gz
#	install -Dm 644 ./copyright ${pkgdir}/usr/share/doc/scrt-sfx/copyright

	install -Dm 644 ./sfxcl.1.gz  ${pkgdir}/usr/share/man/man1/sfxcl.1.gz

#	This is patch part.
		sh ${srcdir}/../patch-binary.sh ./
		install -Dm 644 "${srcdir}/../"SecureCRT.lic ${pkgdir}/usr/share/vandyke/data/SecureCRT.lic
		sed -i "s;__VERSION__;${pkgver};g" ${pkgdir}/usr/share/vandyke/data/SecureCRT.lic
		sed -i "s;__REV__;${pkgrev};g" ${pkgdir}/usr/share/vandyke/data/SecureCRT.lic
		install -Dm 644 "${srcdir}/../"SecureFX.lic ${pkgdir}/usr/share/vandyke/data/SecureFX.lic
		sed -i "s;__VERSION__;${pkgver};g" ${pkgdir}/usr/share/vandyke/data/SecureFX.lic
		sed -i "s;__REV__;${pkgrev};g" ${pkgdir}/usr/share/vandyke/data/SecureFX.lic
		rm ${pkgdir}/usr/lib/scrt-sfx/SecureCRT ${pkgdir}/usr/lib/scrt-sfx/SecureFX
		install -Dm 755 ./SecureCRT ${pkgdir}/usr/lib/scrt-sfx/SecureCRT
		install -Dm 755 ./SecureFX ${pkgdir}/usr/lib/scrt-sfx/SecureFX
		echo '#!/bin/sh' > ${pkgdir}/usr/lib/scrt-sfx/run.sh
		echo 'BINDIR=/usr/lib/scrt-sfx' >> ${pkgdir}/usr/lib/scrt-sfx/run.sh
		echo 'BINNAME=`basename $0`' >> ${pkgdir}/usr/lib/scrt-sfx/run.sh
		echo '[[ -z "$LD_LIBRARY_PATH" ]] && export LD_LIBRARY_PATH=${BINDIR} || export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/scrt-sfx' >> ${pkgdir}/usr/lib/scrt-sfx/run.sh
		echo '[ -f ~/.vandyke/SecureCRT/Config/${BINNAME}.lic ] && exec $BINDIR/${BINNAME} "$@" \ || ( install -Dm 644 /usr/share/vandyke/data/${BINNAME}.lic ~/.vandyke/SecureCRT/Config/${BINNAME}.lic && exec $BINDIR/${BINNAME} "$@" )' >> ${pkgdir}/usr/lib/scrt-sfx/run.sh
#	Patch part end

}


