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
navSlide();
var acc = document.getElementsByClassName('accordion');
var i;
var len = acc.length;
for(i = 0; i < len; i++) {
    acc[i].addEventListener('click', function() {
        this.classList.toggle('active');
        var panel = this.nextElementSibling;
        if(panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + 'px'
        }
    })
}

function backToLogin(){
    event.preventDefault();

    window.open("login.html");
    return ;
}