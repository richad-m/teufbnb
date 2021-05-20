// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // initUpdateNavbarOnScroll();
  // gerer affichage navbar bookings
  const myStuff = document.querySelector(".my-stuff");
  const bookings = document.querySelector(".bookings");

  const myStuffBtn = document.querySelector("#mystuff");
  const bookingsBtn = document.querySelector("#bookings");

  myStuffBtn.addEventListener("click", (event) => {
    event.preventDefault();
    myStuff.classList.remove('d-none')
    bookings.classList.add('d-none')
  });

  bookingsBtn.addEventListener("click", (event) => {
    event.preventDefault();
    bookings.classList.remove('d-none')
    myStuff.classList.add('d-none')
  });

});

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
// Magic navbar in dashboard index page
$(function() {
  var $el,
    leftPos,
    newWidth,
    $mainNav = $(".booking .navbar-nav");

  $mainNav.append("<li id='magic-line'></li>");
  var $magicLine = $("#magic-line");

  $magicLine
    .width($(".active").width())
    .css("left", $(".booking .active a").position().left)
    .data("origLeft", $magicLine.position().left)
    .data("origWidth", $magicLine.width());

  $(".booking .navbar-nav li a").hover(
    function() {
      $el = $(this);
      leftPos = $el.position().left;
      newWidth = $el.parent().width();
      $magicLine.stop().animate({
        left: leftPos,
        width: newWidth
      });
    },
    function() {
      $magicLine.stop().animate({
        left: $magicLine.data("origLeft"),
        width: $magicLine.data("origWidth")
      });
    }
  );
});

// Credit: https://css-tricks.com/jquery-magicline-navigation



