Funcionalidade: componente para edição de campos
    Para permitir ao usuario alterar valores de campo
    Eu, como programador
    Desejo utilizar o componente h5-input 

Cenário: Renderização do input
  Dado que eu tenho um estado em uma estoria
  Quando eu renderizar [render]
  Entao validar [spec]

Exemplos: 
    case               | campo           |  spec_input                 
    ------------------------------------------------------------------------
    input no estado    | c1              |  input[name='nome']    
    inicial            |                 |    text is:      
                       |                 |  html/body
                       |                 |    contains: input[name='nome']            
    ------------------------------------------------------------------------
    input no estado    | c2              |  input[name='nome']    
    inicial            |                 |    text is:      
                       |                 |  html/body
                       |                 |    contains: input[name='nome']            
                       |                 |  input[name='nome']~spam           
                       |                 |    text is: Obrigatorio            
                       |                 |    color: red            
    ------------------------------------------------------------------------  
  
  
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
