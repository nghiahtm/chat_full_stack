import { UnauthorizedError } from "../../configs/utils/app_errors.js";
import catchAsync from "../../configs/utils/catch_async.js";
import bcrypt from "bcrypt";
import BaseResponse from "../../configs/utils/base_response.js";
import { UserService, AuthService } from "../../services/service.js";
import jwt from "jsonwebtoken";
import crypto from "crypto";
import { HandleSuccess } from "../../middlewares/middleware.js";

// Dang nhap
export const login = catchAsync(async (req, res, next) => {
  const { username, password } = req.body;
  /// Kiem tra username va password da duoc truyen vao hay chua
  if (!username || !password) {
    throw new UnauthorizedError("Username hoặc password không được để trống!");
  }
  /// Kiem tra xem username co ton tai trong database hay khong
  const findUserName = await UserService.findUser({ username });
  if (!findUserName) {
    throw new UnauthorizedError("Username hoặc password không chinh xác!");
  }
  /// Kiem tra xem voi user do mat khau co dung khong
  const comparePassword = await bcrypt.compare(
    password,
    findUserName.hashedPassword,
  );
  if (!comparePassword) {
    throw new UnauthorizedError("Username hoặc password không chinh xác!");
  }
  /// Neu dung thi tao token va tra ve cho client
  const accessToken = jwt.sign(
    { userId: findUserName._id },
    process.env.JWT_SECRET_KEY,
    {
      expiresIn: process.env.JWT_EXPIRES_IN,
    },
  );

  /// Luu refresh token vao database de sau nay co the xoa khi user logout
  const refreshToken = crypto.randomBytes(64).toString("hex");

  /// Luu refresh token vao database de sau nay co the xoa khi user logout
  const msExpiresIn = Number(process.env.REFRESH_TOKEN_EXPIRES_IN);

  await AuthService.createRefreshToken({
    refreshToken,
    referencedUser: findUserName._id,
    expiresAt: new Date(Date.now() + msExpiresIn),
  });
  /// Luu refresh token vao cookie de sau nay co the su dung de refresh access token
  res.cookie("refreshToken", refreshToken, {
    httpOnly: true,
    secure: process.env.ENV === "production",
    sameSite: "none",
    maxAge: msExpiresIn, // 7 ngay
  });
  /// Tra ve access token cho client
  return HandleSuccess.successResponse(
    res,
    { accessToken, refreshToken },
    "User logged in successfully!",
  );
});

/// Dang ky
export const create = catchAsync(async (req, res, next) => {
  const { username, password, email, fullName } = req.body;
  const duplicate = await UserService.findUser({
    $or: [{ username: username }, { email: email }],
  });
  if (duplicate) {
    throw new UnauthorizedError("Username hoặc email đã tồn tại!");
  }

  const hashedPassword = await bcrypt.hash(password, 10);
  await UserService.createUser({
    username,
    hashedPassword,
    email,
    fullName,
  });
  return HandleSuccess.successResponse(res, null, "User created successfully!");
});

/// Dang xuat
export const logout = catchAsync(async (req, res, next) => {
  /// Xoa refresh token trong cookie
  const refreshToken = req.cookies?.refreshToken;
  if (refreshToken) {
    await AuthService.deleteRefreshToken(refreshToken);
  }
  /// Xoa refresh token trong cookie
  res.clearCookie("refreshToken");
  /// Tra ve response cho client
  return res.json(BaseResponse.success(null, "Logout successful!"));
});

/// refresh access token
export const refreshAccToken = catchAsync(async (req, res, next) => {
  const { refreshToken } = req.body;
  if (!refreshToken) {
    throw new BadRequestError("Refresh token không hợp lệ!");
  }

  const authService = await AuthService.refreshAccessToken(refreshToken);
  const accessToken = jwt.sign(
    { userId: authService.referencedUser },
    process.env.JWT_SECRET_KEY,
    {
      expiresIn: process.env.JWT_EXPIRES_IN,
    },
  );

  return HandleSuccess.successResponse(
    res,
    { accessToken, refreshToken: authService.newRefreshToken },
    "Access token refreshed successfully!",
  );
});
