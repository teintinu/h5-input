/* jslint node: true */

module.exports = function (library, expect, h5_test) {
  library
    .given('que o estado da estória é ([^\u0000]*)', function (estado, next) {

      expect(estado, 'estado').to.be.an('string');
      h5_test.replace('___fields___', estado);
      next();

    })
    .when('eu renderizar (.*)', function (caso, next) {
      h5_test.replace('___caso___', caso);
      h5_test.file('app/input.view.js');
      h5_test.serve('app/index.html');
      h5_test.pack('app', next);
    })

  .then('validar ([^\u0000]*)', function (spec, next) {
    expect(spec).to.be.an('string');
    h5_test.replace('$$$spec$$$', spec);
    h5_test.check('test/input.spec');
    // chamar o galen
    next();
  });
};
