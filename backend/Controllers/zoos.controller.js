import {client} from "../db.js";

class ZoosController{
    // async createCategory(req, res){
    //     const {categoryName} = req.body;
    //     const newCategory = await client.query("call add_category($1)", [categoryName]);
    //     res.json(req.body);
    // }
    async getZoos(req, res){
        const zoo = await client.query("select * from zoos");
        res.json(zoo.rows);
    }

    async getOneZoo(req, res){
        const id = req.params.id;
        const zoo = await client.query("select * from zoos where Code = $1", [id]);
        res.json(type.rows)
    }
    // async deleteCategory(req, res){
    //     const id = req.params.id;
    //     const category = await client.query("delete from Category where ID_Category = $1", [id]);
    //     res.json(type.rows[0])
    // }
    // async updateCategory(req, res){
    //     const {ID_Category, categoryName} = req.body;
    //     const category = await client.query("update Category set CategoryName = $2 where ID_Category = $1", [ID_Category, categoryName]);
    //     res.json(type.rows[0]);
    // }
}

export default new ZoosController();