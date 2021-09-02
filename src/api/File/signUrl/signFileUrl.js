const { getSignedS3URL } = require("../../../utils");

module.exports = {
  Query: {
    signFileUrl: async (parent, args, ctx) => {
      return getSignedS3URL({ key: args.file});
    },
  },
};
