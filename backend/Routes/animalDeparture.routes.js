import Router from "express";
const router = new Router();
import animalDepartureController from "../Controllers/animalDeparture.controller.js";

router.get("/", animalDepartureController.getAnimalD);
router.get("/:id", animalDepartureController.getOneAnimalD);

export default router;