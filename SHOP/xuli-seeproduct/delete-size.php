<?php
//Bắt đầu phiên làm việc (session_start()).
session_start();
//Lấy giá trị của tham số $_GET['id'] và gán vào biến $id.
$id=$_GET['id']; 
//Chuyển đổi giá trị của tham số $_GET['size'] thành chữ in hoa bằng hàm strtoupper() và gán vào biến $size.
$size=strtoupper($_GET['size']);
//Xóa phần tử tương ứng với kích thước ($size) trong mảng $_SESSION['cart'][$id]['quantity'] bằng cách sử dụng hàm unset().
unset($_SESSION['cart'][$id]['quantity'][$size]);
// Kiểm tra nếu mảng $_SESSION['cart'][$id]['quantity'] không còn phần tử nào (null), thì xóa cả phần tử $id trong mảng $_SESSION['cart'] bằng hàm unset() và hiển thị giá trị 0.
if($_SESSION['cart'][$id]['quantity']==null){
	unset($_SESSION['cart'][$id]);
	echo 0;
}else{
	//Nếu mảng $_SESSION['cart'][$id]['quantity'] vẫn còn phần tử, thì hiển thị giá trị 1.
	echo 1;
}
?>