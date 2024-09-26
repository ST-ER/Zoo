import Router from "express";
const router = new Router();
import familiesController from "../Controllers/families.controller.js";

router.get("/", familiesController.getFamilies);
router.get("/:id", familiesController.getOneFamily);

export default router;