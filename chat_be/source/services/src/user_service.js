import { UserModel } from "../../models/model.js";

export const findUser = async (query) => await UserModel.findOne(query);
export const createUser = async (userData) => await UserModel.create(userData);
