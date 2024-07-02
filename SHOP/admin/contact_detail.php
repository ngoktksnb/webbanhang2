<?php 
include('includes/header.php');
include('inc/myconnect.php');
include('inc/function.php');
//Đầu tiên, nó kiểm tra xem biến $_GET['id'] có tồn tại và có giá trị là một số nguyên dương không (lớn hơn hoặc bằng 1) bằng cách sử dụng hàm filter_var() với FILTER_VALIDATE_INT và một mảng tùy chọn để chỉ định giá trị tối thiểu.
if(isset($_GET['id']) && filter_var($_GET['id'],FILTER_VALIDATE_INT,array('min_range'=>1))){
	//Nếu điều kiện kiểm tra trên được đáp ứng, nó gán giá trị của $_GET['id'] cho biến $id.
	$id = $_GET['id'];
	//Tiếp theo, nó thực hiện một truy vấn SQL để cập nhật trạng thái của bản ghi trong bảng tb_contact có id tương ứng với $id thành '1'.
	$query_ud="UPDATE tb_contact SET status='1' WHERE id='{$id}'";
	$result_ud=mysqli_query($dbc,$query_ud);
	//Sau đó, nó kiểm tra xem truy vấn cập nhật đã thành công hay không bằng cách sử dụng hàm kt_query().
	kt_query($query_ud,$result_ud);
	//Tiếp theo, nó thực hiện một truy vấn SQL để lấy thông tin của bản ghi trong bảng tb_contact có id tương ứng với $id.
	$query = "SELECT * FROM tb_contact WHERE id='{$id}'";
	$result = mysqli_query($dbc, $query);
	kt_query($query,$result);
	//Sau đó, nó kiểm tra xem truy vấn đã thành công hay không bằng cách sử dụng hàm kt_query() và sử dụng hàm extract() để trích xuất các giá trị từ mảng kết quả và gán chúng vào các biến tương ứng.
	extract(mysqli_fetch_array($result, MYSQLI_ASSOC));
	?>
 
	<div class="row" style="height: 100%">
		<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">.
			<h3 style="color: red">Chi tiết liên hệ</h3>
			
			<div class="row">
				<div class="name col-xs-4"><label>Họ và tên: </label> <?php echo $name; ?></div>
				<div class="phone col-xs-4"><label>Số diện thoại: </label> <?php echo $number_phone; ?></div>
			</div>
			<div class="row">
				<div class="email col-xs-4"><label>Email </label> <?php echo $email; ?></div>
				<div class="address col-xs-6"><label>Địa chỉ: </label> <?php echo $address; ?></div>
			</div>
			<div class="row"  style="padding:30px 0 0 15px">
				<label class="col-xs-12">Nội dung liên hệ: </label>
				<div class="col-xs-12"><?php echo $content; ?></div>
			</div>
			<div class="" style="padding-top: 25px;">
				<a href="list_contact.php"><div class="btn btn-primary">Quay về</div></a>
			</div>
		</div>

	</div>
	<?php
	include('includes/footer.php');
}
else{
	header("Location: list_contact.php");
	exit();		
}
?>
<script type="text/javascript">
    $('.danh-muc .collapse').addClass('in');
    $('.danh-muc .lienhe').css({'background-color': '#e1e1e1'});
</script>