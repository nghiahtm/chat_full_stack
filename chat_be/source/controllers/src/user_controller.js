import { AuthModel, UserModel } from "../../models/model.js";
import { UnauthorizedError } from "../../configs/utils/app_errors.js";
import catchAsync from "../../configs/utils/catch_async.js";
import bcrypt from "bcrypt";
import BaseResponse from "../../configs/utils/base_response.js";
export const login = catchAsync(async (req, res, next) => {
  const { username } = req.body;
  console.log(`Đang xem thông tin user có ID là: ${username}`);
  if (!username) {
    throw new UnauthorizedError("Username không được để trống!");
  }
  const newUser = new AuthModel(username);
  return res.json(newUser);
});

export const create = catchAsync(async (req, res, next) => {
  const { username, password, email, fullName } = req.body;
  const duplicate = await UserModel.findOne({ username });
  if (duplicate) {
    throw new UnauthorizedError("Username đã tồn tại!");
  }
  const hashedPassword = await bcrypt.hash(password, 10);
  await UserModel.create({
    username,
    hashedPassword,
    email,
    fullName,
  });
  return res.json(BaseResponse.success(null, "User created successfully!"));
});
