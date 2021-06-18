function insertProfilData(){
    fetch("http://localhost:3001/show_data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let file_id = "";
                    let file_name = "";
                    let file_format = "";
                    data.forEach((u) => {
                        file_id += "" + u.file_id + "";
                        file_name += "" + u.username + "";
                        file_format += "" + u.id_file + "";

                        /* hier wusste ich nicht ganz was gemacht werden muss
                        if (u.profil_pic_path == null) {
                            console.log("Using default Profil Picture")
                            tempProfilePicture += defaultProfilPicture
                        } else {
                            console.log("Using profil picture the user chose")
                            tempProfilePicture += "<img src=" + u.profil_pic_path + "height='100' width='100' algin='right' hspace='30' vspace='30'></img>";
                        }*/
                    })
                    document.getElementById("file_id").innerHTML = file_id;
                    document.getElementById("file_name").innerHTML = file_name;
                    document.getElementById("file_format").innerHTML = file_format;


                };
            }
        )
    })
};