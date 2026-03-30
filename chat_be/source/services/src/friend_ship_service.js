import { FriendShipModel } from "../../models/model.js";

export const createFriendShip = async (friendRelation) =>
  await FriendShipModel.create(friendRelation);

export const findFriendHadRequest = async (senderId, receiverId) =>
  await FriendShipModel.findOne({
    $or: [
      {
        senderId,
        receiverId,
      },
      {
        senderId: receiverId,
        receiverId: senderId,
      },
    ],
  });

export const getFriendRequest = async (idFriendRequest, receiverId) =>
  await FriendShipModel.findOne({
    _id: idFriendRequest,
    receiverId: receiverId,
  });

export const updateStatusFriendShip = async (idFriendRequest, activeFriend) =>
  await FriendShipModel.findByIdAndUpdate(idFriendRequest, {
    activeFriend: activeFriend,
    actionBy: idFriendRequest,
  });

export const findFriends = async (currentUserId, options) => {
  const { page, limit, activeFriend, searchFriends } = options;

  const query = {
    $and: [
      {
        $or: [{ senderId: currentUserId }, { receiverId: currentUserId }],
      },
      { activeFriend: activeFriend }, // Đảm bảo tên trường trong DB là 'status'
    ],
  };
  const search = options.searchFriends;
  let userFilter = {};

  if (search) {
    const safeSearch = searchFriends.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    if (searchFriends.startsWith("@")) {
      userMatch.username = searchFriends.slice(1).trim();
    } else {
      const regex = new RegExp(safeSearch.trim(), "i");
      userFilter.$or = [
        { username: regex },
        { email: regex },
        { fullName: regex },
      ];
    }
  }
  const paginateOptions = {
    page,
    limit,
    populate: [
      { path: "senderId", select: "username email", match: userFilter },
      { path: "receiverId", select: "username email", match: userFilter },
    ],
    lean: true,
  };

  const result = await FriendShipModel.paginate(query, paginateOptions);
  console.log("🚀 ~ file: friend_ship ~ result:", result);
  if (!result) return null;
  // Xử lý để lấy thông tin "người kia"
  result.docs = result.docs
    .map((doc) => {
      /// Mapping để lấy thông tin người kia và loại bỏ những kết quả không khớp với search
      /// neu search có thì sẽ lọc current user ra khỏi senderId và receiverId, nếu không có thì sẽ lấy cả 2
      const friendInfo = [doc.senderId, doc.receiverId].find(
        (user) =>
          user !== null && user._id.toString() !== currentUserId.toString(),
      );
      if (!friendInfo) return null;
      return {
        friendshipId: doc._id,
        friendInfo,
        status: doc.status,
      };
    })
    .filter((item) => item !== null);

  return result;
};
