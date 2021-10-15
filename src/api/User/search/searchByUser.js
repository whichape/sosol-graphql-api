module.exports = {
  Query: {
    searchByUser: (parent, args, ctx) => {
      return ctx.prisma.user.findMany({
        where: {
          OR: [
            { handle: { contains: args.term } },
            { consumerName: { contains: args.term } },
          ],
        },
      });
    },
  },
};
