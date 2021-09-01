const jwt = require("jsonwebtoken");

exports.getUserId = (ctx) => {
  const token = ctx.request.get("Authorization");
  // const token = true;
  if (token) {
    const { userId } = jwt.verify(token, process.env.JWT_SECRET);
    // const userId = 'user111111111111111111';
    return userId;
  }

  throw Error("You need to be authenticated.");
};
