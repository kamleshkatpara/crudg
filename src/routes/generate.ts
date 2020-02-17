import { Router } from "express";
import { GenerateController } from './../controller/GenerateController';

const router = Router();

router.post('/', GenerateController.create);

export default router;