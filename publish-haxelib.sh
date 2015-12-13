#!/bin/bash

# zip up the relevant files
git ls-files | \
  grep -E -v -e '^test' -e '^\.munit' -e '\.git(keep|ignore)$' -e '^.*\.sh' | \
  zip --filesync build/struct.zip -@

# publish to haxelib
haxelib submit build/struct.zip
