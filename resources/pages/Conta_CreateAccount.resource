
*** Settings ***

Resource    ../Base.resource

Documentation    Tela 3: Cadastrando a conta com informações pessoais do usuário.

*** Variables ***

${ELEMENT_H3_INFORMATION}                xpath: //h3[@class='page-subheading'][contains(.,'Your personal information')]
${RADION_BUTTON_MRS}                     id: id_gender2
${INPUT_FIRST_NAME}                      id: customer_firstname 
${TXT_FIRST_NAME}                        Marcela
${INPUT_LAST_NAME}                       id: customer_lastname
${TXT_LAST_NAME}                         Menezes
${TXT_PASSWORD}                          123456
${LIST_DATE_DAYS}                        id: days 
${DAY}                                   8 
${LIST_DATE_MONTHS}                      id: months 
${MONTH}                                 2 
${LIST_DATE_YEARS}                       id: years 
${YEARS}                                 1986

${CKECKBOX_SIGN}                         id: newsletter
${BTN_REGISTER}                          id: submitAccount

*** Keywords ***
Cadastrar as informações pessoais                                          
    Wait Until Element Is Visible               ${ELEMENT_H3_INFORMATION}
    Click Element                               ${RADION_BUTTON_MRS}
    Input Text                                  ${INPUT_FIRST_NAME}               ${TXT_FIRST_NAME}  
    Input Text                                  ${INPUT_LAST_NAME}                ${TXT_LAST_NAME}   
    ${aux}    Get Value                         ${LOGIN_INPUT_EMAIL} 
   #  Set Suite Variable                          ${EMAIL_INTRODUCED}               ${aux} 
    Should Be Equal                             ${aux}                            ${login_email-create}  
   #  Print
    Input Password                              ${LOGIN_INPUT_PASSWORD}                 ${TXT_PASSWORD}
    Select From List By Value                   ${LIST_DATE_DAYS}                 ${DAY}
    Select From List By Value                   ${LIST_DATE_MONTHS}               ${MONTH}
    Select From List By Value                   ${LIST_DATE_YEARS}                ${YEARS}
    Select Checkbox                             ${CKECKBOX_SIGN}
    Scroll Element Into View                    ${BTN_REGISTER}
   #  Print
    Click Button                                ${BTN_REGISTER}  



 



