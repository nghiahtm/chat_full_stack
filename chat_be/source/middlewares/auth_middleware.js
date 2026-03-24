import { UnauthorizedError } from "../configs/utils/app_errors.js";
import jwt from "jsonwebtoken";
import { UserService } from "../services/service.js";

export const authMiddleware = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith("Bearer ")) {
    return new UnauthorizedError("Sai token hoặc token không được cung cấp!");
  }
  const token = authHeader.split(" ")[1];
  if (!token) {
    return UnauthorizedError("Sai token hoặc token không được cung cấp!");
  }

  jwt.verify(token, process.env.JWT_SECRET_KEY, async (err, decoded) => {
    if (err) {
      return next(new UnauthorizedError("Token không hợp lệ!"));
    }

    const user = await UserService.getUserById({ _id: decoded.userId });
    if (!user) {
      return next(new UnauthorizedError("Người dùng không tồn tại!"));
    }
    req.user = user;
    next();
  });
};

export default authMiddleware;
