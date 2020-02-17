import * as multer from 'multer';
import generate from './generate';
import { Router } from 'express';

const upload = multer({ dest: 'uploads' });

const routes = Router();

routes.use('/generate', upload.single('file'), generate);

export default routes;