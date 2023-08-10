*** Settings ***
Documentation       Cenários de testes do cadastro de usuários

Resource    ../resources/base.resource

Test Setup          Start Session
Test Teardown       Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuários
    [Tags]        new

    ${user}        Create Dictionary
    ...        name=Daniel Feliciano
    ...        email=daniel@yahoo.com
    ...        password=pwd123

    Remove user from database           ${user}[email]

    Go To        ${BASE_URL}/signup

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro

    Fill Text        css=#name      ${user}[name]
    Fill Text        id=email       ${user}[email]
    Fill Text        id=password    ${user}[password]

    Click            id=buttonSignup >> text=Cadastrar

    Wait For Elements State    css=.notice p        visible     5
    Get Text                   css=.notice p        equal       Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com o email duplicado
    [Tags]        dup

    ${user}        Create Dictionary
    ...        name=Feliciano Daniel
    ...        email=feliciano@gmail.com
    ...        password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Go To        ${BASE_URL}/signup

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro
    
    Fill Text        css=#name      ${user}[name]
    Fill Text        id=email       ${user}[email]
    Fill Text        id=password    ${user}[password]

    Click            id=buttonSignup >> text=Cadastrar

    Wait For Elements State    css=.notice p        visible     5
    Get Text                   css=.notice p        equal       Oops! Já existe uma conta com o e-mail informado.
