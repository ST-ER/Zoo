import {client} from "../db.js";

class DepartureReasonsController{
    async getReasons(req, res){
        const reason = await client.query("select * from DepartureReasons");
        res.json(reason.rows);
    }

    async getOneReason(req, res){
        const id = req.params.id;
        const reason = await client.query("select * from DepartureReasons where Code = $1", [id]);
        res.json(reason.rows)
    }
}

export default new DepartureReasonsController();