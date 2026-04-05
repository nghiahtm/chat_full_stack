import { is } from "zod/locales";
import { BadRequestError } from "../../configs/utils/app_errors.js";
import { AuthModel } from "../../models/model.js";

export const createRefreshToken = async ({
  refreshToken,
  referencedUser,
  expiresAt,
}) => {
  await AuthModel.create({
    refreshToken,
    referencedUser,
    expiresAt,
  });
};

export const deleteRefreshToken = async (refreshToken) => {
  await AuthModel.deleteOne({ refreshToken });
};

export const refreshAccessToken = async (refreshToken) => {
  if (!refreshToken) {
    throw new BadRequestError("Refresh token is required!");
  }
  const isRefreshTokenValid = await AuthModel.findOne({ refreshToken });
  if (!isRefreshTokenValid) {
    throw new BadRequestError("Invalid refresh token!");
  }
  if (isRefreshTokenValid.expiresAt < new Date()) {
    await AuthModel.deleteOne({ refreshToken });
    throw new BadRequestError("Refresh token has expired!");
  }
  return isRefreshTokenValid.referencedUser;
};
