<?php
//Dòng này khởi động phiên làm việc của session. Nó đảm bảo rằng session có thể được sử dụng để lưu trữ và truy xuất dữ liệu trên các trang PHP.    
session_start();
//Dòng này kiểm tra xem biến $_GET['display'] có tồn tại và không rỗng không. $_GET là một mảng chứa các tham số truyền qua URL. Điều kiện isset($_GET['display']) kiểm tra xem tham số display đã được truyền hay chưa, và !empty($_GET['display']) kiểm tra xem giá trị của tham số display có rỗng hay không.
if(isset($_GET['display'])&& !empty($_GET['display'])){
    $_SESSION['display']= $_GET['display'];
}
else{
    header('location:index.php');
}
//Nếu cả hai điều kiện đúng (tham số display tồn tại và không rỗng), dòng $SESSION['display'] = $_GET['display'] được thực thi. Điều này có nghĩa là giá trị của tham số display được lưu vào biến $_SESSION['display'], để có thể sử dụng giá trị này trong các phiên làm việc sau này.
//Nếu một trong hai điều kiện sai, tức là tham số display không tồn tại hoặc rỗng, dòng header('location:index.php') được thực thi. Điều này chuyển hướng người dùng về trang "index.php".

?>