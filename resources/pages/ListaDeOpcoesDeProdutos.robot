
*** Settings ***
Library            String
Library    FakerLibrary

Resource    ../Base.resource


Documentation    Tela 4: "Minha Conta", tela princiapal da conta do usuário. ao logar.

*** Variables ***
${TXT_FIRST_NAME}            Marcela
${TXT_LAST_NAME}             Teste



*** Keywords ***
Dado que estaja logado no site                                        
    Dado que acesso a tela de login do site
    Relaizar login    marcela@gmail.com    123456
    Validar tela principal my accout
    #nome do usuario logado


visualizar lista de produtos da categoria
  Wait Until Element Is Visible    class: cat-name 
  ${aux}    Catenate  ${Home_Menu_Escolhido}${SPACE}
  Element Text Should Be           class: cat-name          ${aux}

clicar no produto  
  Click Element                  xpath: //img[@title='Blouse']

  
*** Test Cases ***    
Criar usuario com sucesso
    Dado que estaja logado no site
    acessar o menu de compra    women
    visualizar lista de produtos da categoria

