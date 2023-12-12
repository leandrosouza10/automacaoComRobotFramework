*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup     Start session
Test Teardown  Finish session  

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]   smoke

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
      
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.     


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
   
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form    


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
   
    Go to signup page
    Fill signup form    ${dog_walker}      
    Submit signup form    


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
 
    Go to signup page
#    Fill signup form    ${dog_walker}      
    Submit signup form  
        Alert should be    Informe o seu nome completo                    
        Alert should be    Informe o seu melhor email                      
        Alert should be    Informe o seu CPF                             
        Alert should be    Informe o seu CEP                                     
        Alert should be    Informe um número maior que zero               
        Alert should be    Adcione um documento com foto (RG ou CHN)   


Deve cadastrar um novo dog walker que saiba cuidar de pets
    [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Vin Diesel                
    ...    email=diesel@gmail.com   
    ...    cpf=00000014141  
    ...    cep=04534011     
    ...    street=Rua Joaquim Floriano
    ...    numero=1200  
    ...    complemento=Apto 200
    ...    district=Itaim Bibi
    ...    city=São Paulo/SP
    ...    cnh=toretto.jpg 
       
      
    Go to signup page
    Fill signup form    ${dog_walker}   
    Additional Service    Cuidar   
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato. 


Deve cadastrar um novo dog walker que saiba adestrar pets
    [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Paul Walker                
    ...    email=walker@hotmail.com   
    ...    cpf=00000014142  
    ...    cep=04534011     
    ...    street=Rua Joaquim Floriano
    ...    numero=1200  
    ...    complemento=Apto 200
    ...    district=Itaim Bibi
    ...    city=São Paulo/SP
    ...    cnh=toretto.jpg 
      
      
    Go to signup page
    Fill signup form    ${dog_walker}    
    Additional Service    Adestrar 
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.     
   



 




    