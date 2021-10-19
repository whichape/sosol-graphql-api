module.exports = {
  Query: {
    healthCheck: async (parent, args, ctx) => {
      const check = `OK @ ${new Date()}`;
      console.log(check);
      return check;
    }
  },
};
