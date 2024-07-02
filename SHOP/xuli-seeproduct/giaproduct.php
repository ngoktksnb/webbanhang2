<?php
//  Lấy giá trị từ tham số $_GET['gia'] và gán vào biến $gia.
	$gia=$_GET['gia'];
// Tham số thứ nhất: Giá trị cần định dạng.
// Tham số thứ hai: Số chữ số sau dấu phẩy thập phân (trong trường hợp này là 0).
// Tham số thứ ba: Ký tự ngăn cách hàng nghìn (trong trường hợp này là dấu phẩy ,).
// Tham số thứ tư: Ký tự ngăn cách hàng nghìn (trong trường hợp này là dấu phẩy ,).
	echo number_format($gia, 0,',',',');
 ?> 