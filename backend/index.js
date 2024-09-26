import express from "express";
import routers from './Routes/link.js';
import cors from 'cors';

const app = express();

app.use(cors());

app.use(express.json());
app.use('/api', routers);

// const port = 3000;\

const start = async () =>{
    try{
        const port = process.env.PORT || 3000;
        app.listen(port, () =>{
            console.log(`Server is started on http://localhost:${port}`);
        });
    } catch (e) {
        console.log(e);
    }
        
}

start()