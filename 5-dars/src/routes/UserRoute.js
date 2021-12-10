const UserController = require("../controllers/UserController");

const router = require("express").Router();

router.post("/signup", UserController.SignUpPOST);
router.post("/login", UserController.LoginPOST);

module.exports = {
    path: "/users",
    router,
};
