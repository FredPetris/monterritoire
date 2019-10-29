var figlet = require("figlet");

const printChar = c => {
  return figlet.textSync(c, {
    font: "3x5",
    horizontalLayout: "default",
    verticalLayout: "default"
  });
};

module.exports = printChar;
