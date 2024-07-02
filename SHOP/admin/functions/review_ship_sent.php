<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	// Đầu tiên, mã kiểm tra xem tham số $_GET['code_ship'] có tồn tại hay không.
	if ( isset($_GET['code_ship']) ) {
		//Nếu tồn tại, nó lấy giá trị của $_GET['code_ship'] và thực hiện một truy vấn SQL để cập nhật trạng thái của đơn vận chuyển trong bảng tb_ship. Trạng thái được cập nhật thành 2 để đánh dấu đơn hàng đã được gửi đi.
		$code_ship = $_GET['code_ship'];
		$query = "UPDATE tb_ship SET  
					status_ship = '2'
				WHERE code_ship = {$code_ship}";
		$result = mysqli_query($dbc, $query);
			
		//Sau đó, sau khi cập nhật trạng thái thành công, mã chuyển hướng người dùng đến trang list_delivery_sent.php.
		header('location: ../list_delivery_sent.php');
	}  
	else {
		//Nếu tham số $_GET['code_ship'] không tồn tại, người dùng sẽ được chuyển hướng trở lại trang list_delivery_sent.php.
		header('location: ../list_delivery_sent.php');
	}


?>