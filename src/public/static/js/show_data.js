function insertProfilData(){
    fetch("http://localhost:3001/show_data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let temp = "";
                    let fileNameRight ="";
                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.id_file+"</td>";
                        temp += "<td onclick='fileNameClicked();'>"+u.file_name+"</td>";
                        temp += "<td>"+u.id_format+"</td>";
                        temp += "</tr>";
                        fileNameRight = u.file_name;
                        let fileNameArray = [fileNameRight];
                        console.log(fileNameArray)
                    })
                    document.getElementById("data").innerHTML = temp;
                    document.getElementById("filename").innerHTML = fileNameRight;
                    document.getElementById("filename").style.display = "none";
                    
                };
            }
        )
    })
};

function fileNameClicked() {
    document.getElementById("filename").style.display = "none";
    document.getElementById("filename").style.display = "block";
    
};