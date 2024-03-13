*** Settings ***

Library            SeleniumLibrary
Library            String

Resource           pages/Home.resource
Resource           pages/Login.resource
Resource           pages/Conta_CreateAccount.resource
Resource           pages/Conta_MayAccount.resource
Resource           pages/Categoria_ListaDeOpcoesDeProdutos.resource

*** Keywords ***
Print
    Capture Page Screenshot