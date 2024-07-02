<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	//mã kiểm tra xem tham số $_GET['code_bill'] có tồn tại hay không.
	if ( isset($_GET['code_bill']) ) {
		//ấy giá trị của $_GET['code_bill'] và thực hiện một truy vấn SQL để cập nhật trạng thái của hóa đơn trong bảng tb_bill. 
		$code_bill = $_GET['code_bill'];
		$query = "UPDATE tb_bill SET  
					status_bill = '1'
				WHERE code_bill = {$code_bill}";
		$result = mysqli_query($dbc, $query);
		//Trạng thái được cập nhật thành 1 để đánh dấu hóa đơn đã được xác nhận thanh toán.

		// tao ship  
//mã tạo mã ship ngẫu nhiên bằng cách gọi hàm ramdom_code_ship() (giả sử hàm này đã được định nghĩa trong tệp tin inc/function.php). Truy vấn SQL được sử dụng để lấy thông tin id_bill và id_order từ bảng tb_bill dựa trên mã code_bill. Sau đó, thông tin vận chuyển được tạo ra trong bảng tb_ship bằng cách chèn dữ liệu mới với mã ship, id_bill, id_order và trạng thái ship là 0 (chưa vận chuyển).
		$code_ship = ramdom_code_ship();
		$query_code_bill = "SELECT id_bill,id_order FROM tb_bill WHERE code_bill = {$code_bill}";
		$result_code_bill = mysqli_query($dbc, $query_code_bill);
		while ( $rows = mysqli_fetch_array($result_code_bill, MYSQLI_ASSOC) ) {
			$id_bill = $rows['id_bill'];
			$id_order = $rows['id_order'];
			$query_is_ship = "INSERT INTO `tb_ship`(`code_ship` , `id_bill`,`id_order`, `status_ship`) VALUES ('{$code_ship}','{$id_bill}','{$id_order}', 0)";
			$result_is_ship = mysqli_query($dbc, $query_is_ship);
		}
		

		header('location: ../list_bill.php');
	} 
	else {
		header('location: ../list_bill.php');
	}


?>