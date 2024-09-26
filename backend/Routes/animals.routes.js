import Router from "express";
const router = new Router();
import animalsController from "../Controllers/animals.controller.js";

router.get("/", animalsController.getAnimals);
router.get("/:id", animalsController.getOneAnimal);

export default router;