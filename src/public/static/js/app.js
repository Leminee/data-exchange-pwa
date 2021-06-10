if ('serviceWorker' in navigator) { 
    navigator.serviceWorker.register('/service-worker.js') 
    .then((regis) => console.log('service worker registriert', regis)) 
    .catch((error) => console.log('service worker nicht registriert', error));
}