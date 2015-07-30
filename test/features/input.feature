  Funcionalidade: componente para edição de campos
  Para permitir ao usuario alterar valores de campo
  Eu, como programador
  Desejo utilizar o componente h5-input

  Cenário: Renderização do h5.input [caso]
  Dado que o estado da estória é [estado]
  Quando eu renderizar o [caso]
  Então deverá ser exibido [spec]
  #combinações value, hintText e Labeltext
  Exemplos:
    caso                                      | estado                                                       | spec
    ---------------------------------------------------------------------------------------------------------------------------------------
    valor_em_branco                           | campo: {value:''}                                            | input
                                              |                                                              |   text is:
                                              |                                                              | body
                                              |                                                              |   contains: input
    ---------------------------------------------------------------------------------------------------------------------------------------
    valor_xx                                  | campo: {value:'xx'}                                          | input
                                              |                                                              |   text is: xx
                                              |                                                              | body
                                              |                                                              |   contains: input
    ---------------------------------------------------------------------------------------------------------------------------------------
    label_text                                | campo: {labelText:'name'}                                    | label_semFoco
                                              |                                                              |   text is: name
    ---------------------------------------------------------------------------------------------------------------------------------------
    label_text && value                       | campo: {labelText:'name', value:'xx'}                        | label_semFoco
                                              |                                                              |   text is: name
                                              |                                                              | input
                                              |                                                              |   text is: xx
    ---------------------------------------------------------------------------------------------------------------------------------------
    label_text && hintText                    | campo: {labelText:'name', value:'', hintText:'Digite xx'}    | input
                                              |                                                              |   text is:
                                              |                                                              | hintText
                                              |                                                              |   text is: name
    ---------------------------------------------------------------------------------------------------------------------------------------
    label_text && value && hintText           | campo: {labelText:'name', value:'xx', hintText:'Digite xx'}  | label_semFoco
                                              |                                                              |   text is: name
                                              |                                                              | input
                                              |                                                              |   text is: xx
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_com_foco                            | _autofocus: 'campo', campo: {value:''}                       | body
                                              |                                                              |   contains: hr_foco
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_com_foco_hintText                   | _autofocus: 'campo', campo: {value:'', hintText:'Digite xx'} | body
                                              |                                                              |   contains: hr_foco
                                              |                                                              | hintText
                                              |                                                              |   text is: Digite xx
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_com_foco_e_value_xx                 | _autofocus: 'campo', campo: {value:'xx'}                     | body
                                              |                                                              |   contains: hr_foco
                                              |                                                              | input
                                              |                                                              |   text is:  xx
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_com_foco_e_labelText_e_hintText     | _autofocus: 'campo', campo: {value:'',                       | body
                                              |     hintText:'Digite xx', labelText:'name'                   |   contains: hr_foco
                                              |   }                                                          | input
                                              |                                                              |   text is:
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_com_foco_value_labelText_e_hintText | _autofocus: 'campo', campo: {value:'xx',                     | body
                                              |     hintText:'Digite xx', labelText:'name'                   |   contains: hr_foco
                                              |   }                                                          | input
                                              |                                                              |   text is: xx
                                              |                                                              | label_comFoco
                                              |                                                              |   text is: name
    ---------------------------------------------------------------------------------------------------------------------------------------
    foco_value_xx_labelText                   | _autofocus: 'campo', campo: {value:'xx', labelText:'name'}   | body
                                              |                                                              |   contains: hr_foco
                                              |                                                              | input
                                              |                                                              |   text is:  xx
                                              |                                                              | label_comFoco
                                              |                                                              |   text is: name
    ---------------------------------------------------------------------------------------------------------------------------------------
    input_erro                                | campo: {error:'requerido'}                                   | labelError
                                              |                                                              |   text is: requerido
                                              |                                                              | hr_error
                                              |                                                              |   color scheme: 100% #FF0000
    ---------------------------------------------------------------------------------------------------------------------------------------
    desabilitado                              | campo: {disabled: 'Campo indisponivel'}                      | input
                                              |                                                              |   text is:
                                              |                                                              | body
                                              |                                                              |   contains: input

  Cenário: validação ao sair do campo [caso]
  Dado que o estado da estória é [estado]
  Quando eu renderizar o [caso]
  E eu sair do campo
  Entao deverá ser exibido [spec]

  Exemplos:
    caso      | estado                                   | spec
    -----------------------------------------------------------------------------------
    sem valor | _autofocus: 'campo', campo: {value:'',   | labelError
              |   validations: [requerido]               |   text is: requerido
              | }                                        | hr_error
              |                                          |   color scheme: 100% #FF0000
    -----------------------------------------------------------------------------------
    com valor | _autofocus: 'campo', campo: {value:'xx', | labelError
              |   validations: [requerido]               |   absent
              | }                                        | hr_error
              |                                          |   absent
              |                                          | input
              |                                          |   text is:  xx


  Cenário: validação da escrita no h5-input [caso]
  Dado que o estado da estória é [estado]
  Quando eu renderizar o h5-input
  E eu digitar no campo [text]
  E eu sair do campo
  Entao deverá ser exibido [spec]


  Exemplos:
    caso                            | estado                                 | text | spec
    --------------------------------------------------------------------------------------------------------------------
    sem validação                   | _autofocus: 'campo', campo: {value:''} | test | input
                                    |                                        |      |  text is: test
                                    |                                        |      |
    --------------------------------------------------------------------------------------------------------------------
    com validação                   | _autofocus: 'campo', campo: {value:'', | test | input
                                    |  validations: [requerido]              |      |  text is: test
                                    | }                                      |      | labelError
                                    |                                        |      |   absent
                                    |                                        |      | hr_error
                                    |                                        |      |   absent
    --------------------------------------------------------------------------------------------------------------------
    com validação e texto em branco | _autofocus: 'campo', campo: {value:'', |      | input
                                    |   validations: [requerido]             |      |  text is:
                                    | }                                      |      | labelError
                                    |                                        |      |   text is: requerido
                                    |                                        |      | hr_error
                                    |                                        |      |   color scheme: 100% #FF0000
    --------------------------------------------------------------------------------------------------------------------
    com validação numerica          | _autofocus: 'campo', campo: {value:'', | test | input
                                    |   validations: [numerico]              |      |  text is: test
                                    | }                                      |      | labelError
                                    |                                        |      |   text is: Necessario ser numerico
                                    |                                        |      | hr_error
                                    |                                        |      |   color scheme: 100% #FF0000
    --------------------------------------------------------------------------------------------------------------------

#validaçao e formatação enquanto digita de campos numericos, datas, cpf, cep...
# cenario varios campos
# implementar icones
@pendente
#Cenário: Icones
