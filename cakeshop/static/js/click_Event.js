function showModal(cakeId) {
    var modal = document.getElementById("modal" + cakeId);
    modal.classList.add("d-block");
}

function hideModal(cakeId) {
    var modal = document.getElementById("modal" + cakeId);
    modal.classList.remove("d-block");
}
