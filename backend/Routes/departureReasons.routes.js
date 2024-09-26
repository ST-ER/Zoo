import Router from "express";
const router = new Router();
import departureRController from "../Controllers/departureReasons.controller.js";

router.get("/", departureRController.getReasons);
router.get("/:id", departureRController.getOneReason);

export default router;