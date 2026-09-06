 Modelo Entidade e Relacionamento (MER)

 1. Entidades

 Cliente

Definição: Representa a pessoa que realiza compras no sistema de e-commerce.

Produto

Definição: Representa os produtos disponíveis para venda na loja virtual.

 Categoria

Definição: Representa a classificação utilizada para organizar os produtos da loja.

 Pedido

Definição: Representa uma compra realizada por um cliente.

 ItemPedido

Definição: Representa cada produto incluído em um pedido, armazenando informações como quantidade e preço no momento da compra.

Pagamento

*Definição:* Representa o pagamento relacionado a um pedido.

Endereco

*Definição:* Representa o endereço utilizado pelo cliente para entrega dos pedidos.

 2. Relacionamentos e Cardinalidades

Cliente e Pedido

*[Cliente] (1) — realiza — (N) [Pedido]*

Um Cliente pode realizar vários Pedidos, mas cada Pedido pertence a apenas um Cliente.

Cliente e Endereco

*[Cliente] (1) — possui — (N) [Endereco]*

Um Cliente pode possuir vários Endereços, mas cada Endereço pertence a apenas um Cliente.

Categoria e Produto

*[Categoria] (1) — possui — (N) [Produto]*

Uma Categoria pode possuir vários Produtos, mas cada Produto pertence a apenas uma Categoria.

 Pedido e ItemPedido

*[Pedido] (1) — possui — (N) [ItemPedido]*

Um Pedido possui um ou vários ItensPedido, enquanto cada ItemPedido pertence a apenas um Pedido.

 Produto e ItemPedido

*[Produto] (1) — aparece em — (N) [ItemPedido]*

Um Produto pode aparecer em vários ItensPedido de diferentes Pedidos, mas cada ItemPedido representa apenas um Produto.

Pedido e Pagamento

*[Pedido] (1) — possui — (1) [Pagamento]*

Cada Pedido possui um Pagamento e cada Pagamento está relacionado a apenas um Pedido.

 Pedido e Endereco

[Pedido] (1) UTILIZA (N) [Endereço]

Um Pedido utiliza apenas 1 Endereço, enquanto um Endereço pode ser utilizado por vários Pedidos.

 3. Sugestão de Atributos

Cliente

Cliente:
- CPF (PK)
- nome
- email
- telefone

Produto

* *id_produto (PK):* identificador único do produto.
* nome: nome do produto.
* descricao: descrição do produto.
* preco: preço atual do produto.
* estoque: quantidade disponível em estoque.
* id_categoria (FK): identifica a categoria do produto.

 Categoria

* *id_categoria (PK):* identificador único da categoria.
* nome: nome da categoria.
* descricao: descrição da categoria.


Pedido

- id_pedido (PK): identificador único do pedido.
- data_pedido: data em que o pedido foi realizado.
- status: situação atual do pedido.
- valor_total: valor total do pedido.
- CPF (FK): identifica o cliente responsável pelo pedido.
- id_endereco (FK): identifica o endereço utilizado para entrega.

ItemPedido

* *id_item (PK):* identificador único do item do pedido.
* quantidade: quantidade do produto comprada.
* preco_unitario: preço do produto no momento da compra.
* subtotal: valor resultante da quantidade multiplicada pelo preço unitário.
* id_pedido (FK): identifica o pedido ao qual o item pertence.
* id_produto (FK): identifica o produto comprado.

Pagamento

* *id_pagamento (PK):* identificador único do pagamento.
* forma_pagamento: forma utilizada para realizar o pagamento.
* data_pagamento: data em que o pagamento foi realizado.
* valor: valor pago.
* status: situação do pagamento.
* id_pedido (FK): identifica o pedido relacionado ao pagamento.


Endereco

- id_endereco (PK): identificador único do endereço.
- rua: nome da rua.
- numero: número do endereço.
- complemento: complemento do endereço.
- bairro: bairro do endereço.
- cidade: cidade do endereço.
- estado: estado do endereço.
- cep: CEP do endereço.
- CPF (FK): identifica o cliente proprietário do endereço.
  
Observações sobre os atributos

Os atributos identificados como *PK* são as chaves primárias das entidades e possuem a função de identificar cada registro de forma única.

Os atributos identificados como *FK* são chaves estrangeiras utilizadas para representar os relacionamentos entre as entidades.

O atributo *subtotal* de ItemPedido é um atributo derivado, pois pode ser obtido pela multiplicação da quantidade pelo preço unitário.


4. Diagrama Entidade e Relacionamento (DER)

O diagrama abaixo representa visualmente as entidades e seus principais relacionamentos.

![Diagrama Entidade e Relacionamento](Diagrama%20sem%20nome.drawio.png)
