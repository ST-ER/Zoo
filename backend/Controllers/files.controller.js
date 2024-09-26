
import {client} from "../db.js";

class FilesController{
    async getFiles(req, res){
        const file = await client.query("select * from Files");
        res.json(file.rows);
    }

    async getOneFile(req, res){
        const id = req.params.id;
        const file = await client.query("select * from Files where Code = $1", [id]);
        res.json(file.rows)
    }
}

export default new FilesController();