.given('que eu tenho um estado em uma estoria', function () {
    mock = {
        editing: {
            c1: '',
            c2: '',
        },
        editing_errors: {
            c1: '',
            c2: 'Obrigatório'
        }
    }
});
.when('eu renderizar [render]', function (render) {
    var view = 'react.create ' + render;
    filewrite('gerado/app/view.js', view);

    <h5.input store=mock name="CAMPO"/>

        run(webpack);
});
.then('Entao validar [spec]', function (spec) {
    filewrite('gerado/galen/view.spec', spec)
    run(galen);
});
//---------------------------------------------------------------------------
.given('que eu preenchi o h5-input com [texto]', function () {
        this.TypeInput = function (driver) {
            GalenPages.extendPage(this, driver, {
                input: "input[name='name']"
                typeText: function ('[texto]') {
                    this.input.typeText('[texto]');
                }
            });
        };
});
.when('eu passar o foco para outro componente', function (render) {
        this.TypeInput = function (driver) {
            GalenPages.extendPage(this, driver, {
                btn: "#btn"
                btn.click();
            });
        };
});
.then('o h5-input deve chamar a validação na estoria', function (spec) {
        this.mock_store.editing_errors;
        this.emit("Validou")
});
.and('esperar pela mensagem [mensagem]', function (spec) {
        this.addEventListener("Validou", this);
        run(webpack)
});
