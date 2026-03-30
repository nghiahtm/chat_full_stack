import * as z from "zod";
import { FRIEND_STATUS_ENUM } from "../utils/enum/friend_status_enum.js";
/// Validator cho việc search fr
const searchValidator = z.object({
  page: z.coerce.number().int().positive().default(1),
  limit: z.coerce.number().int().positive().default(10),
  status: z.enum(FRIEND_STATUS_ENUM, {
    errorMap: () => ({ message: "Trạng thái không hợp lệ" }),
  }),
  searchFriends: z.string().max(50).trim().optional(),
});

export default searchValidator;
