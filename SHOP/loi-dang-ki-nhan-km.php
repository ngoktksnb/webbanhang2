<?php

?>   
<!DOCTYPE html>
<html>
<head>
    <title>Quần áo nam đẹp, quần áo hàng hiệu, cao cấp kiểu 2017</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style-main.css">
    <style type="text/css">

    </style>
</head>
<body style="margin-top: -20px">
<!-- đoạn mã PHP sau được sử dụng để bao gồm các tệp tin cần thiết: -->
<?php
//Đây là một tệp tin PHP khác được bao gồm trong đây. Nó có thể chứa mã để thiết lập kết nối đến cơ sở dữ liệu.
include('inc/myconnect.php');
//Đây là một tệp tin PHP khác được bao gồm trong đây. Nó có thể chứa các hàm và code liên quan đến chức năng cụ thể của trang web.
include('inc/function.php');
//Đây cũng là một tệp tin PHP khác được bao gồm trong đây. Thường thì nó chứa mã HTML/CSS để hiển thị phần header của trang web.
include('include/header.php');
?>

<div class="news-letter hidden-sm hidden-xs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <h2>BẠN CHƯA NHẬP EMAIL HOẶC EMAIL KHÔNG ĐƯỢC XÁC THỰC</h2>
                <div>Thông tin này sẽ được bảo mật trên hệ thống 3T SHOP</div>
                <div>Hệ thống sẽ tự động gửi thông tin khuyến mãi hoặc sản phẩm mới nhất về thời trang nam về email mà
                    bạn đã đăng ký
                </div>
                <!-- Khi form được gửi đi, nó sẽ gửi đến tệp tin mail.php trong thư mục xuli để xử lý dữ liệu đăng ký email. -->
                <!-- Dữ liệu form sẽ được gửi đi bằng phương thức POST. -->
                <form action="xuli/mail.php" method="post">
                    <div class="form-group">
                        <input type="text" name="insertMail" placeholder="Email của bạn">
                        <button type="submit" name="submitNewleter" >Đăng kí</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<?php
//Đây là một tệp tin PHP khác được bao gồm trong đây. Thường thì nó chứa mã HTML/CSS để hiển thị phần footer của trang web.
include('include/footer.php');
?>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery-main.js"></script>
</html>
