const { join } = require("path");
const { makeExecutableSchema } = require("@graphql-tools/schema");
const { loadFilesSync } = require('@graphql-tools/load-files');
const { mergeResolvers, mergeTypeDefs } = require("@graphql-tools/merge");

const typeDefs = loadFilesSync(join(__dirname, "/api/**/*.graphql"));
const resolvers = loadFilesSync(join(__dirname, "/api/**/*.js"));

const schema = makeExecutableSchema({
  typeDefs: mergeTypeDefs(typeDefs),
  resolvers: mergeResolvers(resolvers),
});

module.exports = schema;
