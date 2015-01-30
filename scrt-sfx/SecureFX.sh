#!/bin/sh
BINDIR=/usr/lib/scrt-sfx
[ -f ~/.vandyke/SecureCRT/Config/SecureFX.lic ] && exec $BINDIR/SecureFX "$@" ||  ( install -Dm 644 /usr/share/vandyke/data/SecureFX.lic ~/.vandyke/SecureCRT/Config/SecureFX.lic && exec $BINDIR/SecureFX "$@" )
