
const addToCheckout = () => {

  if (document.querySelector('.baskets-show')) {
    const basketCards = document.querySelectorAll('.basket-card')
    const checkoutContainer = document.querySelector('.checkout-items')
    const checkoutBaskets = document.querySelector('.checkout-baskets')
    const pageRestaurant = document.querySelector('.restaurant-info').dataset.restaurant;
    const checkoutItems = document.querySelectorAll('.checkout-item');
    let cartAlertFlag = false;
    const modal = document.getElementById("myModal");
    const closeModal = document.querySelectorAll(".modal-close");
    const clearCartBtn = document.querySelector(".clear-cart")


    // Add basic modal behaviour
    closeModal.forEach (close => {
      close.onclick = function () {
        modal.style.display = "none";
      }
    });

    closeModal.onclick = function () {
      modal.style.display = "none";
    }

    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }

    clearCartBtn.addEventListener('click', event => {
      modal.style.display = "none";
    })

    // Check if there is a basket from a different restaurant in the checkout cart
    const checkForDifferentRestaurant = () => {
      if (checkoutItems.length > 0) {
        checkoutItems.forEach(item => {
          if (item.dataset.restaurant != pageRestaurant) {
            cartAlertFlag = true;
          }
        })
      }
    }

    checkForDifferentRestaurant();

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

    const addToCheckout = (card, action, clear = false) => {
      // get basket name from element
      let basketName = card.querySelector('.basket-name').innerText;
      let value = Number(card.querySelector('.card-count').innerText);

      let cardHTML = `<div class='checkout-item ${basketName.replaceAll(' ', '-').toLowerCase()}'><h3>${basketName}</h3> <div class='std-flex-space-between'><p class='quantity'>qtd: 1</p><p class='price' data-unit-price = '789' data-total-price = '0'>R$ 7,89</p></div>`

      // if clear is true, clean the checkout before adding the item
      if (clear === true) {
        checkoutBaskets.innerHTML = ""
        cartAlertFlag = false;
      }

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
      });

      // update total with prices
      let totalPriceField = document.querySelector('.total-price')
      totalPriceField.innerText = `Total: R$ ${totalPrice / 100}`
    }

    //clear checkout items when clicking on ClearCartBtn
    const clearAndAddToCheckout = (card, addbutton) => {
      clearCartBtn.addEventListener('click', event => {
        changeValue(addbutton, 1);
        addToCheckout(card, 'add', true);
      });
    };

    basketCards.forEach(card => {
      let addButton = card.querySelector('.add');
      let subtractButton = card.querySelector('.subtract');
      let countField = card.querySelector('.card-count').innerText;

      if (countField === '0') {
        subtractButton.style.backgroundColor = 'gray';
      }

      addButton.addEventListener('click', (event) => {
        // Check if there's something in the checkout from another restaurant.
        // If so, display popup to clear cart and wait for click;
        if (cartAlertFlag) {
          modal.style.display = "block";
          clearAndAddToCheckout(card, addButton)
        } else {
          changeValue(event.currentTarget, 1);
          addToCheckout(card, 'add');
        }
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
