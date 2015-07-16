Funcionalidade: componente para edição de campos
    Para permitir ao usuario alterar valores de campo
    Eu, como programador
    Desejo utilizar o componente h5-input 




Cenário: Renderização do input
  Dado que eu tenho um estado em uma estoria
  Quando eu renderizar [render]
  Entao validar [spec]




Exemplos:

  #variaveis                          |
  #-------------------------------------
  #spanErro = input[name=CAMPO]~span  |
  #input = input[name='nome']         |
  #-------------------------------------
  
  case               | campo           |  spec_input_sem_foco         |  spec_input_com_foco         |  spec_input_onBlur        
  ---------------------------------------------------------------------------------------------------------------------------------
  campo obrigatorio  | c1              |  spanErro                    |  spanErro                    |  spanErro    
    nao preenchido   |                 |    text is:                  |    text is:                  |    text is: Obrigatorio
                     |                 |    below: input              |    below: input              |    below: input
                     |                 |                              |                              |    color: red              
  ---------------------------------------------------------------------------------------------------------------------------------
  @Pendente
  campo obrigatorio  | <h5.input store=mock name="c2" />    |  input[name='nome']~span 
    ja preenchido    |                                      |    absent
    
    
  
Cenário: validação ao perder o foco
    Dado que eu preenchi o h5-input com [texto]
    Quando eu passar o foco para outro componente
    Entao o h5-input deve chamar a validação na estoria
    E esperar pela mensagem [mensagem]

Cenário: on blur
  Dado uma estoria com um estado inicial  
  Quando escrever [texto]
  E sair do input
  Entao 

Exemplos:

  case               |  campo                               |  spec com foco               | spec sem focus
  ---------------------------------------------------------------------------------------
  saiu sem preencher |     |  input[name='nome']~span 
  campo obrigatorio  |                                      |    text is: Obrigatório
                     |                                      |    color: red
                     |                                      |    below: input[name='nome']
  ---------------------------------------------------------------------------------------
  
  @Pendente
  campo obrigatorio  | <h5.input store=mock name="c2" />    |  input[name='nome']~span 
    ja preenchido    |                                      |    absent

  
    