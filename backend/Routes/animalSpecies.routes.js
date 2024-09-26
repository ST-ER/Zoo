import Router from "express";
const router = new Router();
import animalSpeciesController from "../Controllers/animalSpecies.controller.js";

router.get("/", animalSpeciesController.getAnimalSpecies);
router.get("/:id", animalSpeciesController.getOneAnimalSpecies);

export default router;