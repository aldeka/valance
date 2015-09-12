#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/valance && pwd )"
NPM_DIR="${DIR}/node_modules"
BIN_DIR="${NPM_DIR}/.bin"
BUILD_DIR="${DIR}/build"
SRC_DIR="${DIR}/src"
ASSETS_DIR="${DIR}/static"
PID_DIR="${DIR}/pid"

pushd "${SRC_DIR}" >/dev/null
    npm install >/dev/null 2>&1
popd >/dev/null

# clean
# rm -r ${BUILD_DIR} && mkdir ${BUILD_DIR} && mkdir ${BUILD_DIR}/scripts && mkdir ${BUILD_DIR}/styles

# copy over copies of HTML file and assets
# note that build.sh has to be rerun if either of these things change...
cp ${DIR}/index.html ${BUILD_DIR}/index.html
cp -r ${ASSETS_DIR} ${BUILD_DIR}

# browserify
echo "Starting browserify..."
"${BIN_DIR}/watchify" "${BUILD_DIR}/scripts/app.js" -d -o "${BUILD_DIR}/scripts/bundle.js" -t -v &
    echo $! > "${PID_DIR}/browserify.pid"

# jsx compilation
echo "Starting jsx compilation..."
"${BIN_DIR}/jsx" --extension jsx --harmony --watch "${SRC_DIR}/scripts" "${BUILD_DIR}/scripts"&
    echo $! > "${PID_DIR}/jsx.pid"

[ -d "${BUILD_DIR}/styles" ] || mkdir -p "${BUILD_DIR}/styles"
echo "Starting less compilation..."
"${BIN_DIR}/autoless" "${SRC_DIR}/styles" "${BUILD_DIR}/styles" &
    echo $! > "${PID_DIR}/less.pid"
