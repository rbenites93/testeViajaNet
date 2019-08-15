class Reservar_passagem
    
    def acessarPagina(url)
        
        @driver = Selenium::WebDriver.for :chrome
        @driver.get "#{url}"
        @driver.manage.window.maximize
        sleep(3)

        verificaJanela()
        
    end

    def selecionaOrigemDestino(origem, destino)

        @driver.find_element(:id, "inptorigin").clear()
        @driver.find_element(:id, "inptorigin").send_keys("#{origem}")
        sleep(3)
        @driver.find_element(:id, "inptorigin").send_keys :enter
        sleep(3)
        @driver.find_element(:id, "inptdestination").clear()
        @driver.find_element(:id, "inptdestination").send_keys("#{destino}")
        sleep(3)
        @driver.find_element(:id, "inptdestination").send_keys :enter
        sleep(3)

    end

    def selecionaDataViajem(dataOrigem, dataDestino)
        
        validadorCalendario(dataOrigem, dataDestino)

    end

    def clicaPesquisar

        @driver.find_element(:xpath, "//button[@type='submit']").click()

        sleep(15)

    end

    def validaPaginaCheckout

        if (element_present?(:id, "frmCheckout") === true)
            puts 'Checkout pagamento OK'
        end
        
    end

    def clicaComprarResultado

        @driver.find_element(:class, "btn-checkin").click()
        sleep(2)

        if (element_present?(:class, "modal-dialog") === true)
            
        modal =  @driver.find_element(:class, "buttons-luggage").find_element(:css, '[ng-model="ctrl.model"]').click()
        end
        
        sleep(10)

    end

    def seusDados(email)

        trocarJanela()
        @driver.find_element(:id, "my-account_email").send_keys("#{email}")
        
    end

    def preencheNomeESobrenome(nome, sobreNome)
        @driver.find_element(:id, "nome_0").send_keys("#{nome}")
        @driver.find_element(:id, "lastName_0").send_keys("#{sobreNome}")
    end

    def preencheDataNascimentoESexo(dataNas, sexo)
        @driver.find_element(:id, "birth_0").send_keys("#{dataNas}")
        @driver.find_element(:name, "gender_0").send_keys("#{sexo}")
    end

    def selecionaFormaPagamento()
        sleep(2)
        @driver.find_element(:id, "card6").click()

    end

    def formaPagamentoCartaoCredito()
        @driver.find_element(:id, "flag_card").send_keys("Mastercard")
        sleep(2)
        @driver.find_element(:id, "number_card-0").send_keys("5135 9209 8902 5099")
        @driver.find_element(:id, "month-0").send_keys("03")
        @driver.find_element(:id, "year-0").send_keys("2021")
        @driver.find_element(:id, "name_card-0").send_keys("RAFAEL A BENITES")
        @driver.find_element(:id, "cpf_card-0").send_keys("086.134.570-37")
        @driver.find_element(:id, "codesecure_card-0").send_keys("115")

    end

    def preencheEnderecoFatura(cep, numero)
        @driver.find_element(:id, "zipcode-0").send_keys("#{cep}")
        @driver.find_element(:id, "number_address-0").click()
        sleep(3)
        @driver.find_element(:id, "number_address-0").send_keys("#{numero}")

    end

    def preencheEmailEConfirmacao(e_mail)
        @driver.find_element(:id, "contact_email").send_keys("#{e_mail}")
        @driver.find_element(:id, "contact_email_confirm").send_keys("#{e_mail}")
    end

    def preencheCelular(telefone)
        @driver.find_element(:id, "contact_phonenumber_0").send_keys("#{telefone}")
        
    end

    def clicaFinalizarCompra
        @driver.find_element(:id, "accept-checkout").click()
        @driver.find_element(:xpath, "//button[@type='submit']").click()
    end

    def validaProcessamento

        sleep(15)
        @driver.find_element(:class, "in-progress").find_element(:tag_name, "small").text

    end

    def verificaJanela

        if (element_present?(:id, "checkoutAbandon"))
            
            @driver.find_element(:class, "btn-close-modal").click()
            sleep(2)
        end
    
    end

    def element_present?(localizador, elemento)
        begin
            @driver.find_element("#{localizador}", "#{elemento}").displayed?
            return true
            rescue Selenium::WebDriver::Error::NoSuchElementError
                return false
        end
    end
    
    def validadorCalendario(dataOrigem, dataDestino)

        if (element_present?(:id, "lblDepartureDate") === true)

            @driver.find_element(:xpath, "//*[@id='lblDepartureDate']").click()
            sleep(3)
    
            calendario = @driver.find_element(:class, "calendar-days")
    
                lista = calendario.find_elements(:tag_name, "div")
                lista.each do |div|
                    element = div.text
                    if (element.include?("#{dataOrigem}"))
                        div.click()
                        break
                    end
                end
    
                calendario2 = @driver.find_element(:class, "calendar-days")
                
                lista = calendario2.find_elements(:tag_name, "div")
                lista.each do |div|
                    element = div.text
                    if (element.include?("#{dataDestino}"))
                        div.click()
                        break
                    end
                end        
        else
            @driver.find_element(:id, "departureDate").click()
            sleep(3)
    
            teste = @driver.find_element(:class, "pika-table")
                lista = teste.find_elements(:tag_name, "td")
                lista.each do |td|
                    element = td.text
                    if (element.include?("#{dataOrigem}"))
                        td.click()
                        break
                    end
                end
        
            @driver.find_element(:id, "arrivalDate").click()
            sleep(3)
    
            teste2 = @driver.find_element(:xpath, "//*[@id='topo']/div[10]").find_element(:class, "pika-table")
            lista = teste2.find_elements(:tag_name, "td")
            lista.each do |td|
                element = td.text
                if (element.include?("#{dataDestino}"))
                    td.click()
                    break
                end
            end
            
        end
        
    end

    def trocarJanela

        @driver.switch_to.window(@driver.window_handles[1])
        sleep(5)
    
    end

end