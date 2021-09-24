*** Variables ***
${URL}              http://localhost:3000/
${BROWSER}          chrome
${LOGIN}            admin
${PASSWORD}         pass
${GUICHE}           
${SERVIÇO}          
${SIGLA}            AUT
${MONITOR}          Monitor Teste
${KEY_MONITOR}      47871B33654034F0B829E0B47258E2B24E19ADDFF9F703F892FF39AD48F0C42ACA1BE6FB271F9743B1D32EC040A2EE5B7EF949EEA34D58D9824D18B396A1A9D1
${URL_MONITOR}      http://192.168.1.24:1234/wsdl/INeoNewsTerminalService
${SENHA}            
${NAME_CHAMADA}     
${CADASTRAR}
${CRIANDO_NOVO}

#LOCATOR
${NAME_LOGINFORM}                       name=login.form
${ID_INPUTLOGIN}                        id=login-user
${ID_INPUTPASSWORD}                     id=login-password
${BOTAO_ENVIAR}                          xpath=//button[contains(.,'Enviar')]
${BOTAO_ALTERARSENHA}                   xpath=//button[@type='button'][contains(.,'Alterar Senha')]
${ELEMENTO_H2INICIO}                    xpath=//h2[contains(.,'Início')]
${CLASS_MODALBODY}                      class=modal-body
${ELEMENTO_NGSCOPE}                     xpath=//span[contains(@class,'ng-scope')]
${BOTAO_SALVAR}                         xpath=//button[contains(.,'Salvar')]
${INPUT_URLMONITOR}                     xpath=//input[contains(@type,'url')]
${INPUT_KEY}                            name=key
${CLICK_SELECTSERVICO_MONITOR}          xpath=//input[contains(@type,'text')]
${CLICK_SELECTACOUGUE}                  xpath=//span[@class='ng-binding ng-scope'][contains(.,'Açougue')]
${CLASS_NGBINDING}                      class=ng-binding
${ID_KEYBOARDCOUNTER}                   id=keyboard-counter
${INPUT_SERVICO_KEYBOARD}               xpath=//*[@id="keyboard-service"]/option[1]
${ID_KEYBOARDNUMBER}                    id=keyboard-number
${ID_KEYBOARDNAME}                      id=keyboard-name