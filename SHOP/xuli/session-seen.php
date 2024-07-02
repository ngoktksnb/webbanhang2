<?php
//Đầu tiên, nó bắt đầu phiên làm việc bằng cách sử dụng hàm session_start() để có thể sử dụng các biến phiên làm việc.
session_start();
include('../inc/myconnect.php');
include('../inc/function.php');
//Tiếp theo, nó kiểm tra xem biến $_GET['id'] có tồn tại và không rỗng hay không bằng cách sử dụng hàm isset() và empty().
if(isset($_GET['id']) && !empty($_GET['id'])){
    $id = $_GET['id'];
    //Sau đó, nó tạo một câu truy vấn SQL để lấy thông tin sản phẩm từ bảng "tb_product" trong cơ sở dữ liệu. Câu truy vấn được gán cho biến $query_product.
    $query_product = "SELECT id_product,name_product,image_thump FROM tb_product";
   //Sau đó, nó thực thi câu truy vấn SQL bằng cách sử dụng hàm mysqli_query() và gán kết quả truy vấn cho biến $result_product.
    $result_product = mysqli_query($dbc, $query_product);
    //Sau đó, nó kiểm tra kết quả truy vấn bằng cách sử dụng hàm kt_query(). Nếu truy vấn thành công, nó tạo một mảng $data để lưu trữ thông tin sản phẩm
    kt_query($query_product, $result_product);
    $data = array();
    //Tiếp theo, nó sử dụng một vòng lặp while để lặp qua từng sản phẩm trong kết quả truy vấn. Mỗi sản phẩm được gán vào mảng $data với khóa là id của sản phẩm.
    while ($product = mysqli_fetch_array($result_product, MYSQLI_ASSOC)) {
        $data[$product['id_product']] = $product;
    }
    //Tiếp theo, nó kiểm tra xem biến $_SESSION['seen'] có tồn tại hoặc không rỗng hay không bằng cách sử dụng hàm isset() và empty().
    if (!isset($_SESSION['seen']) or empty($_SESSION['seen'])) {
       //nó gán giá trị của sản phẩm có id là $id trong mảng $data vào biến $_SESSION['seen'].
        $_SESSION['seen'][$id] = $data[$id];
    } else {
        //nó ghi đè giá trị của sản phẩm có id là $id trong mảng $data vào biến $_SESSION['seen'].
        $_SESSION['seen'][$id] = $data[$id];

    };
}else{
    header('location:../index.php');
}






?>