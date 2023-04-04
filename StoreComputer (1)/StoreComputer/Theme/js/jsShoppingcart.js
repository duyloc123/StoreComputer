ShowCount();
function add() {
    let id = document.getElementById("maSP").value;
    let soLuong = document.getElementById("soLuong").value;
    $.ajax({
        url: '/ShoppingCart/AddToCart',
        type: 'POST',
        data: { id: id, soLuong: soLuong },
        success: function (rs) {
            if (rs.Success) {
                $('#check-items').html(rs.Count);
                alert(rs.msg);
            }
        }
    });
}
function ShowCount() {
    $.ajax({
        url: '/ShoppingCart/ShowCount',
        type: 'GET',
        success: function (rs) {
            $('#check-items').html(rs.Count);
        }
    });
}

function del() {
    let id = document.getElementById("maSP").value;
    var con = confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng? ");
    if (con == true) {
        $.ajax({
            url: '/ShoppingCart/Delete',
            type: 'POST',
            data: { id: id },
            success: function (rs) {
                if (rs.success) {
                    $('#check-items').html(rs.Count);
                    $('trow_'+id).remove;
                }

            }
        });
    }
}
function delAll() {
    var con = confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng? ");
    if (con == true) {
        $.ajax({
            url: '/ShoppingCart/DeleteAll',
            type: 'POST',
            success: function (rs) {
                if (rs.success) {
                    loadCart();
                }

            }
        });
    }
}
function loadCart() {
    $.ajax({
        url: '/ShoppingCart/Index',
        type: 'GET',
        success: function (rs) {
            if (rs.success) {
                $('#load_data').html(rs);
            }

        }
    });
}
function update() {
    let id = document.getElementById("maSP").value;
    let soLuong = document.getElementById("soLuong").value;
    $.ajax({
        url: '/ShoppingCart/Update',
        type: 'POST',
        data: { id: id, soLuong: soLuong },
        success: function (rs) {
            if (rs.Success) {
                loadCart();
            }
        }
    });
}