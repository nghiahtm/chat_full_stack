import express from "express";
import userRoutes from "./src/user_route.js";

const privateRoute = express.Router();

// Authentication routes: Login, Register
privateRoute.use("/user", userRoutes);

export default privateRoute;
