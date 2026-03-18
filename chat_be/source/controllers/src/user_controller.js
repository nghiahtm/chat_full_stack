import {AuthModel} from '../../models/model.js';
import { UnauthorizedError } from '../../configs/utils/app_errors.js'
import catchAsync from '../../configs/utils/catch_async.js'

export const login = catchAsync(async (req, res, next)=>{
        const { username } = req.body; 
        console.log(`Đang xem thông tin user có ID là: ${username}`); 
    if(!username){
       throw new UnauthorizedError("Username không được để trống!");
    }
        const newUser = new AuthModel(username);
        return res.json(newUser);
    });


    export const create = catchAsync(async (req, res, next)=>{
        const newUser = new AuthModel(username);
        return res.json(newUser);
    });
