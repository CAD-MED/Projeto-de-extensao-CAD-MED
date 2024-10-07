import { Users, User } from '../models/User.model';
import { CreationAttributes } from 'sequelize';

class UserRepository {
    // Método para criar múltiplos usuários
    public async createUsers(users: CreationAttributes<User>[]): Promise<void> {
        try {
            console.debug('Iniciando a criação de múltiplos usuários...');

            // Mapeamento dos usuários
            const usuarios = users.map(e => {
                console.debug(`Processando usuário: ${e.nome}, idUser: ${e.idUser}`);

                return {
                    idUser: e.idUser,
                    nome: e.nome,
                    idade: e.idade,
                    genero: e.genero,
                    patologia: e.patologia,
                    createdAt: e.createdAt,
                };
            });

            const idUser = users[0].idUser;
            console.debug(`Deletando registros existentes para idUser: ${idUser}`);
            await User.destroy({ where: { idUser: idUser } });

            console.debug('Inserindo novos usuários...');
            await User.bulkCreate(usuarios);

            console.debug('Criação de usuários concluída com sucesso.');

        } catch (error) {
            console.error('Erro ao criar usuários:', error);
            throw new Error('Erro ao criar usuários: ' + error);
        }
    }
}

// Exporta uma instância única do UserRepository
export default new UserRepository();
