import * as z from "zod";

export const userValidator = z.object({
  username: z.string().trim().min(1, "Thông tin tài khoản không được để trống"),
  password: z.string().min(6, "Mật khẩu ít nhất 6 ký tự"),
  confirmPassword: z.string().min(6, "Mật khẩu ít nhất 6 ký tự"),
  fullName: z.string().trim().min(1, "Họ và tên không được để trống"),
});

export default userValidator;