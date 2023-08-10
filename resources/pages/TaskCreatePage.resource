*** Settings ***
Documentation        Ações e elementos da página de cadastros de tarefas

Library        Browser

*** Keywords ***
Submit task form
    [Arguments]        ${task}
                                                            #objeto task e pega o campo name
    Fill Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]

    ${tags_elements}        Set Variable        css=input[name="tags"]
    
    #colocar as tags e pressionar o botão enter
    FOR    ${tag}    IN    @{task}[tags]

        Fill Text     ${tags_elements}        ${tag}
        Sleep         1
        Press Keys    ${tags_elements}        Enter

    END

    Click    css=button >> text=Cadastrar
