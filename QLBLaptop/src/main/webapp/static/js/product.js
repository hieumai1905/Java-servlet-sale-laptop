function checkValidation() {
    let productName = $('#product_name');
    let brandName = $('#brand_name');

    if (!productName.val()) {
        alert('Tên sản phẩm không được để trống');
        productName.focus();
        return false;
    }

    if (!brandName.val()) {
        alert('Thương hiệu không được để trống');
        brandName.focus();
        return false;
    }

    let productColor = $('#product_color');
    if (!productColor.val()) {
        alert('Màu không được để trống');
        productColor.focus();
        return false;
    }

    let productSeries = $('#product_series');
    if (!productSeries.val()) {
        alert('Series không được để trống');
        productSeries.focus();
        return false;
    }

    let demand = $('#demand');
    if (!demand.val()) {
        alert('Nhu cầu không được để trống');
        demand.focus();
        return false;
    }

    let seriesCPU = $('#series_cpu');
    if (!seriesCPU.val()) {
        alert('Series CPU không được để trống');
        seriesCPU.focus();
        return false;
    }

    let productCPU = $('#product_cpu');
    if (!productCPU.val()) {
        alert('CPU không được để trống');
        productCPU.focus();
        return false;
    }

    let productDoHoa = $('#product_do_hoa');
    if (!productDoHoa.val()) {
        alert('Đồ hoạ không được để trống');
        productDoHoa.focus();
        return false;
    }

    let productDoHoaRoi = $('#product_do_hoa_roi');
    if (!productDoHoaRoi.val()) {
        alert('Đồ hoạ rời không được để trống');
        productDoHoaRoi.focus();
        return false;
    }

    let productRAM = $('#product_ram');
    if (!productRAM.val()) {
        alert('RAM không được để trống');
        productRAM.focus();
        return false;
    }

    let productStorage = $('#product_storage');
    if (!productStorage.val()) {
        alert('Bộ nhớ không được để trống');
        productStorage.focus();
        return false;
    }

    let productScreenSize = $('#product_screen_size');
    if (!productScreenSize.val()) {
        alert('Màn hình không được để trống');
        productScreenSize.focus();
        return false;
    }

    let productPhanGiai = $('#product_phan_giai');
    if (!productPhanGiai.val()) {
        alert('Độ phân giải không được để trống');
        productPhanGiai.focus();
        return false;
    }

    let productMhCamUng = $('#product_mh_cam_ung');
    if (!productMhCamUng.val()) {
        alert('Màn hình cảm ứng không được để trống');
        productMhCamUng.focus();
        return false;
    }

    let productWeight = $('#product_weight');
    if (!productWeight.val()) {
        alert('Khối lượng không được để trống');
        productWeight.focus();
        return false;
    }

    let productPrice = $('#product_price');
    if (productPrice.val() ==='' || parseFloat(productPrice.val()) < 0) {
        alert('Giá nhập không hợp lệ');
        productPrice.focus();
        return false;
    }
    if (productPrice.val() ===''|| isNaN(productPrice.val())) {
        alert('Giá nhập phải là một số');
        productPrice.focus();
        return false;
    }

    let productPriceOutput = $('#product_price_output');
    if (productPriceOutput.val() ==='' || parseFloat(productPriceOutput.val()) < 0) {
        alert('Giá bán không hợp lệ');
        productPriceOutput.focus();
        return false;
    }
    if (productPriceOutput.val() ===''|| isNaN(productPriceOutput.val())) {
        alert('Giá bán phải là một số');
        productPriceOutput.focus();
        return false;
    }

    let productQuantity = $('#product_quantity');
    if (productQuantity.val() ===''|| parseInt(productQuantity.val()) < 0) {
        alert('Số lượng không hợp lệ');
        productQuantity.focus();
        return false;
    }
    if (productQuantity.val() ==='' || isNaN(productQuantity.val())) {
        alert('Số lượng phải là một số');
        productQuantity.focus();
        return false;
    }

    return true;
}