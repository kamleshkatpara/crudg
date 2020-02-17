import "reflect-metadata";
import * as express from "express";
import * as bodyParser from "body-parser";
import routes from "./routes";
import * as helmet from "helmet";
import * as cors from "cors";
import fileUpload = require("express-fileupload");
import config from './config/config';

const app = express();
app.use(cors());
app.use(helmet());
app.use(bodyParser.json());
app.use(fileUpload());
app.use('/', routes);
app.listen(config.PORT, () => {
    console.log(`Express server has started on port ${config.PORT}. Open http://localhost:${config.PORT}/`);
});

