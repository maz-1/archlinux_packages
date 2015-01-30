#!/bin/sh
BINDIR=/usr/lib/scrt-sfx
[ -f ~/.vandyke/SecureCRT/Config/SecureCRT.lic ] && exec $BINDIR/SecureCRT "$@" || (  install -Dm 644 /usr/share/vandyke/data/SecureCRT.lic ~/.vandyke/SecureCRT/Config/SecureCRT.lic && exec $BINDIR/SecureCRT "$@" )
