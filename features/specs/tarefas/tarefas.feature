#language: pt

Funcionalidade: Cadastro de tarefas
    Para que eu possa organizar minhas atividades
    Sendo um usuário organizado
    Posso cadastrar novas tarefas

    @nova_task @auth @logout @smoke
    Cenario: Nova tarefa
        
        Dado que eu tenho uma tarefa com os atributos:
            | titulo | Ler livro de Ruby |
            | data   | 31/03/2018        |
        E quero taguear esta tarefa com:
            | tag     |
            | ruby    |
            | livro   |
            | leitura |
            | estudar |
        Quando faço o cadastro desta tarefa
        Então devo ver este cadastro com status "Em andamento"

    @tarefa_dup @auth @logout
    Cenario: Tarefa duplicada
        Dado que eu tenho uma tarefa com os atributos:
            | titulo | Ler livro de Go lang |
            | data   | 01/04/2018           |
        E quero taguear esta tarefa com:
            | tag      |
            | go       |
            | livro    |
            | leitura  |
            | hardcore |
        Mas eu já tinha cadastrado esta tarefa e não tinha percebido
        Quando faço o cadastro desta tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar fazer o cadastro 