const Pool = require("pg-pool");
const { DB_PASS, DB_PORT, DATABASE } = require("../config");

const pool = new Pool({
    connectionString: `postgres://postgres:${DB_PASS}@localhost:${DB_PORT}/${DATABASE}`,
});

async function init() {
    try {
        const client = await pool.connect();
        return client;
    } catch (e) {
        console.log(`DB_ERROR: `, e);
    }
}

module.exports = init;
