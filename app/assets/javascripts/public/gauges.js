var _gauges = _gauges || [];
$(document).on("ready", function() {
  var t   = document.createElement('script');
  t.type  = 'text/javascript';
  t.async = true;
  t.id    = 'gauges-tracker';
  t.setAttribute('data-site-id', '55eb2a54de2e2621530048a0');
  t.setAttribute('data-track-path', 'https://track.gaug.es/track.gif');
  t.src = 'https://track.gaug.es/track.js';
  var s = document.getElementsByTagName('script')[0];
  s.parentNode.insertBefore(t, s);
});

$(document).on("page:load", function () {
  _gauges.push(['track']);
});
