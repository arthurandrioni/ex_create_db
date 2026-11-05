CREATE DATABASE loja_online;


CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE table categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(80)
);




CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    data_pedido DATE,
    id_cliente INTEGER NOT NULL,
        CONSTRAINT fk_pedidos_clientes
            FOREIGN KEY (id_cliente)
            REFERENCES clientes(id_cliente)
);

CREATE table produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(80),
    preco DECIMAL(8,2) NOT NULL,
    id_categoria INTEGER NOT NULL,
        CONSTRAINT fk_categoria_produtos
            FOREIGN KEY (id_categoria)
            REFERENCES categorias(id_categoria),
            CONSTRAINT ceck_preco
                CHECK (preco >= 0)
);



CREATE TABLE item_pedido (
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
        CONSTRAINT pk_pedidos
            PRIMARY KEY (id_pedido, id_produto),
        CONSTRAINT fk_item_pedido
            FOREIGN KEY (id_pedido)
            REFERENCES pedidos(id_pedido),
        CONSTRAINT fk_item_produto
            FOREIGN KEY (id_produto)
            REFERENCES produtos(id_produto)
);