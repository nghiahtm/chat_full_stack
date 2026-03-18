class AppError extends Error {
  constructor(message, statusCode, errors = []) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = true; // Đánh dấu đây là lỗi có thể kiểm soát
    this.errors = errors;
    Error.captureStackTrace(this, this.constructor);
  }
}

// Lỗi 404 - Không tìm thấy
export class NotFoundError extends AppError {
  constructor(message = "Tài nguyên không tồn tại") {
    super(message, 404);
  }
}

// Lỗi 401 - Chưa đăng nhập
export class UnauthorizedError extends AppError {
  constructor(message = "Bạn cần đăng nhập để tiếp tục") {
    super(message, 401);
  }
}

// Lỗi 400 - Dữ liệu gửi lên sai (Validation)
export class BadRequestError extends AppError {
  constructor(message = "Dữ liệu không hợp lệ", errors = []) {
    super(message, 400, errors);
  }
}

// Lỗi 400 - Dữ liệu gửi lên sai (Validation)
export class RequestTimeoutError extends AppError {
  constructor(message = "Yêu cầu hết thời gian chờ") {
    super(message, 400);
  }
}

export default AppError;
