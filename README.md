# Sistema de Controle de Estoque - Web Application

Um sistema web completo de gestão de estoque desenvolvido em **Flask** com **PostgreSQL**, permitindo controle total de produtos, movimentações de estoque e geração de relatórios.

## 📋 Funcionalidades

- **Autenticação de Usuários:** Login seguro com email e senha
- **Gestão de Produtos:** Cadastro, edição e exclusão de produtos
- **Movimentação de Estoque:** Registro de entradas e saídas com histórico completo
- **Controle de Permissões:** Diferenciação entre usuários administradores e comuns
- **Relatórios:** Geração de relatórios de movimentações e estoque atual usando Pandas
- **Interface Responsiva:** Design moderno com Bootstrap

## 🛠️ Tecnologias Utilizadas

- **Backend:** Python com Flask
- **Banco de Dados:** PostgreSQL (Neon)
- **Frontend:** HTML5, CSS3, Bootstrap 4
- **Bibliotecas:** psycopg2 (conexão com PostgreSQL), Pandas (relatórios)

## 📦 Instalação

### 1. Pré-requisitos

- Python 3.7+
- PostgreSQL (ou Neon)
- pip (gerenciador de pacotes Python)

### 2. Clonar o Repositório

```bash
git clone <seu-repositorio>
cd sistema_estoque_novo
```

### 3. Instalar Dependências

```bash
pip install -r requirements.txt
```

### 4. Configurar Conexão com o Banco de Dados

Edite o arquivo `conexão.py` e configure as credenciais do seu banco de dados:

```python
DB_HOST = "seu_host_neon"
DB_PORT = 5432
DB_NAME = "estoque_ti"
DB_USER = "seu_usuario_neon"
DB_PASSWORD = "sua_senha_neon"
```

### 5. Executar o Script de Atualização do Banco

Execute o script SQL `sql/update_schema.sql` no seu banco de dados PostgreSQL para criar as tabelas e colunas necessárias:

```bash
# Via psql
psql -h seu_host -U seu_usuario -d estoque_ti -f sql/update_schema.sql

# Ou copie e cole o conteúdo do arquivo no seu cliente PostgreSQL
```

## 🚀 Execução

Para iniciar o sistema, execute:

```bash
python main.py
```

A aplicação estará disponível em `http://localhost:5000/`

## 📝 Credenciais de Teste

Após executar o script SQL, você terá um usuário administrador:

- **Email:** vitor.cba@outlook.com
- **Senha:** 123456

## 📂 Estrutura do Projeto

```
sistema_estoque_novo/
├── main.py                 # Arquivo principal com rotas Flask
├── conexão.py              # Configuração de conexão com o banco
├── banco.py                # Funções genéricas de banco de dados
├── users.py                # Lógica de autenticação
├── produtos.py             # CRUD de produtos
├── movimentacoes.py        # Lógica de movimentação de estoque
├── relatorios.py           # Geração de relatórios com Pandas
├── requirements.txt        # Dependências do projeto
├── README.md               # Este arquivo
├── templates/              # Templates HTML
│   ├── login.html
│   ├── dashboard.html
│   ├── produtos.html
│   ├── produto_form.html
│   ├── movimentar_estoque.html
│   ├── historico_movimentacoes.html
│   ├── relatorio_movimentacoes.html
│   ├── relatorio_estoque_atual.html
│   ├── erro_404.html
│   └── erro_500.html
├── static/                 # Arquivos estáticos
│   └── CSS/
│       └── style.css
└── sql/                    # Scripts SQL
    └── update_schema.sql
```

## 🔐 Segurança

- **Senhas:** Armazenadas em texto simples (para desenvolvimento). Em produção, use hash (bcrypt, argon2)
- **Chave Secreta:** Altere `app.secret_key` em `main.py` para uma chave segura
- **Validação de Entrada:** Implemente validação mais robusta em produção
- **HTTPS:** Use HTTPS em produção

## 🎯 Fluxo de Uso

1. **Login:** Acesse a página de login e insira suas credenciais
2. **Dashboard:** Após login, você verá o menu principal com opções disponíveis
3. **Gerenciar Produtos:** Adicione, edite ou delete produtos
4. **Movimentar Estoque:** Registre entradas e saídas de produtos
5. **Visualizar Relatórios:** Consulte relatórios de movimentações e estoque atual
6. **Logout:** Clique em "Sair" para encerrar a sessão

## 📊 Relatórios

O sistema gera dois tipos de relatórios:

- **Relatório de Movimentações:** Lista todas as entradas e saídas de estoque
- **Relatório de Estoque Atual:** Mostra a situação atual de todos os produtos

Os relatórios são gerados usando Pandas e exibidos em tabelas HTML.

## 🐛 Troubleshooting

### Erro de Conexão com o Banco

- Verifique as credenciais em `conexão.py`
- Certifique-se de que o servidor PostgreSQL está ativo
- Verifique a conectividade de rede

### Erro ao Executar o Script SQL

- Certifique-se de que as tabelas `usuarios`, `roles`, `produtos` e `movimentacoes` existem
- Verifique se o usuário do banco tem permissão para executar ALTER TABLE

### Erro 404 ou 500

- Verifique os logs do Flask no terminal
- Certifique-se de que todos os templates estão na pasta `templates/`

## 🚀 Próximas Melhorias

- [ ] Login com Google (OAuth)
- [ ] Alertas de estoque mínimo
- [ ] Exportação de relatórios em PDF e Excel
- [ ] Gráficos e dashboards mais avançados
- [ ] Validação de formulários mais robusta
- [ ] Hash de senhas com bcrypt
- [ ] Testes automatizados

## 📄 Licença

Este projeto é fornecido como está para fins educacionais.

## 👨‍💻 Autor

Desenvolvido como projeto acadêmico/estágio supervisionado.

---

**Última atualização:** Abril de 2024
