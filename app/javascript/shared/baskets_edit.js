const enableEditButtons = () => {

  if (document.querySelector('.edit-page')) {
    let basketCards = document.querySelectorAll('.basket-card');


    const disableBasket = (card) => {

    }


    basketCards.forEach(card => {
      let editIcon = card.querySelector('.edit-icon');
      let disableIcon = card.querySelector('.disable-icon');
      let enableIcon = card.querySelector('.enable-icon')
      let cardImage = card.querySelector('.basket-image');

      disableIcon.addEventListener('click', event => {
        cardImage.style.filter = "grayscale(100%)";
        enableIcon.classList.toggle('d-none');
        disableIcon.classList.toggle('d-none');
      })

      enableIcon.addEventListener('click', event => {
        cardImage.style.filter = null;
        enableIcon.classList.toggle('d-none');
        disableIcon.classList.toggle('d-none');
      })
    });
  }
}



export {enableEditButtons}
