import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config(); // Carrega as variáveis de ambiente do arquivo .env

// Verifica se as variáveis de ambiente obrigatórias estão definidas
if (!process.env.DB_NAME || !process.env.DB_USER || !process.env.DB_PASSWORD || !process.env.DB_HOST) {
    throw new Error('Variáveis de ambiente obrigatórias ausentes!');
}

// Configuração do Sequelize
const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: 'mysql',
        port: Number(process.env.DB_PORT) || 3306,
        pool: {
            max: Number(process.env.DB_CONNECTION_LIMIT) || 5,
            min: 0,
            acquire: 30000,
            idle: 10000
        },
        logging: false // Desativa logs SQL, útil em produção
    }
);

export default sequelize;
