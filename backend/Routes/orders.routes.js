import Router from "express";
const router = new Router();
import ordersController from "../Controllers/orders.controller.js";

router.get("/", ordersController.getOrders);
router.get("/:id", ordersController.getOneOrder);

export default router;