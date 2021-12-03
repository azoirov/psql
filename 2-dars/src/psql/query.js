const { path } = require("../routes/Route");
const init = require("./psql");

async function query(query, args) {
    const client = await init();
    const result = await client.query(query, args);
    return result.rows;
}

module.exports = query;
