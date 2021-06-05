const navSlide = () => {
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
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
