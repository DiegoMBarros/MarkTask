# Before ('@excluir_cadastro') do 
#     HTTParty.get('https://marktasks.herokuapp.com/api/reset/diegomacedo@qaninja.io?clean=full')
# end

Before do
    @login = LoginPage.new
    @tasks = TarefasPage.new
    @perfil = PerfilPage.new
    # @nav = Navbar.new
    
    @helpers = Helpers.new

    page.current_window.resize_to(1280, 800)
end

Before('@auth') do
    @login = LoginPage.new
    @tasks = TarefasPage.new
    @helpers = Helpers.new

    @email = 'diegomacedo@qaninja.io'
    @senha = '123456'    
    @login.load
    @login.logar(@email, @senha)
    @token = @helpers.login(@email, @senha) #-> Comando para logar via api
    sleep 4
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

After do |scenario|
    # puts scenario.name -> função para pegar o nome do cenário
    nome_cenario = scenario.name.tr(' ','_').downcase!
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '') #3h32 aula 4
    screenshot = "logs/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique aqui para ver a evidência!')
end