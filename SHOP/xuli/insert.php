<?php
//Đầu tiên, nó bắt đầu một phiên làm việc bằng cách sử dụng hàm session_start() và bao gồm tệp tin kết nối cơ sở dữ liệu và tệp tin chứa các hàm hỗ trợ.
session_start();
include('../inc/myconnect.php');
include('../inc/function.php');

 
if(isset($_GET['id'])&& isset($_GET['size'] )&& isset($_GET['quantity'])){
   //Sau đó, nó thực hiện câu truy vấn SQL SELECT để lấy dữ liệu từ bảng tb_product và gán kết quả vào biến $result_product.
    $query_product= "SELECT * FROM tb_product";
    $result_product=mysqli_query($dbc,$query_product);
    kt_query($query_product,$result_product);
    //Tiếp theo, nó tạo một mảng $data để lưu trữ dữ liệu của các sản phẩm từ kết quả truy vấn. Mỗi sản phẩm được lưu trữ dưới dạng một mảng trong $data với khóa là id_product.
    $data=array();

    while($product=mysqli_fetch_array($result_product,MYSQLI_ASSOC))
    {
        $data[$product['id_product']]=$product;
    }
    $id=$_GET['id'];
    $size=strtoupper($_GET['size']);
    $quantity=$_GET['quantity'];
    if(!isset($_SESSION['cart']) or empty($_SESSION['cart'])){
        $data[$id]['quantity'][$size]=$quantity;
        $_SESSION['cart'][$id]=$data[$id];

    }
    else{
        //Nếu các biến $_GET['id'], $_GET['size'], $_GET['quantity'] tồn tại, nó lấy giá trị của chúng và gán vào các biến $id, $size, $quantity tương ứng.
        if(array_key_exists($id, $_SESSION['cart'])){
            if(array_key_exists($size, $_SESSION['cart'][$id]['quantity'])){
                $_SESSION['cart'][$id]['quantity'][$size]+=$quantity;
            }
            else{
                $_SESSION['cart'][$id]['quantity'][$size]=$quantity;

            }

        }
        else{
            $data[$id]['quantity'][$size]=$quantity;
            $_SESSION['cart'][$id]=$data[$id];

        }
    }

}
// else{
//     header('location:../index.php');
// }



?>