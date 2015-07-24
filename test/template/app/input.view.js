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
var mock_store = {

    fields: {
        ___fields___
    }
};

var ViewInput = React.createClass({
    render: function () {
        return React.createElement(HInput, {
            store: mock_store,
            field: 'campo',
            rowSpan: [1],
            colSpan: [1],
        })
    }
});

React.render( < table > < tr > < ViewInput / > < / tr> </table > , document.body);
