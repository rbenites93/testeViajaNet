reservar = Reservar_passagem.new

Dado("que eu acesso o site do viajaNet em {string}") do |url|

    @pagina = url
    reservar.acessarPagina(@pagina)
    reservar.verificaJanela()
  end
  
  Então("acesso site com sucesso") do
    expect(@pagina).to eq('https://www.viajanet.com.br/')
  end
  
  Quando("eu seleciono a origem {string} e destino {string}") do |origem, destino|

    reservar.selecionaOrigemDestino(origem, destino)
  end
  
  Quando("seleciono a data de ida dia {string} de agosto e a data de volta dia {string} de agosto") do |dtOrigem, dtDestino|

    reservar.selecionaDataViajem(dtOrigem, dtDestino)
    
  end
  
  Então("realizo a pesquisa com sucesso") do

    reservar.clicaPesquisar()
  end

  Dado("que estou na pagina de resultado de passagem") do
    
    reservar.validaPaginaCheckout()
  end
  
  Quando("eu clico no primeiro resultado de passagem em comprar") do
    
    reservar.clicaComprarResultado()
  end

  Então("sou encaminhado para pagina de confirmação da compra") do

   reservar.trocarJanela()
  end

  Quando("realizo o preenchimento das informações da compra usando o e-mail {string}") do |email|
   
    reservar.seusDados(email)
  end
  
  Quando("realizo o preenchimento do passageiro com o nome de {string} e sobrenome {string}") do |nome, sobreNome|
    reservar.preencheNomeESobrenome(nome, sobreNome)
    
  end
  
  Quando("data de nascimento {string} do sexo {string}") do |dataNas, sexo|
    reservar.preencheDataNascimentoESexo(dataNas, sexo)

  end
  
  Então("finalizo com sucesso o preenchimento de informações para compra") do
    puts 'Finalizado preenchimento de informações para compra'
  end
  
  Quando("seleciono a forma de pagamento cartão de crédito parcelado") do
      reservar.selecionaFormaPagamento()    

  end
  
  Quando("realizo o preenchimento dos dados do cartão de crédito") do
      reservar.formaPagamentoCartaoCredito()    

  end
  
  Quando("preencho o endereço de fatura do cartão com o cep {string} e número {string}") do |cep, numero|
      reservar.preencheEnderecoFatura(cep, numero)
    
  end
  
  Então("finalizo com sucesso o preenchimento de informações de pagamento") do
    puts 'Finalizado com sucesso dados para pagamento'
  end
  
  Quando("realizo o preenchimento do e-mail {string}") do |e_mail|
    reservar.preencheEmailEConfirmacao(e_mail)

  end
  
  Quando("numero de celular {string}") do |telefone|
    reservar.preencheCelular(telefone)

  end
  
  Então("clico em finalizar compra") do
    reservar.clicaFinalizarCompra()
  end
  
  Então("devo validar passagem em processamento") do

    
    expect(reservar.validaProcessamento()).to eq('Sua reserva está em processamento. Após a confirmação do pagamento você receberá sua passagem aérea por e-mail.')

  end
