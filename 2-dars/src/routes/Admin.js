const upload = require("../modules/cloudinary");
const query = require("../psql/query");
const path = require("path");
const fs = require("fs/promises");

const router = require("express").Router();

router.get("/", async (req, res) => {
    try {
        let users = await query(`SELECT * FROM users;`);
        const user = users[0];
        console.log(user);
        res.render("admin", {
            user,
        });
    } catch (e) {
        console.log(e);
    }
});

router.post("/", async (req, res) => {
    try {
        const { first_name, last_name, email, about, get_in_touch, address } =
            req.body;

        let user = await query(
            `UPDATE users SET first_name = $1, last_name = $2, email = $3, about = $4, get_in_touch = $5, address = $6 WHERE id = ${1} RETURNING *`,
            [first_name, last_name, email, about, get_in_touch, address]
        );

        console.log(user);

        res.redirect("/");
    } catch (e) {
        console.log(e);
    }
});

router.post("/avatar", async (req, res) => {
    try {
        const { avatar } = req.files;

        const format = avatar.mimetype.split("/")[1];

        const fileName = `profile-1.${format}`;
        const filePath = path.join(
            __dirname,
            "..",
            "public",
            "images",
            fileName
        );
        await avatar.mv(filePath);

        let response = await upload(filePath);

        await fs.unlink(filePath);

        await query(`UPDATE users SET avatar = $1 WHERE id = 1`, [
            response.url,
        ]);

        res.status(200).json({
            ok: true,
            message: "uploaded",
        });
    } catch (e) {
        res.status(400).json({
            ok: false,
            message: e + "",
        });
    }
});

module.exports = {
    path: "/admin",
    router,
};
