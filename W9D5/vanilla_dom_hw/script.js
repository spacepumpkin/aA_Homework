document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const favoriteInput = document.querySelector(".favorite-input");
  const favoritePlaces = document.getElementById("sf-places");

  const addPlace = function () {
    let newLi = document.createElement("li");
    newLi.textContent = favoriteInput.value;
    favoritePlaces.appendChild(newLi);
    favoriteInput.value = "";
  };

  // console.log(favoriteInput);
  // console.log(favoritePlaces);
  const favoriteSubmit = document.querySelector(".favorite-submit");
  // const firstForm = document.getElementsByTagName("form")[0];
  favoriteSubmit.addEventListener("click", function (e) { // only works on click
    e.preventDefault();
    addPlace();
  });


  // adding new photos

  // toggle photo-show-button
  const photoShowButton = document.querySelector(".photo-show-button");
  photoShowButton.addEventListener("click", function (e) {
    e.preventDefault();
    let photoForm = document.querySelector(".photo-form-container");
    photoForm.classList.toggle("hidden");
  });

  // on submit, form append new list item with img tag to ul.dog-photos
  // img tag should have src that matches inputted url
  const photoInput = document.querySelector(".photo-url-input");
  const dogPhotos = document.querySelector(".dog-photos");
  
  const addPhoto = function () {
    let photoUrl = photoInput.value;
    console.log(photoInput.value);
    let newPhoto = document.createElement("li");
    newPhoto.innerHTML = `<img src="${photoUrl}" />`;
    dogPhotos.appendChild(newPhoto);
    console.log(newPhoto);
  };

  const photoSubmit = document.querySelector(".photo-url-submit");
  console.log(photoInput);
  console.log(photoSubmit.value);
  photoSubmit.addEventListener("click", function (e) {
    e.preventDefault();
    console.log(photoInput.value);
    addPhoto();
  })



});
