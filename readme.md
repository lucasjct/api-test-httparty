# clube-platinum-api

Teste de API com HTTParty.

## Getting started

[HTTParty](https://github.com/jnunemaker/httparty), auxilia a validar as requisições com os métodos HTTP.   
Para facilitar a sintaxe e disponibilizar recursos pra validação, utilizamos também [Rspec](https://relishapp.com/rspec/).
   
 
## Para executar este projeto:   

* É necessário ter uma versão do Ruby e Bundle instalada na máquina.  
* Clonar o projeto:  
    `git clone https://github.com/lucasjct/api-test-httparty.git`  
* Instalar as dependências:  
`bundle install` 
* Após isso, executar os testes com o seguinte comando:  
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
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'


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
* Dentro do arquivo `get_listar_spec.rb`, será utilizada a sintaxe do Rspec, que pode ser consultada [aqui](https://relishapp.com/rspec/).  

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

No diretório `hooks/` configuramos um método que sempre é chamado na suíte de testes e que retorna o token necessário para a autenticação.  O arquivo de `hooks` precisa chamar as configurações do arquivo `spec_helper.rb` .  

O método do arquivo hooks é chamado pela palavra chave `before {nome_metodo(parâmetros)}` dentro da da suite de testes. A suite por sua vez, precisa chamar o arquivo hooks: `require_relative '../../hooks/hook'`.

* Finalmente, para rodar os testes:   
`rspec`  
* Para verificar as opções de saída do rspec:  
`rspec --help`  

Navegue pelas pastas deste projeto e verifique outras possibilidades.