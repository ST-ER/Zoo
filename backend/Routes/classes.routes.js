import Router from "express";
const router = new Router();
import classesController from "../Controllers/classes.controller.js";

router.get("/", classesController.getClasses);
router.get("/:id", classesController.getOneClass);

export default router;