function insertProfilData(){
    fetch("http://localhost:3001/show_data").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let temp = "";
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
                    let fileFormatForDownload = "";
                    let fileUserForDownload = "";
                    fileNameForDownload = data[0].file_name;
                    fileUserForDownload = data[0].id_user;
                    fileFormatForDownload = data[0].id_format;
                    document.getElementById("file_nameDownload").innerHTML = fileNameForDownload;
                    document.getElementById("downloadLink").innerHTML = "http://localhost:3001/download/"+fileUserForDownload+"/"+fileFormatForDownload+"/"+fileNameForDownload;
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