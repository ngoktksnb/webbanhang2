<?php include('../../inc/myconnect.php');?>
<?php include('../../inc/function.php');?>
<?php
//Lấy giá trị date từ tham số $_GET và gán vào biến $date, đại diện cho tổng số ngày của tháng trước đó.
	$date = $_GET['date']; // tong so ngay cua thang truoc
	//Sử dụng hàm getdate() để lấy thời gian hiện tại và gán vào biến $now.
	$now = getdate(); // thoi gian hien tai
	//Tính giá trị của tháng trước đó và năm tương ứng và gán vào biến $month_ago và $year.
	$month_ago = $now["mon"] -1;
	$year = $now["year"];
	//Kiểm tra nếu $month_ago bằng 0 (tức là tháng 12), thì cập nhật giá trị của $month_ago thành 12 và giảm giá trị của $year đi 1 để lấy năm trước đó.
	if($month_ago == 0) {
		$month_ago =12;
		$year = $now["year"] - 1;
	} 
	//Khởi tạo một mảng $thongke để lưu trữ kết quả thống kê.
	$thongke = array();
	for ($i=1; $i <= $date; $i++) { 
		//Thực hiện truy vấn SQL để tính tổng tiền (tongtien) của các đơn hàng trong khoảng thời gian từ 00:00:00 đến 23:59:59 của ngày đang xét. Truy vấn này liên kết hai bảng tb_order và tb_product thông qua trường id_product.
		$query = "SELECT SUM(quantity_product*saleprice_product) tongtien FROM  tb_order, tb_product WHERE tb_order.id_product = tb_product.id_product && order_day BETWEEN '".$year."-".$month_ago."-".$i." 0:0:0' AND '".$year."-".$month_ago."-".$i." 23:59:59'";
		$result = mysqli_query($dbc, $query);
		//Lấy kết quả của truy vấn và trích xuất giá trị tongtien bằng hàm extract().
		extract(mysqli_fetch_assoc($result));
		//Thêm một cặp key-value vào $thongke với key là "ngayX" và value là tổng tiền tương ứng, trong đó X là số ngày
		$thongke['ngay'.$i] = $tongtien;
	}
	//Sử dụng hàm json_encode() để chuyển đổi mảng $thongke thành chuỗi JSON.
	echo json_encode($thongke);
	//Dừng thực thi chương trình (die) và hiển thị kết quả.
	die;
	?>