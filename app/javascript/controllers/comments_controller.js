import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() { // on load 
  }

  connect() { // on refresh
    console.log("hello world!");
  }

  disconnect() { // on unload
  }

  editForm(event) { // avoids refreshing everytime edit button is clicked
    event.preventDefault();   
    event.stopPropagation();
    console.log("edit");

    const formID        = event.params["form"];   // pass edit form id 
    const formBodyID    = event.params["body"];   // pass edit form body id 
    const editButtonID  = event.params["edit"];   // pass edit button id

    const form = document.getElementById(formID); // grab the edit form
    form.classList.toggle("d-none");              // unhide it
    form.classList.toggle("mt-5");                // move it up a little bit to avoid buttons collapsing

    const formBody = document.getElementById(formBodyID); // grab the edit form body
    formBody.classList.toggle("d-none");                  // unhide it

    const editButton = document.getElementById(editButtonID); // grab the edit button
    this.toggleEditButton(editButton);                        // toggle bw 'cancel' and 'edit'
  }
  
  toggleEditButton(editButton) {
    if (editButton.innerText === "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle("btn-secondary");
    editButton.classList.toggle("btn-warning");
  }
}
