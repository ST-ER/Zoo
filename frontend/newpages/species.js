import { exportXLSX } from "../functions/exportXLSX.js";
import { deleteField } from "../functions/deleteField.js";
import { updateField } from "../functions/updateField.js";
import { addCategory } from "../functions/addCategory.js";

const url = window.location.href;
const segments = url.split('/');
const lastSegment = segments[segments.length - 1];
const route = lastSegment.replace('.html', '');
console.log('Название файла без расширения:', route);

const headers = ["ID-категории", "Наименование"];

function fillClientData(obj, arr) {
    obj.ID_Category = arr[0];
    obj.categoryName = arr[1];
}

async function getCategory(){
    const response = await fetch(`http://localhost:3000/api/${route}/`);
    if(response.ok){
        let json = await response.json();
        const categoryDiv = document.getElementById("table");
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
        categoryDiv.append(table);

        for(let i = 0; i < json.length; i++){
            let tr = document.createElement("tr");
            tr.setAttribute("id", "trID_" + json[i].id_category);
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
            deleteBtn.dataset.id_client = json[i].id_category;
            const deleteIcon = document.createElement("img");
            deleteIcon.src = "../img/icons/delete.png";
            deleteBtn.append(deleteIcon);
            

            const updateBtn = document.createElement("button");
            updateBtn.setAttribute("id", "UpdateBtn");
            updateBtn.dataset.id_category = json[i].id_category;
            console.log(updateBtn.dataset.id_category)
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
                const id_category = btn.getAttribute("data-id_category");
                console.log(id_category)
                const deletion = confirm("Удалить запись?")
                if(deletion){
                    deleteField(route, id_category);
                    const trID = document.getElementById("trID_" + id_category);
                    trID.remove();
                    alert("Запись удалена.");
                }else{
                    alert("Удаление записи отменено.")
                }
            })
        });

        const updateBtns = document.querySelectorAll("#UpdateBtn");
        let inputValues = [];
        let inputObj = {};
        let clickCount = 0
        updateBtns.forEach((btn) =>{
            btn.addEventListener("click", () =>{
                clickCount +=1;
                const id_category = btn.getAttribute("data-id_category");
                console.log(id_category)
                const trInputs = document.querySelectorAll(`#trID_${id_category} input`);
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
                    fillClientData(inputObj, inputValues);
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
const addBtn = document.getElementById("addCategory");
addBtn.addEventListener("click", ()=>{
    addCategory(route, body)
})

window.addEventListener("load", ()=>{
    getCategory();
})