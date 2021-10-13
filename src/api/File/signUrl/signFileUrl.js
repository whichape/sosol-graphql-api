const { getSignedS3URL } = require("../../../utils");

module.exports = {
  Mutation: {
    signFileUrl: async (parent, args, ctx) => {
      return await getSignedS3URL({ file: args.file, type: args.type });
    },
  },
};
