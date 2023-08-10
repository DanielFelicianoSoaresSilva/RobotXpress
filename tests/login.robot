*** Settings ***
Documentation       Cenários de autenticação do usuários

Resource            ../resources/base.resource

Library        Collections

Test Setup          Start Session
Test Teardown       Take Screenshot


*** Test Cases ***
Deve poder logar com um usuário pré cadastrado
    ${user}    Create Dictionary
    ...    name=Daniel Feliciano
    ...    email=daniel@msn.com
    ...    password=123456
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit login from        ${user}
    User should logged in    ${user}[name]

Não deve logar com senha invalida
    
    ${user}    Create Dictionary
    ...    name=Steve Woz
    ...    email=woz@apple.com
    ...    password=123456
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=abc123

    Submit login from        ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais.

