const Haikunator = require("haikunator");
const base58 = require('bs58');
const cuid = require("cuid");
const haikunator = new Haikunator();
const jwt = require("jsonwebtoken");
const nacl = require('tweetnacl');

module.exports = {
  Mutation: {
    loginRegister: async (parent, args, ctx) => {
      // check if the email and username is unique
      const user = await ctx.prisma.user.findFirst({
        where: { publicAddress: args.publicAddress },
      });

      if (args.signature) {
        const signatureUint8 = base58.decode(args.signature);
        const nonceUint8 = new TextEncoder().encode(user?.nonce);
        const pubKeyUint8 = base58.decode(user?.publicAddress);

        // // Refresh the nonce
        // await ctx.prisma.user.update({
        //   where: { publicAddress: user.publicAddress },
        //   data: {
        //     nonce: cuid(),
        //   },
        // });

        // Verify the nonce is signed
        if (!nacl.sign.detached.verify(nonceUint8, signatureUint8, pubKeyUint8)) {
          throw Error(
            "Unauthorized: Signature does not match nonce."
          );
        }

        const payload = {
          userId: user.id,
          publicAddress: user.publicAddress,
          handle: user.handle,
        };
        const token = jwt.sign(payload, process.env.JWT_SECRET);
        return {
          token,
          user,
        };
      }

      if (user)
        throw Error(
          "$publicAddress is missing a transaction signature for authentication."
        );

      if (!args?.handle) {
        args.handle = haikunator.haikunate();
        const nameArr = args.handle.split("-");
        args.firstname = nameArr[0];
        args.lastname = nameArr[1];
      }

      // generate a jsonwebtoken using the userid as payload
      const newUser = await ctx.prisma.user.create({
        data: { ...args },
      });

      // generate jsonwebtoken using userid as payload
      const payload = {
        userId: newUser.id,
        publicAddress: newUser.publicAddress,
        handle: newUser.handle,
      };
      const token = jwt.sign(payload, process.env.JWT_SECRET);
      return {
        token,
        user,
      };
    },
  },
};
