import {client} from "../db.js";

class CitiesController{
    async getCities(req, res){
        const city = await client.query("select * from Cities");
        res.json(city.rows);
    }

    async getOneCity(req, res){
        const id = req.params.id;
        const city = await client.query("select * from Cities where Code = $1", [id]);
        res.json(city.rows)
    }
}

export default new CitiesController();