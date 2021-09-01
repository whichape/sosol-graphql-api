const jwt = require("jsonwebtoken");
const AWS = require("aws-sdk");

exports.getUserId = (ctx) => {
  const token = ctx.request.get("Authorization");
  // const token = true;
  if (token) {
    const { userId } = jwt.verify(token, process.env.JWT_SECRET);
    // const userId = 'user111111111111111111';
    return userId;
  }

  throw Error("You need to be authenticated.");
};

exports.getSignedS3URL = ({ key, expires }) => {
  AWS.config = new AWS.Config({
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_KEY,
    region: process.env.AWS_REGION || "us-west-2",
    signatureVersion: "v4",
  });

  const s3 = new AWS.S3();

  const signedUrl = s3.getSignedUrl("getObject", {
    Key: key,
    Bucket: process.env.AWS_BUCKET_NAME,
    Expires: expires || 600, // S3 default is 900 seconds (15 minutes)
  });

  return signedUrl;
}
