importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.0.0/workbox-sw.js');
workbox.loadModule('workbox-precaching');
workbox.loadModule('workbox-routing');
workbox.loadModule('workbox-strategies');
workbox.loadModule('workbox-expiration');
workbox.loadModule('workbox-core');

workbox.setConfig({
  modulePathPrefix: 'workbox/'
});

workbox.core.setLogLevel(workbox.core.LOG_LEVELS.debug);

const baseHref = '/';
const cacheNameBase =
  baseHref
  .replace(/\//g,'-') // replace slashes with dashes
  .replace(/^-/,'') // remove first slash (cosmetic)
  .replace(/-$/,'') // remove last slash (cosmetic)
;

workbox.core.setCacheNameDetails({
  prefix: `${cacheNameBase}`,
  suffix: 'v1',
  precache: 'precache',
  runtime: 'runtime'
});

workbox.googleAnalytics.initialize({
  hitFilter: (params) => {
    const queueTimeInSeconds = Math.round(params.get('qt') / 1000);
    params.set('qtime', queueTimeInSeconds);
  }
});

workbox.routing.registerNavigationRoute('index.html')

// any files in /media/
const mediaRE = 'media/.*$';

const mediaCacheName = `${cacheNameBase}-media`;

workbox.routing.registerRoute(
  new RegExp(mediaRE),
  workbox.strategies.cacheFirst({
    cacheName: mediaCacheName,
    plugins: [
      new workbox.rangeRequests.Plugin(),
      new workbox.cacheableResponse.Plugin({
        statuses: [0, 200, 304]
      })
    ]
  })
);

// any element files
const elementRE = 'ant-.*\.js$';

const elementsCacheName = `${cacheNameBase}-elements`;

workbox.routing.registerRoute(
  new RegExp(elementRE),
  workbox.strategies.cacheFirst({
    cacheName: elementsCacheName,
    plugins: [
      new workbox.rangeRequests.Plugin(),
      new workbox.cacheableResponse.Plugin({
        statuses: [0, 200, 304]
      })
    ]
  })
);

workbox.skipWaiting()
workbox.clientsClaim()

const extraRoutes = JSON.parse('[{\u0022url\u0022: \u0022images/antennaSplash.jpg\u0022, \u0022revision\u0022: \u00227f5666a1f65a6dc06225006fc40b2fb4\u0022}, {\u0022url\u0022: \u0022index.html\u0022, \u0022revision\u0022: \u002206b17b8a0d5450cfc0819c54f3a696e0\u0022}]');
workbox.precaching.precacheAndRoute(extraRoutes);
workbox.precaching.precacheAndRoute([
  {
    "url": "app.min.js",
    "revision": "0920d3c4c3b18f6f2f5bde2ad6379968"
  },
  {
    "url": "node_modules/express-useragent/lib/express-useragent.min.js",
    "revision": "f8ef49cae0f2212c2bd4809882d4f47b"
  },
  {
    "url": "node_modules/hammerjs/hammer.js",
    "revision": "3a382096c1b15b965d331e0ced40584e"
  },
  {
    "url": "node_modules/screenfull/dist/screenfull.js",
    "revision": "e005576a96dbc1163999613a5886f816"
  },
  {
    "url": "analytics.js",
    "revision": "ef046efbeb63419d677fef82e9aaf392"
  },
  {
    "url": "manifest.json",
    "revision": "d3b412c305ff5e2963cdf7e3cdb4ade9"
  },
  {
    "url": "images/antenna_logo.png",
    "revision": "8c99e7196a8bffe5d7c1286e4005c466"
  },
  {
    "url": "images/antennaSplash.jpg",
    "revision": "7f5666a1f65a6dc06225006fc40b2fb4"
  },
  {
    "url": "images/background.jpg",
    "revision": "e4e7f2aec20c0e100e2574749b7bc9f2"
  },
  {
    "url": "images/clientSplash.jpg",
    "revision": "3af23ec921d344f564c632243a5d6f96"
  },
  {
    "url": "images/manifest/icon-1024x1024.png",
    "revision": "06e9f1651bc4324cfd74331119eb5b20"
  },
  {
    "url": "images/manifest/icon-144x144.png",
    "revision": "4838ff44f5fe0b6db9381a5d80660e0d"
  },
  {
    "url": "images/manifest/icon-192x192.png",
    "revision": "9ac583778a2e8e345c4ed429a7c5df77"
  },
  {
    "url": "images/manifest/icon-48x48.png",
    "revision": "34eb0305688da8e90d9d7ea198e333d9"
  },
  {
    "url": "images/manifest/icon-512x512.png",
    "revision": "94325f4172c80ee2479eb5a2f6ae8a2d"
  },
  {
    "url": "images/manifest/icon-72x72.png",
    "revision": "94ddea181189b3e9233f1d6397748244"
  },
  {
    "url": "images/manifest/icon-96x96.png",
    "revision": "00cf7dcad29de82aa47ea2cc31197635"
  },
  {
    "url": "images/stopImagePlaceholder.jpg",
    "revision": "0c634330be3ec1f4ea5067c101c0ce59"
  }
]);

self.addEventListener('message', (event) => {
  switch (event.data.type) {
  case 'clear_media_cache':
    {
      const cacheName = mediaCacheName;
      console.log(`SW:Clearing cache: ${cacheName}`);
      caches.delete(cacheName);
    }
    break;
  case 'clear_elements_cache':
    {
      const cacheName = elementsCacheName;
      console.log(`SW:Clearing cache: ${cacheName}`);
      caches.delete(cacheName);
    }
    break;
  }
});
