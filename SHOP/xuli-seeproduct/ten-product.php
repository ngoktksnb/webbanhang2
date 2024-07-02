<?php
	// Import các tệp tin cần thiết và khai báo biến $id với giá trị lấy từ tham số $_GET['id']. Biến $id được chuyển đổi sang kiểu dữ liệu integer bằng hàm settype() để đảm bảo tính hợp lệ của giá trị.

	include('../inc/myconnect.php');
	include('../inc/function.php');
	$id = $_GET['id'];
	settype($id, 'int'); 
	// Xây dựng câu truy vấn SQL để lấy tên sản phẩm từ bảng tbl_sanpham dựa trên id nhận được.
	$query_product= "SELECT ten_sanpham FROM tbl_sanpham WHERE id={$id}";
	$result_product=mysqli_query($dbc,$query_product);
	//Sử dụng hàm kt_query() để kiểm tra và xử lý lỗi nếu có.
	kt_query($query_product,$result_product);
	//Sử dụng vòng lặp while để duyệt qua từng dòng kết quả trả về từ câu truy vấn. Biến $product được gán giá trị là một mảng chứa các trường dữ liệu từ kết quả truy vấn. Trong trường hợp này, chỉ có một trường dữ liệu là ten_sanpham.
	while($product=mysqli_fetch_array($result_product,MYSQLI_NUM)){
		echo $product[0];
	}
?>