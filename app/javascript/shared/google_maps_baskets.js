const initMap = () => {

  if (document.getElementById("map")) {
      map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 41.15, lng: -8.61024},
        zoom: 8,
        disableDefaultUI: true
      });


    const icon = {
      url: 'https://cdn-icons-png.flaticon.com/512/684/684908.png', // url
      scaledSize: new google.maps.Size(30, 30), // scaled size
      origin: new google.maps.Point(0, 0), // origin
      anchor: new google.maps.Point(15, 30) // anchor
    };

    const createMarkers =  (marker, card) => {
      console.log('marker')
      marker.setMap(map);
    }

    const cards = document.querySelectorAll('.basket-card');
    let restaurants = [];

    cards.forEach(card => {
      if (!restaurants.includes(card.dataset.restaurant)) {
        restaurants.push(card.dataset.restaurant);

        let latitude = Number(card.dataset.latitude);
        let longitude = Number(card.dataset.longitude);

        let marker = new google.maps.Marker({
          position: { lat: latitude, lng: longitude},
          map,
          title: "marker",
          icon: icon
        });

        createMarkers(marker,card);

        const changeMarkerOnHover = () => {
          const cards = document.querySelectorAll('.basket-card');
          const mapMarker = document.querySelector('#map img');
          cards.forEach(card => {
            card.addEventListener('mouseover', event => {
              mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/447/447031.png';
            })

            card.addEventListener('mouseout', event => {
              mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/684/684908.png';
            })
          });
        }

        // changeMarkerOnHover();


      }
    });
  }
}

export { initMap }
