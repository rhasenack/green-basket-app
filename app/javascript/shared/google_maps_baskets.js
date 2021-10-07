import { makeArray } from "jquery";

const initMap = () => {

  if (document.getElementById("map")) {
    map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: 41.15, lng: -8.61024},
      zoom: 8,
      disableDefaultUI: true
    });


    let iconMain = {
      url: `https://cdn-icons-png.flaticon.com/512/684/684908.png`, // url
      scaledSize: new google.maps.Size(30, 30), // scaled size
      origin: new google.maps.Point(0, 0), // origin
      anchor: new google.maps.Point(15, 30) // anchor
    };

    let iconHover = {
      url: `https://cdn-icons-png.flaticon.com/512/447/447031.png`, // url
      scaledSize: new google.maps.Size(30, 30), // scaled size
      origin: new google.maps.Point(0, 0), // origin
      anchor: new google.maps.Point(15, 30) // anchor
    };


    const cardsColumnDiv = document.querySelector('.left-column')
    // define create marker function
    const createMarkers = (marker, cards) => {
      console.log('marker');
      marker.setMap(map);
      let firstCard = cards[0];
      marker.addListener('click', event => {
        cards.forEach(card => {
          // card.style.color = "red";
          firstCard.scrollIntoView({ behavior: "smooth" });
          card.classList.add('highlited-card');
          setTimeout(function() {
            card.classList.add('normal-card');
            card.classList.remove('highlited-card');
            },3000)
        });
      });

      if(cards.length > 0) {
        cards.forEach(card => {
          card.addEventListener('mouseover', event => {
            marker.setIcon(iconHover);
          })
          card.addEventListener('mouseout', event => {
            marker.setIcon(iconMain);
          })
        })
      }
    }

    const cards = document.querySelectorAll('.basket-card');
    let restaurants = [];

    // for each restaurant, add a marker in the map
    cards.forEach(card => {
      if (!restaurants.includes(card.dataset.restaurant)) {
        restaurants.push(card.dataset.restaurant);

        let latitude = Number(card.dataset.latitude);
        let longitude = Number(card.dataset.longitude);

        let marker = new google.maps.Marker({
          position: { lat: latitude, lng: longitude},
          map,
          title: card.dataset.restaurantName,
          icon: iconMain
        });

        let cardsToChange = document.querySelectorAll(`[data-restaurant = "${card.dataset.restaurant}"]`)

        createMarkers(marker, cardsToChange);

      }
    });

  };
}

export { initMap }
