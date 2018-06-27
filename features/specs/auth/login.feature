#language:pt

Funcionalidade: Login
Para que somente eu possa ver as minhas tarefas
Sendo um usuário
Posso logar no sistema com meus dados de acesso previamente cadastrados

@login @logout @smoke
Cenário: Login do usuário
    Quando faço login com "diegomacedo@qaninja.io" e "123456"
    Então sou autenticado com sucesso
    E vejo o meu painel de atividades

@login_exp
Esquema do Cenário: Tentativa de login

    Quando faço login com "<email>" e "<senha>"
    Então não sou autenticado
    E devo ver mensagem "<alerta>"

    Exemplos:
        |email|senha|alerta|
        | eu@papito.io                | abc123 | Senha inválida.            |
        | padre.kevedo@naoekziste.com | 123456 | Usuário não cadastrado.    |
        | eu@papito.io                |        | Senha ausente.             |
        |                             | 123456 | Email incorreto ou ausente.|