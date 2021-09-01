module.exports = {
  Mutation: {
    address: async (parent, args, ctx) => {
      const user = await ctx.prisma.user.findUnique({
        where: { publicAddress: args.publicAddress },
      });

      return {
        hasPublicAddress: !!user,
        user
      };
    },
  },
};
