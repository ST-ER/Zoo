import Router from "express";
const router = new Router();
import filesController from "../Controllers/files.controller.js";

router.get("/", filesController.getFiles);
router.get("/:id", filesController.getOneFile);

export default router;