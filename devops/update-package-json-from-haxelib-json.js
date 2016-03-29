'use strict';

var fs = require('fs');
var path = require('path');

var haxelibJson = require('../haxelib.json');
var packageJson = require('../package.json');

[
  'version',
  'description',
  'tags'
].forEach((key) => {
  packageJson[key] = haxelibJson[key];
});

// Now write to file
console.log(packageJson); //DEBUG
fs.writeFileSync(
  path.resolve(__dirname, '../package.json'),
  JSON.stringify(packageJson, undefined, '  '));
