<?php

//Đầu tiên, nó kiểm tra xem biến $_POST['submitNewleter'] có tồn tại hay không bằng cách sử dụng hàm isset().
if(isset($_POST['submitNewleter'])){
    $ktMail="/^[A-Za-z0-9_.]{6,32}@([a-zA-Z0-9]{2,12})(.[a-zA-Z]{2,12})+$/";
    $insertMail=$_POST['insertMail'];
    //Trong trường hợp biến $_POST['submitNewleter'] tồn tại, nó tiếp tục kiểm tra các điều kiện của biểu thức chính quy để kiểm tra định dạng địa chỉ email.
    if(!preg_match($ktMail ,$insertMail)){
        //Nếu giá trị của biến $_POST['insertMail'] không khớp với định dạng email hợp lệ, nó chuyển hướng người dùng đến trang "loi-dang-ki-nhan-km.php" bằng cách sử dụng lệnh header('location:../loi-dang-ki-nhan-km.php').
        header('location:../loi-dang-ki-nhan-km.php');
    }else{
        //Nếu giá trị của biến $_POST['insertMail'] khớp với định dạng email hợp lệ, nó chuyển hướng người dùng đến trang "dang-ki-nhan-km-thanh-cong.php" bằng cách sử dụng lệnh header('location:../dang-ki-nhan-km-thanh-cong.php').
        header('location:../dang-ki-nhan-km-thanh-cong.php');
    } 

}
?>