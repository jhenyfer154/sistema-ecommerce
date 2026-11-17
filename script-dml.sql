-- PROJETO: Sistema de E-commerce
-- ARQUIVO: script-dml.sql
-- SGBD: MySQL 8.0+
-- Execute primeiro o script-ddl.sql.
-- Os dados pessoais abaixo sao ficticios e academicos.

USE sistema_ecommerce;

-- CENARIO 1: Configuracao inicial do catalogo.
-- A loja organiza cinco categorias antes de iniciar as vendas.
INSERT INTO categoria (id_categoria, nome, descricao, ativo) VALUES
(1, 'Eletronicos', 'Aparelhos e acessorios eletronicos.', TRUE),
(2, 'Informatica', 'Equipamentos e acessorios para computadores.', TRUE),
(3, 'Casa e Cozinha', 'Utensilios e produtos para o lar.', TRUE),
(4, 'Papelaria', 'Materiais para estudo e escritorio.', TRUE),
(5, 'Acessorios', 'Acessorios de uso pessoal e cotidiano.', TRUE);

-- CENARIO 2: Cadastro dos primeiros produtos.
-- A equipe cadastra produtos, precos e estoques iniciais.
INSERT INTO produto (id_produto, id_categoria, nome, descricao, preco, estoque) VALUES
(1, 1, 'Fone Bluetooth Wave', 'Fone sem fio com estojo de carregamento.', 129.90, 25),
(2, 2, 'Mouse Optico USB', 'Mouse com fio e sensor optico.', 49.90, 40),
(3, 3, 'Garrafa Termica Inox', 'Garrafa termica com capacidade de 500 ml.', 79.90, 30),
(4, 4, 'Caderno Universitario', 'Caderno de 10 materias com 160 folhas.', 34.50, 50),
(5, 5, 'Mochila Urbana', 'Mochila para rotina de estudo e trabalho.', 119.00, 18);

-- CENARIO 3: Chegada dos primeiros clientes.
-- Cinco pessoas criam contas na loja virtual. Dados ficticios.
INSERT INTO cliente (cpf, nome, email, telefone, data_cadastro) VALUES
('11111111111', 'Ana Beatriz Souza', 'ana.souza@example.com', '(84) 90000-0001', '2026-03-02 09:00:00'),
('22222222222', 'Bruno Martins Lima', 'bruno.lima@example.com', '(84) 90000-0002', '2026-03-02 09:30:00'),
('33333333333', 'Carla Oliveira Santos', 'carla.santos@example.com', '(84) 90000-0003', '2026-03-02 10:15:00'),
('44444444444', 'Diego Ferreira Costa', 'diego.costa@example.com', '(84) 90000-0004', '2026-03-02 11:00:00'),
('55555555555', 'Elisa Ribeiro Alves', 'elisa.alves@example.com', '(84) 90000-0005', '2026-03-02 11:45:00');

-- CENARIO 4: Registro dos enderecos de entrega.
-- Cada cliente informa um endereco para receber suas compras.
INSERT INTO endereco (id_endereco, cpf, rua, numero, complemento, bairro, cidade, estado, cep) VALUES
(1, '11111111111', 'Rua das Flores', '120', 'Casa', 'Centro', 'Pedro Velho', 'RN', '59196000'),
(2, '22222222222', 'Avenida Principal', '45', 'Apto 201', 'Nossa Senhora da Conceicao', 'Canguaretama', 'RN', '59190000'),
(3, '33333333333', 'Rua Nova', '310', NULL, 'Estacao', 'Goianinha', 'RN', '59173000'),
(4, '44444444444', 'Rua do Comercio', '88', 'Casa B', 'Centro', 'Montanhas', 'RN', '59198000'),
(5, '55555555555', 'Travessa do Sol', '17', NULL, 'Planalto', 'Nova Cruz', 'RN', '59215000');

-- CENARIO 5: Realizacao dos primeiros pedidos.
-- Cinco compras sao registradas, vinculadas aos clientes e enderecos.
-- Os totais correspondem aos itens cadastrados no cenario seguinte.
INSERT INTO pedido (id_pedido, cpf, id_endereco, data_pedido, status, valor_total) VALUES
(1, '11111111111', 1, '2026-03-03 10:20:00', 'Entregue', 129.90),
(2, '22222222222', 2, '2026-03-03 14:10:00', 'Entregue', 99.80),
(3, '33333333333', 3, '2026-03-04 09:45:00', 'Enviado', 79.90),
(4, '44444444444', 4, '2026-03-04 16:30:00', 'Aprovado', 69.00),
(5, '55555555555', 5, '2026-03-05 11:05:00', 'Pendente', 119.00);

-- CENARIO 6: Detalhamento dos itens comprados.
-- O preco_unitario registra o valor praticado no momento da compra.
INSERT INTO item_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1, 129.90),
(2, 2, 2, 2, 49.90),
(3, 3, 3, 1, 79.90),
(4, 4, 4, 2, 34.50),
(5, 5, 5, 1, 119.00);

-- CENARIO 7: Registro dos pagamentos.
-- O sistema registra forma, valor, data e situacao de cada pagamento.
INSERT INTO pagamento (id_pagamento, id_pedido, forma_pagamento, data_pagamento, valor, status) VALUES
(1, 1, 'Cartao de credito', '2026-03-03 10:22:00', 129.90, 'Aprovado'),
(2, 2, 'Pix', '2026-03-03 14:12:00', 99.80, 'Aprovado'),
(3, 3, 'Cartao de debito', '2026-03-04 09:47:00', 79.90, 'Aprovado'),
(4, 4, 'Pix', '2026-03-04 16:32:00', 69.00, 'Aprovado'),
(5, 5, 'Boleto', NULL, 119.00, 'Pendente');

-- CENARIO 8: Primeiras avaliacoes dos produtos.
-- Cada cliente avalia um produto, compartilhando sua experiencia.
INSERT INTO avaliacao_produto (id_avaliacao, cpf, id_produto, nota, comentario, data_avaliacao) VALUES
(1, '11111111111', 1, 5, 'Produto funcionando bem e chegou em boas condicoes.', '2026-03-08 18:00:00'),
(2, '22222222222', 2, 4, 'Mouse confortavel e atende ao que eu precisava.', '2026-03-08 18:30:00'),
(3, '33333333333', 3, 5, 'Mantem a bebida na temperatura por bastante tempo.', '2026-03-09 09:15:00'),
(4, '44444444444', 4, 4, 'Caderno com bom acabamento e bastante espaco.', '2026-03-09 10:00:00'),
(5, '55555555555', 5, 5, 'Mochila espacosa e util para a rotina.', '2026-03-10 12:20:00');

-- CONFERENCIA: Cada tabela deve apresentar cinco registros.
SELECT 'cliente' AS tabela, COUNT(*) AS quantidade FROM cliente
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'produto', COUNT(*) FROM produto
UNION ALL SELECT 'endereco', COUNT(*) FROM endereco
UNION ALL SELECT 'pedido', COUNT(*) FROM pedido
UNION ALL SELECT 'pagamento', COUNT(*) FROM pagamento
UNION ALL SELECT 'item_pedido', COUNT(*) FROM item_pedido
UNION ALL SELECT 'avaliacao_produto', COUNT(*) FROM avaliacao_produto;

-- FIM DO SCRIPT DML.
