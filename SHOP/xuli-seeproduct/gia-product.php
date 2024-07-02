<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	//Lấy giá trị của tham số $_GET['id'] và gán vào biến $id.
	$id = $_GET['id'];
	//Định dạng kiểu dữ liệu của biến $id thành kiểu số nguyên bằng cách sử dụng hàm settype($id, 'int').
	settype($id, 'int'); 
	//Thực hiện truy vấn SQL để lấy giá bán từ bảng tbl_sanpham dựa trên giá trị $id.
	$query_product= "SELECT gia_ban FROM tbl_sanpham WHERE id={$id}";
	$result_product=mysqli_query($dbc,$query_product);
	kt_query($query_product,$result_product);
	//Kiểm tra kết quả truy vấn và lặp qua từng hàng kết quả bằng cách sử dụng vòng lặp while.
	while($product=mysqli_fetch_array($result_product,MYSQLI_NUM)){
		//Trong mỗi vòng lặp, sử dụng hàm number_format() để định dạng giá trị $product[0] thành số nguyên và có dấu phẩy ngăn cách hàng nghìn.
		echo number_format($product[0], 0,',',',');
	}
 ?>