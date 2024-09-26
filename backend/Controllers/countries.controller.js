import {client} from "../db.js";

class CountriesController{
    async getCountries(req, res){
        const country = await client.query("select * from Countries");
        res.json(city.rows);
    }

    async getOneCountry(req, res){
        const id = req.params.id;
        const country = await client.query("select * from Countries where Code = $1", [id]);
        res.json(country.rows)
    }
}

export default new CountriesController();