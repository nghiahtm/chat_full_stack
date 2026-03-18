import { BadRequestError } from '../../configs/utils/app_errors.js'

export const validate = (schema) => (req, res, next) => {
  const result = schema.safeParse(req.body);
  if (!result.success) {
        const errorMessages = result.error.issues.map((e)=> ({
      // err.path là một mảng (vd: ['user', 'email']), dùng join để biến thành string 'user.email'
      type: e.path.join('.')||'', 
      message: e.message,
    }));

    return next( new BadRequestError(errorMessages));
  }
  next();
};

export const asyncValidate = (schema) => (req, res, next) => {
  const result = schema.asyncValidate(req.body);
  if (!result.success) {
    console.log(result.ZodError);
    throw new BadRequestError('messages');
  }
  next();
};

