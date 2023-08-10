*** Settings ***
Documentation        Ações e elementos da página de login

Library        Browser
Library        String

*** Keywords ***
Submit login from
    [Arguments]        ${user}

    Fill Text    css=input[placeholder="E-mail"]    ${user}[email]
    Fill Text    css=input[placeholder="Senha"]     ${user}[password]

    #Click    xpath=//button[text()="Entrar"]
    Click    css=button >> text=Entrar
