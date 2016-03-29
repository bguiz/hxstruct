#!/bin/bash

# compile
haxe dist.hxml

# update npm package.json from haxe haxelib.json
node devops/update-package-json-from-haxelib-json.js

# zip up the relevant files
git ls-files | \
  grep -E -v -e '^test' -e '^\.munit' -e '\.git(keep|ignore)$' -e '^.*\.sh' | \
  zip --filesync build/struct.zip -@

# publish to haxelib
haxelib submit build/struct.zip

# publish to npm
npm publish
