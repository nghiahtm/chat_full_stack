import { BadRequestError } from "../../configs/utils/app_errors.js";

export const validate = (schema) => (req, res, next) => {
  const result = schema.safeParse(req.body);
  if (result.error) {
    const errorMessages = result.error.issues.map((e) => ({
      type: e.path.join(".") || "",
      message: e.message,
    }));
    return next(new BadRequestError("", errorMessages));
  }
  next();
};

export const asyncValidate = (schema) => (req, res, next) => {
  const result = schema.asyncValidate(req.body);
  if (!result.success) {
    throw new BadRequestError("messages");
  }
  next();
};
