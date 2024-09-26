import {client} from "../db.js";

class AnimalDepartureController{
    async getAnimalD(req, res){
        const departure = await client.query("select * from AnimalDeparture");
        res.json(departure.rows);
    }

    async getOneAnimalD(req, res){
        const id = req.params.id;
        const departure = await client.query("select * from AnimalDeparture where Number = $1", [id]);
        res.json(departure.rows)
    }
}

export default new AnimalDepartureController();