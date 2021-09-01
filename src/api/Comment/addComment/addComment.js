module.exports = {
  Mutation: {
    addComment: async (parent, args, ctx) => {
      // 1. make sure the user is authenticated
      const userId = ctx.getUserId(ctx);
      if (!userId) throw Error("You need to be authenticated");

      // 2.make sure the tweet exist
      const exists = await ctx.prisma.tweet.findFirst({
        where: { id: args.id },
      });
      if (!exists) throw Error(`No tweet exists for id - ${args.id}`);

      // 3. add a comment
      const comment = await ctx.prisma.comment.create({
        data: {
          text: args.text,
          tweet: {
            connect: { id: args.id },
          },
          user: {
            connect: { id: userId },
          },
        },
        include: {
          user: true,
        }
      });

      return comment;
    },
  },
};
