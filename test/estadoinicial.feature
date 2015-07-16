
Cenário: Estado inicial
  Dado uma estoria com um estado inicial
  Quando acabar de renderizar [render]
  E nao escrever
  E sair do input
  Entao validar [spec]

Exemplos:

case               | campo           |  spec_input_sem_foco         |  spec_input_com_foco         |  spec_input_onBlur        
---------------------------------------------------------------------------------------------------------------------------------
campo obrigatorio  | c1              |  input[name='nome']~span     |  input[name='nome']~span     |  input[name='nome']~span    
  nao preenchido   |                 |    text is:                  |    text is:                  |    text is: Obrigatorio
                   |                 |    color: gray               |    color: blue               |    color: red              
                   |                 |    below: input[name='nome'] |    below: input[name='nome'] |    below: input[name='nome']
---------------------------------------------------------------------------------------------------------------------------------
@Pendente
campo obrigatorio  | <h5.input store=mock name="c2" />    |  input[name='nome']~span 
  ja preenchido    |                                      |    absent

  



Cenário: on blur
  Dado uma estoria com um estado inicial  
  Quando escrever [texto]
  E sair do input
  Entao 

Exemplos:

case               |  campo                              |  spec com foco               | spec sem focus
---------------------------------------------------------------------------------------
saiu sem preencher |     |  input[name='nome']~span 
campo obrigatorio  |                                      |    text is: Obrigatório
                   |                                      |    color: red
                   |                                      |    below: input[name='nome']
---------------------------------------------------------------------------------------

@Pendente
campo obrigatorio  | <h5.input store=mock name="c2" />    |  input[name='nome']~span 
  ja preenchido    |                                      |    absent

  
    