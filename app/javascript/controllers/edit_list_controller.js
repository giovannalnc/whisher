import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['title', 'form', 'info'];

  displayForm() {
    this.titleTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }

  update(event) {
    event.preventDefault();
    const url = this.formTarget.action
    const csrftoken = document.querySelector('meta[name="csrf-token"]').content
    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrftoken },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.infoTarget.outerHTML = data;
      })
  }
}
