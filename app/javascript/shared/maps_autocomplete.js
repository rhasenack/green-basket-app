const autocompleteStart = () => {

  const initialize = () => {
    var input = document.getElementById('restaurant_address');
    new google.maps.places.Autocomplete(input);
  }

  google.maps.event.addDomListener(window, 'load', initialize);


}

export {autocompleteStart}
