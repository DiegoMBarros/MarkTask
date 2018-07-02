#language:pt

Funcionalidade: Cadastro
	Sendo um usuário que possui muitas tarefas
	Posso fazer meu cadastro no sistema
	Para poder gerenciar as minhas tarefas

   @cadastro @excluir_cadastro @logout @smoke
	Cenário: Cadastro simplificado

        Dado que eu acessei a página de cadastro
        E possuo os seguintes dados:
            | Nome  | Diego                     |
            | Email | diegomacedo@qaninja.io    |
            | Senha | 123456                    |
        Quando faço o meu cadastro
        Então sou redirecionado para o meu painel de tarefas

    @cadastro_exp 
    Esquema do Cenário: Tentativa de cadastro
        Dado que eu acessei a página de cadastro
        E possuo os seguintes dados:
            | Nome  | <nome>  |
            | Email | <email> |
            | Senha | <senha> |
        Quando faço o meu cadastro
        Então devo ver uma mensagem de alerta "<alerta>"

        Exemplos:
            | nome  | email            | senha  | alerta                                      |
            |       | diego@qaninja.io | 123456 | Nome é obrigatório.                         |
            | Diego |                  | 123456 | Email é obrigatório.                        |
            | Diego | diego@qaninja.io |        | Informe uma senha.                          |
            | Diego | diego@qaninja.io | 12345  | Sua senha deve ter pelo menos 6 caracteres. |
            | Diego | diego@qaninja.io | 1234   | Sua senha deve ter pelo menos 6 caracteres. |
            | Diego | diego@qaninja.io | 123    | Sua senha deve ter pelo menos 6 caracteres. |
            | Diego | diego@qaninja.io | 12     | Sua senha deve ter pelo menos 6 caracteres. |
            | Diego | diego@qaninja.io | 1      | Sua senha deve ter pelo menos 6 caracteres. |