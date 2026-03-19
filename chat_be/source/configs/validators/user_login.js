import * as z from "zod";

/// Validator cho việc tạo người dùng mới
const authValidator = z.object({
  username: z.string().trim().min(1, "Thông tin tài khoản không được để trống"),
  password: z.string().min(6, "Mật khẩu ít nhất 6 ký tự"),
});

export default authValidator;
