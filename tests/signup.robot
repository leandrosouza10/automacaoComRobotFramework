*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]   CadastroComSucesso

    ${dog_walker}    Create Dictionary    
    ...    name=Dominic Toretto                
    ...    email=toretto@gmail.com   
    ...    cpf=00000014141  
    ...    cep=04534011     
    ...    street=Rua Joaquim Floriano
    ...    numero=1200  
    ...    complemento=Apto 200
    ...    district=Itaim Bibi
    ...    city=São Paulo/SP
    ...    cnh=toretto.jpg   

    Start session    
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato. 
    Finish session 


Não deve cadastrar se o CPF for incorreto
    [Tags]   cpfInvalido

    ${dog_walker}    Create Dictionary    
    ...    name=Dominic Toretto                
    ...    email=toretto@gmail.com   
    ...    cpf=000000141A  
    ...    cep=04534011     
    ...    street=Rua Joaquim Floriano
    ...    numero=1200  
    ...    complemento=Apto 200
    ...    district=Itaim Bibi
    ...    city=São Paulo/SP
    ...    cnh=toretto.jpg   

    Start session    
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form  
    Finish session 


Não deve cadastrar com email inválido
    [Tags]   emailInvalido

    ${dog_walker}    Create Dictionary    
    ...    name=Dominic Toretto                
    ...    email=torettogmail.com   
    ...    cpf=00000014141 
    ...    cep=04534011     
    ...    street=Rua Joaquim Floriano
    ...    numero=1200  
    ...    complemento=Apto 200
    ...    district=Itaim Bibi
    ...    city=São Paulo/SP
    ...    cnh=toretto.jpg   

    Start session    
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form    
    Finish session 

Não deve cadastrar se os campos obrigatórios não forem preenchidos
   [Tags]    required
#    ${dog_walker}    Create Dictionary    
#    ...    name=Dominic Toretto                
#    ...    email=toretto@gmail.com   
#    ...    cpf=00000014141  
#    ...    cep=04534011     
#    ...    street=Rua Joaquim Floriano
#    ...    numero=1200  
#    ...    complemento=Apto 200
#    ...    district=Itaim Bibi
#    ...    city=São Paulo/SP
#    ...    cnh=toretto.jpg   

    Start session    
    Go to signup page
#    Fill signup form    ${dog_walker}      
    Submit signup form  
        Alert should be    Informe o seu nome completo                    
        Alert should be    Informe o seu melhor email                      
        Alert should be    Informe o seu CPF                             
        Alert should be    Informe o seu CEP                                     
        Alert should be    Informe um número maior que zero               
        Alert should be    Adcione um documento com foto (RG ou CHN)     
    Finish session 



 




    