import express from "express";
import publicRoutes from "./routes/public_route.js";
import { HandleError } from "./middlewares/middleware.js";
import dotenv from "dotenv";
import connectDB from "./configs/db/mongo_db_connect.js";
import cookieParser from "cookie-parser";
import privateRoute from "./routes/private_route.js";
import authMiddleware from "./middlewares/auth_middleware.js";

dotenv.config({ path: "./dev.env" });
const app = express();
const port = process.env.PORT || 5001;
/// Set Express json
app.use(express.json());
app.use(cookieParser());

/// Add Routes
app.use("/api", publicRoutes);

app.use(authMiddleware);
app.use("/api", privateRoute);

app.use(HandleError.errorHandler);

// Connect to MongoDB and start the server
await connectDB();
app.listen(port, ipAddress, () => {
  console.log(`🚀 Server running at port:${port}`);
});
