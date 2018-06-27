    Quando("faço login com {string} e {string}") do |email, senha|
        @email = email

        @login = LoginPage.new
        @tasks = TarefasPage.new
        @login.load
        @login.logar(email, senha)
    end

    Então("sou autenticado com sucesso") do
        expect(@tasks.nav.menu_usuario.text).to eql @email
    end

    E("vejo o meu painel de atividades") do
        expect(@tasks.titulo.text).to eql 'Painel de Atividades'
    end

    Então("não sou autenticado") do
        expect(@tasks.has_botao_novo?).to be false
    end

    E("devo ver mensagem {string}") do |mensagem_alerta|
        expect(@login.alert.text).to eql mensagem_alerta
    end
    
    