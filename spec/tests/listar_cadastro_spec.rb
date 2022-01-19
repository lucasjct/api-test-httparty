context "Listar todos cadastrados" do
    it 'Get - Listagem' do
        @listar = Login.get('/contacts/665')
        puts @listar
        puts $token
    end
end