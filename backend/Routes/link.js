import Router from "express";
import AnimalArrival from "./animalArrival.routes.js";
import AnimalDeparture from "./animalDeparture.routes.js";
import Animals from "./animals.routes.js"
import AnimalSpecies from "./animalSpecies.routes.js";
import Cities from "./cities.routes.js";
import Classes from "./classes.routes.js";
import Countries from "./countries.routes.js";
import DepartureReasons from "./departureReasons.routes.js";
import Families from "./families.routes.js";
import Files from "./files.routes.js";
import Orders from "./orders.routes.js";
import Zoos from "./zoos.routes.js";

const router = new Router();

router.use("/AnimalArrival", AnimalArrival);
router.use("/AnimalDeparture", AnimalDeparture);
router.use("/Animals", Animals);
router.use("/AnimalSpecies", AnimalSpecies);
router.use("/Cities", Cities);
router.use("/Classes", Classes);
router.use("/Countries", Countries);
router.use("/DepartureReasons", DepartureReasons);
router.use("/Families", Families);
router.use("/Files", Files);
router.use("/Orders", Orders);
router.use("/Zoos", Zoos);

export default router;