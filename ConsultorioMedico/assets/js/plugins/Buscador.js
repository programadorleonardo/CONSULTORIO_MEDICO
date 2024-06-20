document.addEventListener("keyup",e => {
    if (e.target.matches("#ContentPlaceHolder1_txtBuscadorPacientes")) {
        document.querySelectorAll("tr").forEach(elemento => {
            elemento.textContent.toUpperCase().includes(e.target.value.toUpperCase())
                ? elemento.classList.remove("filtro")
                : elemento.classList.add("filtro")
        });
    }

});