#!/bin/bash

GL_VENDOR=$(glxinfo | grep "OpenGL vendor string" | cut -f2 -d":" | xargs)
if [ "${GL_VENDOR}" = "AMD" ]; then
    if [ -x "$(command -v progl)" ]; then
        exec progl "$@"
    fi
fi
exec "$@"
