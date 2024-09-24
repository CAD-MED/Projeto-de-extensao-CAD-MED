import 'dotenv/config';
import { Application } from 'express';
import express from 'express';
import { pacienteController } from './paciente/controllers/paciente.controller';
import sequelize from '../config/sequelize.config';


export const AppModule = (app: Application) => {
    app.use(express.json());
    // Sincronização do Sequelize (cria tabelas se elas não existirem)
    sequelize.sync({ force: true }) // force: true recria as tabelas toda vez que reiniciar

    // API de exemplo
    app.use('/api', pacienteController);

};
