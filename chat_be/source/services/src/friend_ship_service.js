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

export const getFriendRequest = async (idFriendRequest,receiverId) =>
  await FriendShipModel.findOne({_id: idFriendRequest,receiverId:receiverId});

export const updateStatusFriendShip = async (idFriendRequest,activeFriend) =>
  await FriendShipModel.findByIdAndUpdate(idFriendRequest, {
    activeFriend: activeFriend,
  });

