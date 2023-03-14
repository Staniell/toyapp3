document.addEventListener("turbo:load", function () {
  // Get the file input field
  const input = document.querySelector('input[type="file"]');

  // Listen for changes to the file input field
  input.addEventListener("change", (e) => {
    // Get the selected files
    const files = e.target.files;

    // Loop through the selected files
    for (let i = 0; i < files.length; i++) {
      // Create a new FileReader instance
      const reader = new FileReader();

      // Listen for the FileReader to load
      reader.addEventListener("load", () => {
        // Create a new image element
        const img = document.createElement("img");

        // Set the image source to the loaded file data
        img.src = reader.result;

        // Append the image to the preview container
        document.getElementById("image-preview").appendChild(img);
      });

      // Read the selected file as a data URL
      reader.readAsDataURL(files[i]);
    }
  });
});
