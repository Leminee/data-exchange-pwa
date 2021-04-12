const cacheName = 'pwa';   
const dCacheName = 'd_pwa';
const urls = [ 
        '/',
        'index.html', 
        '/src/js/register-login.js', 
        '/src/css/style.css', 
        '/src/js/app.js'

]

self.addEventListener('install', event => { 
    event.waitUntil( 
        caches.open(cacheName) 
        .then(cache => { 
            console.log('c urls')
            cache.addAll(urls);
        })
    );
}); 
 
self.addEventListener('fetch', event => { 
    event.respondWith( 
        caches.match(event.request) 
        .then(cacheResponse => { 
            return cacheResponse || fetch (event.request)
            .then(fetchResponse => { 
                return caches.open(dCacheName) 
                .then (cache => { 
                    cache.put(event.request.url,fetchResponse.clone()); 
                    return fetchResponse;
                })
            }).catch(() => { 
                if (event.request.url.indexOf('.html')> -1)  
                //TODO
                return caches.match('note.txt'); 

            })
        })
    );
});   





 