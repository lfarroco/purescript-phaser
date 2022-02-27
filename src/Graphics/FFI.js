"use strict";

exports.getImpl = function (property, obj) {
 return obj[property];
};
exports.setImpl = function (property, obj, value) {
  obj[property] = value;
  return {}
};
