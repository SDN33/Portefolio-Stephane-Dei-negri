const CACHE_NAME = 'v1';
const urlsToCache = [
  '/',
  '/assets/application.css', // Assurez-vous que ce chemin est correct
  'app/views/layouts/application.html.erb', // Ce chemin semble être côté serveur. Vous ne pouvez pas le cacher ainsi.
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll(urlsToCache).catch(error => {
        console.error("Cache add failed: ", error);
      });
    })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request).then(response => {
      return response || fetch(event.request);
    })
  );
});
