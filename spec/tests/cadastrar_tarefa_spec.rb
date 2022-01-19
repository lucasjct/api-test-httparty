require_relative '../../hooks/hook'

context 'Tarefas' do
    before { token('teste-lucas@gmail.com', '123456') }
    it 'Com sucesso' do
            @headers = {
                Accept:'application/vnd.tasksmanager.v2',
                'Content-Type': 'application/json',
                 Authorization:  $token
            }

            @body = {
                task: {
                  title: "Tarefa 1",
                  description: "Descrição da tarefa Lucas.",
                  deadline: "2018-08-21 15:00:00",
                  done: true
                }
            }.to_json

            @tarefa = Cadastrar.post('/tasks', body: @body , headers: @headers)
            expect(@tarefa.parsed_response['data']['attributes']['title']).to eq('Tarefa 1')

    end
end