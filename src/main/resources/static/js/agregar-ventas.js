document.addEventListener('DOMContentLoaded', () => {
    const clienteIdInput = document.getElementById('id_usuario');
    const clienteNombreInput = document.getElementById('nombre_user');

    clienteIdInput.addEventListener('input', async () => {
        const id = parseInt(clienteIdInput.value, 10);

        if (!id) {
            clienteNombreInput.value = '';
            return;
        }

        try {
            const response = await fetch('/api/usuarios/listar-usuarios');
            const usuarios = await response.json();

            const usuario = usuarios.find(u => u.id_usuario === id);

            if (usuario) {
                clienteNombreInput.value = `${usuario.nombre_user} ${usuario.apaterno_user} ${usuario.amaterno_user}`;
            } else {
                clienteNombreInput.value = 'Usuario no encontrado';
            }
        } catch (error) {
            console.error('Error al obtener usuario:', error);
            clienteNombreInput.value = '';
        }
    });
});
