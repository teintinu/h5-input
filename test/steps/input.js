/* jslint node: true */

module.exports = function(library, expect, h5_test)
{
        library
        .given('que o estado da estória é ([^\u0000]*)', function (fields, next) {

            expect(fields, 'fields').to.be.an('string');
            h5_test.replace('$$$fields$$$', fields);
            next();

        })
        .when('eu renderizar o h5.input', function (next) {
            h5_test.generate('app/index.html', 'input.view.js', 'webpack.config.js');
            h5_test.server(); // webpack ...
            next();
        })

        .then('Entao validar $SPEC', function (spec, next) {
            expect(spec).to.be.an('string');
            h5_test.replace('$$$spec$$$', spec);

            filewrite('gerado/galen/view.spec', spec);
            run(galen);
            next();
        })
});

