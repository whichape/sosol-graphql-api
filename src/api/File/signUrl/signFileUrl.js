const { getSignedS3URL } = require("../../../utils");

module.exports = {
  Mutation: {
    signFileUrl: async (parent, args, ctx) => {
      return getSignedS3URL({ file: args.file, type: args.type });
    },
  },
};
