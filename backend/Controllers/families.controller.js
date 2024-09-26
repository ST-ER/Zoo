import {client} from "../db.js";

class FamiliesController{
    async getFamilies(req, res){
        const family = await client.query("select * from Families");
        res.json(family.rows);
    }

    async getOneFamily(req, res){
        const id = req.params.id;
        const family = await client.query("select * from Families where Code = $1", [id]);
        res.json(family.rows)
    }
}

export default new FamiliesController();