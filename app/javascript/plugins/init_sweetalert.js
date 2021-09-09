import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => { }) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

const initSweetalertProduct = (selector, options = {}, callback = () => { }) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) {
    swalButtons.forEach((button) => {
      button.addEventListener('click', () => {
        swal(options).then((value) => {
          if (value) {
            const id = button.dataset.productId;
            const link = document.querySelector('.delete-link-'+id);
            link.click();
          }
        });
      });
    })
  }
};

export { initSweetalert, initSweetalertProduct };
