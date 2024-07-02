<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	//Đầu tiên, mã kiểm tra xem tham số $_GET['code_ship'] có tồn tại hay không.
	if ( isset($_GET['code_ship']) ) {
		//Nếu tồn tại, nó lấy giá trị của $_GET['code_ship'] và thực hiện một truy vấn SQL để cập nhật trạng thái của đơn vận chuyển trong bảng tb_ship. Trạng thái được cập nhật thành 1 để đánh dấu đơn hàng đã được giao hàng.
		$code_ship = $_GET['code_ship'];
		$query = "UPDATE tb_ship SET  
					status_ship = '1'
				WHERE code_ship = {$code_ship}";
		$result = mysqli_query($dbc, $query);
			
 
	// tru so luong san pham khi khach hàng đặt sản pham do
	$query = "SELECT tb_order.id_product id_product, tb_order.size_product size_order, tb_order.quantity_product quantity_order FROM tb_order,tb_ship,tb_bill WHERE tb_ship.id_bill = tb_bill.id_bill && tb_bill.id_order = tb_order.id_order &&  code_ship=$code_ship  ORDER BY tb_order.id_product ASC";
	$result = mysqli_query($dbc, $query);
	while ( $rows =  mysqli_fetch_array($result, MYSQLI_ASSOC) ) {
		$id_product = $rows['id_product'];
		/* lay size cua san pham */
		$query_size = "SELECT size_product FROM tb_product WHERE id_product = $id_product";
		$result_size = mysqli_query($dbc, $query_size);
		extract(mysqli_fetch_assoc($result_size));
		extract( $rows );
		$array_size = unserialize($size_product);
		$array_size[strtolower($size_order)] = $array_size[strtolower($size_order)] - $quantity_order;
		$array_size = Serialize($array_size);
		// UPDATE product 
		$query_product = "UPDATE tb_product SET  
						size_product = '{$array_size}'
					WHERE id_product = '{$id_product}'";
					// echo $query_product;
		$result_product = mysqli_query($dbc, $query_product);
		//Cuối cùng, sau khi cập nhật thành công trạng thái đơn vận chuyển và trừ số lượng sản phẩm, mã chuyển hướng người dùng đến trang list_delivery.php.
		header('location: ../list_delivery.php');
	}
	
	} 
	else {
		//Nếu tham số $_GET['code_ship'] không tồn tại, người dùng sẽ được chuyển hướng trở lại trang list_delivery.php.
		header('location: ../list_delivery.php');
	}


?>