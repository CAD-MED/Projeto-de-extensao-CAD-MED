import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from './../../../config/sequelize.config';

// Definição dos atributos do usuário
interface UserAttributes {
    id: number;
    idUser: string;
    nome: string;
    idade: number;
    genero: string;
    patologia: string;
    createdAt?: string;
}

// Campos opcionais durante a criação de usuários (ID auto-incremento)
interface UserCreationAttributes extends Optional<UserAttributes, 'id'> { }

// Modelo de usuário com Sequelize
export class User extends Model<UserAttributes, UserCreationAttributes> implements UserAttributes {
    public id!: number;
    public idUser!: string;
    public nome!: string;
    public idade!: number;
    public genero!: string;
    public patologia!: string;
    public createdAt?: string;
}

// Definição do modelo no Sequelize
export const Users = User.init({
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    idUser: {
        type: DataTypes.STRING(255),
        allowNull: false
    },
    nome: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    idade: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    genero: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    patologia: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    createdAt: {
        type: DataTypes.TEXT,
        allowNull: true, // Permite inserção manual de data
        // defaultValue: DataTypes.NOW
    },
}, {
    sequelize,
    tableName: 'users',
    timestamps: false, // Desabilita timestamps automáticos do Sequelize
});

export default Users;