require("dotenv").config();

const schema = require("./schema");
const { ApolloServer } = require("apollo-server");
const { PrismaClient } = require("@prisma/client");
const { getUserId } = require("./utils");

const prisma = new PrismaClient();

const server = new ApolloServer({
  schema,
  context: (req) => ({ ...req, prisma, getUserId }),
  cors: false,
});

const PORT = process.env.SOSOL_PORT || 7777;

server.listen(
  {
    port: PORT,
  },
  () => console.log(`server has started at http://localhost:${PORT}`)
);
