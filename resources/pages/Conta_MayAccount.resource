
*** Settings ***
Resource    ../Base.resource

Documentation    Tela 4: "Minha Conta", tela princiapal da conta do usuário. ao logar.
Library    XML

*** Variables ***
${ALERT_ACCOUNT_CREATED _SUCCESS}                class: alert.alert-success
${TITLE_MAY_ACCOUNT}                             My account - My Shop
${ELEMENT_H1_MAY_ACCOUNT}                        xpath: //h1[contains(.,'My account')]
${ELEMENT_MENU_MAY_ACCOUT}                       xpath: //span[contains(.,'%param%')]
@{MENUS_MAY_ACCOUNT}                             Add my first address    
...                                              Order history and details    
...                                              My credit slips
...                                              My addresses
...                                              My personal information

${CUSTOMER_NAME}                                 class: account
${ICON_HOME}                                     xpath:  //a[@title='Home']


*** Keywords ***

Conferir se o cadastro foi efetuado com sucesso   
    [Arguments]        ${txt_alert_account_created _success}
    Wait Until Element Is Visible           ${ALERT_ACCOUNT_CREATED _SUCCESS}                                   
    Element Text Should Be                  ${ALERT_ACCOUNT_CREATED _SUCCESS}         ${txt_alert_account_created _success} 

Validar tela principal my accout
    Wait Until Element Is Visible                   ${ELEMENT_H1_MAY_ACCOUNT}       
    Title Should Be                                 ${TITLE_MAY_ACCOUNT}
    Element Should Be Visible                       ${ELEMENT_H1_MAY_ACCOUNT}      
    # Print
    Element Text Should Be                          ${CUSTOMER_NAME}       ${TXT_FIRST_NAME} ${TXT_LAST_NAME}  
    Scroll Element Into View                        ${ICON_HOME}
    # Print
    
Validar submenus de gerenciamento de infomações da conta
    FOR    ${element}    IN    @{MENUS_MAY_ACCOUNT}   
        ${menus}    Replace String                  ${ELEMENT_MENU_MAY_ACCOUT}     %param%    ${element}
        Element Should Be Visible                   ${menus} 
    END

Deverá direcionar para a página minha conta do site  
    Validar tela principal my accout
    Validar submenus de gerenciamento de infomações da conta
    

