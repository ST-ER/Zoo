import {client} from "../db.js";

class AnimalArrivalController{
    async getAnimalA(req, res){
        const animalA = await client.query("select * from AnimalArrival");
        res.json(animalA.rows);
    }

    async getOneAnimalA(req, res){
        const id = req.params.id;
        const animalA = await client.query("select * from AnimalArrival where Number = $1", [id]);
        res.json(animalA.rows)
    }
}

export default new AnimalArrivalController();