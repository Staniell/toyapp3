document.addEventListener("turbo:load", function () {
  const input = document.querySelector('input[type="file"]');
  input.addEventListener("change", (e) => {
    const files = e.target.files;

    document.getElementById("image-preview").innerHTML = "";

    for (let i = 0; i < files.length; i++) {
      const reader = new FileReader();

      reader.addEventListener("load", () => {
        const img = document.createElement("img");
        img.classList.add("object-cover");
        img.src = reader.result;
        document.getElementById("image-preview").appendChild(img);
      });

      reader.readAsDataURL(files[i]);
    }
  });
});
