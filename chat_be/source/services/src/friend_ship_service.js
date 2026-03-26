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
