#!/bin/bash

ZIP_FILE="build/struct.zip"

# compile
haxe dist.hxml

# update npm package.json from haxe haxelib.json
node devops/update-package-json-from-haxelib-json.js

# zip up the relevant files
FILES_TO_ZIP=$( \
  git ls-files | \
  grep -E -v -e '^test' -e '^\.munit' -e '\.git(keep|ignore)$' -e '^.*\.sh' )

if [ "{$OS}" == "{Windows_NT}" ]; then
  7z a ${ZIP_FILE} ${FILES_TO_ZIP}
else
  zip --paths --filesync ${ZIP_FILE} ${FILES_TO_ZIP}
fi
