*** Settings ***
Documentation       Online

Resource    ../resources/base.resource

*** Test Cases ***
Webapp deve estar Online

    Start Session
    Get Title           equal                   Mark85 by QAx

    ${element}      Set Variable        css=h1
    
    Wait For Elements State     ${element}     visible    5
    Get Text                    ${element}     equal      Faça seu login
