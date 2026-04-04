import { UserModel } from "../../models/model.js";
import { validateText } from "../../configs/utils/text_valid.js";

export const findUser = async (query) => await UserModel.findOne(query);
export const createUser = async (userData) => await UserModel.create(userData);

export const getUserById = async (userId) =>
  await UserModel.findById(userId).select("-hashedPassword -__v");

export const getUsers = async (options) => {
  const { page, limit, search } = options;
  let query = {};
  if (options.search) {
    let searchCriteria;
    const safeSearch = validateText(search);
    if (search.startsWith("@")) {
      searchCriteria = search.slice(1).trim();
    } else {
      searchCriteria = new RegExp(safeSearch.trim(), "i");
    }
    query = {
      $or: [{ username: searchCriteria }, { fullName: searchCriteria }],
    };
  }

  const paginateOptions = {
    page,
    limit,
    lean: true,
    select: "-hashedPassword",
  };

  const userData = await UserModel.paginate(query, paginateOptions);
  console.log("🚀 ~ file: userRes ~ result:", userData);
  if (!userData) return null;
  // Xử lý để lấy thông tin "người kia"
  const result = userData.docs.filter((item) => item !== null);
  return result;
};
