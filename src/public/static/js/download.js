/*function getFileName(){
    
    fetch("http://localhost:3001/show_data").then(response => {
        response.json().then(
            data => {
                if(data.length > 0) {
                    var temp = "";

                    data.forEach((u) => {
                        temp +="<label>" + u.file_name + "</label>";
                    })
                    document.getElementById("filename").innerHTML = temp;
                }
            }
        )
    })
};
*/