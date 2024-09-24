import express, { Request, Response } from 'express';
import UserService from '../services/paciente.service';

const router = express.Router();

// // GET /pacientes - Retorna todos os pacientes
// router.get('/pacientes', async (req: Request, res: Response) => {
//     try {
//         const pacientes = await UserService.getAllUsers();
//         res.status(200).json(pacientes); // Resposta com status 200 e lista de pacientes em formato JSON
//     } catch (error) {
//         console.log(error)
//         res.status(500).json({ error: error });
//     }
// });

// // GET /pacientes/:id - Retorna um paciente específico por ID
// router.get('/pacientes/:id', async (req: Request, res: Response) => {
//     try {
//         const pacienteId = parseInt(req.params.id);
//         const paciente = await UserService.getUserById(pacienteId);

//         if (!paciente) {
//             return res.status(404).json({ error: 'Paciente não encontrado' });
//         }

//         res.status(200).json(paciente);
//     } catch (error) {
//         res.status(500).json({ error: error });
//     }
// });

// POST /pacientes - Cria novos pacientes
router.post('/pacientes', async (req: Request, res: Response) => {
    try {
        const pacientes = req.body; // Recebe a lista de pacientes a partir do corpo da requisição

        if (!Array.isArray(pacientes)) {
            return res.status(400).json({ error: 'O corpo da requisição deve ser uma lista de pacientes' });
        }
        await UserService.createMultipleUsers(pacientes);
        res.status(201).json({ message: 'Pacientes criados com sucesso' });
    } catch (error) {
        res.status(500).json({ error: error });
    }
});

export const pacienteController = router;
