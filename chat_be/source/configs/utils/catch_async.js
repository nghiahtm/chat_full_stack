export default (fn) => {
    return (req, res, next) => {
        // Nếu hàm fn (controller) có lỗi, nó sẽ tự đẩy vào next(err)
        fn(req, res, next).catch(next); 
    };
};