import { BadRequestError } from "../../configs/utils/app_errors.js";
import { AuthModel } from "../../models/model.js";
import crypto from "crypto";

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
  const newRefreshToken = crypto.randomBytes(64).toString("hex");

  const msExpiresIn = Number(process.env.REFRESH_TOKEN_EXPIRES_IN);
  await AuthModel.findOneAndUpdate(
    { _id: isRefreshTokenValid._id },
    {
      refreshToken: newRefreshToken,
      expiresAt: new Date(Date.now() + msExpiresIn),
    },
  );
  return {
    newRefreshToken,
    referencedUser: isRefreshTokenValid.referencedUser,
  };
};
