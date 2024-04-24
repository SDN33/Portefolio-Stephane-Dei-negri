const CACHE_NAME = 'v1';
const urlsToCache = [
  '/',  // Home page - ensure this route serves an HTML page
  '/assets/application.css'  // Correct path to the generated CSS
];

// Installation of service worker and caching the assets
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

// Fetch event handling
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Serve from cache if available
        if (response) {
          return response;
        }
        // Attempt to fetch from network
        return fetch(event.request).then(fetchResponse => {
          // Check if we received a valid response
          if (!fetchResponse || !fetchResponse.ok) {
            throw new Error('Network response was not ok');
          }
          // Cache the fetched data
          const cloneResponse = fetchResponse.clone();
          if (event.request.method === 'GET' && cloneResponse.type === 'basic' && cloneResponse.headers.get('content-type').includes('text/html')) {
            caches.open(CACHE_NAME).then(cache => {
              cache.put(event.request, cloneResponse);
            });
          }
          return fetchResponse;
        }).catch(error => {
          // On network error, fallback to cache
          console.log('Fetch failed; returning offline page instead.', error);
          return caches.match('/offline.html');
        });
      })
  );
});
