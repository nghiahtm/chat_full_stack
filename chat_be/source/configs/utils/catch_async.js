import { RequestTimeoutError } from "./app_errors.js";

export default (fn,ms = 5000) => {
    return (req, res, next) => {
        const timeout = new Promise((_, reject) => {
            setTimeout(() => {
                reject(new RequestTimeoutError(`Request timeout after ${ms}ms`));
            }, ms);
        });
        // Nếu hàm fn (controller) có lỗi, nó sẽ tự đẩy vào next(err)
        Promise.race([fn(req, res, next), timeout]).catch(next);
    };
};