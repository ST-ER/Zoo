import {client} from "../db.js";

class AnimalSpecies{
    async getAnimalSpecies(req, res){
        const animalS = await client.query("select * from AnimalSpecies");
        res.json(animalS.rows);
    }

    async getOneAnimalSpecies(req, res){
        const id = req.params.id;
        const animalS = await client.query("select * from AnimalSpecies where Code = $1", [id]);
        res.json(animalS.rows)
    }
}

export default new AnimalSpecies();