#language:pt

Funcionalidade: Meu perfil
    Para que eu possa ter meus dados atualizados
    Sendo um usuário
    Posso completar o meus cadastro

    @perfil @perfil_logout
    Esquema do Cenário: Atualizar meu perfil

        Dado que estou autenticado com "diegomacedo@qaninja.io" e "123456"
        E acesso o meu perfil
        Quando completo o meu cadastro com "<empresa>" e "<cargo>"
        Então vejo a mensagem "Perfil atualizado com sucesso."

        Exemplos:
        | empresa        | cargo      |
        | QA Ninja       | Developer  |
        | Dotz           | QA         |
        | Microsoft      | CTO        |
        | Google         | Estagiário |
        | Dogão do Betão | CEO        |