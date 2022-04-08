// ==UserScript==
// @name          UTM param stripper
// @author        Paul Irish
// @namespace     http://github.com/paulirish
// @version       1.2
// @description   Drop the UTM params from a URL when the page loads.
// @extra         Cuz you know they're all ugly n shit.
// @include       http*://*
// ==/UserScript==


// Update: 
// In chrome, it's better to just install the UTM stripper chrome extension:
//   https://chrome.google.com/webstore/detail/google-analytics-paramete/jbgedkkfkohoehhkknnmlodlobbhafge

// It is great and open source:  github.com/mihaip/utm-stripper

// You can also install this greasemonkey script if you really want.
// download this script. go to about:extensions. Turn on developer mode and drag and drop
//    this file onto the window. it'll install it.  hopefully.


// lastly, if your site / marketing funnel uses these tracking tokens. you can clean up your users URLs
// look at the comments below on correct installation to integrate with __gaq.push

if (/utm_/.test(location.search) && window.history.replaceState){  
  
  // thx @cowboy for the revised hash param magic.
  var oldUrl = location.href;
  var newUrl = oldUrl.replace(/\?([^#]*)/, function(_, search) {
    search = search.split('&').map(function(v) {
      return !/^utm_/.test(v) && v;
    }).filter(Boolean).join('&'); // omg filter(Boolean) so dope.
    return search ? '?' + search : '';
  });

  if ( newUrl != oldUrl ) {
    window.history.replaceState({},'', newUrl); 
  }
  
}
