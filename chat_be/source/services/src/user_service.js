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

  const result = await UserModel.paginate(query, paginateOptions);
  console.log("🚀 ~ file: userRes ~ result:", result);
  if (!result) return null;
  // Xử lý để lấy thông tin "người kia"
  result.docs = result.docs
    .map((doc) => {
      return {
        userInfo: doc,
      };
    })
    .filter((item) => item !== null);
  return result;
};
