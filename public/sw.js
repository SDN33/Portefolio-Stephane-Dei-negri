const CACHE_NAME = 'v1';
const urlsToCache = [
  '/',  // Page d'accueil - assurez-vous que cette route rend une page HTML
  '/assets/application.css'  // Chemin correct vers le CSS généré
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      console.log('Opened cache');
      return cache.addAll(urlsToCache).catch(error => {
        console.error("Cache add failed: ", error);
      });
    })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Serve from cache if available
        if (response) {
          return response;
        }
        // Fetch from network and cache if it's a GET request for HTML
        return fetch(event.request).then(fetchResponse => {
          if (!fetchResponse || !fetchResponse.ok) {
            throw new Error('Network response was not ok');
          }
          const cloneResponse = fetchResponse.clone();
          if (event.request.method === 'GET' && cloneResponse.type === 'basic' && cloneResponse.headers.get('content-type').includes('text/html')) {
            caches.open(CACHE_NAME).then(cache => {
              cache.put(event.request, cloneResponse);
            });
          }
          return fetchResponse;
        });
      }).catch(error => {
        console.log('Fetch failed; returning offline page instead.', error);
        // Provide a fallback offline page
        return caches.match('/offline.html');
      })
  );
});
