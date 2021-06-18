function insertProfilData(){
    fetch("http://localhost:3001/show_data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let temp = "";
                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.id_file+"</td>";
                        temp += "<td>"+u.file_name+"</td>";
                        temp += "<td>"+u.id_format+"</td>";
                        temp += "</tr>";
                    })
                    document.getElementById("data").innerHTML = temp;
                };
            }
        )
    })
};