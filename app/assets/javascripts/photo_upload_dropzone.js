// "myAwesomeDropzone" is the camelized version of the HTML element's ID
Dropzone.options.photosDropzone = {
  paramName: "file", // The name that will be used to transfer the file
  maxFilesize: 5, // MB
  accept: function(file, done) {
    if (file.name == "justinbieber.jpg") {
      done("Naha, you don't.");
    }
    else { done(); }
  }
};