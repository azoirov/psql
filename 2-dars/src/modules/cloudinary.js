const cloudinary = require("cloudinary");

cloudinary.config({
    cloud_name: "fulfil",
    api_key: "915995471952131",
    api_secret: "vV5PUzUui8rzZu3wnfdwZojTrXM",
});

async function upload(file) {
    let response = await cloudinary.v2.uploader.upload(file);
    return response;
}

module.exports = upload;
