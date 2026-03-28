import express from "express";
import { FriendShipController } from "../../controllers/controller.js";

const router = express.Router();
router.post("/friend_req", FriendShipController.addFriend);
router.post("/accept_friend", FriendShipController.acceptFriend);
router.post("/decline_friend", FriendShipController.declineFriend);

export default router;
