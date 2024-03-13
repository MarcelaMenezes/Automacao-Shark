
*** Settings ***

Resource    ../Base.resource


Documentation    Tela 2: Tela de autenticação de Login.

*** Variables ***
${LOGIN_TITLE_LOGIN}                               Login - My Shop
${LOGIN_ELEMENT_H1_AUTHENTICATION}                 xpath: //h1[contains(.,'Authentication')] 
${LOGIN_ELEMENT_H3_CREATE_AN_ACCOUNT}              xpath: //h3[contains(.,'Create an account')]
${LOGIN_INPUT_EMAIL_CREATE}                        id: email_create
${LOGIN_ELEMENT_VALIDATION_FIELD_EMAIl}             class: form-group.form-
${LOGIN_BTN_CREATE_ACCOUNT}                        id: SubmitCreate

${LOGIN_ELEMENT_H3_ALREADY_REGISTERED}            xpath: //h3[contains(.,'Already registered?')]
${LOGIN_INPUT_EMAIL}                              id: email
${LOGIN_INPUT_PASSWORD}                           id: passwd
${LOGIN_BTN_SINGNING}                             id: SubmitLogin

${LOGIN_ELEMENT_ALERT_CREATE_ACCOUNT_ERRO}         id: create_account_error


*** Keywords ***
Validar titulo da tela login
    Title Should Be                             ${LOGIN_TITLE_LOGIN}   
    Wait Until Element Is Visible               ${LOGIN_ELEMENT_H1_AUTHENTICATION} 

Relaizar login 
    [Arguments]        ${txt_email}       ${txt_password}
    Validar titulo da tela login
    Wait Until Element Is Visible               ${LOGIN_ELEMENT_H3_ALREADY_REGISTERED} 
    Input Text                                  ${LOGIN_INPUT_EMAIL}                         ${txt_email}
    Input Password                              ${LOGIN_INPUT_PASSWORD}                      ${txt_password}
    Click Button                                ${LOGIN_BTN_SINGNING}   
Casdastrar um novo e-mail 
    [Arguments]        ${txt_email}
    Validar titulo da tela login                
    Element Should Be Visible                   ${LOGIN_ELEMENT_H3_CREATE_AN_ACCOUNT}                                 
    Input Text                                  ${LOGIN_INPUT_EMAIL_CREATE}                  ${txt_email}
    Set test Variable                           ${login_email-create}                        ${txt_email}
    Press Keys                                  ${LOGIN_INPUT_EMAIL_CREATE}                  TAB
    # Print
            
Clicar em "Create an account"
    Click Button                                ${LOGIN_BTN_CREATE_ACCOUNT}

Validar campo de email
    [Arguments]        ${status}
    Element Should Be Visible                   ${LOGIN_ELEMENT_VALIDATION_FIELD_EMAIl}${status}     

Validar mensagem de erro no e-mail cadastrado
# mensagem de erro ao inserir email já registrado
    [Arguments]        ${txt_alert_erro_email}
    Wait Until Element Is Visible               ${LOGIN_ELEMENT_ALERT_CREATE_ACCOUNT_ERRO}
    Element Text Should Be                      ${LOGIN_ELEMENT_ALERT_CREATE_ACCOUNT_ERRO}        ${txt_alert_erro_email}
    # Print    





