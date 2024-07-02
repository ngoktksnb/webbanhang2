<?php 
	include('inc/myconnect.php');
	include('inc/function.php');
	// nó kiểm tra xem biến $_GET['id'] có tồn tại và có giá trị là một số nguyên dương không (lớn hơn hoặc bằng 1) bằng cách sử dụng hàm filter_var() với FILTER_VALIDATE_INT và một mảng tùy chọn để chỉ định giá trị tối thiểu.
	if(isset($_GET['id']) && filter_var($_GET['id'],FILTER_VALIDATE_INT,array('min_range'=>1))){
		//Nếu điều kiện kiểm tra trên được đáp ứng, nó gán giá trị của $_GET['id'] cho biến $id.
		$id = $_GET['id'];
		//Tiếp theo, nó thực hiện một truy vấn SQL để xóa bản ghi trong bảng tb_category có id tương ứng với $id.
		$query="DELETE FROM tb_category WHERE id_category={$id}";
		$result=mysqli_query($dbc,$query);
		//Sau đó, nó kiểm tra xem truy vấn xóa đã thành công hay không bằng cách sử dụng hàm kt_query().
		kt_query($query,$result);
		//Nếu xóa thành công, nó sử dụng hàm header() để chuyển hướng người dùng đến trang "list_category.php" sau khi xóa.
		header("Location: list_category.php");
	}
	else{
		//Nếu không đáp ứng điều kiện trong điều kiện kiểm tra ban đầu, nó cũng sử dụng hàm header() để chuyển hướng người dùng đến trang "list_category.php".
	header("Location: list_category.php");
	exit();		
	}
?> 