const printChar = require("./printChar.js");

function isEqual(array1, array2) {
  if (array1.length != array2.length) return false;
  else {
    for (var i = 0; i < array1.length; i++)
      if (array1[i] != array2[i]) {
        return false;
      }
    return true;
  }
}

const letters = {
  A: printChar("A").split(/\r\n|\r|\n/),
  B: printChar("B").split(/\r\n|\r|\n/),
  C: printChar("C").split(/\r\n|\r|\n/),
  D: printChar("D").split(/\r\n|\r|\n/),
  E: printChar("E").split(/\r\n|\r|\n/),
  F: printChar("F").split(/\r\n|\r|\n/)
};

const art = printChar("C");
for (let [key, value] of Object.entries(letters)) {
  if (isEqual(letters[key], art.split(/\r\n|\r|\n/))) console.log(key);
}
