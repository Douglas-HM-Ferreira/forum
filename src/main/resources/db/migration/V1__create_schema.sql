-- V1__create_schema.sql

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Tabela de usuários
CREATE TABLE users (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(100)        NOT NULL,
    email       VARCHAR(150)        NOT NULL UNIQUE,
    password    VARCHAR(255)        NOT NULL,
    role        VARCHAR(20)         NOT NULL DEFAULT 'CLIENT',
    active      BOOLEAN             NOT NULL DEFAULT TRUE,
    created_at  TIMESTAMP           NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP           NOT NULL DEFAULT NOW()
);

-- Tabela de categorias (suporta hierarquia pai/filho)
CREATE TABLE categories (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(80)         NOT NULL,
    slug        VARCHAR(80)         NOT NULL UNIQUE,
    description TEXT,
    icon_url    VARCHAR(255),
    sort_order  INTEGER             NOT NULL DEFAULT 0,
    active      BOOLEAN             NOT NULL DEFAULT TRUE,
    parent_id   UUID                REFERENCES categories(id) ON DELETE SET NULL,
    created_at  TIMESTAMP           NOT NULL DEFAULT NOW()
);

-- Tabela de tags
CREATE TABLE tags (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(50)         NOT NULL UNIQUE,
    slug        VARCHAR(50)         NOT NULL UNIQUE,
    color       VARCHAR(7)          NOT NULL DEFAULT '#6B7280'
);

-- Tabela de tópicos
CREATE TABLE topics (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title       VARCHAR(200)        NOT NULL,
    body        TEXT                NOT NULL,
    status      VARCHAR(20)         NOT NULL DEFAULT 'OPEN',
    views       INTEGER             NOT NULL DEFAULT 0,
    user_id     UUID                NOT NULL REFERENCES users(id),
    category_id UUID                NOT NULL REFERENCES categories(id),
    created_at  TIMESTAMP           NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP           NOT NULL DEFAULT NOW()
);

-- Tabela de posts (respostas)
CREATE TABLE posts (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    body        TEXT                NOT NULL,
    is_accepted BOOLEAN             NOT NULL DEFAULT FALSE,
    user_id     UUID                NOT NULL REFERENCES users(id),
    topic_id    UUID                NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    created_at  TIMESTAMP           NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP           NOT NULL DEFAULT NOW()
);

-- Tabela de relação tópico <-> tag
CREATE TABLE topic_tags (
    topic_id    UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    tag_id      UUID NOT NULL REFERENCES tags(id),
    PRIMARY KEY (topic_id, tag_id)
);

-- Índices
CREATE INDEX idx_categories_parent  ON categories(parent_id);
CREATE INDEX idx_topics_category    ON topics(category_id);
CREATE INDEX idx_topics_user        ON topics(user_id);
CREATE INDEX idx_topics_status      ON topics(status);
CREATE INDEX idx_posts_topic        ON posts(topic_id);
CREATE INDEX idx_posts_user         ON posts(user_id);
