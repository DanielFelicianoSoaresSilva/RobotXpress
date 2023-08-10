*** Settings ***
Documentation        Ações e lementos do cabeçalho

Library        Browser
Library        String

*** Keywords ***
User should logged in
    [Arguments]         ${name}

    @{splited_name}     Split String        ${name}

    ${element}        Set Variable        css=header .right small
    
    Wait For Elements State        ${element}        visible        5
    Get Text                       ${element}        equal          Olá, ${splited_name}[0]

Go to task form
    
    Click    css=.button-add >> text=Nova Tarefa
