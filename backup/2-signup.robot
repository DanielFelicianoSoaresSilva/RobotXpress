*** Settings ***
Documentation       Cenários de testes do cadastro de usuários

Resource    ../resources/base.resource

*** Variables ***
${name}        Daniel Feliciano
${email}       daniel@yahoo.com
${password}    pwd123

*** Test Cases ***
Deve poder cadastrar um novo usuários

    # ${name}         Set Variable        Daniel Feliciano
    # ${email}        Set Variable        daniel@yahoo.com
    # ${password}     Set Variable        pwd123

    Remove user from database           ${email}

    Start Session

    Go To        http://localhost:3000/signup

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro

    Fill Text        css=#name      ${name}
    Fill Text        id=email       ${email}
    Fill Text        id=password    ${password}

    Click            id=buttonSignup >> text=Cadastrar

    Wait For Elements State    css=.notice p        visible     5
    Get Text                   css=.notice p        equal       Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com o email duplicado

    Start Session

    Go To        http://localhost:3000/signup

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro
    
    Fill Text        css=#name      ${name}
    Fill Text        id=email       ${email}
    Fill Text        id=password    ${password}

    Click            id=buttonSignup >> text=Cadastrar

    Wait For Elements State    css=.notice p        visible     5
    Get Text                   css=.notice p        equal       Oops! Já existe uma conta com o e-mail informado.
    