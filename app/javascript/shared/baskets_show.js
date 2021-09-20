
const addToCheckout = () => {

  if (document.querySelector('.baskets-show')) {
    const basketCards = document.querySelectorAll('.basket-card')
    const checkoutContainer = document.querySelector('.checkout-card')

    const changeValue = (element, value) => {
      let valor = Number(element.parentNode.querySelector('.card-count').innerText);
      if (value  > 0 || valor > 0) {
        element.parentNode.querySelector('.card-count').innerText = valor + value;
        valor = valor + value;
      }

      let subtractButton = element.parentNode.querySelector('.subtract');

      if (valor > 0) {
        subtractButton.style.backgroundColor = null;
      }
      else {
        subtractButton.style.backgroundColor = 'gray';
      }
    }

    const addToCheckout = (card, action) => {
      // get basket name from element
      let basketName = card.querySelector('.basket-name').innerText.replace(/\s+/g, '');;
      console.log(basketName);
      let value = Number(card.querySelector('.card-count').innerText);

      // if value is 1, element must be added to the checkout card

      let cardHTML = `<div class='checkout-item ${basketName}'><h3>${basketName}</h3> <div class='std-flex-space-between'><p class='quantity'>qtd: 1</p><p class='price' data-unit-price = '789'>R$ 7,89</p></div>`


      if (value === 1 && action === 'add') {
          checkoutContainer.insertAdjacentHTML('beforeend', cardHTML);
      }

      let basketCheckoutCard = document.querySelector(`.${basketName}`);

      if (value === 0) {
          if (basketCheckoutCard) {
            basketCheckoutCard.remove();
          }
        }

      if (basketCheckoutCard) {
        let quantity = basketCheckoutCard.querySelector('.quantity')
        quantity.innerText = `qtd: ${value}`

        let priceField = basketCheckoutCard.querySelector('.price')
        let unitPrice = Number(priceField.dataset.unitPrice);

        priceField.innerText = `R$ ${unitPrice * value / 100}`

      }

    }

    basketCards.forEach(card => {
      let addButton = card.querySelector('.add');
      let subtractButton = card.querySelector('.subtract');
      let countField = card.querySelector('.card-count').innerText;

      if (countField === '0') {
        subtractButton.style.backgroundColor = 'gray';
      }

      addButton.addEventListener('click', (event) => {
        changeValue(event.currentTarget, 1);
        addToCheckout(card, 'add');
      })

      subtractButton.addEventListener('click', (event) => {
        changeValue(event.currentTarget, -1);
        addToCheckout(card, 'subtract');
      })



    });

  }

}

export {addToCheckout}
