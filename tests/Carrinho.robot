*** Settings ***
Resource                ../resources/Base.resource

Test Teardown           Print


*** Test Cases ***    
Cebnario: Escolher um produto
    acessar site
    acessar o menu de compra    women
    Visualizar lista de produtos da categoria do menu escolhido 
    Escolher um produto