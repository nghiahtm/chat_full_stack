import express from "express";
import { AuthController } from "../../controllers/controller.js";
import userValidator from "../../configs/validators/create_user_validator.js";
import authValidator from "../../configs/validators/user_login.js";
import * as ValidatorMiddleware from "../../configs/core/valid_middleware.js";
import authMiddleware from "../../middlewares/auth_middleware.js";

const router = express.Router();

router.post(
  "/login",
  ValidatorMiddleware.validate(authValidator),
  AuthController.login,
);
router.post(
  "/create",
  ValidatorMiddleware.validate(userValidator),
  AuthController.create,
);

router.post("/logout", AuthController.logout);
router.post("/refresh_token", AuthController.refreshAccToken);

export default router;
