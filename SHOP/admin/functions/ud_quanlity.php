<?php 
	session_start();
	include('../inc/myconnect.php');
	include('../inc/function.php');

	$id_product = $_GET['id_product'];
	//Mã kiểm tra xem có tham số GET 'array_quanlity' được truyền vào hay không. 
	if( isset($_GET['array_quanlity']) ) {
		//Nếu có, mã sẽ lấy giá trị của 'array_quanlity' và cập nhật lại mảng 'quanlity' trong session 'order' cho sản phẩm có id_product tương ứng.
		$array_quanlity = $_GET['array_quanlity'];
		$_SESSION['order'][$id_product]['quanlity'] = array();
		//Vòng lặp foreach được sử dụng để duyệt qua các phần tử của 'array_quanlity' và cập nhật giá trị vào mảng 'quanlity'.
		foreach ($array_quanlity as $key => $value) {
			$_SESSION['order'][$id_product]['quanlity'][$key] = $value;
		} 
		print_r($_SESSION['order']);
	} else {
		// Cuối cùng, mã sẽ in ra session 'order' sau khi cập nhật hoặc xoá sản phẩm và thông báo "khong co array_quanlity (file: ud_quanlity.php)".
		unset($_SESSION['order'][$id_product]);
		print_r($_SESSION['order']);
		echo "khong co array_quanlity (fileL:ud_quanlity.php)";
	}
?>