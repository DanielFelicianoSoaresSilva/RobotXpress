*** Settings ***
Documentation       Cenários de testes do cadastro de usuários

Library             Browser
Library             FakerLibrary

*** Test Cases ***
Deve poder cadastrar um novo usuários
    
    #FAKER=Dados falsos
    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable        pwd123

    New Browser     browser=chromium        headless=false
    New Page        http://localhost:3000/signup

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro

    Fill Text        css=#name                        ${name}
    Fill Text        xpath=//input[@id="email"]       ${email}
    Fill Text        id=password                      ${password}

    Click            id=buttonSignup >> text=Cadastrar

    Wait For Elements State    css=.notice p        visible     5
    Get Text                   css=.notice p        equal       Boas vindas ao Mark85, o seu gerenciador de tarefas.
