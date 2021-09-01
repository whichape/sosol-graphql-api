const { getSignedS3URL } = require("../../../utils");

module.exports = {
  Query: {
    signFileUrl: async (parent, args, ctx) => {
      console.log(args.file);
      return "xxx";
    },
  },
};
