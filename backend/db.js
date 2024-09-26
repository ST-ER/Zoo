import pkg from 'pg';
const { Client } = pkg

const dbConfig = {
    user: 'postgres',
    password: '1234',
    host: 'localhost',
    port: 5432,
    database: 'Zoo'
}

export const client = new Client(dbConfig);
client.connect().then(() =>{
    console.log('Успешное подключение')
}).catch((error) =>{
    console.error('Ошибка подключения', error)
})