const initMap = () => {

    map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: -5.397, lng: 150.644 },
      zoom: 8,
    });

}

export { initMap }
