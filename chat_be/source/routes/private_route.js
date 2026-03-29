import express from "express";
import userRoutes from "./src/user_route.js";
import friendRoutes from "./src/friend_route.js";

const privateRoute = express.Router();

// Authentication routes: Login, Register
privateRoute.use("/user", userRoutes);
privateRoute.use("/friend", friendRoutes);

export default privateRoute;
