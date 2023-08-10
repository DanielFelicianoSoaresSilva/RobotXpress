*** Settings ***
Documentation        

Library        libs/database.py
Library        Browser
Library        JSONLibrary

Resource        env.resource

Resource        pages/components/Notice.resource
Resource        pages/components/Alert.resource
Resource        pages/components/Header.resource

Resource        pages/SignupPage.resource
Resource        pages/LoginPage.resource
Resource        pages/TaskCreatePage.resource
Resource        pages/TasksPage.resource

Resource        services.resource

*** Keywords ***
Start Session

    New Browser         browser=${BROWSER}        headless=false
    New Page            ${BASE_URL}

#Helper
Get fixture
    [Arguments]        ${file_name}        ${scenario}

        #Pegar massa de teste em JSON
        ${data}        Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json        encoding=utf-8

    [Return]    ${data}[${scenario}]

Reset user from database
    [Arguments]        ${user}

    Clean user from database     ${user}[email]
    Insert user from database    ${user}

Create a new task from API
    [Arguments]        ${data}

    #cadastrando usuário via API
    POST user session    ${data}[user]
    #cadastrando tarefa via API
    POST a new task     ${data}[task]

Do login
    [Arguments]        ${user}

    Submit login from        ${user}
    User should logged in    ${user}[name]
