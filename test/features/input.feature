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




  Cenário: validação ao sair do campo
  Dado que o estado da estória é [estado]
  Quando eu renderizar o [caso]
  E eu sair do campo sem preencher
  Entao deverá ser exibido [spec]

  #Então executar a validação do campo

  Exemplos:
    caso             | estado                                 | spec
    ----------------------------------------------------------------------------------------
     campo requerido | _autofocus: 'campo', campo: {value:'', | labelError
                     |   validations: [requerido]             |   text is: requerido
                     | }                                      | hr_error
                     |                                        |   color scheme: 100% #FF0000


