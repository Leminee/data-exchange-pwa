

function getFileName(){
    fetch("http://localhost:3001/download/:id_file").then(response => {
        response.json().then(
            data => {
                if(data.length > 0) {
                    var temp = data.file_name

                    document.getElementById("filename").innerHTML = temp;
                }
            }
        )
        

    }
    )
}

function getFileName2(){

      temp = "Hermann";
    document.getElementById("filename").innerHTML = temp;
    
}
