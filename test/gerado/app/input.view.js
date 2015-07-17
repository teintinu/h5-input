import React from 'react';
import HInput from '../../../h5-input/h5-input';

window.hsession = {
    language: 'pt_br'
};
var mock_store = {
    fields: {
        name: {
            floatingLabelText: "Nome",
            hintText: "Digite seu nome",
            //            validate: [V.required],
            error: 'obrigatorio'
        }
    }
}

function createViewTest() {
    return React.createElement(HInput, {
        store: mock_store
    })
}
var x = createViewTest();

React.render( < x / > , document.body);
