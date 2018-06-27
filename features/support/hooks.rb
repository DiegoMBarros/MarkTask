Before ('@excluir_cadastro') do 
    visit 'https://marktasks.herokuapp.com/api/reset/diegomacedo@qaninja.io?clean=full'

    @login = LoginPage.new
    @tasks = TarefasPage.new
    @perfil = PerfilPage.new

    page.current_window.resize_to(1280, 800)
end

Before('@auth') do
    @login = LoginPage.new
    @tasks = TarefasPage.new
    
    @login.load
    @login.logar('diegomacedo@qaninja.io', '123456')
    sleep 5
end

After ('@logout') do
        @login = LoginPage.new
        @tasks = TarefasPage.new
        @tasks.nav.bye
end

After ('@perfil_logout') do
    @login = LoginPage.new
    @perfil = PerfilPage.new
    @perfil.nav.bye
end