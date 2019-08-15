#language: pt

Funcionalidade: Realizar o fluxo simples para reservar uma passagem

    Cenário: Acessar site viajaNet 
        Dado que eu acesso o site do viajaNet em 'https://www.viajanet.com.br/'
        Então acesso site com sucesso

    Cenário: Selecionar destino e realizar pesquisa com sucesso
        Quando eu seleciono a origem "São Paulo" e destino "frança"
        E seleciono a data de ida dia "20" de agosto e a data de volta dia "30" de agosto
        Então realizo a pesquisa com sucesso 

    Cenário: Selecionar o primeiro resultado de passagem
        Dado que estou na pagina de resultado de passagem
        Quando eu clico no primeiro resultado de passagem em comprar
        Então sou encaminhado para pagina de confirmação da compra
    
    Cenário: Preencher informações de compra
        Quando realizo o preenchimento das informações da compra usando o e-mail "teste@teste.com"
        E realizo o preenchimento do passageiro com o nome de "Rafael" e sobrenome "Benites"
        E data de nascimento "06/04/1993" do sexo "Masculino"
        Então finalizo com sucesso o preenchimento de informações para compra

    Cenário: Preencher informações de pagamento
        Quando seleciono a forma de pagamento cartão de crédito parcelado
        E realizo o preenchimento dos dados do cartão de crédito
        E preencho o endereço de fatura do cartão com o cep "09810-170" e número "43"
        Então finalizo com sucesso o preenchimento de informações de pagamento

    Cenário: Preencher dados para contato
        Quando realizo o preenchimento do e-mail "teste@teste.com"
        E numero de celular "(13)99623-2222"
        Então clico em finalizar compra 
    
    Cenário: Validar processamento de reserva
        Então devo validar passagem em processamento