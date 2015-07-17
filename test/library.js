.given('que eu tenho um estado em uma estoria', function () {
    mock = {
        editing: {
            c1: ''
        },
        editing_errors: {
            c1: 'Obrigatório'
        }
    }
})
.when('eu renderizar [render]', function (render) {
    var view = 'react.create ' + render;
    filewrite('gerado/app/view.js', view);

    < h5.input store = mock name = "CAMPO" / >

        run(webpack);
})
.then('Entao validar [spec]', function (spec) {
    filewrite('gerado/galen/view.spec', spec)
    run(galen);
})
