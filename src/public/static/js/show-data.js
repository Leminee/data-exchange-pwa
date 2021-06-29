document.getElementById("hiding").style.display = "none";

function insertProfilData(){
    fetch("http://localhost:3001/show-data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let temp = "";
                    let fileNameSelect ="";
                    let fileComment =""; 
                    let moveFile = ""; 
                    let moveIn="";
                    data.forEach((u) => {
                        temp += "<tr>";
                        temp += "<td>"+u.file_name+"</td>";
                        temp += "<td>"+u.format+"</td>";
                        temp += "<td>"+u.comment+"</td>";
                        temp += "</tr>";
                        fileNameSelect += "<option>"+ u.file_name + "</option>";
                        fileComment += "<option>" + u.file_name + "</option>";  
                        moveFile += "<option>" + u.file_name + "</option>";  
                        moveIn += "<option>" + u.folder + "</option>";  

                    })
                    document.getElementById("data").innerHTML = temp;
                    document.getElementById("file_nameDownloadSelect").innerHTML = fileNameSelect;
                    document.getElementById("file_comment").innerHTML = fileComment; 
                    document.getElementById("movefile").innerHTML = moveFile; 
                    document.getElementById("movein").innerHTML = moveIn;
                };
            }
        )
    })
};

function fileNameClicked() {
    fetch("http://localhost:3001/show-data/file/:file_name").then(response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let fileNameForDownload = "";
                    let fileFormatForDownload = "";
                    let fileUserForDownload = "";
                    fileNameForDownload = data[0].file_name;
                    fileUserForDownload = data[0].id_user;
                    fileFormatForDownload = data[0].format;
                    document.getElementById("file_nameDownload").innerHTML = fileNameForDownload;
                    document.getElementById("downloadLink").innerHTML = "http://localhost:3001/download/"+fileNameForDownload;
                    document.getElementById("hiding").value = "http://localhost:3001/download/"+fileNameForDownload;
                }
            } 
        )
    })   
};

function copyToClipboard(element) {
    alert("Sie haben den Link kopiert.")
    var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
};