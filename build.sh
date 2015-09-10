#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/valence && pwd )"
NPM_DIR="${DIR}/node_modules"
BIN_DIR="${NPM_DIR}/.bin"
BUILD_DIR="${DIR}/build"
SRC_DIR="${DIR}/src"
PID_DIR="${DIR}/pid"

pushd "${SRC_DIR}" >/dev/null
    npm install >/dev/null 2>&1
popd >/dev/null

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
