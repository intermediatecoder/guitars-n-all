
import { Sequelize } from "sequelize";
export { QueryTypes } from "sequelize";

const { DB_CONNECTION_STRING, DB_NAME, DB_USERNAME, DB_PASSWORD, DB_HOST } = process.env;

// export const sequelize = new Sequelize(DB_NAME, DB_USERNAME, DB_PASSWORD, {
//   dialect: "mysql",
//   host: DB_HOST,
// });
const sequelize = new Sequelize(DB_CONNECTION_STRING, {
    dialect: "mysql",
});
export const db = sequelize;

export async function connectToDatabase() {
  const result = await sequelize.authenticate();
  return result;
}

export async function loadModels() {
  
}