import express from "express";
import userRoutes from "./src/user_route.js";

const rootRouter = express.Router();

// Authentication routes: Login, Register
rootRouter.use("/auth", userRoutes);
export default rootRouter;
