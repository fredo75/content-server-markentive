
function algolia () {

  envAppId = process.env.ALGOLIA_ID;
  envApiKey = process.env.ALGOLIA_AP_KEY;

  var placesAutocomplete = places({
    appId: envAppId,
    apiKey: envApiKey,
 container: document.querySelector('#lead_address'),
 // style: false,
    templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    }
  }).configure({
    type: 'address'
  });
  placesAutocomplete.on('change', function resultSelected(e) {
    // document.querySelector('#lead_address_2').value = e.suggestion.administrative || '';
    document.querySelector('#lead_city').value = e.suggestion.city || '';
    document.querySelector('#lead_zip').value = e.suggestion.postcode || '';
  });
};

algolia()

