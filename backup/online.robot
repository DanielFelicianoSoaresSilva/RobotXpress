*** Settings ***
Documentation       Online

Library             Browser

*** Test Cases ***
Webapp deve estar Online

    New Browser     browser=chromium        headless=false
    New Page        http://localhost:3000/signup
    
    Get Title           equal                   Mark85 by QAx

    ${element}      Set Variable        css=h1
    
    Wait For Elements State     ${element}     visible    5
    Get Text                    ${element}     equal      Faça seu login
