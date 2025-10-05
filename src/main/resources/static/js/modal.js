document.addEventListener("DOMContentLoaded", () => {
  const wineModal = new bootstrap.Modal(document.getElementById("wineModal"));
  const botones = document.querySelectorAll(".modalito");

  botones.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      const card = e.target.closest(".card");
      if (!card) return;

      const imagen = card.querySelector("img").getAttribute("src");
      const nombre = card.querySelector(".card-title")?.innerText || "";
      const descripcion = card.querySelector(".card-text")?.innerText || "";
      const precio = card.querySelector(".card-price")?.innerText || "";
      const anio = card.querySelector(".card-year")?.innerText || "";
      const stock = card.querySelector(".card-stock")?.innerText || "";
      const categoria = card.querySelector(".card-category")?.innerText || "";

      document.getElementById("modal-image").setAttribute("src", imagen);
      document.getElementById("modal-name").innerText = nombre;
      document.getElementById("modal-description").innerText = descripcion;
      document.getElementById("modal-price").innerText = precio;
      document.getElementById("modal-year").innerText = anio;
      document.getElementById("modal-stock").innerText = stock;
      document.getElementById("modal-category").innerText = categoria;
      wineModal.show();
    });
  });
});
