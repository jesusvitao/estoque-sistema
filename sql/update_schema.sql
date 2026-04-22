-- Script SQL para atualização do esquema do banco de dados
-- Este script adiciona as novas colunas à tabela de produtos e garante a existência das roles

-- Adicionar a coluna 'descricao' à tabela 'produtos' se ela não existir
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'produtos' AND column_name = 'descricao'
    ) THEN
        ALTER TABLE produtos
        ADD COLUMN descricao TEXT;
    END IF;
END
$$;

-- Adicionar a coluna 'preco' à tabela 'produtos' se ela não existir
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'produtos' AND column_name = 'preco'
    ) THEN
        ALTER TABLE produtos
        ADD COLUMN preco NUMERIC(10, 2) DEFAULT 0.00;
    END IF;
END
$$;

-- Adicionar a coluna 'data_cadastro' à tabela 'produtos' se ela não existir
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'produtos' AND column_name = 'data_cadastro'
    ) THEN
        ALTER TABLE produtos
        ADD COLUMN data_cadastro TIMESTAMP DEFAULT NOW();
    END IF;
END
$$;

-- Adicionar a coluna 'ativo' à tabela 'produtos' se ela não existir
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'produtos' AND column_name = 'ativo'
    ) THEN
        ALTER TABLE produtos
        ADD COLUMN ativo BOOLEAN DEFAULT TRUE;
    END IF;
END
$$;

-- Inserir roles 'admin' e 'user' se não existirem
INSERT INTO roles (usuario)
SELECT 'admin'
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE usuario = 'admin');

INSERT INTO roles (usuario)
SELECT 'user'
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE usuario = 'user');

-- Atualizar produtos existentes para ter valores padrão para as novas colunas
UPDATE produtos SET descricao = COALESCE(descricao, '') WHERE descricao IS NULL;
UPDATE produtos SET preco = COALESCE(preco, 0.00) WHERE preco IS NULL;
UPDATE produtos SET data_cadastro = COALESCE(data_cadastro, NOW()) WHERE data_cadastro IS NULL;
UPDATE produtos SET ativo = COALESCE(ativo, TRUE) WHERE ativo IS NULL;
