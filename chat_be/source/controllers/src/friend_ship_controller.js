import catchAsync from "../../configs/utils/catch_async.js";
import { BadRequestError } from "../../configs/utils/app_errors.js";
import { UserService, FriendShipService } from "../../services/service.js";
import { HandleSuccess } from "../../middlewares/middleware.js";

export const addFriend = catchAsync(async (req, res, next) => {
  const { id } = req.body;
  if (!id) {
    throw new BadRequestError("Không tìm thấy user");
  }
  const senderUser = req.user;
  if (senderUser._id.equals(id)) {
    throw new BadRequestError("Không thể kết bạn");
  }
  const receivedUser = await UserService.getUserById(id);
  if (!receivedUser) {
    throw new BadRequestError("Không tìm thấy bạn bè này");
  }
  /// Kiem tra 2 dau gui xem co giong nhau khong se hoan vi lai
  const senderId = senderUser._id.toString();
  const receiverId = receivedUser._id.toString();
  if (senderId > receiverId) {
    [senderId, receiverId] = [receiverId, senderId];
  }

  /// Kiem tra xem 2 nguoi nay da la ban be chua

  /// kiem tra xem 2 nguoi nay da co loi ket ban chua
  const isHasFriendReq = await FriendShipService.findFriendHadRequest(
    senderId,
    receiverId,
  );
  if (isHasFriendReq) {
    throw new BadRequestError("Đã gửi lời kết bạn tới người này");
  }
  await FriendShipService.createFriendShip({
    receiverId,
    senderId,
    actionBy: senderId,
  });
  return HandleSuccess.successResponse(
    res,
    null,
    "Đã gửi lời mời kết bạn",
    201,
  );
});

export const acceptFriend = catchAsync(async (req, res, next) => {
  
  await FriendShipService.updateAcceptFriendShip(idFriendRequest,"accept");
  return HandleSuccess.successResponse(
    res,
    null,
    "Đã chập nhận lời mời kết bạn",
    201,
  );
});

export const declineFriend = catchAsync(async (req, res, next) => {
  await FriendShipService.updateAcceptFriendShip(idFriendRequest,"decline");
  return HandleSuccess.successResponse(
    res,
    null,
    "Đã hủy lời mời kết bạn",
    201,
  );
});
