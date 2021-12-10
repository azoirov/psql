const { sign, verify } = require("jsonwebtoken");

module.exports.generateToken = (data) => {
    try {
        return sign(data, "SECRET_WORD");
    } catch (e) {}
};

module.exports.checkToken = (token) => {
    try {
        return verify(token, "SECRET_WORD");
    } catch (e) {
        return false;
    }
};
