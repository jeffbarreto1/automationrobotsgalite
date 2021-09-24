*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
#Setup e Teardown
Abrir navegador
    Open Browser    about:blank  ${BROWSER}

Fechar navegador
    Close Browser

#Realizando a automatização
Dado que acesso a página de login
    Go To                           ${URL}
    Maximize Browser Window 
    Page Should Contain Element     ${NAME_LOGINFORM}

Quando submeto meu Login
    Input Text      ${ID_INPUTLOGIN}   ${LOGIN} 

E submeto meu Password
    Input Password  ${ID_INPUTPASSWORD}   ${PASSWORD}
        
Então devo ser direcionado para área logada
    Click Element                   ${BOTAO_ENVIAR}
    Wait Until Element Is Visible   ${BOTAO_ALTERARSENHA}
    Page Should Contain Element     ${ELEMENTO_H2INICIO}
    
Dado que clico em "${CADASTRAR}"
    Click Element                   xpath=//a[contains(.,'${CADASTRAR}')]
    Page Should Contain Element     xpath=//h2[contains(.,'${CADASTRAR}')]

E clico no botão "${CRIANDO_NOVO}"
    Wait Until Element Is Visible   xpath=//button[contains(.,'${CRIANDO_NOVO}')]
    Click Element                   xpath=//button[contains(.,'${CRIANDO_NOVO}')]
    Wait Until Element Is Visible   ${CLASS_MODALBODY}
    Page Should Contain Element     ${ELEMENTO_NGSCOPE}
    
E crio um novo guichê com o nome "${GUICHE}"
    Input Text                              name=description   ${GUICHE}
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${BOTAO_SALVAR}

Então devo encontrar o novo "${GUICHE}" listado
    Page Should Contain Element             xpath=//td[contains(.,'${GUICHE}')]

E adiciono um novo monitor chamado "${MONITOR}"
    Input Text                              name=description                ${MONITOR}
    Clear Element Text                      ${INPUT_URLMONITOR}
    Input Text                              ${INPUT_URLMONITOR}             ${URL_MONITOR}
    Input Text                              ${INPUT_KEY}                    ${KEY_MONITOR}
    Click Element                           ${CLICK_SELECTSERVICO_MONITOR}
    Click Element                           ${CLICK_SELECTACOUGUE}
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${CLASS_NGBINDING}
    
Então devo encontrar o novo "${MONITOR}" cadastrado
    Wait Until Element Is Visible           xpath=//td[contains(.,'${KEY_MONITOR}')]
    Page Should Contain Element             xpath=//td[contains(.,'${KEY_MONITOR}')]

E cadastro um novo serviço chamado "${SERVIÇO}"
    Input Text                              name=description    ${SERVIÇO}
    Input Text                              name=abbreviation   ${SIGLA}
    Click Element                           ${CLICK_SELECTSERVICO_MONITOR}
    Click Element                           xpath=//span[@class='ng-binding ng-scope'][contains(.,'${MONITOR}')]
    Click Element                           ${BOTAO_SALVAR}
    Wait Until Element Is Not Visible       ${CLASS_NGBINDING}

Então devo encontrar o novo "${SERVIÇO}"
    Wait Until Element Is Visible           xpath=//td[contains(.,'${SERVIÇO}')]
    Page Should Contain Element             xpath=//td[contains(.,'${SERVIÇO}')]  
    
E seleciono um Guichê
    Wait Until Element Is Visible   id=keyboard-counter
    Click Element                   xpath=//select[contains(@id,'keyboard-counter')]
    Click Element                   xpath=//*[@id="keyboard-counter"]/option[1]

E Seleciono um Serviço
    Click Element                   ${ID_KEYBOARDCOUNTER}
    Click Element                   ${INPUT_SERVICO_KEYBOARD}

E digito uma Senha: "${SENHA}"
    Click Element                   ${ID_KEYBOARDNUMBER}
    Input Text                      ${ID_KEYBOARDNUMBER}    ${SENHA}
    
E digito o nome a ser chamado: "${NAME_CHAMADA}"
    Click Element                   ${ID_KEYBOARDNUMBER}
    Input Text                      ${ID_KEYBOARDNAME}      ${NAME_CHAMADA}
    
Então clico no botão Enviar
    Click Element                       ${BOTAO_ENVIAR}