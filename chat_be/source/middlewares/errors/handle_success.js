import BaseResponse from "../../configs/utils/base_response.js";

export const successResponse = (
  res,
  data = null,
  message = "Success",
  status = 200,
) => {
  return res.status(status).json(BaseResponse.success(data, message));
};
