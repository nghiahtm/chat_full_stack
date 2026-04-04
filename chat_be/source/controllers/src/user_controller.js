import catchAsync from "../../configs/utils/catch_async.js";
import { HandleSuccess } from "../../middlewares/middleware.js";
import { UserService } from "../../services/service.js";

export const getUser = catchAsync(async (req, res, next) => {
  return HandleSuccess.successResponse(
    res,
    req.user,
    "User found successfully!",
  );
});

export const findUsers = catchAsync(async (req, res, next) => {
  const { page = 1, limit = 10, search = "" } = req.body;
  const options = {
    page: page,
    limit: limit,
    search: search,
  };
  const result = await UserService.getUsers(options);
  return HandleSuccess.successResponse(res, result, "Successfully");
});
