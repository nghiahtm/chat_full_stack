import catchAsync from "../../configs/utils/catch_async.js";
import BaseResponse from "../../configs/utils/base_response.js";

export const getUser = catchAsync(async (req, res, next) => {
  return res.json(BaseResponse.success(req.user, "User found successfully!"));
});
