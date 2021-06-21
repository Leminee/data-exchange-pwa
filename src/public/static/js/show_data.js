function insertProfilData(){
    fetch("http://localhost:3001/show_data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let temp = "";
                    let fileNameRight ="";
                    let fileNameSelect ="";
                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.id_file+"</td>";
                        temp += "<td>"+u.file_name+"</td>";
                        temp += "<td>"+u.id_format+"</td>";
                        temp += "</tr>";
                        fileNameSelect += "<option>"+ u.file_name + "</option>";
                    })
                    document.getElementById("data").innerHTML = temp;
                    document.getElementById("file_name").style.display = "none";
                    document.getElementById("file_nameDownloadSelect").innerHTML = fileNameSelect;
                };
            }
        )
    })
};

function fileNameClicked() {
    fetch("http://localhost:3001/show_data/file/:file_name").then(response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let fileNameForDownload = "";
                    fileNameForDownload = data[0].file_name;
                    console.log(fileNameForDownload);
                    document.getElementById("file_nameDownload").innerHTML = fileNameForDownload;
                }
            } 
        )
    })   
};
/*
function waitBeforeFetch() {
    setTimeout(fileNameClicked(),500)
}
*/