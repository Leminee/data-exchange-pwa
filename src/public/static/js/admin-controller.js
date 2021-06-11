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
    }
/*
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

    }
*/
