import { BadRequestError } from "../configs/utils/app_errors.js";
import { UserService, FriendShipService } from "../services/service.js";
import { UnauthorizedError } from "../configs/utils/app_errors.js";
import { FRIEND_STATUS_ENUM } from "../configs/utils/enum/friend_status_enum.js";
export const friendRequestMiddleware = async (req, res, next) => {
  const { idFriendRequest, idFriendAccept } = req.body;
  if (!idFriendRequest) {
    throw new BadRequestError("Không tìm thấy lời mời kết bạn");
  }
  if (!idFriendAccept) {
    throw new BadRequestError("Không tìm thấy bạn này");
  }
  const receivedUser = await UserService.getUserById(idFriendAccept);
  if (!receivedUser) {
    throw new BadRequestError("Không tìm thấy bạn bè này");
  }
  const friendRequest = await FriendShipService.getFriendRequest(
    idFriendRequest,
    idFriendAccept,
  );
  if (!friendRequest) {
    throw new BadRequestError("Không có lời mời kết bạn nào");
  }
  if (friendRequest.activeFriend == FRIEND_STATUS_ENUM.ACCEPT) {
    throw new BadRequestError("Đã chập nhận lời mời trước đó");
  }
  if (friendRequest.activeFriend == FRIEND_STATUS_ENUM.DECLINE) {
    throw new BadRequestError("Đã từ chối lời mời trước đó");
  }
  /// Khi chấp nhận lời mời kết bạn
  /// Kiểm tra qua token xem có phải người nhận lời mời kết bạn này không
  const curUser = req.user;
  const isUserReceiverd = curUser._id.equals(friendRequest.receiverId);
  const isUserSenderId = curUser._id.equals(friendRequest.senderId);

  if (!isUserReceiverd && !isUserSenderId) {
    throw new UnauthorizedError("Bạn không được phép truy cập");
  }
  if (!isUserSenderId) {
    throw new BadRequestError(
      "Ban không có quyền chấp nhận lời mời kết bạn này",
    );
  }
  next();
};

export default friendRequestMiddleware;
