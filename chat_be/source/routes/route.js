import express from "express";
import authRoutes from "./src/auth_route.js";

const rootRouter = express.Router();

// Authentication routes: Login, Register
rootRouter.use("/auth", authRoutes);
export default rootRouter;
