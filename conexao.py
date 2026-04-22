import psycopg2

DB_HOST = "ep-cold-glitter-ackp3ojw-pooler.sa-east-1.aws.neon.tech"
DB_PORT = 5432
DB_NAME = "estoque_ti"
DB_USER = "neondb_owner"
DB_PASSWORD = "npg_yfL4Azi0ZadI"

def conectar():
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    return conn
