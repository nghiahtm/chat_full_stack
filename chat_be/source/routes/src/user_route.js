import express from "express";
import { UserController } from "../../controllers/controller.js";
import * as ValidatorMiddleware from "../../configs/core/valid_middleware.js";
import searchValidator from "../../configs/validators/search_fr_validator.js";

const router = express.Router();

router.post("/get", UserController.getUser);
router.post(
  "/users",
  ValidatorMiddleware.validate(searchValidator.omit({ status: true })),
  UserController.findUsers,
);
export default router;
