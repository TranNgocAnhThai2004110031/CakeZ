
function handelMinus(id) {
    var form = document.getElementById('cart-item_form ' + id)
    var input = document.getElementById('amount ' + id);
    var value = parseInt(input.value);
    value--;
    input.value = value < 1 ? 1 : value
    form.submit()
}

function handelPlus(id) {
    var form = document.getElementById('cart-item_form ' + id)
    var input = document.getElementById('amount ' + id);
    var value = parseInt(input.value);
    value++;
    input.value = value
    form.submit()

}

