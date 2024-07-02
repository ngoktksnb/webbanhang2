<?php 
	include('../inc/myconnect.php');
	include('../inc/function.php');
	// Biến $id được gán giá trị từ tham số GET 'value' để xác định ID của thành phố.
	$id =$_GET['value'];
	// Một câu truy vấn SQL được tạo để lấy dữ liệu từ bảng tb_district với điều kiện id_city bằng $id.
	$query = "SELECT * FROM tb_district WHERE id_city = $id";
	//  Câu truy vấn được thực thi bằng cách sử dụng hàm mysqli_query() và kết quả được lưu trong biến $result.
	$result = mysqli_query($dbc, $query);
	/* tao seleced cho edit order */
	if ( isset($_GET['id_district']) ) {
		$id_district = $_GET['id_district'];
	}
	/**/ 
	echo "<option value=''>Bạn chưa chọn tỉnh thành</option>";
	// Một vòng lặp while được sử dụng để duyệt qua các dòng dữ liệu trả về từ câu truy vấn. Mỗi dòng dữ liệu sẽ được sử dụng để tạo một tùy chọn trong thẻ 
	while ($rows = mysqli_fetch_assoc($result)) {
	?>
	<option <?php if (isset($id_district)) {
		echo $id_district == $rows['id_district'] ? 'selected="selected"' : '';
	} ?>
	value="<?php echo $rows['id_district'] ?>"><?php echo $rows['name_district'] ?></option>
	<?php
	}
?> 