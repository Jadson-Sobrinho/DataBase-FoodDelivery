CREATE DATABASE IF NOT EXISTS db_food_delivery;
USE db_food_delivery;

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_cartao (
  cartao_id INT NOT NULL AUTO_INCREMENT,
  numero CHAR(16) NOT NULL,
  nome_titular VARCHAR(45) NOT NULL,
  data_validade DATE NOT NULL,
  cpf_cnpj VARCHAR(16) NOT NULL,
  cvv CHAR(3) NOT NULL,
  PRIMARY KEY (cartao_id),
  UNIQUE INDEX numero_UNIQUE (numero)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_voucher (
  voucher_id INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data_validade DATE NULL,
  PRIMARY KEY (voucher_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_carteira (
  carteira_id INT NOT NULL,
  cartao_id INT NULL,
  voucher_id INT NULL,
  PRIMARY KEY (carteira_id),
  INDEX cartao_id_idx (cartao_id),
  INDEX voucher_id_idx (voucher_id),
  CONSTRAINT cartao_id
    FOREIGN KEY (cartao_id)
    REFERENCES db_food_delivery.tb_cartao (cartao_id),
  CONSTRAINT voucher_id
    FOREIGN KEY (voucher_id)
    REFERENCES db_food_delivery.tb_voucher (voucher_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_cliente (
  cliente_id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  rg CHAR(9) NOT NULL,
  sexo CHAR(1) NOT NULL,
  cpf CHAR(11) NOT NULL,
  data_nascimento DATE NOT NULL,
  usuario VARCHAR(45) NOT NULL,
  senha CHAR(8) NOT NULL,
  carteira_id INT NULL,
  PRIMARY KEY (cliente_id),
  UNIQUE INDEX cliente_id_UNIQUE (cliente_id),
  UNIQUE INDEX cnpj_UNIQUE (cpf),
  UNIQUE INDEX usuario_UNIQUE (usuario),
  INDEX carteira_id_idx (carteira_id),
  CONSTRAINT carteira_id
    FOREIGN KEY (carteira_id)
    REFERENCES db_food_delivery.tb_carteira (carteira_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_endereco (
  endereco_id INT NOT NULL AUTO_INCREMENT,
  cidade VARCHAR(45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  cep CHAR(8) NOT NULL,
  UF CHAR(2) NOT NULL,
  PRIMARY KEY (endereco_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_endereco_cliente (
  endereco_cliente_id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  endereco_id INT NOT NULL,
  numero VARCHAR(10) NULL,
  complemento VARCHAR(45) NULL,
  INDEX endereco_id_idx (endereco_id),
  INDEX cliente_id_idx (cliente_id),
  PRIMARY KEY (endereco_cliente_id, endereco_id, cliente_id),
  CONSTRAINT endereco_id
    FOREIGN KEY (endereco_id)
    REFERENCES db_food_delivery.tb_endereco (endereco_id),
  CONSTRAINT cliente_id
    FOREIGN KEY (cliente_id)
    REFERENCES db_food_delivery.tb_cliente (cliente_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_categoria (
  categoria_id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(20) NULL,
  PRIMARY KEY (categoria_id),
  UNIQUE INDEX tipo_UNIQUE (descricao),
  UNIQUE INDEX categoria_id_UNIQUE (categoria_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_cardapio (
  cardapio_id INT NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(20) NOT NULL,
  PRIMARY KEY (cardapio_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_horario_funcionamento (
  horario_funcionamento_id INT NOT NULL AUTO_INCREMENT,
  dia_semana VARCHAR(20) NOT NULL,
  hora_inicio TIME NOT NULL DEFAULT '00:00:00',
  hora_fim TIME NOT NULL DEFAULT '23:59:59',
  almoco_inicio TIME NULL,
  almoco_fim TIME NULL,
  PRIMARY KEY (horario_funcionamento_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_estabelecimento (
  estabelecimento_id INT NOT NULL AUTO_INCREMENT,
  cardapio_id INT NULL,
  categoria_id INT NULL,
  horario_funcionamento_id INT NULL,
  cnpj CHAR(14) NOT NULL,
  razao_social VARCHAR(45) NOT NULL,
  nome_fantasia VARCHAR(45) NULL,
  descricao VARCHAR(100) NULL,
  telefone VARCHAR(12) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (estabelecimento_id),
  UNIQUE INDEX estabelecimento_id_UNIQUE (estabelecimento_id),
  INDEX categoria_id_idx (categoria_id),
  INDEX cardapio_id_idx (cardapio_id),
  INDEX horario_funcionamento_id_idx (horario_funcionamento_id),
  CONSTRAINT categoria_id
    FOREIGN KEY (categoria_id)
    REFERENCES db_food_delivery.tb_categoria (categoria_id),
  CONSTRAINT fk_cardapio_id
    FOREIGN KEY (cardapio_id)
    REFERENCES db_food_delivery.tb_cardapio (cardapio_id),
  CONSTRAINT horario_funcionamento_id
    FOREIGN KEY (horario_funcionamento_id)
    REFERENCES db_food_delivery.tb_horario_funcionamento (horario_funcionamento_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_endereco_estabelecimento (
  tb_estabelecimento_endereco_id INT NOT NULL AUTO_INCREMENT,
  endereco_id INT NOT NULL,
  estabelecimento_id INT NOT NULL,
  numero INT NULL,
  complemento VARCHAR(45) NULL,
  PRIMARY KEY (tb_estabelecimento_endereco_id, endereco_id, estabelecimento_id),
  INDEX endereco_id_idx (endereco_id),
  INDEX estabelecimento_id_idx (estabelecimento_id),
  CONSTRAINT fk_endereco_id
    FOREIGN KEY (endereco_id)
    REFERENCES db_food_delivery.tb_endereco (endereco_id),
  CONSTRAINT estabelecimento_id
    FOREIGN KEY (estabelecimento_id)
    REFERENCES db_food_delivery.tb_estabelecimento (estabelecimento_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_item (
  item_id INT NOT NULL AUTO_INCREMENT,
  cardapio_id INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  observacao VARCHAR(100) NULL,
  categoria VARCHAR(45) NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (item_id),
  INDEX cardapio_id_idx (cardapio_id),
  CONSTRAINT cardapio_id
    FOREIGN KEY (cardapio_id)
    REFERENCES db_food_delivery.tb_cardapio (cardapio_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_avaliacao_pedido (
  avaliacao_pedido_id INT NOT NULL,
  nota CHAR(1) NULL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (avaliacao_pedido_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_pedido (
  pedido_id INT NOT NULL,
  cliente_id INT NOT NULL,
  endereco_cliente_id INT NOT NULL,
  item_id INT NOT NULL,
  cardapio_id INT NOT NULL,
  estabelecimento_id INT NOT NULL,
  horario_solicitacao TIME NOT NULL,
  horario_entrega TIME NULL,
  status_pedido VARCHAR(45) NULL DEFAULT 'PENDENTE',
  valor_total DECIMAL(10,2) NULL,
  avaliacao_pedido_id INT NULL,
  PRIMARY KEY (pedido_id),
  INDEX cliente_id_idx (cliente_id),
  INDEX estabelecimento_id_idx (estabelecimento_id),
  INDEX cardapio_id_idx (cardapio_id),
  INDEX item_id_idx (item_id),
  INDEX endereco_cliente_id_idx (endereco_cliente_id),
  INDEX avaliacao_pedido_id_idx (avaliacao_pedido_id),
  CONSTRAINT fk_cliente_id
    FOREIGN KEY (cliente_id)
    REFERENCES db_food_delivery.tb_cliente (cliente_id),
  CONSTRAINT fk_estabelecimento_id
    FOREIGN KEY (estabelecimento_id)
    REFERENCES db_food_delivery.tb_estabelecimento (estabelecimento_id),
  CONSTRAINT fk2_cardapio_id
    FOREIGN KEY (cardapio_id)
    REFERENCES db_food_delivery.tb_cardapio (cardapio_id),
  CONSTRAINT fk_item_id
    FOREIGN KEY (item_id)
    REFERENCES db_food_delivery.tb_item (item_id),
  CONSTRAINT fk_endereco_cliente_id
    FOREIGN KEY (endereco_cliente_id)
    REFERENCES db_food_delivery.tb_endereco_cliente (endereco_cliente_id),
  CONSTRAINT fk_avaliacao_pedido_id
    FOREIGN KEY (avaliacao_pedido_id)
    REFERENCES db_food_delivery.tb_avaliacao_pedido (avaliacao_pedido_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_tipo_pagamento (
  tipo_pagamento_id INT NOT NULL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (tipo_pagamento_id)
);

CREATE TABLE IF NOT EXISTS db_food_delivery.tb_pagamento (
  pagamento_id INT NOT NULL,
  pedido_id INT NOT NULL,
  carteira_id INT NOT NULL,
  tipo_pagamento INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (pagamento_id),
  INDEX tipo_pagamento_id_idx (tipo_pagamento),
  INDEX pedido_id_idx (pedido_id),
  INDEX fk_carteira_id_idx (carteira_id),
  CONSTRAINT fk_tipo_pagamento_id
    FOREIGN KEY (tipo_pagamento)
    REFERENCES db_food_delivery.tb_tipo_pagamento (tipo_pagamento_id),
  CONSTRAINT fk_pedido_id
    FOREIGN KEY (pedido_id)
    REFERENCES db_food_delivery.tb_pedido (pedido_id),
  CONSTRAINT fk_carteira_id
    FOREIGN KEY (carteira_id)
    REFERENCES db_food_delivery.tb_carteira (carteira_id)
);


