

function getFileName(){
    
    fetch("http://localhost:3001/download/:id_file/d").then(response => {
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
}

function getFileName2(){
    
      temp = "5";
      console.log(temp);
    document.getElementById("filename").innerHTML = temp;
    
}
