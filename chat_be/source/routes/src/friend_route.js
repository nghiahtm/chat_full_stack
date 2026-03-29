import express from "express";
import { FriendShipController } from "../../controllers/controller.js";
import friendRequestMiddleware from "../../middlewares/friend_request_middleware.js";
const router = express.Router();
router.post("/friend_req", FriendShipController.addFriend);
router.post("/accept_friend",friendRequestMiddleware ,FriendShipController.acceptFriend);
router.post("/decline_friend", friendRequestMiddleware,FriendShipController.declineFriend);

export default router;
