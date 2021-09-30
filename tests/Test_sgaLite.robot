*** Settings ***
Resource        ../resource/Resource.robot
Resource        ../variables/Variables.robot
Suite Setup      Abrir navegador
Suite Teardown   Fechar navegador

*** Test Cases ***

Caso de Teste 01: Realizar login
    Given que acesso a página de login
    When submeto meu Login    
    And submeto meu Password    
    Then devo ser direcionado para área logada

Caso de Teste 02: Cadastrando Guichê
    Given que clico em "Cadastrar Guichê"
    And clico no botão "Novo Guichê"
    And crio um novo guichê com o nome "Guichê Teste"
    Then devo encontrar o novo "${GUICHE}" listado

Caso de Teste 03: Cadastrando Monitor
    Given que clico em "Cadastrar Monitor"
    And clico no botão "Novo Monitor"
    And adiciono um novo monitor chamado "Monitor Teste"
    Then devo encontrar o novo "${MONITOR}" cadastrado

Caso de Teste 04: Cadastrando Serviço
    Given que clico em "Cadastrar Serviço"
    And clico no botão "Novo Serviço"
    And cadastro um novo serviço chamado "Serviço Teste"
    Then devo encontrar o novo "${SERVIÇO}"

Caso de Teste 05: Realizando uma chamada
    Given que clico em "Chamar Senha Avulsa"
    And seleciono um Guichê
    And Seleciono um Serviço
    And digito uma Senha: "0"
    And digito o nome a ser chamado: "Jefferson"
    Then clico no botão Enviar