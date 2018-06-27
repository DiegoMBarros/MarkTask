Dado("que estou autenticado com {string} e {string}") do |email, senha|
    @login = LoginPage.new
    @tasks = TarefasPage.new
    @perfil = PerfilPage.new
    @login.load
    @login.logar(email, senha)
    @tasks.wait_for_table_body
end

Dado("acesso o meu perfil") do
    # @perfil.load # > Acesso pelo link, via URL

    # > Acesso através do menu superior
    @tasks.nav.menu_usuario.click
    @tasks.nav.meu_perfil.click
end
  
Quando("completo o meu cadastro com {string} e {string}") do |empresa, cargo|
    @perfil.atualiza(empresa,cargo)
end
  
Então("vejo a mensagem {string}") do |mensagem|
    expect(@perfil.formulario).to have_content mensagem
end

#upload

Dado("que eu tenho uma foto muito bonita") do
    # @minha_foto = File.join(Dir.pwd, 'features/support/fixtures/al.jpg')
    # @minha_foto = File.join(Dir.pwd, '/features/support/fixtures/AlElric.jpg')
    @minha_foto = File.join(Dir.pwd, 'features/support/fixtures/elrics.jpg')
end
  
Quando("faço o upload da minha foto") do
    @perfil = PerfilPage.new
    @perfil.load
    @perfil.upload(@minha_foto)
end
  
Então("devo ver a mensagem de upload com o texto {string}") do |mensagem|
    expect(@perfil.formulario).to have_content mensagem
end