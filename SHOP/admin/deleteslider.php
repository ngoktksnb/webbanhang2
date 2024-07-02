<!-- Sử dụng hàm ob_start() để bắt đầu bộ đệm đầu ra. -->
<?php ob_start(); ?>
<?php include('inc/myconnect.php');?>
<?php include('inc/function.php');?>

<?php 
//Kiểm tra xem biến $_GET['id'] có tồn tại và có giá trị là một số nguyên dương không (sử dụng hàm filter_var() với FILTER_VALIDATE_INT) để đảm bảo giá trị của $_GET['id'] hợp lệ và lớn hơn 0.
	if(isset($_GET['id']) && filter_var($_GET['id'],FILTER_VALIDATE_INT,array('min_range' => 1))){
		//Nếu kiểm tra thành công, lấy giá trị của $_GET['id'] vào biến $id.
		$id = $_GET['id'];
		//Thực hiện câu truy vấn SELECT để lấy thông tin về ảnh và ảnh thu nhỏ từ bảng tb_sider dựa trên $id.
		$query_a= "SELECT anh,anh_thumb FROM tb_sider WHERE id={$id}";
		$result_a = mysqli_query($dbc,$query_a);
		kt_query($query_a,$result_a);
		//Kiểm tra kết quả của câu truy vấn và lưu thông tin ảnh vào biến $anhInfo thông qua hàm mysqli_fetch_assoc().
		$anhInfo =mysqli_fetch_assoc($result_a);
		//Xóa tệp tin ảnh gốc và ảnh thu nhỏ từ đường dẫn '../' bằng hàm unlink().
		unlink('../'.$anhInfo['anh']);
		unlink('../'.$anhInfo['anh_thumb']);
		//Thực hiện câu truy vấn DELETE để xóa bản ghi trong bảng tb_sider dựa trên $id.
			$query = "DELETE FROM tb_sider WHERE id={$id}";
		$result = mysqli_query($dbc,$query);
		kt_query($query,$result);
		//Kiểm tra kết quả của câu truy vấn và điều hướng người dùng đến trang 'listslider.php' bằng hàm header().
		header('Location: listslider.php');

	} 
	else{
		//Nếu kiểm tra không thành công, điều hướng người dùng đến trang 'listslider.php' bằng hàm header().
	header('Location: listslider.php');
	}
?>
