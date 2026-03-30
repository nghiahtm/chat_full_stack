import express from "express";
import { FriendShipController } from "../../controllers/controller.js";
import friendRequestMiddleware from "../../middlewares/friend_request_middleware.js";
import searchValidator from "../../configs/validators/search_fr_validator.js";
import * as ValidatorMiddleware from "../../configs/core/valid_middleware.js";

const router = express.Router();
router.post("/friend_req", FriendShipController.addFriend);
router.post(
  "/accept_friend",
  friendRequestMiddleware,
  FriendShipController.acceptFriend,
);
router.post(
  "/decline_friend",
  friendRequestMiddleware,
  FriendShipController.declineFriend,
);
router.post(
  "/search_friend",
  ValidatorMiddleware.validate(searchValidator),
  FriendShipController.searchFriends,
);

export default router;
