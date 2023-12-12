*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

*** Test Cases ***
Deve poder cadastrar um novo dog walker


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


  
