#!/bin/bash
homedir=~
eval homedir=$homedir
HMCL_DIR="${homedir}/.hmcl"
SRC_JAR="/opt/hmcl/hmcl.jar"
TGT_JAR="${HMCL_DIR}/hmcl.jar"
mkdir -p "${HMCL_DIR}"
cd "${HMCL_DIR}"
ls hmcl.json > /dev/null 2>&1 || touch hmcl.json
#if cmp --silent "$SRC_JAR" "$TGT_JAR" ; then
#    echo "jar file ok"
#else
#    rm -f "$TGT_JAR"
#    cp "$SRC_JAR" "$TGT_JAR"
#fi
if [ ! -f "$TGT_JAR" ]; then
    ln -s "$SRC_JAR" "$TGT_JAR"
fi
if [ ! -f "${homedir}/.hmcl/background.png" ]; then
    ln -s "/opt/hmcl/background.png" "${homedir}/.hmcl/background.png"
fi

GL_VENDOR=$(glxinfo | grep "OpenGL vendor string" | cut -f2 -d":" | xargs)

if [ "${GL_VENDOR}" = "AMD" ]; then
    export allow_glsl_extension_directive_midshader=true
    export force_glsl_extensions_warn=true
    export mesa_glthread=true
    export vblank_mode=0
fi

/usr/lib/jvm/java-11-openjdk/bin/java --module-path /usr/lib/jvm/java-11-openjfx/lib --add-modules=javafx.base --add-modules=javafx.fxml --add-modules=javafx.graphics --add-modules=javafx.media --add-modules=javafx.swing --add-modules=javafx.web --add-modules=javafx.controls  -jar hmcl.jar

