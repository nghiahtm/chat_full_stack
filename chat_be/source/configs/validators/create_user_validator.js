import * as z from "zod";

/// Validator cho việc tạo người dùng mới
const userValidator = z
  .object({
    username: z
      .string()
      .trim()
      .min(1, "Thông tin tài khoản không được để trống"),
    password: z.string().min(6, "Mật khẩu ít nhất 6 ký tự"),
    fullName: z.string().trim().min(1, "Họ và tên không được để trống"),
    email: z.email("Định dạng email không hợp lệ"),
    confirmPassword: z.string().min(6, "Xác nhận mật khẩu ít nhất 6 ký tự"),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Mật khẩu và xác nhận mật khẩu không khớp",
    path: ["confirmPassword"],
  });

export default userValidator;
