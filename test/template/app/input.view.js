import React from 'react'
import HInput from '../../../src/HInput'

// ___caso___

window.hsession = {
  language: 'pt_br'
}

// var NameField: EditStoreField = {
//   labelText: "Name",
//   hintText: "Write your name",
//   type: "text",
//   disabled: false,
//   value: "",
//   errorText: ""
// }
//
// export var test:EditStore =
//    {
//      fields:{name: NameField},
//      focus: null
//    }

function requerido (field, value) {
  if (!value) {
    mock_store.fields[field].error = 'requerido'

  } else {
    mock_store.fields[field].error = null
  }
}

function numerico (field, value) {
  if (typeof (value) != Number)
    mock_store.fields[field].error = 'Necessario ser numerico'
  else
    mock_store.fields[field].error = null
}
var mock_store = {
  fields: {
  ___fields___}
}
// var mock_store = {
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
// }
var ViewInput = React.createClass({
  render: function () {
    return React.createElement(HInput, {
      store: mock_store,
      field: 'campo',
      rowSpan: [1],
      colSpan: [1]
    })
  }
})
React.render(< table>
               < tr>
                 < ViewInput />
                 < / tr>
                   </table> , document.body)
