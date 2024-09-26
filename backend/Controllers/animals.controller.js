import {client} from "../db.js";

class AnimalController{
    async getAnimals(req, res){
        const animal = await client.query("select * from Animals");
        res.json(animal.rows);
    }

    async getOneAnimal(req, res){
        const id = req.params.id;
        const animal = await client.query("select * from Animals where Code = $1", [id]);
        res.json(animal.rows)
    }
}

export default new AnimalController();