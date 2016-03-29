'use strict';

var assert = require('assert');

var struct = require('../dist/js/struct.js').Struct;

// Very basic tests to ensure that the classes have been exported
for (var key in struct) {
  if (struct.hasOwnProperty(key)) {
    console.log(key, typeof struct[key]);
    assert(key.indexOf('.') < 0, 'exports do not contain ".": '+key);
    assert(typeof struct[key] === 'function', 'exports function: '+key);
  }
}
