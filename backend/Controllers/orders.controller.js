import {client} from "../db.js";

class OrdersController{
    async getOrders(req, res){
        const order = await client.query("select * from Orders");
        res.json(order.rows);
    }

    async getOneOrder(req, res){
        const id = req.params.id;
        const order = await client.query("select * from Orders where Code = $1", [id]);
        res.json(order.rows)
    }
}

export default new OrdersController();