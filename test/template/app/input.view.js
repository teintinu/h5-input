import React from 'react';
import HInput from '../../../src/h5-input';

// ___caso___

window.hsession = {
    language: 'pt_br'
};

function requerido(field, value) {
    if (!value) {
        mock_store.fields[field].error = 'requerido';

    } else {
        mock_store.fields[field].error = null;
    }
}

function numerico(field, value) {
    if (typeof (value) != Number)
        mock_store.fields[field].error = 'Necessario ser numerico';
    else
        mock_store.fields[field].error = null;
}
var mock_store = {

    fields: {
        campo: {labelText:'name', value:'', hintText:'Digite xx'}
    }
};
//var mock_store = {
//    fields: {
//        phone: {
//            type: 'numbers',
//            labelText: 'Phone'
//        },
//        cpf: {
//            type: 'numbers',
//            labelText: 'Cpf'
//        }
//    }
//};
var ViewInput = React.createClass({
    render: function () {
        return React.createElement(HInput, {
            store: mock_store,
            field: 'campo',
        })
    }
});
React.render(< ViewInput / >, document.body);
