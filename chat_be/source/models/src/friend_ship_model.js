import mongoose from "mongoose";
import mongoosePaginate from "mongoose-paginate-v2";

const friendShipSchema = new mongoose.Schema(
  {
    receiverId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    senderId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    /// Trang thai 2 nguoi add user
    activeFriend: {
      type: String,
      enum: ["pending", "decline", "accept"],
      default: "pending",
    },

    // Lưu người thực hiện thao tác cuối (ví dụ: người nhấn accept)
    actionBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  },
  {
    timestamps: true,
  },
);

//tránh trường hợp A gửi kết bạn cho B hai lần (duplicating)
friendShipSchema.index({ senderId: 1, receiverId: 1 }, { unique: true });

// Kích hoạt paging
friendShipSchema.plugin(mongoosePaginate);

friendShipSchema.post("save", function (error, doc, next) {
  if (error.name === "MongoServerError" && error.code === 11000) {
    next(new Error("Yêu cầu kết bạn đã tồn tại"));
  } else {
    next(error);
  }
});
const FriendShipModel = mongoose.model("FriendShip", friendShipSchema);
export default FriendShipModel;
