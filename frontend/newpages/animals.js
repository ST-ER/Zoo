// import { exportXLSX } from "../exportXLSX.js";

const headers = ["ID_Животного", "Кличка", "Пол", "ID_Вида", "Дата прибытия", "Дата рождения", "Цена", "Доп. информация"];
async function getAnimals(){
    const response = await fetch(`http://localhost:3000/api/Animals/`);
    if(response.ok){
        let json = await response.json();
        const orderDiv = document.getElementById("table");
        const table = document.createElement("table");
        const thead = document.createElement("thead");
        const tbody = document.createElement("tbody");
        const trh = document.createElement("tr");

        headers.forEach(headerText => {
            const th = document.createElement("th");
            th.textContent = headerText;
            trh.append(th);
        });

        thead.append(trh);
        table.append(thead);
        table.append(tbody);
        orderDiv.append(table);

        for(let i = 0; i < json.length; i++){
            let tr = document.createElement("tr");
            tr.setAttribute("id", "trID_" + json[i].id_order);
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
    }else{
        alert("Ошибка HTTP: " + response.status);
    }

    // const exportExcel = document.getElementById("XLSX");
    // exportExcel.addEventListener("click", ()=>{
    //     const choice = confirm("Экспортировать в Excel?")
    //     if(choice){
    //         exportXLSX(headers, route);
    //         alert("Успешно экспортированно")
    //     }else{
    //         alert("Экспортирование отменено")
    //     }
    // })
}

const body = document.body;
const addBtn = document.getElementById("addOrder");
// addBtn.addEventListener("click", ()=>{
// })

window.addEventListener("load", ()=>{
    getAnimals();
})