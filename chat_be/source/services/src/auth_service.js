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
