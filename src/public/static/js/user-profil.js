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

function insertEmail(){
    fetch("http://localhost:3001/user-profil/profil/2").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    var tempEmail = "";
                    temEmail += "<label className" > data.e_mail < /label>
                    document.getElementByID("tempEmail").innerHTML = temEmail;

                }
                ;


            })

        function insertEmail(){
            fetch("http://localhost:3001/user-profil/profil/2).then( response => {
            response.json().then(
                data => {
                    if(data.length > 0) {
                        var tempEmail = "";
                        temEmail += "<label className">data.e_mail</label>
                        document.getElementByID("tempEmail").innerHTML = temEmail;

                    };





function insertusername(){
    fetch("http://localhost:3001/user-profil/profil/2").then( response => {
        response.json().then(
            data => {
                if (data.length > 0) {
                    var tempEmail = "";
                    tempUsername += "<label className" > data.username < /label>
                    document.getElementByID("tempUsernamel").innerHTML = tempUsername;

                }
                ;


            });

app.post('/profil', (req, res) => {
    e_mail = req.body.e_mail;
    res.redirect('/profil/show/' + e_mail);
});

app.post('/profil', (req, res) => {
    username = req.body.username;
    res.redirect('/profil/show/' + username);
        });


                navSlide();
                var acc = document.getElementsByClassName('accordion');
                var i;
                var len = acc.length;
                for (i = 0; i < len; i++) {
                    acc[i].addEventListener('click', function () {
                        this.classList.toggle('active');
                        var panel = this.nextElementSibling;
                        if (panel.style.maxHeight) {
                            panel.style.maxHeight = null;
                        } else {
                            panel.style.maxHeight = panel.scrollHeight + 'px'
                        }
                    )}

/*
                function backToLogin() {
                    event.preventDefault();

                    window.open("login.html");
                    return;
                }



/*function Inhalt1(){
    var Inhalt = document.getElementById('inhalt');
    Inhalt.innerHTML = '<btn btn-sm btn-primary onclick="Inhalt1()">Inhalt1</>
        <btn btn-sm btn-primary onclick="Inhalt2()">Inhalt2</button> <br /><h1>Irgendeininhalt</h1>';
}*/

