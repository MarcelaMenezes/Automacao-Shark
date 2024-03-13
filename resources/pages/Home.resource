
*** Settings ***
Resource    ../Base.resource


Documentation    Tela 1: Tela home do site. 

*** Variables ***
${BROWSER}             chrome  
${URL_SITE}            http://www.automationpractice.pl/index.php
${HOME_TITLE_SITE}          My Shop  
${HOME_MENU_LOGIN}          class: login

${HOME_MENU_WOMEN}                                    xpath:  //a[@title='Women']
${HOME_MENU_DRESSES}                                  xpath: (//a[@title='Dresses'])[2]
${HOME_MENU_T-SHIRTS}                                 xpath: (//a[@title='T-shirts'])[2]
${HOME_TXT_MENU_WOMEN}                                WOMEN
${HOME_TXT_MENU_DRESSES}                              DRESSES
${HOME_TXT_MENU_T-SHIRTS}                             T-SHIRTS

*** Keywords ***
Acessar site
    Open Browser                                   browser=${BROWSER}           
    Maximize Browser Window
    Go To                                                  ${URL_SITE}
    Title Should Be                                        ${HOME_TITLE_SITE}
    # Print
Acessar tela de login
    Click Element                                          ${HOME_MENU_LOGIN}

Acessar o menu de compra
    [Arguments]        ${menu}
    ${aux}    Convert To Upper Case    ${menu}
    Set Test Variable    ${Home_Menu_Escolhido}    ${aux}

    IF     "${Home_Menu_Escolhido}" == "${HOME_TXT_MENU_WOMEN}"
        Click Element    ${HOME_MENU_WOMEN}

    ELSE IF     "${Home_Menu_Escolhido}" == "${HOME_TXT_MENU_DRESSES}"
        Click Element    ${HOME_MENU_DRESSES}

    ELSE IF     "${Home_Menu_Escolhido}" == "${HOME_TXT_MENU_T-SHIRTS}"
        Click Element    ${HOME_MENU_T-SHIRTS}
    ELSE 
        Log To Console    Menu não localizado! Escolha uma opção correta: "WOMEN", "DRESSES" ou "T-SHIRTS"        
        Fatal Error
       
    END    


Dado que acesso a tela de login do site    
    acessar site
    acessar tela de login