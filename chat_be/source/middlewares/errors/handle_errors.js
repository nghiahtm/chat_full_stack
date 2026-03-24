import BaseResponse from "../../configs/utils/base_response.js";

export const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  const mess = err.message;
  const errors = err.errors || [];
  const response = BaseResponse.error(mess, statusCode, null, errors);
  res.status(statusCode).json(response);
};
