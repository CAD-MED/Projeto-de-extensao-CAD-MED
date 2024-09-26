import express from 'express';
import serverless from 'serverless-http';
import { AppModule } from '../../app/app.module';
import cors from 'cors';

const api = express();
// Middleware para permitir CORS
api.use(cors());
AppModule(api);

export const handler = serverless(api);