-- V2__seed_data.sql
-- Categorias e subcategorias baseadas na estrutura real do fórum Inter Developers

-- =============================================
-- CATEGORIAS PAI
-- =============================================
INSERT INTO categories (id, name, slug, description, sort_order) VALUES
    ('00000000-0000-0000-0000-000000000001', 'Sandbox',            'sandbox',            'Testes e homologação nos ambientes sandbox de cada API',      1),
    ('00000000-0000-0000-0000-000000000002', 'Arquivos',           'arquivos',           'Integração via arquivos CNAB e Excel',                        2),
    ('00000000-0000-0000-0000-000000000003', 'API Pix Automático', 'api-pix-automatico', 'Cobranças recorrentes automáticas via Pix',                   3),
    ('00000000-0000-0000-0000-000000000004', 'API Fórum',          'api-forum',          'Endpoints e publicação via API do Fórum Inter',               4),
    ('00000000-0000-0000-0000-000000000005', 'API Cobrança',       'api-cobranca',       'Emissão de boletos com e sem Pix',                            5),
    ('00000000-0000-0000-0000-000000000006', 'API Banking',        'api-banking',        'Operações bancárias: saldo, extrato e pagamentos',            6),
    ('00000000-0000-0000-0000-000000000007', 'API Pix',            'api-pix',            'Cobranças imediatas, com vencimento, location e Pix avulso',  7),
    ('00000000-0000-0000-0000-000000000008', 'Webhook',            'webhook',            'Configuração e recebimento de notificações em tempo real',    8),
    ('00000000-0000-0000-0000-000000000009', 'Outros',             'outros',             'Demais assuntos não cobertos pelas categorias anteriores',    9);

-- =============================================
-- 1. SANDBOX
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('API Cobrança Sandbox',       'sandbox-api-cobranca',       'Testes da API de Cobrança (Boleto/BolePix) em sandbox',         1, '00000000-0000-0000-0000-000000000001'),
    ('API Pix Sandbox',            'sandbox-api-pix',            'Testes da API Pix (cob, cobv, location) em sandbox',            2, '00000000-0000-0000-0000-000000000001'),
    ('API Pix Automático Sandbox', 'sandbox-api-pix-automatico', 'Testes da API Pix Automático em sandbox',                       3, '00000000-0000-0000-0000-000000000001'),
    ('API Banking Sandbox',        'sandbox-api-banking',        'Testes da API Banking (saldo, extrato, pagamentos) em sandbox', 4, '00000000-0000-0000-0000-000000000001'),
    ('Demais assuntos Sandbox',    'sandbox-outros',             'Outros tópicos relacionados ao ambiente de sandbox',            5, '00000000-0000-0000-0000-000000000001');

-- =============================================
-- 2. ARQUIVOS
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Pagamentos via CNAB 240', 'arquivos-cnab-240', 'Remessa e retorno de pagamentos no layout CNAB 240', 1, '00000000-0000-0000-0000-000000000002'),
    ('Cobrança via Excel',      'arquivos-excel',    'Emissão de cobranças em lote via planilha Excel',    2, '00000000-0000-0000-0000-000000000002'),
    ('Cobrança via CNAB 400',   'arquivos-cnab-400', 'Remessa e retorno de cobrança no layout CNAB 400',   3, '00000000-0000-0000-0000-000000000002');

-- =============================================
-- 3. API PIX AUTOMÁTICO
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Location da recorrência',    'pix-auto-location',            'Criação e gestão de locations para recorrência',          1, '00000000-0000-0000-0000-000000000003'),
    ('Cobrança recorrente',        'pix-auto-cobranca-recorrente', 'Emissão e gestão de cobranças recorrentes',               2, '00000000-0000-0000-0000-000000000003'),
    ('Recorrência',                'pix-auto-recorrencia',         'Configuração e gestão do ciclo de recorrência',           3, '00000000-0000-0000-0000-000000000003'),
    ('Solicitação de recorrência', 'pix-auto-solicitacao',         'Fluxo de solicitação e aprovação de recorrência',         4, '00000000-0000-0000-0000-000000000003');

-- =============================================
-- 4. API FÓRUM
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Publicação', 'forum-publicacao', 'Criação e gestão de publicações via API do Fórum', 1, '00000000-0000-0000-0000-000000000004');

-- =============================================
-- 5. API COBRANÇA
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Boleto com Pix', 'cobranca-bolepix', 'Emissão de boleto híbrido com QR Code Pix (BolePix)', 1, '00000000-0000-0000-0000-000000000005'),
    ('Boleto',         'cobranca-boleto',  'Emissão de boleto tradicional com código de barras',  2, '00000000-0000-0000-0000-000000000005');

-- =============================================
-- 6. API BANKING
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Saldo e Extrato', 'banking-saldo-extrato', 'Consulta de saldo e extrato da conta PJ',                   1, '00000000-0000-0000-0000-000000000006'),
    ('Pagamento',       'banking-pagamento',     'Pagamentos via código de barras, DARF e lotes',             2, '00000000-0000-0000-0000-000000000006'),
    ('Pix pagamento',   'banking-pix-pagamento', 'Inclusão e agendamento de pagamentos Pix via API Banking',  3, '00000000-0000-0000-0000-000000000006');

-- =============================================
-- 7. API PIX
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Cob Imediata',       'pix-cob-imediata', 'Cobrança Pix imediata (cob) — criação, consulta e cancelamento', 1, '00000000-0000-0000-0000-000000000007'),
    ('Location',           'pix-location',     'Criação e gestão de locations Pix',                              2, '00000000-0000-0000-0000-000000000007'),
    ('Pix',                'pix-avulso',        'Consulta e devolução de Pix avulso recebido',                   3, '00000000-0000-0000-0000-000000000007'),
    ('Cob com vencimento', 'pix-cobv',          'Cobrança Pix com vencimento (cobv) — juros, multa e desconto',  4, '00000000-0000-0000-0000-000000000007');

-- =============================================
-- 8. WEBHOOK
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('API Cobrança (Boleto com Pix)', 'webhook-cobranca-bolepix',  'Notificações de pagamento de boletos BolePix',             1, '00000000-0000-0000-0000-000000000008'),
    ('API Banking',                   'webhook-banking',            'Notificações de eventos bancários via webhook',            2, '00000000-0000-0000-0000-000000000008'),
    ('API Cobrança',                  'webhook-cobranca',           'Notificações de pagamento de boletos tradicionais',        3, '00000000-0000-0000-0000-000000000008'),
    ('API Pix Automático',            'webhook-pix-automatico',     'Notificações de eventos de recorrência Pix Automático',    4, '00000000-0000-0000-0000-000000000008'),
    ('API Pix',                       'webhook-pix',                'Notificações de liquidação e devolução de cobranças Pix',  5, '00000000-0000-0000-0000-000000000008');

-- =============================================
-- 9. OUTROS
-- =============================================
INSERT INTO categories (name, slug, description, sort_order, parent_id) VALUES
    ('Demais assuntos', 'outros-geral', 'Tópicos que não se enquadram nas demais categorias', 1, '00000000-0000-0000-0000-000000000009');

-- =============================================
-- TAGS INICIAIS
-- =============================================
INSERT INTO tags (name, slug, color) VALUES
    ('erro-422',     'erro-422',     '#EF4444'),
    ('erro-401',     'erro-401',     '#EF4444'),
    ('erro-403',     'erro-403',     '#EF4444'),
    ('webhook',      'webhook',      '#8B5CF6'),
    ('autenticação', 'autenticacao', '#F59E0B'),
    ('timeout',      'timeout',      '#EF4444'),
    ('sandbox',      'sandbox',      '#3B82F6'),
    ('produção',     'producao',     '#10B981'),
    ('certificado',  'certificado',  '#F59E0B'),
    ('cnab',         'cnab',         '#6366F1'),
    ('qrcode',       'qrcode',       '#0EA5E9');

-- =============================================
-- USUÁRIO ADMIN
-- =============================================
-- Senha: Admin@123 — troque em produção
INSERT INTO users (name, email, password, role) VALUES
    ('Administrador', 'admin@forum.com',
     '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'ADMIN');
