<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
 //nó kiểm tra xem các biến $_GET['name'], $_GET['email'], $_GET['sdt'], $_GET['address'], $_GET['content'] có tồn tại hay không bằng cách sử dụng hàm isset().
		if(isset($_GET['name']) && isset($_GET['email']) &&  isset($_GET['sdt']) && isset($_GET['address']) && isset( $_GET['content'])){
			//Trong trường hợp các biến tồn tại, nó gán giá trị của chúng vào các biến tương ứng $name, $email, $sdt, $address, $content.
			$name = $_GET['name'];
			$email = $_GET['email'];
			$sdt = $_GET['sdt'];
			$address = $_GET['address'];
			$content = $_GET['content'];
			//Tiếp theo, nó tạo một câu truy vấn SQL INSERT để chèn dữ liệu vào bảng tb_contact trong cơ sở dữ liệu.
			$query ="INSERT INTO tb_contact(
											name,
											email,
											number_phone, 
											address,
											content,
											status
										) VALUES(
										'{$name}',
										'{$email}', 
										'{$sdt}', 
										'{$address}', 
										'{$content}',
										'0'
									)";
			//Sau đó, nó thực thi câu truy vấn bằng cách sử dụng hàm mysqli_query() và gán kết quả vào biến $result.
			$result =  mysqli_query($dbc,$query);
		}
?>