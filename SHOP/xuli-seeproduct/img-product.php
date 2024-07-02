<?php
	include('../inc/myconnect.php');
	include('../inc/function.php');
	$id = $_GET['id']; 
	settype($id, 'int');
	//Xây dựng câu truy vấn SQL để lấy hình ảnh của sản phẩm từ bảng tbl_sanpham dựa trên id nhận được.
	$query_product= "SELECT anh FROM tbl_sanpham WHERE id={$id}";
	//Sử dụng hàm kt_query() để kiểm tra và xử lý lỗi nếu có.
	$result_product=mysqli_query($dbc,$query_product);
	kt_query($query_product,$result_product);
	//Sử dụng vòng lặp while để duyệt qua từng dòng kết quả trả về từ câu truy vấn. Biến $product được gán giá trị là một mảng chứa các trường dữ liệu từ kết quả truy vấn. Trong trường hợp này, chỉ có một trường dữ liệu là anh.
	while($product=mysqli_fetch_array($result_product,MYSQLI_NUM)){
		$stt=0;
		?>
		<div class="item-img" stt="<?php echo $stt;?>">
			<img src="<?php echo $product[0]; ?>" style="width: 300px;height: 400px">		
		</div>
	<?php 
	//Tăng giá trị của biến $stt lên 1 sau mỗi vòng lặp để đảm bảo các hình ảnh được đánh số thứ tự khác nhau.
		$stt++;
		}
	 ?>