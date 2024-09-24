import { Users, User } from '../models/User.model';
import { CreationAttributes } from 'sequelize';

class UserRepository {
    // Método para obter todos os usuários
    public async getAll(): Promise<User[]> {
        try {
            return await Users.findAll();
        } catch (error) {
            throw new Error('Erro ao buscar todos os usuários: ' + error);
        }
    }

    // Método para obter um usuário por ID
    public async getOne(id: number): Promise<User | null> {
        try {
            return await Users.findByPk(id);
        } catch (error) {
            throw new Error('Erro ao buscar usuário por ID: ' + error);
        }
    }

    // Método para criar múltiplos usuários
    public async createUsers(users: CreationAttributes<User>[]): Promise<void> {
        try {
            const userId = users[0].idUser;

            // Verifica se já existe algum registro com o mesmo idUser e nome
            for (const user of users) {
                const existingUser = await Users.findOne({
                    where: { idUser: user.idUser, nome: user.nome }
                });

                if (existingUser) {
                    console.log(`Usuário com nome ${user.nome} e idUser ${user.idUser} já existe. Pulando inserção.`);
                } else {
                    // Inserir apenas os usuários que não são duplicados para o mesmo idUser
                    await Users.create(user);
                    console.log(`Usuário ${user.nome} criado com sucesso para idUser ${user.idUser}.`);
                }
            }
        } catch (error) {
            throw new Error('Erro ao criar usuários: ' + error);
        }
    }
}

// Exporta uma instância única do UserRepository
export default new UserRepository();
