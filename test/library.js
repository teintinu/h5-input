var Yadda = require('yadda');
var English = Yadda.localisation.English;
var assert = require('assert');
var format = require('util').format;

module.exports = (function() {

    var mock_estado;

    var library = English.library()
    .define('ESTADO', /[^\u0000]*/)
        .given('que o estado da estória é $ESTADO', function (estado, next) {
            mock_estado = estado
            next();
        })
        .when('eu renderizar $RENDER', function (render, next) {
            var view =
                [
                 'require React from "react";
                 'function createViewTest()
                 '{'
                 '  return React.createElement(h5.input, {'
                 '       store={'+mock_estado+'}'
                 '       field="campo"
                  '  }'
                 '}'
                 'var res = createViewTest();'
                 'React.render(<res>, document.body);

                ].split('\n');





            filewrite('gerado/app/view.js', view);
            run('webpack-dev-server');
            next();
        })
        .then('Entao validar $SPEC', function (spec) {
            filewrite('gerado/galen/view.spec', spec)
            run(galen);
        })
    });










//---------------------------------------------------------------------------
//.given('que eu preenchi o h5-input com [texto]', function () {
//        this.TypeInput = function (driver) {
//            GalenPages.extendPage(this, driver, {
//                input: "input[name='name']"
//                typeText: function ('[texto]') {
//                    this.input.typeText('[texto]');
//                }
//            });
//        };
//});
//.when('eu passar o foco para outro componente', function (render) {
//        this.TypeInput = function (driver) {
//            GalenPages.extendPage(this, driver, {
//                btn: "#btn"
//                btn.click();
//            });
//        };
//});
//.then('o h5-input deve chamar a validação na estoria', function (spec) {
//        this.mock_store.editing_errors;
//        this.emit("Validou")
//});
//.and('esperar pela mensagem [mensagem]', function (spec) {
//        this.addEventListener("Validou", this);
//        run(webpack)
//});
