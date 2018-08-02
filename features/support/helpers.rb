class Helpers
    def login(email, senha)
        result = HTTParty.post(
            'https://marktasks.herokuapp.com/api/login',
            headers: { 'Content-Type' => 'application/json' },
            body: { email: email, password: senha }.to_json
        )
        result.parsed_response['data']
    end

    def remover_tarefa(token, titulo)
        @headers = {
            'Content-Type' => 'application/json',
            'X-User-Id' => token['userId'],
            'X-Auth-Token' => token['authToken']
        }

        result = HTTParty.get(
            'https://marktasks.herokuapp.com/api/tasks',
            headers: @headers
        )

        @tasks = result.parsed_response['data']
        # puts @tasks = result.parsed_response['data'].class #-> Para descobrir o titulo.

        @tasks.each do |t|
            @id_para_remover = t['_id'] if t['title'] == titulo
        end
            # puts @id_para_remover
        # @tarefa = @tasks.select { |t| t['title'] == titulo }.first #-> outra maneira de selecionar o item da lista
        
        HTTParty.delete(
            'https://marktasks.herokuapp.com/api/tasks/' + @id_para_remover, #-> Se optar pela opção comentada, então o id deve ser declarado assim "@tarefa['_id']"
            headers: @headers
        )
    end
    

    def back_to_the_past(email)
        HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{email}?clean=full")
    end
end