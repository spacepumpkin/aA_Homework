console.log("Hello from the JavaScript console!");

// Your AJAX request here
// Get req, from url; if success, show data; else, show error

$.ajax( {
  type: 'GET', 
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,' + 
  'US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("Here's your weather"),
    console.log(data)
  },
  error() {
    console.log("Thee's an error")
  }
} )

// Add another console log here, outside your AJAX request
console.log("Goodbye AJAX!");
