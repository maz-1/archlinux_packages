#!/bin/bash
WORKING_DIR=/opt/dassault-systemes/DraftSight/Linux
cd "${WORKING_DIR}"
if [[ -z "${DEPLOY_ENV}" ]]; then
  export LD_PRELOAD=/usr/lib/libfreetype.so:/usr/lib/faketime/libfaketime.so.1
else
  export LD_PRELOAD=${LD_PRELOAD}:/usr/lib/libfreetype.so:/usr/lib/faketime/libfaketime.so.1
fi
export FAKETIME='2020-02-29 08:15:42'
export vblank_mode=0
unset XDG_CURRENT_DESKTOP
unset DESKTOP_SESSION
unset GNOME_DESKTOP_SESSION_ID
exec "${WORKING_DIR}/DraftSight" "$@"
