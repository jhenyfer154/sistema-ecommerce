 Sistema de E-commerce

 Descrição do Minimundo

O projeto consiste na modelagem de dados de um sistema de e-commerce. O sistema tem como objetivo organizar as informações de clientes, produtos, categorias, pedidos, pagamentos e endereços, facilitando o controle das vendas realizadas pela loja virtual.

O sistema deve permitir que os clientes realizem compras de produtos disponíveis na loja. Cada produto possui informações próprias e pertence a uma categoria. Quando um cliente realiza uma compra, é criado um pedido contendo os produtos escolhidos e suas respectivas quantidades.

O sistema também deve registrar o endereço utilizado pelo cliente e as informações relacionadas ao pagamento do pedido.

Problema que o sistema busca resolver

O banco de dados busca resolver o problema de organizar e controlar as informações de uma loja virtual. Sem um sistema organizado, pode ser difícil controlar os clientes, produtos disponíveis, pedidos realizados, pagamentos e endereços de entrega.

Com a utilização do banco de dados, essas informações podem ser armazenadas de forma organizada, facilitando o acompanhamento das vendas e evitando informações duplicadas ou desorganizadas.

 Regras de Negócio

* Um cliente pode realizar vários pedidos.
* Cada pedido pertence a apenas um cliente.
* Um cliente pode possuir um ou mais endereços.
* Cada endereço pertence a apenas um cliente.
* Um produto pertence a uma única categoria.
* Uma categoria pode possuir vários produtos.
* Um pedido pode possuir vários produtos.
* Um produto pode estar presente em vários pedidos.
* Cada item de pedido registra a quantidade de um determinado produto.
* Cada pedido possui um pagamento.
* Um pagamento pertence a apenas um pedido.
* Um pedido está associado a um endereço de entrega.
* Os produtos possuem preço e quantidade disponível em estoque.

 Principais Processos

O sistema deve atender aos seguintes processos:

1. Cadastro de clientes.
2. Cadastro e organização de produtos.
3. Cadastro de categorias.
4. Cadastro de endereços dos clientes.
5. Realização de pedidos.
6. Inclusão de produtos nos pedidos.
7. Registro da quantidade de cada produto comprado.
8. Registro do pagamento do pedido.
9. Consulta dos pedidos realizados pelos clientes.
10. Controle das informações dos produtos e seus estoques.

 Objetivo da Modelagem

A modelagem tem como objetivo representar as principais entidades do sistema de e-commerce, seus atributos e os relacionamentos existentes entre elas, servindo como base para a criação futura do banco de dados.
