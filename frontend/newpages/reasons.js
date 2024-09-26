import { exportXLSX } from "../functions/exportXLSX.js";
import { deleteField } from "../functions/deleteField.js";
import { updateField } from "../functions/updateField.js";
import { addType } from "../functions/addType.js";

const url = window.location.href;
const segments = url.split('/');
const lastSegment = segments[segments.length - 1];
const route = lastSegment.replace('.html', '');
console.log('Название файла без расширения:', route);

const headers = ["ID-Вида", "Наименование", "Коэффициент обработки"];

function fillTypeData(obj, arr) {
    obj.ID_Type = arr[0];
    obj.typeName = arr[1];
    obj.typeCoefficient = arr[2];
}

async function getTypes(){
    const response = await fetch(`http://localhost:3000/api/${route}/`);
    if(response.ok){
        let json = await response.json();
        const typeDiv = document.getElementById("table");
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
        typeDiv.append(table);

        for(let i = 0; i < json.length; i++){
            let tr = document.createElement("tr");
            tr.setAttribute("id", "trID_" + json[i].id_type);
            for(const key in json[i]){
                let td = document.createElement("td");
                let input = document.createElement("input");
                input.setAttribute("id", "InputTable")
                input.setAttribute("readonly", "true")
                input.value = json[i][key];

                td.append(input);
                tr.append(td);
            }

            const deleteBtn = document.createElement("button");
            deleteBtn.setAttribute("id", "DeleteBtn");
            deleteBtn.dataset.id_client = json[i].id_type;
            const deleteIcon = document.createElement("img");
            deleteIcon.src = "../img/icons/delete.png";
            deleteBtn.append(deleteIcon);
            

            const updateBtn = document.createElement("button");
            updateBtn.setAttribute("id", "UpdateBtn");
            updateBtn.dataset.id_type = json[i].id_type;
            console.log(updateBtn.dataset.id_type)
            const updateIcon = document.createElement("img");
            updateIcon.src = "../img/icons/update.png";
            updateBtn.append(updateIcon);

            tbody.append(tr);
            tr.append(deleteBtn);
            tr.append(updateBtn);
        }

        const deleteBtns = document.querySelectorAll("#DeleteBtn");
        deleteBtns.forEach((btn) =>{
            btn.addEventListener("click", () =>{
                const id_type = btn.getAttribute("data-id_type");
                console.log(id_type)
                const deletion = confirm("Удалить запись?")
                if(deletion){
                    deleteField(route, id_type);
                    const trID = document.getElementById("trID_" + id_type);
                    trID.remove();
                    alert("Запись удалена.");
                }else{
                    alert("Удаление записи отменено.")
                }
            })
        })

        const updateBtns = document.querySelectorAll("#UpdateBtn");
        let inputValues = [];
        let inputObj = {};
        let clickCount = 0
        updateBtns.forEach((btn) =>{
            btn.addEventListener("click", () =>{
                clickCount +=1;
                const id_type = btn.getAttribute("data-id_type");
                console.log(id_type)
                const trInputs = document.querySelectorAll(`#trID_${id_type} input`);
                trInputs.forEach((input) => {
                    if(input.hasAttribute("readonly")){
                        input.removeAttribute("readonly");
                        const img = btn.querySelector("img");
                        img.setAttribute("src", "../img/icons/done.png");
                    }else{
                        input.setAttribute("readonly", true);
                        inputValues.push(input.value);    
                        const img = btn.querySelector("img");
                        img.setAttribute("src", "../img/icons/update.png");
                    }
                    
                })
                console.log(inputValues)
                if(clickCount == 2){
                    fillTypeData(inputObj, inputValues);
                    console.log(inputObj);
                    updateField(route, inputObj);
                    inputValues = [];
                    inputObj = {};
                    clickCount = 0;
                }
            })
            
        })

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
}

const body = document.body;
const addBtn = document.getElementById("addType");
addBtn.addEventListener("click", ()=>{
    addType(route, body)
})

window.addEventListener("load", ()=>{
    getTypes();
})