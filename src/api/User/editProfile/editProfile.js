module.exports = {
  Mutation: {
    editProfile: async (parent, args, ctx) => {
      // 1. make sure the user is authenticated
      const userId = ctx.getUserId(ctx);
      if (!userId) throw Error("You need to be authenticated.");

      // 2.make sure handle isn't taken
      const exists = await ctx.prisma.user.findFirst({
        where: { handle: args.handle },
      });
      if (exists) throw Error(`Handle already taken for - @${args.handle}`);

      const user = await ctx.prisma.user.update({
        where: { id: userId },
        data: {
          ...args,
        },
      });

      return user;
    },
  },
};
