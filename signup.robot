*** Settings ***
Documentation    Suite de testesde cadastro de dog walker

Library    Browser

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    
    ${name}                       Set Variable     Roger Waters 
    ${email}                      Set Variable     roger@gmail.com 
    ${cpf}                        Set Variable     00000014141    
    ${cep}                        Set Variable     04534011 
    ${addressStreet}              Set Variable     Rua Joaquim Floriano
    ${numero}                     Set Variable     1200
    ${complemento}                Set Variable     Apto 200  
    ${addressDistrict}            Set Variable     Itaim Bibi
    ${addressCityUf}              Set Variable     São Paulo/SP
    
      


    New Browser    browser=chromium    headless=False
    New Page       https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

    Fill Text    css=input[placeholder$=completo]           ${name}
    Fill Text    css=input[name=email]                      ${email}   
    Fill Text    css=input[placeholder^=CPF]                ${cpf}
    Fill Text    css=input[placeholder=CEP]                 ${cep} 

    Click        css=input[type=button][value="Buscar CEP"]

    Get Property    css=input[name=addressStreet]       value     equal           ${addressStreet}
    Get Property    css=input[name=addressDistrict]     value     equal           ${addressDistrict}
    Get Property    css=input[name=addressCityUf]       value     equal           ${addressCityUf}

    Fill Text       css=input[name=addressNumber]           ${numero}
    Fill Text       css=input[name=addressDetails]          ${complemento}
          

   