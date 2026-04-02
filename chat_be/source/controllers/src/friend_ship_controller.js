import catchAsync from "../../configs/utils/catch_async.js";
import { BadRequestError } from "../../configs/utils/app_errors.js";
import { UserService, FriendShipService } from "../../services/service.js";
import { HandleSuccess } from "../../middlewares/middleware.js";
import { FRIEND_STATUS_ENUM } from "../../configs/utils/enum/friend_status_enum.js";

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
  let senderId = senderUser._id.toString();
  let receiverId = receivedUser._id.toString();
  if (senderId > receiverId) {
    [senderId, receiverId] = [receiverId, senderId];
  }

  const isHasFriendReq = await FriendShipService.findFriendHadRequest(
    senderId,
    receiverId,
  );

  /// Kiem tra xem 2 nguoi nay da la ban be chua
  if (
    isHasFriendReq &&
    isHasFriendReq.activeFriend === FRIEND_STATUS_ENUM.ACCEPT
  ) {
    throw new BadRequestError("Đã kết bạn với người này");
  }

  /// kiem tra xem 2 nguoi nay da co loi ket ban chua
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
  const { idFriendShip } = req.body;
  await FriendShipService.updateStatusFriendShip(
    idFriendShip,
    FRIEND_STATUS_ENUM.ACCEPT,
  );
  return HandleSuccess.successResponse(
    res,
    null,
    "Đã chập nhận lời mời kết bạn",
    201,
  );
});

export const declineFriend = catchAsync(async (req, res, next) => {
  const { idFriendShip } = req.body;

  await FriendShipService.updateStatusFriendShip(
    idFriendShip,
    FRIEND_STATUS_ENUM.DECLINE,
  );
  return HandleSuccess.successResponse(
    res,
    null,
    "Đã hủy lời mời kết bạn",
    201,
  );
});

export const searchFriends = catchAsync(async (req, res, next) => {
  const {
    status = FRIEND_STATUS_ENUM.ACCEPT,
    page = 1,
    limit = 10,
    searchFriends = "",
  } = req.body;
  const options = {
    page: page,
    limit: limit,
    activeFriend: status,
    searchFriends: searchFriends,
  };
  const currentUserId = req.user._id;

  const result = await FriendShipService.findFriends(currentUserId, options);

  return HandleSuccess.successResponse(res, result, 200);
});
