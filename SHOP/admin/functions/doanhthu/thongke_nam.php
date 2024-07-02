<?php include('../../inc/myconnect.php');?>
<?php include('../../inc/function.php');?>
<?php 
//Sử dụng hàm getdate() để lấy thời gian hiện tại và gán vào biến $now.
	$now = getdate(); // thoi gian hien tai
//Khởi tạo một mảng $thongke để lưu trữ kết quả thống kê.
	$thongke = array();
	for ($i=1; $i <=12 ; $i++) { 
		//Thực hiện truy vấn SQL để tính tổng tiền (tongtien) của các đơn hàng trong khoảng thời gian từ ngày 1 đến ngày 31 của tháng đang xét. Truy vấn này liên kết hai bảng tb_order và tb_product thông qua trường id_product.
		$query = "SELECT SUM(quantity_product*saleprice_product) tongtien FROM  tb_order, tb_product WHERE tb_order.id_product = tb_product.id_product && order_day BETWEEN '".$now["year"]."-".$i."-01 0:0:0' AND '".$now["year"]."-".$i."-31 23:59:59'";
		// echo $query;
		$result = mysqli_query($dbc, $query);
		// Lấy kết quả của truy vấn và trích xuất giá trị tongtien bằng hàm extract().
		extract(mysqli_fetch_assoc($result));
		//Thêm một cặp key-value vào $thongke với key là "thangX" và value là tổng tiền tương ứng, trong đó X là số tháng.
		$thongke['thang'.$i] = $tongtien;
	} 
	//Sử dụng hàm json_encode() để chuyển đổi mảng $thongke thành chuỗi JSON.
	echo json_encode($thongke);
	//Dừng thực thi chương trình (die) và hiển thị kết quả.
	die;
	?>