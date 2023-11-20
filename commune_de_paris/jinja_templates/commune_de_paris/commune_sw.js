importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.0.0/workbox-sw.js');
workbox.loadModule('workbox-precaching');
workbox.loadModule('workbox-routing');
workbox.loadModule('workbox-strategies');
workbox.loadModule('workbox-expiration');
workbox.loadModule('workbox-core');



if (workbox) {
  console.log(`Yay! Workbox is loaded`);
} else {
  console.log(`Boo! Workbox didn't load`);
}


const OFFLINE_URL = '{{ offline_url }}';
const appShell = [
    '/static/commune_de_paris/manifest.json',
    '/',
].map((partialUrl) => `${location.protocol}//${location.host}${partialUrl}`);







function serviceWorkerCore () { 


// workbox.precaching.precacheAndRoute(cache_files, {   urlManipulation: ({url}) => {   return html_files  } });

workbox.routing.registerRoute(({url}) => appShell.includes(url), new workbox.strategies.NetworkFirst());


workbox.routing.registerRoute(
({url}) => !appShell.includes(url),
new workbox.strategies.StaleWhileRevalidate({
  cacheName: 'dynamic-cache',
  plugins: [new workbox.expiration.ExpirationPlugin({
      maxEntries: 5,
  })],
})
);

// Handle offline.
// From https://developers.google.com/web/tools/workbox/guides/advanced-recipes#provide_a_fallback_response_to_a_route
workbox.routing.setCatchHandler(({ event }) => {
console.log(event)
switch (event.request.method) {
  case 'GET':
      return caches.match(OFFLINE_URL);
  default:
      return Response.error();
}
});

}

// self.addEventListener('install', event => {
//   // self.skipWaiting();
//   fetchfiles();
//   media_files = [{"url":"media/media/chatou_auto/Res_1200_Chatou_Parc_051c_Lentrée_du_Parc.jpg","revision":"383676"},{"url":"media/media/chatou_auto/Sequana_Chatou.jpg","revision":"383676"}];

//   const urls = media_files;
//   const cacheName = workbox.cacheNames.runtime;
 

//   event.waitUntil(caches.open(cacheName).then((cache) => cache.addAll(urls)));
// });

serviceWorkerCore();
