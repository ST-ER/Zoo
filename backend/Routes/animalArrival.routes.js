import Router from "express";
const router = new Router();
import AnimalArrivalController from "../Controllers/animalArrival.controller.js";

router.get("/", AnimalArrivalController.getAnimalA);
router.get("/:id", AnimalArrivalController.getOneAnimalA);

export default router;