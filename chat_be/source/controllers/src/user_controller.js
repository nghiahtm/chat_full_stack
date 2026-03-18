import { AuthModel } from "../../models/model.js";
import { UnauthorizedError } from "../../configs/utils/app_errors.js";
import catchAsync from "../../configs/utils/catch_async.js";
import BaseResponse from "../../configs/utils/base_response.js";

export const login = catchAsync(async (req, res, next) => {
  const { username, password } = req.body;
  if (!username && !password) {
    throw new UnauthorizedError("Username và password không được để trống!");
  }
  if (!username) {
    throw new UnauthorizedError("Username không được để trống!");
  }
  if (!password) {
    throw new UnauthorizedError("Password không được để trống!");
  }
  const newUser = new AuthModel(username, password);
  return BaseResponse.success(newUser, "Đăng nhập thành công!");
});
