<?php
include('../inc/myconnect.php');
include('../inc/function.php');
// mã kiểm tra xem tham số $_GET['id_order'] có tồn tại hay không
if ( isset($_GET['id_order']) ) {
	//Nếu tồn tại, nó lấy giá trị của $_GET['id_order'] và thực hiện một truy vấn SQL để cập nhật trạng thái của đơn hàng trong bảng tb_order. Trạng thái được cập nhật thành 1 để đánh dấu đơn hàng đã được xác nhận.
	/* id_order that ra là ma don hàng */
	$id_order = $_GET['id_order'];
	$query = "UPDATE tb_order SET  
				status_order = '1'
			WHERE code_order = {$id_order}";
	$result = mysqli_query($dbc, $query);
	// Tạo hóa đơn
 //mã tạo mã hóa đơn ngẫu nhiên bằng cách gọi hàm ramdom_code() (giả sử hàm này đã được định nghĩa trong tệp tin inc/function.php). Truy vấn SQL được sử dụng để lấy id_order từ bảng tb_order dựa trên mã code_order. Sau đó, hóa đơn mới được tạo trong bảng tb_bill bằng cách chèn dữ liệu mới với mã hóa đơn, trạng thái hóa đơn là 0 (chưa thanh toán) và id_order tương ứng.
	$code_bill = ramdom_code();
	$query_code_order = "SELECT id_order FROM tb_order WHERE code_order = {$id_order}";
	$result_code_order = mysqli_query($dbc, $query_code_order);
	while ( $rows = mysqli_fetch_array($result_code_order, MYSQLI_ASSOC) ) {
		$id_order = $rows['id_order'];
		$query_bill = "INSERT INTO `tb_bill`(`code_bill`, `status_bill`, `id_order`) VALUES ('{$code_bill}', 0,'{$id_order}')";
		$result_bill = mysqli_query($dbc, $query_bill);
	}
	

	
	// tru so luong san pham khi khach hàng đặt sản pham do
	// $query = "SELECT tb_order.id_product id_product, tb_order.size_product size_order, tb_order.quantity_product quantity_order, tb_product.size_product array_size FROM tb_product, tb_order WHERE tb_product.id_product=tb_order.id_product && code_order=$code_order  GROUP BY tb_order.id_product ORDER BY tb_order.id_product ASC";
	// $result = mysqli_query($dbc, $query);

	// extract(mysqli_fetch_array($result, MYSQLI_ASSOC));
	// $array_size = unserialize($array_size);

	// $array_size[strtolower($size_order)] = $array_size[strtolower($size_order)] - $quantity_order;

	// $array_size = Serialize($array_size);

//Cuối cùng, sau khi cập nhật trạng thái và tạo hóa đơn thành công, mã chuyển hướng người dùng đến trang list_order.php.
	header('location: ../list_order.php');

} 
else {
	//Nếu tham số $_GET['id_order'] không tồn tại, người dùng sẽ được chuyển hướng trở lại trang list_order.php.
		header('location: ../list_order.php');
}
?>