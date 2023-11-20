importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.0.0/workbox-sw.js');
workbox.loadModule('workbox-precaching');
workbox.loadModule('workbox-routing');
workbox.loadModule('workbox-strategies');
workbox.loadModule('workbox-expiration');


if (workbox) {
  console.log(`Yay! Workbox is loaded`);
} else {
  console.log(`Boo! Workbox didn't load`);
}
/*
{
  "name": "chatoufirebase2020",
  "gcm_sender_id": "198054459774"
}
*/
const OFFLINE_URL = '{{ offline_url }}';
const appShell = [
    '/static/commune_de_paris/manifest.webmanifest',
    '/',
].map((partialUrl) => `${location.protocol}//${location.host}${partialUrl}`);
// Precache the shell.
// workbox.precaching.precacheAndRoute(appShell.map(url => ({
    // url,
    // revision: '383676',
// })));
var media_files = [];
fetch('/getmediafiles/')
.then(

  function (response) {
      // deleteMarkers();
      // console.log(JSON.stringify(data))
      response.json().then(function(data) {
        
        // media_files = data.media_files;
         for(var i=0; i<data.media_files.length; i++) {
           media_files[i] = {url:data.media_files[i], revision: '383676'};      
         }
      });
    
  }
)
.catch(function(err) {
  console.log('Fetch Error :-S', err);
});
var site_links = [

  {url:'/', revision: '383676'},
 {url:'/le-mur-des-federes/', revision: '383676'},
 {url:'/articles-thematiques/', revision: '383676'},
 {url:'/les-communardars-au-pere-lachaise/', revision: '383676'},
 {url:'/name-index/', revision: '383676'},
 {url:'/a-propos/', revision: '383676'},
 {url:'/mentions-legales/', revision: '383676'},
 {url:'/articles-thematiques/presentation-de-la-commune', revision: '383676'},
 {url:'/articles-thematiques/le-contexte-de-la-commune', revision: '383676'},
 {url:'/articles-thematiques/la-garde-nationale', revision: '383676'},
 {url:'/articles-thematiques/adolphe-thiers', revision: '383676'},
 {url:'/articles-thematiques/le-debut-de-la-commune', revision: '383676'},
 {url:'/articles-thematiques/le-fonctionnement-de-la-commune', revision: '383676'},
 {url:'/articles-thematiques/l-oeuvre-de-la-commune', revision: '383676'},
 {url:'/articles-thematiques/les-femmes-dans-la-commune', revision: '383676'},
 {url:'/articles-thematiques/la-federation-des-artistes', revision: '383676'},
 {url:'/articles-thematiques/les-ecrivains-contre-la-commune-de-paris', revision: '383676'},
 {url:'/articles-thematiques/les-etrangers-sous-la-commune', revision: '383676'},
 {url:'/articles-thematiques/la-presse', revision: '383676'},
 {url:'/articles-thematiques/la-semaine-sanglante', revision: '383676'},
 {url:'/articles-thematiques/la-repression', revision: '383676'},
 {url:'/histoire-de-la-commune/le-temps-des-cerises', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/le-cimetiere-du-pere-lachaise', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/flourens-gustave', revision: '383676'},
 {url:'/les-communardars-au-pere-lachaise/valles-jules', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/monument-a-la-memoire-des-gardes-nationaux', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/cleray-eugene', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/miot-jules', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/le-site-des-derniers-combats-tombeau-de-charles-nodier', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/delecluze-charles', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/pyat-felix', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/capellaro-charles-romain', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/okolowicz-auguste', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/colombarium-et-crematorium', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/grousset-paschal', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/urbain-raoul', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/avrial-augustin', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/eudes-emile', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/blanqui-auguste', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/noir-victor', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/longuet-charles', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/chassin-charles-louis', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/cournet-frederic', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/gill-andre', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/pottier-eugene', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/joffrin-jules', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/rogeard-louis-auguste', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/delaplanche-eugene', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/frankel-leo', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/amouroux-charles', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/ranc-arthur', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/devant-le-mur-des-federes', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/le-mur-des-federes', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/lejeune-adrien', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/allemane-jean', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/lucipia-louis-adrien', revision: '383676'},
 {url:'/les-communards-au-pere-lachaise/moreau-vauthier-augustin-jean', revision: '383676'},
 
];
var html_files = [
  {url:'static/commune_de_paris/static/pwa/adolphe-thiers.json'},
  {url:'static/commune_de_paris/static/pwa/allemane-jean.json'},
  {url:'static/commune_de_paris/static/pwa/amouroux-charles.json'},
  {url:'static/commune_de_paris/static/pwa/avrial-augustin.json'},
  {url:'static/commune_de_paris/static/pwa/blanqui-auguste.json'},
  {url:'static/commune_de_paris/static/pwa/capellaro-charles-romain.json'},
  {url:'static/commune_de_paris/static/pwa/chassin-charles-louis.json'},
  {url:'static/commune_de_paris/static/pwa/cleray-eugene.json'},
  {url:'static/commune_de_paris/static/pwa/colombarium-et-crematorium.json'},
  {url:'static/commune_de_paris/static/pwa/cournet-frederic.json'},
  {url:'static/commune_de_paris/static/pwa/delaplanche-eugene.json'},
  {url:'static/commune_de_paris/static/pwa/delecluze-charles.json'},
  {url:'static/commune_de_paris/static/pwa/devant-le-mur-des-federes.json'},
  {url:'static/commune_de_paris/static/pwa/eudes-emile.json'},
  {url:'static/commune_de_paris/static/pwa/flourens-gustave.json'},
  {url:'static/commune_de_paris/static/pwa/frankel-leo.json'},
  {url:'static/commune_de_paris/static/pwa/gill-andre.json'},
  {url:'static/commune_de_paris/static/pwa/grousset-paschal.json'},
  {url:'static/commune_de_paris/static/pwa/home.json'},
  {url:'static/commune_de_paris/static/pwa/joffrin-jules.json'},
  {url:'static/commune_de_paris/static/pwa/l-oeuvre-de-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/la-federation-des-artistes.json'},
  {url:'static/commune_de_paris/static/pwa/la-garde-nationale.json'},
  {url:'static/commune_de_paris/static/pwa/la-presse.json'},
  {url:'static/commune_de_paris/static/pwa/la-repression.json'},
  {url:'static/commune_de_paris/static/pwa/la-semaine-sanglante.json'},
  {url:'static/commune_de_paris/static/pwa/le-cimetiere-du-pere-lachaise.json'},
  {url:'static/commune_de_paris/static/pwa/le-contexte-de-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/le-debut-de-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/le-fonctionnement-de-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/le-mur-des-federes.json'},
  {url:'static/commune_de_paris/static/pwa/le-site-des-derniers-combats-tombeau-de-charles-nodier.json'},
  {url:'static/commune_de_paris/static/pwa/le-temps-des-cerises.json'},
  {url:'static/commune_de_paris/static/pwa/lejeune-adrien.json'},
  {url:'static/commune_de_paris/static/pwa/les-ecrivains-contre-la-commune-de-paris.json'},
  {url:'static/commune_de_paris/static/pwa/les-etrangers-sous-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/les-femmes-dans-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/longuet-charles.json'},
  {url:'static/commune_de_paris/static/pwa/lucipia-louis-adrien.json'},
  {url:'static/commune_de_paris/static/pwa/miot-jules.json'},
  {url:'static/commune_de_paris/static/pwa/monument-a-la-memoire-des-gardes-nationaux.json'},
  {url:'static/commune_de_paris/static/pwa/moreau-vauthier-augustin-jean.json'},
  {url:'static/commune_de_paris/static/pwa/noir-victor.json'},
  {url:'static/commune_de_paris/static/pwa/okolowicz-auguste.json'},
  {url:'static/commune_de_paris/static/pwa/pottier-eugene.json'},
  {url:'static/commune_de_paris/static/pwa/presentation-de-la-commune.json'},
  {url:'static/commune_de_paris/static/pwa/pyat-felix.json'},
  {url:'static/commune_de_paris/static/pwa/ranc-arthur.json'},
  {url:'static/commune_de_paris/static/pwa/rogeard-louis-auguste.json'},
  {url:'static/commune_de_paris/static/pwa/urbain-raoul.json'},
  {url:'static/commune_de_paris/static/pwa/valles-jules.json'},
 
];
var cache_files = site_links.concat(media_files);
console.log(JSON.stringify(media_files));1
workbox.precaching.precacheAndRoute(cache_files, {   urlManipulation: ({url}) => {   return html_files  } });

workbox.routing.registerRoute(({url}) => appShell.includes(url), new workbox.strategies.CacheOnly());
// workbox.skipWaiting();
// workbox.clientsClaim();
// Serve the other pages from the cache and make a request to update the value in the cache.
// Limit the cache to 5 entries.
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

// push notification
/*
self.addEventListener('notificationclose', function(e) {
  var notification = e.notification;
  var primaryKey = notification.data.primaryKey;

  console.log('Closed notification: ' + primaryKey);
});

self.addEventListener('notificationclick', function(e) {
  var notification = e.notification;
  var primaryKey = notification.data.primaryKey;
  var action = e.action;

  if (action === 'close') {
    notification.close();
  } else {
    clients.openWindow('https://dev.bluelion.icu');
    notification.close();
  }
});
self.addEventListener('push', function(e) {
  var options = {
    body: 'This notification was generated from a push!',
    icon: 'images/example.png',
    vibrate: [100, 50, 100],
    data: {
      dateOfArrival: Date.now(),
      primaryKey: '2'
    },
    actions: [
      {action: 'explore', title: 'Explore this new world',
        icon: 'images/checkmark.png'},
      {action: 'close', title: 'Close',
        icon: 'images/xmark.png'},
    ]
  };
  e.waitUntil(
    self.registration.showNotification('Hello world!', options)
  );
});*/
// const precacheController = new workbox.precaching.PrecacheController();
// precacheController.addToCacheList([{
//   url: '/static/chatou_auto/step0.json',
//   revision: '123',
// }

// ]);
// self.addEventListener('install', (event) => {
//   event.waitUntil(precacheController.install());
// });

// self.addEventListener('activate', (event) => {
//   event.waitUntil(precacheController.activate());
// });
// self.addEventListener('fetch', (event) => {
//   const cacheKey = precacheController.getCacheKeyForURL(event.request.url);
//   event.respondWith(caches.match(cacheKey).then(

//   ));
// });

// workbox.precaching.precacheAndRoute([
// {url: '/static/chatou_auto/step0.html', revision: '1' },
// ],{
//   // Ignore all URL parameters.
//   cleanUrls: false,
// });

// Serve the app shell from the cache.
