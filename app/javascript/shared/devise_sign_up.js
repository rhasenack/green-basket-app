const controlSignUpCheckBoxes = () => {

  const establishmentCb = document.querySelector('.establishment-checkbox')
  const consumerCb = document.querySelector('.consumer-checkbox')

  // if click on establishmentCb, make sure that consumerCb is 0
  establishmentCb.addEventListener('click', event => {
    if (establishmentCb.checked) {
      consumerCb.checked = false;
    } else {
      consumerCb.checked = true;
    }
  });

  consumerCb.addEventListener('click', event => {
    if (consumerCb.checked) {
      establishmentCb.checked = false;
    } else {
      establishmentCb.checked = true;
    }
  });
}

export { controlSignUpCheckBoxes }
