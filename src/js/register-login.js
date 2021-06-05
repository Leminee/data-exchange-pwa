var emailArray=[];
var passwordArray=[];

var loginBox = document.getElementById("login");
var regBox = document.getElementById("register");
var forgetBox = document.getElementById("forgot");

var loginTab = document.getElementById("lt");
var regTab = document.getElementById("rt");

function regTabFun(){
    event.preventDefault();

    regBox.style.visibility="visible";
    loginBox.style.visibility="hidden";
    forgetBox.style.visibility="hidden";

    regTab.style.backgroundColor="rgb(12, 132, 189)";
    loginTab.style.backgroundColor="rgba(11, 177, 224, 0.82)";
}
function loginTabFun(){
    event.preventDefault();

    regBox.style.visibility="hidden";
    loginBox.style.visibility="visible";
    forgetBox.style.visibility="hidden";

    loginTab.style.backgroundColor="rgb(12, 132, 189)";
    regTab.style.backgroundColor="rgba(11, 177, 224, 0.82)";
}
function forTabFun(){
    event.preventDefault();

    regBox.style.visibility="hidden";
    loginBox.style.visibility="hidden";
    forgetBox.style.visibility="visible";

    regTab.style.backgroundColor="rgba(11, 177, 224, 0.82)";
    loginTab.style.backgroundColor="rgba(11, 177, 224, 0.82)";

}


function register(){
    event.preventDefault();

    var email = document.getElementById("email-reg").value;
    var username = document.getElementById("username-reg").value;
    var password= document.getElementById("password-reg").value;

    if (email == ""){
        alert("E-Mail-Adresse erforderlich.");
        return ;
    }
    else if (username == ""){
        alert("Username erforderlich.");
        return ;
    } 

    else if (username.length < 3){  
        alert("Username zu kurz"); 
        return ;

    }
    else if (password == ""){
        alert("Passwort erforderlich.");
        return ;
    } 
 
    else if (password.length < 8){
        alert("Passwort zu kurz");
        return ;
    } 

    else if(emailArray.indexOf(email) == -1){
        emailArray.push(email);
        passwordArray.push(password);

        alert(username + "  Du hast Dich registriert. \nLogge Dich ein!");

        document.getElementById("re").value ="";
        document.getElementById("rp").value="";
        document.getElementById("rrp").value="";
    }
    else{
        alert(email + " ist schon registriert.");
        return ;
    }
}
function login(){
    event.preventDefault();

    var email = document.getElementById("se").value;
    var password = document.getElementById("sp").value;

    var i = emailArray.indexOf(email);

    if(emailArray.indexOf(email) == -1){
        if (email == ""){
            alert("E-Mail-Adresse erforderlich.");
            return ;
        }
        alert("E-Mail-Adresse existiert nicht.");
        return ;
    }
    else if(passwordArray[i] != password){
        if (password == ""){
            alert("Passwort erforderlich.");
            return ;
        }
        alert("Passwörter stimmen nicht überein.");
        return ;
    }
    else {
        alert(email + " Du bist eingeloggt \n willkommen.");

        document.getElementById("se").value ="";
        document.getElementById("sp").value="";
        return ;
    }

}
function forgot(){
    event.preventDefault();

    var email = document.getElementById("fe").value;

    if(emailArray.indexOf(email) == -1){
        if (email == ""){
            alert("E-Mail-Adresse erforderlich.");
            return ;
        }
        alert("E-Mail-Adresse existiert nicht.");
        return ;
    }

    alert("Es wurde eine E-Mail an Dich verschickt!. \n Danke");
    document.getElementById("fe").value ="";
}

function faq(){
    event.preventDefault();

    window.open("faq.html");
    return ;
}

