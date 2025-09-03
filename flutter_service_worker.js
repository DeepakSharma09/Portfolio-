'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "fe120e28a7fd8ca8ed1027698ee7e9c5",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "7db81d83e13a1ad8ef45df7925e53350",
"/": "7db81d83e13a1ad8ef45df7925e53350",
"main.dart.js": "dd5677e3707f2d0d7c4f25a90ce3fd22",
"resume/DEEPAK%20RESUME%20EXP..pdf": "9a8f64f36d764c7e81d7c632229fd342",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "94ad83da81cefc3c46577555f1601b77",
"favicon-dg.png": "7720545c5eced191442456ea8e641dc2",
"assets/AssetManifest.json": "4ecdceb697cd1c5d72de05a3e843cef2",
"assets/NOTICES": "5f8b9f52a525eabccfabee04150725f6",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "485443c03cf874bf5232e125fd8eae45",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "349717601a2b34e50c923e2966378542",
"assets/fonts/MaterialIcons-Regular.otf": "711db2518ee01d5f952e4553f516c2c8",
"assets/assets/SampleImages/Orders.jpeg": "acd4734049052913391e293126f49eea",
"assets/assets/SampleImages/Projects%2520for%2520labours.jpeg": "7a15dd7a8d785bd1547cf60d2567def8",
"assets/assets/SampleImages/Inventory%2520page.jpeg": "93e3f334d6efc19937ca119214e57e63",
"assets/assets/SampleImages/Labour%2520DashBoard.jpeg": "41f8622caec0b8b8d531593b05d258b4",
"assets/assets/SampleImages/Staff%2520KPI.jpeg": "a70c09314a52945ba5497d326b2b47f9",
"assets/assets/SampleImages/Custmor%2520dashbaord.jpeg": "8420eb7ce3fba50ae78c8d988de983a4",
"assets/assets/SampleImages/Join%2520us.jpeg": "8ea8ba3613399490d284755d704f01c4",
"assets/assets/SampleImages/Billing%2520Page.jpeg": "bc9fe1931dab15d88053bf22ff074d91",
"assets/assets/Image/jobizoLogo.png": "f64b4bb72c23a9355a75801d5805cffd",
"assets/assets/Image/Uthix_logo.png": "e92046c70e08b814a28679fb1091e8b5",
"assets/assets/Image/dhaba_logo.png": "4f7e3534b55bb01122b3f8fe1a707f15",
"assets/assets/Image/photo.jpeg": "436e8ea8c23fba1b52cbd00bdb625ff5",
"assets/assets/uthix/Instructor%2520dashboard.jpeg": "943e514234516ab6f0626fde125ba97f",
"assets/assets/uthix/Student%2520e-commerce%2520part.jpeg": "f81cfdb2e37bb515dc31f6d0db8394ee",
"assets/assets/uthix/Student%2520classes.jpeg": "20142fb86dd78699d3e41f93b5a18977",
"assets/assets/uthix/Seller%2520dashboard.jpeg": "6e9272d04496560d4735a2fe31838e60",
"assets/assets/uthix/Student%2520Chatting%2520Part.jpeg": "837df9e4260025f76853df6935c24926",
"assets/assets/uthix/Instructor%2520Classroom.jpeg": "2c9f7d0274e1b899f438c820e1454503",
"assets/assets/uthix/1.png": "513e601da99e8d72587b911eef00ec0e",
"assets/assets/uthix/Student%2520Dashboard.jpeg": "d074453412da4f45f2afb3b2f3398b38",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
