<?php
session_start();
if(isset($_SESSION['uid'])) {
    header('location: index.php');
    exit();
}

require_once('inc/myconnect.php');
require_once('inc/function.php');

$error = '';
if(isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if(empty($username) || empty($password)) {
        $error = 'Vui lòng nhập đầy đủ tài khoản và mật khẩu.';
    } else {
        $taikhoan = $username;

        // Sử dụng prepared statements để truy vấn CSDL
        $query = "SELECT id_user, account_user, pass_user, type_user
                  FROM tb_user
                  WHERE account_user = ? AND pass_user = ? AND status_user = 1";
        $stmt = mysqli_prepare($dbc, $query);
        mysqli_stmt_bind_param($stmt, "ss", $taikhoan, $password);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if(mysqli_stmt_num_rows($stmt) == 1) {
            mysqli_stmt_bind_result($stmt, $id_user, $account_user, $pass_user, $type_user);
            mysqli_stmt_fetch($stmt);

            $_SESSION['uid'] = $id_user;
            $_SESSION['taikhoan'] = $account_user;
            $_SESSION['type_user'] = $type_user;
            header('Location: index.php');
            exit();
        } else {
            $error = 'Tài khoản hoặc mật khẩu không đúng. Vui lòng đăng nhập lại.';
            $username = '';
            $password = '';
        }
    }
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style-login.css" />
    <title>Đăng nhập</title>
</head>
<body>
    <div id="login">
        <form action="login.php" method="post" enctype="multipart/form-data">
            <h2>Đăng nhập</h2>
            <?php if(!empty($error)) { ?>
                <div class="error"><?php echo $error; ?></div>
            <?php } ?>
            <input type="text" name="username" id="username" placeholder="Nhập tài khoản . . ." required="required" value="<?php echo isset($username) ? $username : ''; ?>" />
            <input type="password" name="password" id="password" maxlength="20" placeholder="Nhập mật khẩu . . ." required="required" value="<?php echo isset($password) ? $password : ''; ?>" />
            <input style=" margin: auto; margin-top: 13px; " type="submit" name="login" id="button" value="Đăng nhập"/>
        </form>
    </div>
</body>
</html>
