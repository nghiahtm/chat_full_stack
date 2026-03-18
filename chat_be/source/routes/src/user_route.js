import express from 'express';
import { UserController } from '../../controllers/controller.js';
import userValidator from '../../configs/validators/create_user_validator.js';
import * as ValidatorMiddleware from '../../configs/core/valid_middleware.js';
const router = express.Router();

router.post('/login', UserController.login);
router.post('/create',ValidatorMiddleware.validate(userValidator) ,UserController.create);

export default router;