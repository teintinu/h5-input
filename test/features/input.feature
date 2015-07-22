Funcionalidade: componente para edição de campos
  Para permitir ao usuario alterar valores de campo
  Eu, como programador
  Desejo utilizar o componente h5-input

Cenário: Renderização do h5.input [caso]
  Dado que o estado da estória é [estado]
  Quando eu renderizar o [caso]
  Então validar [spec]

  Exemplos:
    caso            | estado              | spec
    ---------------------------------------------------------
    valor_em_branco | campo: {value:''}   | input
                    |                     |   text is:
                    |                     | body
                    |                     |   contains: input
    ---------------------------------------------------------
    valor_xx        | campo: {value:'xx'} | input
                    |                     |   text is: xx
                    |                     | body
                    |                     |   contains: input
    ---------------------------------------------------------


#    editing: {         |  input[name='nome']
#     campo: {          |    text is:
#       value: '',      |  html/body
#       error:          |    contains: input[name='nome']
#        'Obrigatorio'  |  input[name='nome']~spam
#     }                 |    text is: Obrigatorio
#                       |    color: red
# COM FOCO
#    ------------------------------------------------------

#Cenário: validação ao perder o foco
#    Dado que eu preenchi o h5-input com [texto]
#    Quando eu passar o foco para outro componente
#    Entao o h5-input deve chamar a validação na estoria
#    E esperar pela mensagem [mensagem]
#
#Exemplos:
#    case               | campo           |  spec_input_vazio            |  spec_input_com_palavra      |  spec_input_com_numero       |
#    -----------------------------------------------------------------------------------------------------------------------------------
#    Validação de campo | c1              |  input[name='nome']~span     |  input[name='nome']~span     |  input[name='nome']~span     |
#    requerido ao       |                 |    text is: Obrigatório      |    absent                    |    absent                    |
#    perder foco        |                 |    below: input[name='nome'] |                              |                              |
#                       |                 |    color: red                |                              |                              |
#    -----------------------------------------------------------------------------------------------------------------------------------
#    ----------------------------------------------------------------------------------------------------------------------------------
#    Validação de       | c1              |  input[name='nome']~span     |  input[name='nome']~span     |  input[name='nome']~span
#    tipo de dado ao    | type='number'   |    absent                    |    text is: Inválido         |    absent
#    perder foco        |                 |                              |    below: input[name='nome'] |
#                       |                 |                              |    color: red                |
#    ----------------------------------------------------------------------------------------------------------------------------------


# testes do colSpan e testes do RowSpan
