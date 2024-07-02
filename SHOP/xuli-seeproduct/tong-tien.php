<?php
	session_start();
	if(isset($_SESSION['cart']) or !empty($_SESSION['cart'])){
		$gia_tong=0;
		// Bắt đầu vòng lặp foreach để duyệt qua từng phần tử trong mảng $_SESSION['cart']. Đối với mỗi phần tử, giá sản phẩm được lấy từ trường 'saleprice_product' và số lượng sản phẩm được lấy từ mảng 'quantity'. Tiếp theo, một vòng lặp foreach khác được sử dụng để tính tổng số lượng sản phẩm. Cuối cùng, giá của sản phẩm được nhân với số lượng để tính tổng giá trị của sản phẩm này, và sau đó cộng vào biến $gia_tong.
		foreach ($_SESSION['cart'] as  $value) {
			$gia=$value['saleprice_product']; 
			$sl_product=0;
			foreach ($value['quantity'] as  $sl) {
				$sl_product += $sl;
			}
			$gia_tong += $gia *$sl_product;
		}
		// Sử dụng hàm number_format() để định dạng giá trị trong biến $gia_tong với các phân đoạn phân cách hàng nghìn bằng dấu ,. Sau đó, giá trị được hiển thị ra màn hình.
		echo number_format($gia_tong, 0,',',',');
	}	
?>