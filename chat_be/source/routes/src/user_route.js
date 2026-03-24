import express from "express";
import { UserController } from "../../controllers/controller.js";

const router = express.Router();

router.post("/get", UserController.getUser);

export default router;
