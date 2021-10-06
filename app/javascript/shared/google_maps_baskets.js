import { makeArray } from "jquery";

const initMap = () => {

  if (document.getElementById("map")) {
    map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: 41.15, lng: -8.61024},
      zoom: 8,
      disableDefaultUI: true
    });


    // define create marker function
    const createMarkers = (marker, cards) => {
      console.log('marker');
      marker.setMap(map);
      marker.addListener('click', event => {
        cards.forEach(card => {
          card.style.color = "red"
        });
      })

      // marker.addListener('mouseover', event => {
      //   cards.forEach(card => {
      //     card.style.color = "red"
      //   });
      // })

    }

    const cards = document.querySelectorAll('.basket-card');
    let restaurants = [];

    // for each restaurant, add a marker in the map
    cards.forEach(card => {
      if (!restaurants.includes(card.dataset.restaurant)) {
        restaurants.push(card.dataset.restaurant);

        let latitude = Number(card.dataset.latitude);
        let longitude = Number(card.dataset.longitude);

        let icon = {
          url: `https://cdn-icons-png.flaticon.com/512/684/684908.png?${card.dataset.restaurant}`, // url
          scaledSize: new google.maps.Size(30, 30), // scaled size
          origin: new google.maps.Point(0, 0), // origin
          anchor: new google.maps.Point(15, 30) // anchor
        };

        let marker = new google.maps.Marker({
          position: { lat: latitude, lng: longitude},
          map,
          title: "marker",
          icon: icon
        });

        let cardsToChange = document.querySelectorAll(`[data-restaurant = "${card.dataset.restaurant}"]`)

        createMarkers(marker, cardsToChange);

      }
    });

    // function to change the baskets' marker image on hover
    const changeMarkerOnHover = () => {
      const cards = document.querySelectorAll('.basket-card');

      cards.forEach(card => {
        let mapMarker = document.querySelector(`#map img[src="https://cdn-icons-png.flaticon.com/512/684/684908.png?${Number(card.dataset.restaurant)}`);

        card.addEventListener('mouseover', event => {
          mapMarker.src = `https://cdn-icons-png.flaticon.com/512/447/447031.png?${Number(card.dataset.restaurant)}`;
        })

        card.addEventListener('mouseout', event => {
          mapMarker.src = `https://cdn-icons-png.flaticon.com/512/684/684908.png?${Number(card.dataset.restaurant)}`;
        })
        return true;
      });
    };

    // guarantees that markers are drawn before adding the eventListener to the cards
    const addHoverEvents = () => {
      let mapMarker = document.querySelector('#map img');
      if (mapMarker === null) {
        setTimeout(addHoverEvents, 1000);
      } else {
        changeMarkerOnHover();
      }
    };

    addHoverEvents();

  };
}

export { initMap }
