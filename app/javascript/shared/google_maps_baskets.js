const initMap = () => {

    map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: -5.397, lng: 150.644 },
      zoom: 8,
      disableDefaultUI: true
    });


  const icon = {
    url: 'https://cdn-icons-png.flaticon.com/512/684/684908.png', // url
    scaledSize: new google.maps.Size(30, 30), // scaled size
    origin: new google.maps.Point(0, 0), // origin
    anchor: new google.maps.Point(15, 30) // anchor
  };


  let marker = new google.maps.Marker({
    position: { lat: -5.397, lng: 150.644 },
    map,
    title: "marker",
    icon: icon
  });

  const changeMarkerOnHover = () => {
    console.log('function')
    const cards = document.querySelectorAll('.basket-card');
    const mapMarker = document.querySelector('#map img');
    console.log(mapMarker)
    cards.forEach(card => {
      card.addEventListener('mouseover', event => {
        mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/447/447031.png';
      })

      card.addEventListener('mouseout', event => {
        mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/684/684908.png';
      })
    });
  }

  const createMarkers =  () => {
    marker.setMap(map);
    setTimeout(changeMarkerOnHover,1000);
  }

  createMarkers();
}

// const cards = document.querySelectorAll('.basket-card');
// const mapMarker = document.querySelector('#map img');

// cards.forEach(card => {
//   card.addEventListener('mouseenter', event => {
//     mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/447/447031.png'
//   })

//   card.addEventListener('mouseout', event => {
//     mapMarker.src = 'https://cdn-icons-png.flaticon.com/512/684/684908.png'
//   })
// });



export { initMap }
// export { changeMarkerOnHover }
