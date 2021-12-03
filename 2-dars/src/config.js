const path = require("path");
require("dotenv").config({ path: path.join(__dirname, "..", ".env") });

const { env } = process;
module.exports = {
    PORT: env.PORT,
    DATABASE: env.DATABASE,
    DB_PORT: env.DB_PORT,
    DB_PASS: env.DB_PASS,
    LOGIN: env.LOGIN,
    PASS: env.PASS,
};
