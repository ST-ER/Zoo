import Router from "express";
const router = new Router();
import countriesController from "../Controllers/countries.controller.js";

router.get("/", countriesController.getCountries);
router.get("/:id", countriesController.getOneCountry);

export default router;