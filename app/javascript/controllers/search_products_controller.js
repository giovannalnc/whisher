import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'product'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.productTargets);
  }

  update(event) {
    const userInput = this.inputTarget.value.toLowerCase();
    this.productTargets.forEach((target) => {
      const productName = target.dataset.productName.toLowerCase();
      if (productName.search(userInput) === -1) {
        target.classList.add("d-none");
      } else {
        target.classList.remove("d-none");
      };
    });

  };
};
