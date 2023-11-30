window.onload = function() {
    $('.btn-delete').click(function() {
        let id = $(this).data('id');
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) {
            window.location.href = '/QLBLaptop/sanphams?action=delete&id=' + id;
        }
    });
}