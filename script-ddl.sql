-- PROJETO: Sistema de E-commerce
-- ARQUIVO: script-ddl.sql
-- OBJETIVO: Definir a estrutura do banco de dados (DDL)
-- SGBD: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS sistema_ecommerce;
USE sistema_ecommerce;

-- CENARIO ESTRUTURAL 1: Cadastro dos clientes
CREATE TABLE IF NOT EXISTS cliente (
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (cpf),
    CONSTRAINT uq_cliente_email UNIQUE (email)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 2: Cadastro das categorias
CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    descricao VARCHAR(255),
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id_categoria),
    CONSTRAINT uq_categoria_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 3: Cadastro dos produtos
CREATE TABLE IF NOT EXISTS produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_produto),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),
    CONSTRAINT chk_produto_preco CHECK (preco >= 0),
    CONSTRAINT chk_produto_estoque CHECK (estoque >= 0)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 4: Cadastro dos enderecos dos clientes
CREATE TABLE IF NOT EXISTS endereco (
    id_endereco INT NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    rua VARCHAR(120) NOT NULL,
    numero VARCHAR(15) NOT NULL,
    complemento VARCHAR(80),
    bairro VARCHAR(80) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    PRIMARY KEY (id_endereco),
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (cpf)
        REFERENCES cliente(cpf)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 5: Registro dos pedidos
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    id_endereco INT NOT NULL,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cpf)
        REFERENCES cliente(cpf),
    CONSTRAINT fk_pedido_endereco FOREIGN KEY (id_endereco)
        REFERENCES endereco(id_endereco),
    CONSTRAINT chk_pedido_status CHECK
        (status IN ('Pendente', 'Aprovado', 'Enviado', 'Entregue', 'Cancelado')),
    CONSTRAINT chk_pedido_valor CHECK (valor_total >= 0)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 6: Registro dos pagamentos
CREATE TABLE IF NOT EXISTS pagamento (
    id_pagamento INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    data_pagamento TIMESTAMP NULL DEFAULT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    PRIMARY KEY (id_pagamento),
    CONSTRAINT uq_pagamento_pedido UNIQUE (id_pedido),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT chk_pagamento_valor CHECK (valor >= 0),
    CONSTRAINT chk_pagamento_status CHECK
        (status IN ('Pendente', 'Aprovado', 'Recusado', 'Estornado'))
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 7: Itens que compoem cada pedido
CREATE TABLE IF NOT EXISTS item_pedido (
    id_item INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_item),
    CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_pedido_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
    CONSTRAINT chk_item_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_item_preco CHECK (preco_unitario >= 0)
) ENGINE=InnoDB;

-- CENARIO ESTRUTURAL 8: Avaliacoes feitas pelos clientes
CREATE TABLE IF NOT EXISTS avaliacao_produto (
    id_avaliacao INT NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    id_produto INT NOT NULL,
    nota TINYINT NOT NULL,
    comentario VARCHAR(500),
    data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_avaliacao),
    CONSTRAINT fk_avaliacao_cliente FOREIGN KEY (cpf)
        REFERENCES cliente(cpf),
    CONSTRAINT fk_avaliacao_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
    CONSTRAINT uq_avaliacao_cliente_produto UNIQUE (cpf, id_produto),
    CONSTRAINT chk_avaliacao_nota CHECK (nota BETWEEN 1 AND 5)
) ENGINE=InnoDB;

-- FIM DO SCRIPT DDL: 8 tabelas criadas.
-- Execute este arquivo antes do script-dml.sql.
