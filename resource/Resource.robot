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
    Page Should Contain Element     name=login.form

Quando submeto meu "${LOGIN}"
    Input Text      id=login-user   ${LOGIN} 

E submeto meu ${PASSWORD}
    Input Password  id=login-password   ${PASSWORD}
        
Então devo ser direcionado para área logada
    Click Element                   xpath=//button[contains(.,'Enviar')]
    Wait Until Element Is Visible   xpath=//button[@type='button'][contains(.,'Alterar Senha')]
    Page Should Contain Element     xpath=//h2[contains(.,'Início')]
    
Dado que clico em "${CADASTRAR}"
    Click Element                   xpath=//a[contains(.,'${CADASTRAR}')]
    Page Should Contain Element     xpath=//h2[contains(.,'${CADASTRAR}')]

E clico no botão Novo Guichê
    Wait Until Element Is Visible   xpath=//button[contains(.,'Novo Guichê')]
    Click Element                   xpath=//button[contains(.,'Novo Guichê')]
    Wait Until Element Is Visible   class=modal-body
    Page Should Contain Element     xpath=//span[contains(@class,'ng-scope')]
    
E crio um novo "${GUICHE}"
    Input Text                              name=description   ${GUICHE}
    Click Element                           xpath=//button[contains(.,'Salvar')]
    Wait Until Element Is Not Visible       xpath=//button[contains(.,'Salvar')]

Então devo encontrar o novo "${GUICHE}" listado
    Page Should Contain Element             xpath=//td[contains(.,'${GUICHE}')]
    
E clico no botão Novo Monitor
    Wait Until Element Is Visible   xpath=//button[contains(.,'Novo Monitor')]
    Click Element                   xpath=//button[contains(.,'Novo Monitor')]
    Wait Until Element Is Visible   class=modal-body
    Page Should Contain Element     name=url

E adiciono um novo "${MONITOR}"
    Input Text                              name=description    ${MONITOR}
    Clear Element Text                      xpath=//input[contains(@type,'url')]
    Input Text                              xpath=//input[contains(@type,'url')]    ${URL_MONITOR}
    Input Text                              name=key            ${KEY_MONITOR}
    Click Element                           xpath=//input[contains(@type,'text')]
    Click Element                           xpath=//span[@class='ng-binding ng-scope'][contains(.,'Açougue')]
    Click Element                           xpath=//button[contains(.,'Salvar')]
    Wait Until Element Is Not Visible       class=ng-binding
    
Então devo encontrar o novo "${MONITOR}" cadastrado
    Wait Until Element Is Visible           xpath=//td[contains(.,'${KEY_MONITOR}')]
    Page Should Contain Element             xpath=//td[contains(.,'${KEY_MONITOR}')]

E clico no botão Novo Serviço
    Wait Until Element Is Visible   xpath=//button[@type='button'][contains(.,'Novo Serviço')]
    Click Element                   xpath=//button[@type='button'][contains(.,'Novo Serviço')]
    Wait Until Element Is Visible   class=modal-body
    Page Should Contain Element     name=callText

E cadastro um novo "${SERVIÇO}"
    Input Text                              name=description    ${SERVIÇO}
    Input Text                              name=abbreviation   ${SIGLA}
    Click Element                           xpath=//input[contains(@type,'text')]
    Click Element                           xpath=//span[@class='ng-binding ng-scope'][contains(.,'${MONITOR}')]
    Click Element                           xpath=//button[contains(.,'Salvar')]
    Wait Until Element Is Not Visible       class=ng-binding

Então devo encontrar o novo "${SERVIÇO}"
    Wait Until Element Is Visible           xpath=//td[contains(.,'${SERVIÇO}')]
    Page Should Contain Element             xpath=//td[contains(.,'${SERVIÇO}')]
    
E seleciono um Guichê
    Wait Until Element Is Visible   id=keyboard-counter
    Click Element                   xpath=//select[contains(@id,'keyboard-counter')]
    Click Element                   xpath=//*[@id="keyboard-counter"]/option[1]

E Seleciono um Serviço
    Click Element                   id=keyboard-service
    Click Element                   xpath=//*[@id="keyboard-service"]/option[1]

E digito uma Senha
    Click Element                   id=keyboard-number
    Input Text                      id=keyboard-number    ${SENHA}
    
E digito o nome a ser chamado
    Click Element                   id=keyboard-number
    Input Text                      id=keyboard-name    ${NAME_CHAMADA}
    
Então clico no botão Enviar
    Click Element                       xpath=//button[contains(.,'Enviar')]