import BaseResponse from '../../configs/utils/base_response.js';

export const errorHandler = (err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    const mess = err.message;
    const response = BaseResponse.error(mess, statusCode);
    res.status(statusCode).json(response);
};