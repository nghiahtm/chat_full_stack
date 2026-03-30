import BaseResponse from "../../configs/utils/base_response.js";
import { ERROR_MESSAGES } from "../../configs/utils/enum/message_error.js";

export const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  let errorMess = err.message;
  // if (statusCode === 500) {
  //   errorMess = ERROR_MESSAGES.INTERNAL_SERVER_ERROR;
  // } else {
  //   errorMess = err.message;
  // }
  const errors = err.errors;
  const response = BaseResponse.error(errorMess, statusCode, null, errors);
  res.status(statusCode).json(response);
};
