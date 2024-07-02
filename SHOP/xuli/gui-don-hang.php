<?php
	session_start();
	include('../inc/myconnect.php');
	include('../inc/function.php'); 
	 //Nếu giỏ hàng $_SESSION['cart'] đã tồn tại hoặc không rỗng và các biến $_GET['name'], $_GET['email'], $_GET['sdt'], $_GET['tinh'], $_GET['quan'], $_GET['sonha'], $_GET['phuong'] cũng tồn tại, nó lấy giá trị của chúng và gán vào các biến tương ứng.
	if(isset($_SESSION['cart']) or !empty($_SESSION['cart']) && isset($_GET['name']) && isset($_GET['email']) && isset($_GET['sdt']) && isset($_GET['tinh']) && isset( $_GET['quan']) && isset($_GET['sonha']) && isset($_GET['phuong'])){
		$name = $_GET['name'];
		$email = $_GET['email'];
		$sdt = $_GET['sdt'];
		$tinh = $_GET['tinh'];
		$quan = $_GET['quan'];
		$sonha = $_GET['sonha'];
		$phuong = $_GET['phuong'];
		//Tạo một biến $code_order để lưu trữ mã đơn hàng ngẫu nhiên bằng cách sử dụng hàm ramdom_code() (không được hiển thị trong đoạn mã).
		$code_order = ramdom_code();
		//Tạo biến $address_customer để lưu địa chỉ của khách hàng từ $sonha và $phuong.
		$address_customer = $sonha . ", ". $phuong;
		//Thiết lập múi giờ mặc định cho phiên làm việc là "Asia/HO_CHI_MINH" bằng hàm date_default_timezone_set().
		date_default_timezone_set("Asia/HO_CHI_MINH");
		//Lấy thời gian hiện tại và gán vào biến $order_day.
		$order_day =date("Y-m-d  H:i:s");
		//Dùng vòng lặp để duyệt qua mảng $_SESSION['cart'] và lấy giá trị của các sản phẩm và số lượng từ mảng.
			foreach ($_SESSION['cart'] as $value) {
				$id_product = $value['id_product'];
				foreach ($value['quantity'] as $key_sl => $value_sl) {
					$size_product =   $key_sl;
					$quantity_product = $value_sl;
					//Thực hiện câu truy vấn INSERT để thêm dữ liệu vào bảng tb_order với các thông tin như mã đơn hàng, trạng thái đơn hàng, id sản phẩm, kích thước sản phẩm, số lượng sản phẩm, tên khách hàng, số điện thoại khách hàng, địa chỉ khách hàng, email khách hàng, ngày đặt hàng và id quận.
					$query= "INSERT INTO tb_order(
											code_order,
											status_order,
											id_product,
											size_product,
											quantity_product,
											name_customer, 
											phone_customer,
											address_customer,
											email_customer,
											order_day,
											id_district
										) VALUES(
										'{$code_order}',
										'0',
										'{$id_product}', 
										'{$size_product}', 
										'{$quantity_product}', 
										'{$name}', 
										'{$sdt}', 
										'{$address_customer}', 
										'{$email}',
										'{$order_day}',
										{$quan}

									)";
				$result =  mysqli_query($dbc,$query);
				}
			}	
		// header('location:../gui-hang-thanh-cong.php');
		//Sau khi thực thi câu truy vấn, giỏ hàng sẽ được xóa bằng cách sử dụng hàm unset().
		unset($_SESSION['cart']);
	}

?>