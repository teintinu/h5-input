import React from 'react';
import HInput from '../../../src/h5-input/h5-input';

window.hsession = {
    language: 'pt_br'
};
var mock_store = {
    fields: {
        name: {
//            labelText: "Nome",
//            hintText: "Digite seu nome",
            error: '',
            validations: []
        }
    }
}

var ViewInput = React.createClass({
    render: function () {
        return React.createElement(HInput, {
            store: mock_store,
            field: 'name',
            rowSpan: [1],
            colSpan: [1]
        })
    }
});

React.render( <table> <tr> <ViewInput/> </ tr> </ table > , document.body);
