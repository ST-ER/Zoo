import Router from "express";
const router = new Router();
import citiesController from "../Controllers/cities.controller.js";

router.get("/", citiesController.getCities);
router.get("/:id", citiesController.getOneCity);

export default router;