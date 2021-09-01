module.exports = {
  Query: {
    searchByTweet: async (parent, args, ctx) => {
      return ctx.prisma.tweet.findMany({
        where: {
          text: { contains: args.term },
        },
        include: {
          user: true,
          files: true,
          comments: true,
          reactions: true,
        },
      })
    }
  },
};
