#!/bin/bash

ZIP_FILE="build/struct.zip"

./prepare-publish.sh

# publish to haxelib
haxelib submit ${ZIP_FILE}

# publish to npm
npm publish
