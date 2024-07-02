<?php include('../../inc/myconnect.php');?>
<?php include('../../inc/function.php');?>
<?php
//Lấy giá trị của biến $_GET['date'] và gán vào mảng $array_date.
	$array_date = $_GET['date'];
	//Khởi tạo một mảng $thongke để lưu trữ kết quả thống kê.
	$thongke = array();
	foreach ($array_date as  $value) {
		//Chuyển đổi giá trị của $value thành định dạng ngày (date_create() và date_format()) và lấy ngày trong tháng.
		$date= date_create($value);
		$date =  date_format($date,"d");
		//Thực hiện truy vấn SQL để tính tổng tiền (tongtien) của các đơn hàng trong khoảng thời gian từ 00:00:00 đến 23:59:59 của ngày đang xét. Truy vấn này liên kết hai bảng tb_order và tb_product thông qua trường id_product.
		$query = "SELECT SUM(quantity_product*saleprice_product) tongtien FROM  tb_order, tb_product WHERE tb_order.id_product = tb_product.id_product && order_day BETWEEN '".$value." 0:0:0' AND '".$value." 23:59:59'";
		$result = mysqli_query($dbc, $query);
		// Lấy kết quả của truy vấn và trích xuất giá trị tongtien bằng hàm extract().
		extract(mysqli_fetch_assoc($result));
		//Thêm một mảng vào $thongke với cặp key-value là ngày và tổng tiền tương ứng.
		$thongke[] = array($date => $tongtien);	
	} 
	//Sử dụng hàm json_encode() để chuyển đổi mảng $thongke thành chuỗi JSON.
	echo json_encode($thongke);
	//Dừng thực thi chương trình (die) và hiển thị kết quả.
	die;
	?>