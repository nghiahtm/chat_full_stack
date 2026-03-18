import {Status} from './status_utils.js';

class BaseResponse {
    constructor(success, message, data = null, errorCode = null) {
        this.success = success;    // true/false
        this.message = message;    // Thông báo cho người dùng
        this.data = data;          // Dữ liệu trả về (Object/Array)
        this.errorCode = errorCode; // Mã lỗi nội bộ (nếu có)
        this.timestamp = new Date().toISOString();
    }

    // Static method để tạo nhanh phản hồi thành công
    static success(data, message = "Thành công") {
        return new BaseResponse(Status.SUCCESS, message, data);
    }

    // Static method để tạo nhanh phản hồi lỗi
    static error(message = ["Đã có lỗi xảy ra"], errorCode = 500, data = null) {
        return new BaseResponse(Status.FAILED, message, data, errorCode);
    }
}

export default BaseResponse;