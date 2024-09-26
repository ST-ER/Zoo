import Router from "express";
const router = new Router();
import zoosController from "../Controllers/zoos.controller.js";

router.get("/", zoosController.getZoos);
router.get("/:id", zoosController.getOneZoo);

export default router;