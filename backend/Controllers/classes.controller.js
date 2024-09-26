import {client} from "../db.js";

class ClassesController{
    async getClasses(req, res){
        const classs = await client.query("select * from Classes");
        res.json(classs.rows);
    }

    async getOneClass(req, res){
        const id = req.params.id;
        const classs = await client.query("select * from Classes where Code = $1", [id]);
        res.json(classs.rows)
    }
}

export default new ClassesController();