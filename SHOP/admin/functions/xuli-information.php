<?php include('../inc/myconnect.php');?>
<?php include('../inc/function.php');?>
<?php
//Mã sử dụng một câu lệnh switch-case để xác định trường dữ liệu (field) được cập nhật. Mỗi trường dữ liệu tương ứng với một case trong switch.
	switch ($_POST['field']) {
		case 'name':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='name'";
			$result_kt = mysqli_query($dbc, $query_kt);
			//Đối với mỗi trường dữ liệu, mã kiểm tra xem đã có thông tin trong bảng 'tb_information' hay chưa bằng cách thực hiện một câu lệnh SELECT theo trường dữ liệu đó. Nếu đã có, mã sẽ thực hiện câu lệnh UPDATE để cập nhật giá trị (value) mới vào bảng. Nếu chưa có, mã sẽ thực hiện câu lệnh INSERT để chèn thông tin mới vào bảng.
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='name'";
				$result_kt = mysqli_query($dbc, $query_kt);
				//Cuối cùng, mã sẽ in ra kết quả là 1 (để thể hiện thành công) sau khi thực hiện cập nhật thông tin.
				echo 1;
			} else { 
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('name','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;
		case 'description':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='description'";
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='description'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('description','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;
		case 'fb':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='fb'";
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='fb'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('fb','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;	
			//Trong trường hợp field là 'logo-header' hoặc 'logo-footer', mã cũng xử lý việc lưu file hình ảnh được tải lên vào thư mục 'image' và lưu đường dẫn của file vào cột value trong bảng 'tb_information'.
		case 'logo-header':
			$img = str_replace(" ","",$_FILES['file']['name']);
            $link_img = 'image/' . $img;
            move_uploaded_file($_FILES['file']['tmp_name'], "../../image/" . $img);
            // Lưu vào csdl
            $query_kt = "SELECT * FROM tb_information WHERE name='logo_header'";
            echo $query_kt;
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$link_img}'
				WHERE name='logo_header'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('logo_header','{$link_img}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
           	
			break;	
		case 'logo-footer':
			$img = str_replace(" ","",$_FILES['file']['name']);
            $link_img = 'image/' . $img;
            move_uploaded_file($_FILES['file']['tmp_name'], "../../image/" . $img);
            // Lưu vào csdl
            $query_kt = "SELECT * FROM tb_information WHERE name='logo_footer'";
            echo $query_kt;
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$link_img}'
				WHERE name='logo_footer'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('logo_footer','{$link_img}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
           	
			break;	
		case 'phone':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='phone'";
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='phone'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('phone','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;
           	
		case 'email':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='email'";
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='email'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('email','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;
        case 'adress':
			$value = $_POST['value'];
			$query_kt = "SELECT * FROM tb_information WHERE name='adress'";
			$result_kt = mysqli_query($dbc, $query_kt);
			if (mysqli_num_rows($result_kt) > 0) {
				$query_kt = "UPDATE tb_information SET  
				value = '{$value}'
				WHERE name='adress'";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			} else {
				$query_kt = "INSERT INTO  tb_information(name,value)
				VALUES('adress','{$value}')";
				$result_kt = mysqli_query($dbc, $query_kt);
				echo 1;
			}
			break;   	
		default:
			# code...
			break;
	}
?>
