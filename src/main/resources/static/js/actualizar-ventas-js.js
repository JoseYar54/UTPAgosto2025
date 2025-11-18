document.addEventListener('DOMContentLoaded', () => {
    const modalProductos = document.getElementById('modalProductos');
    const tablaProductos = document.querySelector('#tablaModalProductos tbody');
    const tablaPrincipal = document.querySelector('#tablaDetalles');

    // Cargar productos desde el backend
    function cargarProductos() {
        fetch('/api/productos/todos-productos')
            .then(res => res.json())
            .then(data => {
                tablaProductos.innerHTML = '';
                data.forEach(producto => {
                    const fila = document.createElement('tr');
                    fila.innerHTML = `
                        <td><img src="${producto.url_pro || 'https://via.placeholder.com/60'}" style="width:60px;height:60px;object-fit:cover;"></td>
                        <td class="fw-semibold">${producto.nombre_pro || 'Sin nombre'}</td>
                        <td>
                            <div style="display:flex; justify-content:flex-end; gap:0;">
                                <span style="font-weight:500;">S/</span>
                                <span style="text-align:right; width:50px; padding:0; margin:0;">${(producto.precio_pro ?? 0)}</span>
                            </div>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-primary btn-sm agregarProductoBtn"><i class="bi bi-plus-lg"></i></button>
                        </td>
                    `;
                    fila.querySelector('.agregarProductoBtn').addEventListener('click', () => {
                        agregarProducto(producto);
                        bootstrap.Modal.getInstance(modalProductos).hide();
                    });
                    tablaProductos.appendChild(fila);
                });
            });
    }

    function agregarProducto(producto) {
        const fila = document.createElement('tr');

        const cantidad = producto.cantidad_det ?? 1;
        const precio = producto.precio_pro ?? 0;
        const subtotal = (cantidad * precio).toFixed(2);

        fila.innerHTML = `
            <!-- Imagen -->
            <td>
                <img src="${producto.url_pro || ''}"
                     alt="${producto.nombre_pro || ''}"
                     class="img-thumbnail"
                     style="width: 60px; height: 60px; object-fit: cover;">
            </td>

            <!-- Nombre -->
            <td class="fw-semibold">
                ${producto.nombre_pro || ''}
            </td>

            <!-- Cantidad -->
            <td>
                <input type="number"
                       name="cantidades[]"
                       class="form-control text-center"
                       value="${cantidad}"
                       style="max-width:55px;"
                       min="1">
            </td>

            <!-- Precio unidad -->
            <td>
                <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0;">
                    <span style="font-weight: 500;">S/</span>
                    <input type="text"
                           name="precios[]"
                           value="${precio.toFixed(2)}"
                           readonly
                           style="background: transparent; border: none; text-align: right; width: 35px; padding: 0; margin: 0;">
                </div>
            </td>

            <!-- SubTotal -->
            <td>
                <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0;">
                    <span style="font-weight: 500;">S/</span>
                    <input type="text"
                           name="subtotales[]"
                           value="${subtotal}"
                           readonly
                           style="background: transparent; border: none; text-align: right; width: 50px; padding: 0; margin: 0;">
                </div>
            </td>

            <!-- ID oculto -->
            <td style="display: none;">
                <input type="hidden" class="id_producto" name="id_producto[]" value="${producto.id_producto}">
            </td>

            <!-- Acciones -->
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm eliminarFila"
                    onclick="if(confirm('¿Estás seguro de eliminar este producto?')) eliminarFila(this)">
                    <i class="bi bi-trash"></i>
                </button>
            </td>
        `;

        tablaPrincipal.appendChild(fila);
        actualizarSubtotal(fila);
    }

    function actualizarSubtotal(fila) {
        const cantidad = parseFloat(fila.querySelector('input[name="cantidades[]"]').value) || 0;
        const precio = parseFloat(fila.querySelector('input[name="precios[]"]').value) || 0;
        fila.querySelector('input[name="subtotales[]"]').value = (cantidad * precio).toFixed(2);
    }

    tablaPrincipal.addEventListener('input', e => {
        if (e.target.name === 'cantidades[]') {
            actualizarSubtotal(e.target.closest('tr'));
        }
    });

    tablaPrincipal.addEventListener('click', e => {
        if (e.target.closest('.eliminarFila')) {
            e.target.closest('tr').remove();
        }
    });

    modalProductos.addEventListener('show.bs.modal', cargarProductos);
});
