<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	$id = $_GET['id']; 
	settype($id, 'int');
	// Xây dựng câu truy vấn SQL để lấy nội dung sản phẩm từ bảng tbl_sanpham dựa trên id nhận được.
	$query_product= "SELECT noidung FROM tbl_sanpham WHERE id={$id}";
	// Thực thi câu truy vấn và lưu kết quả vào biến $result_product.
	$result_product=mysqli_query($dbc,$query_product);
	// Sử dụng hàm kt_query() để kiểm tra và xử lý lỗi nếu có.
	kt_query($query_product,$result_product);
	// Sử dụng vòng lặp while để duyệt qua từng dòng kết quả trả về từ câu truy vấn. Biến $product được gán giá trị là một mảng chứa các trường dữ liệu từ kết quả truy vấn. Trong trường hợp này, chỉ có một trường dữ liệu là noidung.
	while($product=mysqli_fetch_array($result_product,MYSQLI_NUM)){
		// Hiển thị nội dung sản phẩm ra màn hình bằng cách truy cập vào phần tử đầu tiên của mảng $product ($product[0]).
		echo $product[0];
	}
 ?>