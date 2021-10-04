
const addToCheckout = () => {

  if (document.querySelector('.baskets-show')) {
    const basketCards = document.querySelectorAll('.basket-card')
    const checkoutContainer = document.querySelector('.checkout-items')
    const checkoutBaskets = document.querySelector('.checkout-baskets')

    const changeValue = (element, value) => {
      let valor = Number(element.parentNode.querySelector('.card-count').innerText);
      if (value > 0 || valor > 0) {
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
      let basketName = card.querySelector('.basket-name').innerText;
      let value = Number(card.querySelector('.card-count').innerText);


      let cardHTML = `<div class='checkout-item ${basketName.replaceAll(' ', '-').toLowerCase()}'><h3>${basketName}</h3> <div class='std-flex-space-between'><p class='quantity'>qtd: 1</p><p class='price' data-unit-price = '789' data-total-price = '0'>R$ 7,89</p></div>`

      // if value is 1, element must be added to the checkout card

      if (value === 1 && action === 'add') {
        checkoutBaskets.insertAdjacentHTML('beforeend', cardHTML);
      }

      let basketCheckoutCard = document.querySelector(`.${basketName.replaceAll(' ', '-').toLowerCase()}`);

      // if it's 0, remove
      if (value === 0) {
        console.log(basketCheckoutCard)
        if (basketCheckoutCard) {
          basketCheckoutCard.remove();
        }
      }

      // if it's already there, update the quantity and the total price
      if (basketCheckoutCard) {
        let quantity = basketCheckoutCard.querySelector('.quantity')
        quantity.innerText = `qtd: ${value}`

        let priceField = basketCheckoutCard.querySelector('.price')
        let unitPrice = Number(priceField.dataset.unitPrice);

        priceField.innerText = `R$ ${unitPrice * value / 100}`
        priceField.dataset.totalPrice = String(unitPrice * value)

      }

      // get all prices

      let prices = document.querySelectorAll('.price')
      let totalPrice = 0;

      prices.forEach(price => {
        totalPrice += Number(price.dataset.totalPrice);
        // console.log(price.dataset.totalPrice)
      });

      // update total with prices

      let totalPriceField = document.querySelector('.total-price')
      totalPriceField.innerText = `Total: R$ ${totalPrice / 100}`
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



    let name = document.querySelector('.restaurant-name')

    name.addEventListener('click', event => {
      name.contentEditable = true;
    })
  }
}

export { addToCheckout }
