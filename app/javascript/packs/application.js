require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const displayForm = document.getElementById('display-form');
displayForm.addEventListener('click', (e) => {
  e.preventDefault();
  document.querySelector('#form-group').classList.toggle('show');
});