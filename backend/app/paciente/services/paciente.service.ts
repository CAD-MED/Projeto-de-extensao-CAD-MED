import UserRepository from '../repository/paciente.repository'; // Importe o repositório
import { User } from './../models/User.model'
class UserService {
    // Get all users
    public async getAllUsers(): Promise<User[]> {
        try {
            const users = await UserRepository.getAll();
            return users;
        } catch (error) {
            throw new Error(`Error retrieving all users: ${error}`);
        }
    }

    // Get a single user by ID
    public async getUserById(id: number): Promise<User | null> {
        try {
            const user = await UserRepository.getOne(id);
            if (!user) {
                throw new Error(`User with id ${id} not found`);
            }
            return user;
        } catch (error) {
            throw new Error(`Error retrieving user with id ${id}: ${error}`);
        }
    }

    // Create multiple users
    public async createMultipleUsers(users: User[]): Promise<void> {
        try {
            // Business logic: Validate or transform data if needed before saving to DB
            if (users.length === 0) {
                throw new Error("User list cannot be empty");
            }

            await UserRepository.createUsers(users);
        } catch (error) {
            throw new Error(`Error creating users: ${error}`);
        }
    }
}

export default new UserService();
