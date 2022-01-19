# clube-platinum-api

Teste de API com HTTParty.

## Getting started

Os testes verficam a resposta dos endpoints que dão suporte para a Campanha Club Platinum do Ambiente Lojista B&S.  
Para isso, utilizamos um framework de teste para requisições chamado [HTTParty](https://github.com/jnunemaker/httparty), que auxilia validar os métodos HTTP.   
Para facilitar a sintaxe e disponibilizar recursos pra validação, utilizamos também [Rspec](https://relishapp.com/rspec/).
   

![image](./image/teste-clube-platinum.png)   


## Para executar este projeto:   

* É necessário ter uma versão do Ruby e Bundle instalada na máquina.  
* Clonar o projeto:  
    `git clone https://gitlab.com/qualidade_pro22/clube-platinum-api.git`  
* Instalar as dependências:  
`bundle install` 
* Após isso, executar os testes na linha de comando com:  
`rspec`


# Como criar um projeto com HTTParty   

* Partimos do princípio que tenha Ruby e Bundle instalados 
* Criar o direório do projeto e rodar o seguinte comando:  
`rspec --init`  
* Após o  comando acima, será criado o seguintes diretório:  
```bash 
spec
  |__ spec_helper.rb
```

* Ainda no diretório raiz, crie o arquivo de dependências `Gemfile` utilizando as seguintes Gems: 

    * `gem "httparty"`  
    * `gem "rpsec"`  


* instalar as gems com o seguinte comando:   
* `bundle install`  

## A partir de agora podemos inicial o projeto  

* Crie um diretório chamado `service` e nele iremos construir os arquivos com módulos que irão configurar as requisições.    
* Agora dentro da pasta `service` crie o arquivo `service.rb`. O conteúdo deste arquivo deve trazer as informações do headers da requisição e importar o HTTParty.  EXemplo:   

```ruby
module Exemplo 
    include HTTParty
    base_uri 'http://some-request.com'
    format :json
    headers Accept: "*/*",
            "Accept-Encoding": "gzip, deflate, br",
            "Connection": "keep-alive",
            "Authorization": "some exemple token"
end
```  

* Agora devemos tornar esse módulo global no pojeto para utilizá-lo em qualquer parte. Para isso, vá ao arquivo `spec_helper.rb`, declare o arquivo como __require_relative__ e defina o nome do módulo como Include dentro do bloco, como exemplo abaixo:

```ruby
require_relative "../services/service.rb"

RSpec.configure do |config|
  include Exemplo
```  
* Agora, podemos definir as requisições que iremos testar dentro da pasta `spec`. Para isso, crie uma nova pasta com o nome do recurso da api que será automatizada.   
* Sempre lembre de nomear o arquivo da requisição utilizando `_spec` como complemento.  

```bash 
spec/
  |__cadatro_usuário/
  |          |__get_listar_spec.rb 
  |
  |__ spec_helper.rb
```
* Dentro do arquivo `get_listar_spec.rb`, será utilizada a sintaxe pelo Rspec, que pode ser consultada [aqui](https://relishapp.com/rspec/).  

* A partir deste momento, a requisição deve ser chamada assim:  

```ruby
describe "Exemplo de requisição" do
        it "Verificar status_code da lista de usuários" do

            @response = Exemplo.get("/lista_usuarios")
            expect(@response.code).to eql(200)
    end
end
```  
OBS: Chamamos apenas o módulo `Exemplo` porque lá no início configuramos toda a requisição dentro deste módulo e o tornamos global.  

* Finalmente, para rodar os testes:   
`rspec`  
* Para verificar as opções de saída do rspec:  
`rspec --help`  

Navegue pelas pastas deste projeto e verifique outras possibilidades.