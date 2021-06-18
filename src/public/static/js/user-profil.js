/*
const navSlide = () => {
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.text-center');
    const navLinks = document.querySelectorAll('nav-links li');


    burger.addEventListener('click',()=>{
        //Toggle nav
        nav.classList.toggle('nav-active');

        //Animate Links
        navLinks.forEach((link, index)=>{
            console.log(index / 5);
            if(link.style.animation) {
                link.style.animation = ''
            } else {
                link.style.animation = `navLinkFade 0.5s ease forwads ${index / 5 + 1.5}s`;
            }
        });

        //Burger Animation
        burger.classList.toggle('toggle');

    });

}
*/

let defaultProfilPicture = "<img src='/images/icons/blank-profile-picture.png' height='100' width='100' algin='right' hspace='30' vspace='30'></img>";

function insertProfilData(){
    fetch("http://localhost:3001/user-profil").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    let tempEmail = "";
                    let tempUsername = "";
                    let tempProfilePicture = ""; 
                    let tempAmountFiles = ""; 
                    let tempAmountFolders = "";
                    data.forEach((u) => {
                        tempEmail += "<p>" + u.e_mail + "</p>";
                        tempUsername += "<p>" + u.username + "</p>"; 
                        tempAmountFiles += "<p>" + u.id_file + "</p>";  
                        tempAmountFolders += "<p>" + u.id_folder + "</p>"; 

                        if (u.profil_pic_path == null) {
                            console.log("Using default Profil Picture")
                            tempProfilePicture += defaultProfilPicture
                        } else {
                            console.log("Using profil picture the user chose")
                            tempProfilePicture += "<img src=" + u.profil_pic_path + "height='100' width='100' algin='right' hspace='30' vspace='30'></img>";
                        }
                    })
                    document.getElementById("tempEmail").innerHTML = tempEmail;
                    document.getElementById("tempUsername").innerHTML = tempUsername;
                    document.getElementById("profilPicture").innerHTML = tempProfilePicture;  
                    document.getElementById("numberFile").innerHTML = tempAmountFiles;  
                    document.getElementById("numberFolder").innerHTML = tempAmountFolders; 

                };
            }
        )
    })
};