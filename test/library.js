.given('que tenho uma estoria com um estado inicial', function () {
    mock = {
        editing: {
            c1: '',
            c2: 'val'
        },
        editing_errors: {
            c1: 'Obrigatório'
        }
    }
});
when('acabar de renderizar [render]', function (render) {
    var view = 'react.create ' + render;
    filewrite('gerado/app/view.js', view);

    < h5.input store = mock name = "CAMPO" / >

        run(webpack);
}).
then('Entao validar [spec]', function (spec) {
    filewrite('gerado/galen/view.spec', spec)
    run(galel);
})
