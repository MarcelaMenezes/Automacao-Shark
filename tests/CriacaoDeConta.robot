*** Settings ***
Resource                ../resources/Base.resource


Test Teardown           Print


*** Test Cases ***

Cenário 1: Criação de conta com sucesso
    Dado que acesso a tela de login do site
    Casdastrar um novo e-mail                                      luiz@gmail.com
    Validar campo de email                                         ok
    Clicar em "Create an account"
    Cadastrar as informações pessoais
    Conferir se o cadastro foi efetuado com sucesso                Your account has been created.
    deverá direcionar para a página minha conta do site

 Cenário 2: Criação de conta com email invalido
    Dado que acesso a tela de login do site
    Casdastrar um novo e-mail                                        macelalima.com
    Validar campo de email                                           error
    Clicar em "Create an account"
    Validar mensagem de erro no e-mail cadastrado                    Invalid email address.

 Cenário 3: Criação de conta com email já registrado
    Dado que acesso a tela de login do site
    Casdastrar um novo e-mail                                        marcela@gmail.com
    Validar campo de email                                           ok
    Clicar em "Create an account"
    Validar mensagem de erro no e-mail cadastrado                    An account using this email address has already been registered. Please enter a valid password or request a new one.