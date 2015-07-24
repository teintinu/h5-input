  Funcionalidade: componente para edição de campos
  Para permitir ao usuario alterar valores de campo
  Eu, como programador
  Desejo utilizar o componente h5-input

  Cenário: Renderização do h5.input [caso]
  Dado que o estado da estória é [estado]
  Quando eu renderizar o [caso]
  Então deverá ser exibido [spec]

  Exemplos:
    caso                      | estado                                                       | spec
    -----------------------------------------------------------------------------------------------------------------------
    valor_em_branco           | campo: {value:''}                                            | input
                              |                                                              |   text is:
                              |                                                              | body
                              |                                                              |   contains: input
    -----------------------------------------------------------------------------------------------------------------------
    valor_xx                  | campo: {value:'xx'}                                          | input
                              |                                                              |   text is: xx
                              |                                                              | body
                              |                                                              |   contains: input
    -----------------------------------------------------------------------------------------------------------------------
    label_text                | campo: {labelText:'name'}                                    | label_semFoco
                              |                                                              |   text is: name
    -----------------------------------------------------------------------------------------------------------------------
    input_com_foco            | _autofocus: 'campo', campo: {value:''}                       | body
                              |                                                              |   contains: hr_foco
    -----------------------------------------------------------------------------------------------------------------------
    input_com_foco_hintText   | _autofocus: 'campo', campo: {value:'', hintText:'Digite xx'} | body
                              |                                                              |   contains: hr_foco
                              |                                                              | hintText
                              |                                                              |   text is: Digite xx
    -----------------------------------------------------------------------------------------------------------------------
    input_com_foco_e_value_xx | _autofocus: 'campo', campo: {value:'xx'}                     | body
                              |                                                              |   contains: hr_foco
                              |                                                              | input
                              |                                                              |   text is:  xx
    -----------------------------------------------------------------------------------------------------------------------
    foco_value_xx_labelText   | _autofocus: 'campo', campo: {value:'xx', labelText:'name'}   | body
                              |                                                              |   contains: hr_foco
                              |                                                              | input
                              |                                                              |   text is:  xx
                              |                                                              | label_comFoco
                              |                                                              |   text is: name
    -----------------------------------------------------------------------------------------------------------------------
    input_erro                | campo: {error:'requerido'}                                   | labelError
                              |                                                              |   text is: requerido
                              |                                                              | hr_error
                              |                                                              |   color scheme: 100% #FF0000


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



  Cenário: validação geral do h5-input
  Dado que o estado da estória é [estado]
  Quando eu renderizar o h5-input
  Entao deverá ser exibido [spec]
  E eu digitar no campo
  Entao deverá ser exibido [spec_2]
  E eu sair do campo
  Entao deverá ser exibido [spec_3]

  Exemplos:
    estado                                 | spec       | spec_2        | spec_3
    -----------------------------------------------------------------------------------
    _autofocus: 'campo', campo: {value:'', | labelError | labelError    | labelError
      validations: [requerido]             |   absent   |   absent      |   absent
    }                                      | hr_error   | hr_error      | hr_error
                                           |   absent   |   absent      |   absent
                                           | input      | input         | input
                                           |   text is: |   text is: xx |   text is: xx

