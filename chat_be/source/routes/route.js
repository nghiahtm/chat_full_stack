import express from 'express';
import userRoutes from './src/user_route.js';

const rootRouter = express.Router();

// Gán tiền tố cho từng nhóm route
rootRouter.use('/auth', userRoutes); 
export default rootRouter;