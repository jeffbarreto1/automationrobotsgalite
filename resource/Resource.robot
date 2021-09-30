*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
#Setup e Teardown
Abrir navegador
    Open Browser    about:blank  ${BROWSER}

Fechar navegador
    Close Browser

#Realizando a automatização
Given que acesso a página de login
    Go To                           ${URL}
    Maximize Browser Window 
    Page Should Contain Element     ${NAME_LOGINFORM}

When submeto meu Login
    Input Text      ${ID_INPUTLOGIN}   ${LOGIN} 

And submeto meu Password
    Input Password  ${ID_INPUTPASSWORD}   ${PASSWORD}
        
Then devo ser direcionado para área logada
    Click Element                   ${BOTAO_ENVIAR}
    Wait Until Element Is Visible   ${BOTAO_ALTERARSENHA}
    Page Should Contain Element     ${ELEMENTO_H2INICIO}
    
Given que clico em "${CADASTRAR}"
    Click Element                   xpath=//a[contains(.,'${CADASTRAR}')]
    Page Should Contain Element     xpath=//h2[contains(.,'${CADASTRAR}')]

And clico no botão "${CRIANDO_NOVO}"
    Wait Until Element Is Visible   xpath=//button[contains(.,'${CRIANDO_NOVO}')]
    Click Element                   xpath=//button[contains(.,'${CRIANDO_NOVO}')]
    Wait Until Element Is Visible   ${CLASS_MODALBODY}
    Page Should Contain Element     ${ELEMENTO_NGSCOPE}
    
And crio um novo guichê com o nome "${GUICHE}"
    Input Text                              name=description   ${GUICHE}
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${BOTAO_SALVAR}

Then devo encontrar o novo "${GUICHE}" listado
    Page Should Contain Element             xpath=//td[contains(.,'${GUICHE}')]

And adiciono um novo monitor chamado "${MONITOR}"
    Input Text                              name=description                ${MONITOR}
    Clear Element Text                      ${INPUT_URLMONITOR}
    Input Text                              ${INPUT_URLMONITOR}             ${URL_MONITOR}
    Input Text                              ${INPUT_KEY}                    ${KEY_MONITOR}
    Click Element                           ${CLICK_SELECTSERVICO_MONITOR}
    Click Element                           ${CLICK_SELECTACOUGUE}
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${CLASS_NGBINDING}
    
Then devo encontrar o novo "${MONITOR}" cadastrado
    Wait Until Element Is Visible           xpath=//td[contains(.,'${KEY_MONITOR}')]
    Page Should Contain Element             xpath=//td[contains(.,'${KEY_MONITOR}')]

And cadastro um novo serviço chamado "${SERVIÇO}"
    Input Text                              name=description    ${SERVIÇO}
    Input Text                              name=abbreviation   ${SIGLA}
    Click Element                           ${CLICK_SELECTSERVICO_MONITOR}
    Click Element                           xpath=//span[@class='ng-binding ng-scope'][contains(.,'${MONITOR}')]
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${CLASS_NGBINDING}

Then devo encontrar o novo "${SERVIÇO}"
    Wait Until Element Is Visible           xpath=//td[contains(.,'${SERVIÇO}')]
    Page Should Contain Element             xpath=//td[contains(.,'${SERVIÇO}')]  
    
And seleciono um Guichê
    Wait Until Element Is Visible   id=keyboard-counter
    Click Element                   xpath=//select[contains(@id,'keyboard-counter')]
    Click Element                   xpath=//*[@id="keyboard-counter"]/option[1]

And Seleciono um Serviço
    Click Element                   ${ID_KEYBOARDCOUNTER}
    Click Element                   ${INPUT_SERVICO_KEYBOARD}

And digito uma Senha: "${SENHA}"
    Click Element                   ${ID_KEYBOARDNUMBER}
    Input Text                      ${ID_KEYBOARDNUMBER}    ${SENHA}
    
And digito o nome a ser chamado: "${NAME_CHAMADA}"
    Click Element                   ${ID_KEYBOARDNUMBER}
    Input Text                      ${ID_KEYBOARDNAME}      ${NAME_CHAMADA}
    
Then clico no botão Enviar
    Click Element                       ${BOTAO_ENVIAR}