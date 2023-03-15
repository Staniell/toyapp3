// document.addEventListener("turbo:load", function () {
//   // Get the file input field
//   const input = document.querySelector('input[type="file"]');

//   // Listen for changes to the file input field
//   input.addEventListener("change", (e) => {
//     // Get the selected files
//     const files = e.target.files;

//     // Loop through the selected files
//     for (let i = 0; i < files.length; i++) {
//       // Create a new FileReader instance
//       const reader = new FileReader();

//       // Listen for the FileReader to load
//       reader.addEventListener("load", () => {
//         // Create a new image element
//         const img = document.createElement("img");

//         // Set the image source to the loaded file data
//         img.src = reader.result;

//         // Create a new container for the image preview and controls
//         const container = document.createElement("div");
//         container.classList.add("flex", "flex-col", "items-center", "justify-center", "p-4");

//         // Append the image and container to the preview container
//         container.appendChild(img);
//         document.getElementById("image-preview").appendChild(container);

//         // Create a new set of controls for the image preview
//         const controls = document.createElement("div");
//         controls.classList.add("flex", "items-center", "justify-center", "mt-2");

//         // Create a new edit button
//         const editButton = document.createElement("button");
//         editButton.innerText = "Edit";
//         editButton.classList.add(
//           "bg-blue-500",
//           "hover:bg-blue-700",
//           "text-white",
//           "font-bold",
//           "py-2",
//           "px-4",
//           "rounded",
//           "mr-2"
//         );
//         editButton.addEventListener("click", (e) => {
//           // Create a new file input field
//           const newInput = document.createElement("input");
//           newInput.type = "file";
//           newInput.multiple = false;

//           // Replace the existing file input field with the new one
//           container.replaceChild(newInput, input);

//           // Add a new listener for changes to the file input field
//           newInput.addEventListener("change", (e) => {
//             // Get the selected file
//             const newFile = e.target.files[0];

//             // Create a new FileReader instance
//             const newReader = new FileReader();

//             // Listen for the FileReader to load
//             newReader.addEventListener("load", () => {
//               // Update the image source to the loaded file data
//               img.src = newReader.result;
//             });

//             // Read the selected file as a data URL
//             newReader.readAsDataURL(newFile);
//           });
//         });

//         // Create a new delete button
//         const deleteButton = document.createElement("button");
//         deleteButton.innerText = "Delete";
//         deleteButton.classList.add(
//           "bg-red-500",
//           "hover:bg-red-700",
//           "text-white",
//           "font-bold",
//           "py-2",
//           "px-4",
//           "rounded"
//         );
//         deleteButton.addEventListener("click", (e) => {
//           // Remove the container from the preview container
//           document.getElementById("image-preview").removeChild(container);
//         });

//         // Append the edit and delete buttons to the controls
//         controls.appendChild(editButton);
//         controls.appendChild(deleteButton);

//         // Append the controls to the container
//         container.appendChild(controls);
//       });

//       // Read the selected file as a data URL
//       reader.readAsDataURL(files[i]);
//     }
//   });
// });

document.addEventListener("turbo:load", function () {
  const input = document.querySelector('input[type="file"]');
  const fileCount = document.querySelector(".file-count");

  input.addEventListener("change", (e) => {
    const files = e.target.files;
    const fileCountText = files.length === 1 ? "1 file selected" : `${files.length} files selected`;
    fileCount.textContent = fileCountText;

    for (let i = 0; i < files.length; i++) {
      const reader = new FileReader();

      reader.addEventListener("load", () => {
        const img = document.createElement("img");
        img.src = reader.result;

        const container = document.createElement("div");
        container.classList.add("image-preview-container");

        container.appendChild(img);
        document.getElementById("image-preview").appendChild(container);

        const controls = document.createElement("div");
        controls.classList.add("image-preview-controls");

        const editButton = document.createElement("button");
        editButton.innerText = "Edit";
        editButton.addEventListener("click", (e) => {
          const newInput = document.createElement("input");
          newInput.type = "file";
          newInput.multiple = false;

          container.replaceChild(newInput, input);

          newInput.addEventListener("change", (e) => {
            const newFile = e.target.files[0];
            const newReader = new FileReader();

            newReader.addEventListener("load", () => {
              img.src = newReader.result;
            });

            newReader.readAsDataURL(newFile);
          });
        });

        const deleteButton = document.createElement("button");
        deleteButton.innerText = "Delete";
        deleteButton.addEventListener("click", (e) => {
          document.getElementById("image-preview").removeChild(container);
          const remainingFiles = document.querySelectorAll(".image-preview-container").length;
          const remainingFilesText = remainingFiles === 1 ? "1 file selected" : `${remainingFiles} files selected`;
          fileCount.textContent = remainingFilesText;
        });

        controls.appendChild(editButton);
        controls.appendChild(deleteButton);

        container.appendChild(controls);

        const fileCountText = files.length === 1 ? "1 file selected" : `${files.length} files selected`;
        fileCount.textContent = fileCountText;
      });

      reader.readAsDataURL(files[i]);
    }
  });
});
