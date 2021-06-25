function getUserFromDB() {
    fetch("http://localhost:3002/user").then( response => {
        response.json().then(
            data => {
                if(data.length > 0) {
                    var temp = "";

                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.id_user+"</td>";
                        temp += "<td>"+u.e_mail+"</td>";
                        temp += "<td>"+u.upload_limit+"</td></tr>";
                    })
                    document.getElementById("users").innerHTML = temp;
                }
            }
        )
    })
};

function showSingleUser(){
    fetch("http://localhost:3002/user/:id_user").then( response => {
        response.json().then(
             data => {
                 if(data.length > 0) {
                     var temp = "";

                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.id_user+"</td>";
                        temp += "<td>"+u.e_mail+"</td>";
                        temp += "<td>"+u.upload_limit+"</td></tr>";
                    })
                    document.getElementById("users").innerHTML = temp;
                }
            }
        )
    })
};

function showUserFiles() {
    fetch("http://localhost:3002/user/:id_user/files").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    var tempFile = "";

                    data.forEach((f) => {
                        tempFile += "<tr>";
                        tempFile += "<td>"+f.id_file+"</td>";
                        tempFile += "<td>"+f.id_folder+"</td>";
                        tempFile += "<td>"+f.id_format+"</td>";
                        tempFile += "<td>"+f.file_name+"</td>";
                        tempFile += "<td>"+f.file_size+"</td>";
                        tempFile += "<td>"+f.uploaded_on+"</td></tr>";
                    })
                    document.getElementById("files").innerHTML = tempFile;
                }
            }
        )
    })
}


function backToAllUsers() {
    window.open("/");
}


function fillInData() {
    showSingleUser();
    showUserFiles();
}