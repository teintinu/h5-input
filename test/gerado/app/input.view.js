import React from 'react';
import HInput from '../../../h5-input/h5-input';

window.hsession = {
    language: 'pt_br'
};
var mock_store = {
    fields: {
        name: {
            labelText: "Nome",
            hintText: "Digite seu nome",
            error: ''
        }
    }
}

function createViewTest() {
    return React.createElement(HInput, {
        store: mock_store,
        field: 'name'
    })
}
var x = createViewTest();

React.render( < x / > , document.body);
