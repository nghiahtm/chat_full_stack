import express from "express";
import routes from "./routes/route.js";
import { HandleError } from "./middlewares/middleware.js";
import dotenv from "dotenv";
import connectDB from "./configs/db/mongo_db_connect.js";

dotenv.config({ path: "./dev.env" });
const app = express();
const port = process.env.PORT || 3000;
const ipAddress = process.env.IP_ADDRESS || "localhost";
/// Set Express json
app.use(express.json());

/// Add Routes
app.use("/api", routes);

app.use(HandleError.errorHandler);

// Connect to MongoDB and start the server
await connectDB();
app.listen(port, ipAddress, () => {
  console.log(`🚀 Server running at http://${ipAddress}:${port}`);
});
