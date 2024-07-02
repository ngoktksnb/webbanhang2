<?php include('../../inc/myconnect.php');?>
<?php include('../../inc/function.php');?>
<?php
//Gán giá trị của $now["mon"] vào biến $month_ago, đại diện cho tháng hiện tại.
	$date = $_GET['date']; // tong so ngay cua thang truoc
	$now = getdate(); // thoi gian hien tai
	$month_ago = $now["mon"];
	//Giữ nguyên giá trị của $now["year"] trong biến $year, đại diện cho năm hiện tại.
	$year = $now["year"];
	$thongke = array();
	for ($i=1; $i <= $date; $i++) { 
		//Tiếp tục thực hiện các bước thống kê như trước đó, sử dụng vòng lặp for để tính tổng tiền (tongtien) của các đơn hàng trong khoảng thời gian từ 00:00:00 đến 23:59:59 của từng ngày trong tháng trước đó.
		$query = "SELECT SUM(quantity_product*saleprice_product) tongtien FROM  tb_order, tb_product WHERE tb_order.id_product = tb_product.id_product && order_day BETWEEN '".$year."-".$month_ago."-".$i." 0:0:0' AND '".$year."-".$month_ago."-".$i." 23:59:59'";
		$result = mysqli_query($dbc, $query);
		//Thêm một cặp key-value vào $thongke với key là "ngayX" và value là tổng tiền tương ứng, trong đó X là số ngày.
		extract(mysqli_fetch_assoc($result));
		$thongke['ngay'.$i] = $tongtien;
	} 
	//Sử dụng hàm json_encode() để chuyển đổi mảng $thongke thành chuỗi JSON.
	echo json_encode($thongke);
	//Dừng thực thi chương trình (die) và hiển thị kết quả.
	die;
	?>