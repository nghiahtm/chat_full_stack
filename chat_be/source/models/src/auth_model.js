import mongoose from "mongoose";

const authenSchema = new mongoose.Schema(
  {
    refreshToken: {
      type: String,
      required: true,
      unique: true,
      trim: true,
    },
    /// Lưu thông tin user để sau này có thể xóa refresh token khi user logout
    referencedUser: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
      index: true,
    },
    expiresAt: {
      type: Date,
      required: true,
    },
  },
  {
    timestamps: true,
  },
);
/// Thiết lập TTL index để tự động xóa document khi đến thời gian hết hạn
// expiresAt sẽ được tự động xóa sau khi đến thời gian đã định

authenSchema.index({ expiresAt: 1 }, { expireAfterSeconds: 0 });

const AuthModel = mongoose.model("Auth", authenSchema);

export default AuthModel;
