export const validateText = (text) => {
  return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
};
