document.addEventListener("DOMContentLoaded", () => {
  const wineModal = new bootstrap.Modal(document.getElementById("wineModal"));
  const botones = document.querySelectorAll(".modalito");

  botones.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      const imagen = btn.dataset.imagen || "";
      const nombre = btn.dataset.nombre || "";
      const descripcion = btn.dataset.descripcion || "";
      const precio = btn.dataset.precio || "";
      const anio = btn.dataset.anio || "";
      const stock = btn.dataset.stock || "";
      const categoria = btn.dataset.categoria || "";
      const id_producto = btn.dataset.id || "";

      document.getElementById("modal-image").setAttribute("src", imagen);
      document.getElementById("modal-name").innerText = nombre;
      document.getElementById("modal-description").innerText = descripcion;
      document.getElementById("modal-price").innerText = precio;
      document.getElementById("modal-year").innerText = anio;
      document.getElementById("modal-stock").innerText = stock;
      document.getElementById("modal-category").innerText = categoria;
      document.getElementById("modal-id-producto").value = id_producto;

      wineModal.show();
    });
  });
});
