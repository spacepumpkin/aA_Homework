/* jshint esversion: 6 */

function View($el) {
  this.$el = $el;
  this.setupEasel();
}

window._randomColorString = function(){
  return '#' + Math.random().toString(16).substr(-6);
};

View.prototype.exercise0 = function () {
  //Challenge: (example) remove the 'square' class from every li
  //Result: this should cause the grid to turn into a long list of undecorated lis
  //just a list of dots

  //this one completed as an example :) no additional code necessary
  // $('li').removeClass("square");

  // vanilla DOM
  let liTags = document.querySelectorAll("li"); // getElementsByTagName didn't work
  // let liTags = document.getElementsByTagName("li"); // returns live HTMLCollection
  liTags.forEach( function (li) {
    li.classList.remove("square");
    // li.className = "";
  })
};

View.prototype.exercise1 = function () {
  //Challenge: Give every square the class 'orange'
  //Result: Every square should turn orange (we already have a CSS rule)
  console.log("Exercise 1 activated");
  // $(".square").addClass("orange");

  // vanilla DOM
  // let squares = document.getElementsByClassName("square");
  let squares = document.querySelectorAll("li.square");
  console.log(squares[0]);
  // need to convert html collection / node list into Array for forEach
  Array.from(squares).forEach( function (square) {
    square.classList.add("orange");
  })
};

View.prototype.exercise2 = function () {
  //Challenge: Remove every square
  //Result: Every square vanishes

  console.log("Exercise 2 activated");
  // $(".square").hide();
  // $(".square").remove();
  
  // vanilla DOM
  let squares = document.querySelectorAll("li.square"); // returns nodelist
  console.log(squares[0]);
  // need to convert html collection / node list into Array for forEach
  Array.from(squares).forEach(function (square) {
    square.remove();
  })
  
};

View.prototype.exercise3 = function () {
  //Challenge: Add an <h1> with the text 'i love jquery' under the grid.
  //Result: An <h1> with the text 'i love jquery' appears under the grid.
  console.log("Exercise 3 activated");
  // let $h1 = $("<h1></h1>");
  // $h1.text("i love jquery"); // lowercase?
  // $("#easel").append($h1);

  // vanilla DOM
  let easel = document.getElementById("easel");
  let newH1 = document.createElement("h1");
  newH1.textContent = "i love jQuery";
  easel.appendChild(newH1);
};

View.prototype.exercise4 = function () {
  //Challenge: Write your first name in every other square.
  //Result: Your name appears in every other square.
  console.log("Exercise 4 activated");
  // $(".square:nth-child(2n)").text("gary");

  // vanilla DOM
  let evenSquares = document.querySelectorAll(".square:nth-child(even)");
  console.log(evenSquares);
  Array.from(evenSquares).forEach( function (square) {
    square.textContent = "gary";
  })
};

View.prototype.exercise5 = function () {
  //Challenge: Alert the row and column of the square, when the square is clicked.
  //Result: When a square is clicked, the row and column appear in an alert. for
  //example: clicking the top left square should alert '0, 0'.

  //hint: checkout the addRow function at the bottom of the file: we set the
  //  'data-pos' of every square

  console.log("Exercise 5 activated");

  // $("#easel").on("click", ".square", function (event) {
  //   // 2 ways:
  //   // $pos = $(event.target).attr("data-pos");
  //   $pos = $(event.target).data("pos");
  //   alert($pos);
  // })

  // vanilla DOM
  let easel = document.getElementById("easel");

  easel.addEventListener("click", function (event) {
    if (event.target.className === "square") {
      let pos = event.target.getAttribute("data-pos");
      console.log(pos);
      alert(pos);
    }
  })

  // this also works (but attaches listener on every square)
  // let squares = document.querySelectorAll("li.square");
  // Array.from(squares).forEach( function (square) {
  //   square.addEventListener("click", function (event) {
  //     // event.preventDefault;
  //     console.log("hello");
  //     console.log(event.currentTarget.getAttribute("data-pos"));
  //   })
  // })
};

View.prototype.exercise6 = function () {
  //Challenge: Give every square a random color!
  //Result: Every square becomes a color as soon as this code runs. The grid
  //should become a beautiful rainbow of colors.

  //hint: use window._randomColorString() (defined at top) to get a random color!

  console.log("Exercise 6 activated");
  // let $squareElements = $(".square");
  // $squareElements.each( (_, square) => {
  //   $(square).css("background-color", window._randomColorString());
  // })

  // vanilla DOM
  let squares = document.getElementsByClassName("square");
  Array.from(squares).forEach( function (square) {
    // square.style.cssText = `background-color: ${window._randomColorString()}`;
    square.style.backgroundColor = window._randomColorString();
  })
};

View.prototype.exercise7 = function(){
  //Challenge: When your mouse goes over a square, console log its color.
  //Result: When the mouse goes over a square its color should appear in the
  //console. The color won't be the color's name, but its rbg value.
  //You should push the button for exercise 6 first to try it on the
  //rainbow.

  console.log("Exercise 7 activated");
  // $("#easel").on("mouseover", ".square", (event) => {
  //   console.log( $(event.target).css("background-color") );
  // })

  // vanilla DOM
  let easel = document.getElementById("easel");
  easel.addEventListener("mouseover", function (event) {
    console.log( event.target.style.backgroundColor );
  })

};



View.prototype.setupEasel = function() {
  const $addRowButton = $('<button>').html('Add a row');
  this.$el.append($addRowButton);
  $addRowButton.on("click", this.addRow.bind(this));

  for(let j = 0; j <= 7; j++){
    const $button = $("<button>").html("Exercise " + j);
    $button.on("click", this["exercise" + j]);
    this.$el.append($button);
  }

  for(let i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function() {
  const rowIdx = this.$el.find(".row").length;
  const $row = $("<ul>").addClass("row").addClass("group");
  for(let colIdx = 0; colIdx < 20; colIdx++) {
    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
    $square.on("mouseenter", (e) => {
      const $square = $(e.currentTarget);
      $square.css("background-color", window._randomColorString());
    });
    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
