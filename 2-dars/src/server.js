const express = require("express");
const { PORT } = require("./config");
const fs = require("fs");
const path = require("path");
const cors = require("cors");
const init = require("./psql/psql");
const FileUpload = require("express-fileupload");

async function server() {
    const app = express();

    app.listen(PORT);

    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use("/", express.static(path.join(__dirname, "public")));
    app.use(FileUpload());
    app.use(cors());

    app.set("view engine", "ejs");
    app.set("views", path.join(__dirname, "views"));

    fs.readdir(path.join(__dirname, "routes"), (err, files) => {
        if (files) {
            files.forEach((file) => {
                let routePath = path.join(__dirname, "routes", file);
                let Route = require(routePath);
                if (Route.path && Route.router)
                    app.use(Route.path, Route.router);
            });
        }
    });
}

server();
