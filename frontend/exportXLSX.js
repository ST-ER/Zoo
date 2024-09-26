import * as XLSX from "../../backend/node_modules/xlsx/xlsx.mjs";

export function exportXLSX(headers, naming){
    let workbook = XLSX.utils.book_new();
    let sheet = XLSX.utils.json_to_sheet([], {header: headers});
    let dataObjects = [];

    // Добавить объекты данных из инпутов в массив
    document.querySelectorAll("tr").forEach(row => {
        let inputData = [];
        row.querySelectorAll("#InputTable").forEach(input => {
            inputData.push(input.value);
        });

        let dataObject = {};
        headers.forEach((header, index) => {
            dataObject[header] = inputData[index];
        });

        dataObjects.push(dataObject);
    });

    // Добавить заголовки в начало массива данных
    dataObjects.unshift(headers.reduce((obj, header) => {
        obj[header] = header;
        return obj;
    }, {}));

    // Добавить все данные (включая заголовки) на лист Excel
    XLSX.utils.sheet_add_json(sheet, dataObjects, {skipHeader: true, origin: "A1"});
    // Добавить лист в книгу и скачать файл
    XLSX.utils.book_append_sheet(workbook, sheet, naming);
    XLSX.writeFile(workbook, `${naming}.xlsb`);
}