/* jslint node: true */

module.exports = function (library, expect, h5_test) {
  library
    .given('que o estado da estória é ([^\u0000]*)', function (estado, next) {

      expect(estado, 'estado').to.be.an('string');
      h5_test.replace('___fields___', estado);
      next();

    })
    .when('eu renderizar o (.*)', function (caso, next) {
      h5_test.replace('___caso___', caso);
      h5_test.generate('app/index.html', 'app/input.view.js', 'app/webpack.config.js');
      //h5_test.server(); // webpack ...
      next();
    })

  .then('validar ([^\u0000]*)', function (spec, next) {
    expect(spec).to.be.an('string');
    h5_test.replace('$$$spec$$$', spec);
    h5_test.generate('test/input.spec');
    // chamar o galen
    next();
  });
};
