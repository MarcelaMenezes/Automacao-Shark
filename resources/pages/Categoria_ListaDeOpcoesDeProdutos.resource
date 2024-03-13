
*** Settings ***
Library            String
Library    FakerLibrary

Resource    ../Base.resource


Documentation    Tela: "Catalogo" de produtoapresentado conforme menu selecionado,

*** Variables ***

${CATEGORIA_H1_CATEGORY_PRODUCT}        class: cat-name
${CATEGORIA_PRODUCT_BLOUSE}             xpath: //img[@title='Blouse']

*** Keywords ***

Visualizar lista de produtos da categoria do menu escolhido
  Wait Until Element Is Visible    ${CATEGORIA_H1_CATEGORY_PRODUCT}  
  ${aux}    Catenate  ${Home_Menu_Escolhido}${SPACE}
  Element Text Should Be           ${CATEGORIA_H1_CATEGORY_PRODUCT}          ${aux}

Escolher um produto  
  Click Element                  ${CATEGORIA_PRODUCT_BLOUSE}

  


