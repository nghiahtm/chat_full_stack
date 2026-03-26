import express from "express";
import { FriendShipController } from "../../controllers/controller.js";

const router = express.Router();
router.post("/friend_req", FriendShipController.addFriend);
export default router;
