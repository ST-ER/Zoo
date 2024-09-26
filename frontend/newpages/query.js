import { exportXLSX } from "../functions/exportXLSX.js";

const url = window.location.href;
const segments = url.split('/');
const lastSegment = segments[segments.length - 1];
const route = lastSegment.replace('.html', '');
console.log('Название файла без расширения:', route);

function newObjQuery(query){
    const newQuery = {
        query: query
    }
    return newQuery
}

const sendBtn = document.getElementById("send");
const cleanBtn = document.getElementById("clean");
const textArea = document.getElementById("queryText");

function handleButtonClick(buttonNumber) {
    switch(buttonNumber) {
        case 1:
            textArea.value = `Запрос на обновление поля готовность
UPDATE public.orders
    SET readiness = true
WHERE dateofending < NOW();`;
            break;
        case 2:
            textArea.value = `Запрос количества клиентов и средняя стоимость их заказов
SELECT c.Surname, c.Name, COUNT(o.ID_Order) AS TotalOrders, AVG(o.S_Price) AS AverageOrderPrice 
FROM client c
    JOIN orders o ON c.ID_Client = o.ID_Client
GROUP BY c.Surname, c.Name;
`;
            break;
        case 3:
            textArea.value = `Запрос стоимости и длительности заказов за текущий месяц
SELECT o.ID_Order, SUM(i.PricePerItem * top.TypeCoefficient) AS TotalCost, SUM(i.ProcessingTime) AS TotalDuration
FROM orders o
    JOIN composition_of_order co ON o.ID_Order = co.ID_Order
    JOIN item i ON co.ID_Item = i.ID_Item
    JOIN type_of_processing top ON co.ID_Type = top.ID_Type
WHERE date_trunc('month', o.DateOfCompilation) = date_trunc('month', CURRENT_DATE)
GROUP BY o.ID_Order;`;
            break;
        case 4:
            textArea.value = `Запрос общего количества заказов для каждого клиента
SELECT c.ID_Client, c.Surname, c.Name, COUNT(o.ID_Order) AS TotalOrders
FROM client c
    LEFT JOIN orders o ON c.ID_Client = o.ID_Client
GROUP BY c.ID_Client, c.Surname, c.Name;`;
            break;
        case 5:
            textArea.value = `Запрос на увеличение цены всех товаров на 10%, если среднее время обработки товара превышает 3 часа
UPDATE item SET PricePerItem = PricePerItem * 1.10
WHERE ID_Item IN (
    SELECT ID_Item
    FROM item
    WHERE ProcessingTime > (SELECT AVG(ProcessingTime) FROM item WHERE ProcessingTime > 180)
);`;
            break;
        case 6:
            textArea.value = `Запрос на имя, фамилию и номер телефона клиента, который сделал самый дорогой заказ
SELECT c.Surname, c.Name, c.PhoneNumber
FROM client c
    JOIN orders o ON c.ID_Client = o.ID_Client
WHERE o.S_Price = (SELECT MAX(S_Price) FROM orders);`;
            break;
        case 7:
            textArea.value = `Заброс на добаление нового ограничения для столбца "TotalDuration" в таблице "orders", чтобы значение не могло быть меньше суммы времени обработки всех товаров в заказе
ALTER TABLE orders
ADD CONSTRAINT TotalDuration_min_check CHECK (
    TotalDuration >= (SELECT SUM(i.ProcessingTime)
    FROM composition_of_order co
        JOIN item i ON co.ID_Item = i.ID_Item
    WHERE co.ID_Order = orders.ID_Order)
);`;
            break;
        default:
            textArea.value = ``;
    }
}

sendBtn.addEventListener("click", async ()=>{
    let queryValue = textArea.value;

    const newQuery = newObjQuery(queryValue);
    
    const response = await fetch(`http://localhost:3000/api/${route}/`, {
        method: "POST",
        headers:{
            "Content-Type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify(newQuery)
    }).catch((error) =>{
        console.error("Ошибка: ", error)
    })
    let json = await response.json();
    if(response.ok){
        if(json.message){
            const queryDiv = document.getElementById("table");
            queryDiv.textContent = json.message;
        }else{
            const queryDiv = document.getElementById("table");
            const table = document.createElement("table");
            table.setAttribute("id","queryTable")
            const thead = document.createElement("thead");
            const tbody = document.createElement("tbody");

            // Добавляем таблицу
            table.append(thead);
            table.append(tbody);
            queryDiv.append(table);

            // Извлекаем заголовки из первого элемента JSON
            if (json.length > 0) {
                const headers = Object.keys(json[0]);
                let tr = document.createElement("tr");
                for (let header of headers) {
                    let th = document.createElement("th");
                    th.textContent = header;
                    tr.append(th);
                }
                thead.append(tr);
            }

            // Заполняем таблицу данными
            for(let i = 0; i < json.length; i++){
                let tr = document.createElement("tr");
                tr.setAttribute("id", "trID_" + json[i].id_client);
                for(const key in json[i]){
                    let td = document.createElement("td");
                    let input = document.createElement("input");
                    input.setAttribute("id", "InputTable")
                    input.setAttribute("readonly", "true")
                    input.value = json[i][key];

                    td.append(input);
                    tr.append(td);
                }
                tbody.append(tr);
            }
        }
    }else{
        alert("Ошибка HTTP: " + response.status);
    }
    
    const exportExcel = document.getElementById("XLSX");
    exportExcel.addEventListener("click", ()=>{
        const choice = confirm("Экспортировать в Excel?")
        if(choice){
            exportXLSX(headers, route);
            alert("Успешно экспортированно")
        }else{
            alert("Экспортирование отменено")
        }
    })

})

document.getElementById('firstQuery').addEventListener('click', function() {
    handleButtonClick(1);
});

document.getElementById('secondQuery').addEventListener('click', function() {
    handleButtonClick(2);
});

document.getElementById('thirdQuery').addEventListener('click', function() {
    handleButtonClick(3);
});

document.getElementById('fourthQuery').addEventListener('click', function() {
    handleButtonClick(4);
});

document.getElementById('fifthQuery').addEventListener('click', function() {
    handleButtonClick(5);
});

document.getElementById('sixthQuery').addEventListener('click', function() {
    handleButtonClick(6);
});

document.getElementById('seventhQuery').addEventListener('click', function() {
    handleButtonClick(7);
});

cleanBtn.addEventListener("click", ()=>{
    const table = document.querySelector("#table table");
    table.remove();
});
