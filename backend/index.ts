import express from 'express';
import { AppModule } from './app/app.module';
import cors from 'cors';

const app = express();
const port = process.env.PORT || 3000;
app.use(cors());

AppModule(app);

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});