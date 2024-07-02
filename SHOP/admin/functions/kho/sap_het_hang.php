<?php include('../../inc/myconnect.php'); ?>
<?php include('../../inc/function.php'); ?>
<table class="table table-hover">
    <thead>
        <tr style="color: #bd0103">
            <th>Mã sp</th>
            <th>Tên sp</th>
            <th>Size</th>
            <th>Loại sp</th>
            <th>Hiệu sp</th>
            <th>Hình ảnh</th>
            <th>Giá</th>
            <th>Giá bán</th> 
            <th>Số lượng</th>
            <!-- <th>Mô tả</th> -->
            <th>Lượt xem</th>
            <th>Ngày thêm</th>
            <th>Trạng thái</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
    </thead>
    <body>
        <?php 
        //Khởi tạo một mảng $array_product để lưu trữ các sản phẩm có số lượng hàng còn lại từ 1 đến 4.
        $array_product = array();
        //Thực hiện truy vấn SQL để lấy thông tin các sản phẩm từ bảng tb_product và liên kết với bảng tb_category.
        $query_product = "SELECT * FROM tb_product, tb_category WHERE tb_product.id_category = tb_category.id_category";
        $result_product = mysqli_query($dbc, $query_product);
        kt_query($query_product,$result_product);
        //Sử dụng vòng lặp while để duyệt qua từng sản phẩm và kiểm tra số lượng hàng còn lại của sản phẩm.
        while ($product = mysqli_fetch_array($result_product, MYSQLI_ASSOC)) {
            $size_product = unserialize($product['size_product']);
            $product_quantity = 0;
            foreach ($size_product as $key => $value) {
                $product_quantity +=$value;
            }
            //Nếu số lượng hàng còn lại từ 1 đến 4, thêm sản phẩm vào mảng $array_product.
            if ( $product_quantity > 0 && $product_quantity < 5) {
               $array_product[] = $product;
            }
        }
        ?>
        <!-- Lọc sản phẩm -->
        <?php
        //Tiếp theo, sử dụng vòng lặp foreach để duyệt qua các sản phẩm trong mảng $array_product và hiển thị thông tin của từng sản phẩm trong bảng.
        foreach ($array_product as $key => $product) { 
            /* Tính số lượng */
              $sl = 0;
              foreach (unserialize($product['size_product']) as $key => $value) {
                 $sl += $value;
              }
          ?>
        
      <tr>
        <td><?php echo $product['code_product']; ?></td>
        <td><?php echo $product['name_product']; ?></td>
        <td>
         <?php 
         if (isset($product['size_product']) && !empty($product['size_product']) ) {
          foreach (Unserialize($product['size_product']) as $key => $value) {
             
            echo strtoupper($key) . " , ";
          };
        }

        ?>
      </td>
      <td><?php echo $product['name_category']; ?></td>
      <td><?php echo $product['id_label']; ?></td>
      <td style="width: 50px"><?php

      $img_product = explode(" ",  $product['image']);
      $stt = 0;
      foreach ($img_product as $value) {
        if(isset($value) && !empty($value)){
          ?>
            
          <img  style="width: 50px;" src="../<?php echo $value; ?>"  style="margin: 0 auto">
            
          <?php
          break;
          $stt++;
        }
      }
      ?></td>
      <!-- Sử dụng hàm number_format() để định dạng lại giá và giá bán của sản phẩm. -->
      <td><?php echo number_format($product['price_product']) ; ?><br/><strong> VND</strong></td>
      <td><?php echo number_format($product['saleprice_product']) ; ?><br/><strong> VND</strong></td>
      <td><?php echo $sl; ?></td>
      <!-- <td><?php echo $product['describe_product']; ?></td> -->
      <td><?php echo $product['view_product']; ?></td>
      <td><?php echo date("d/m/Y",strtotime($product['date_product'])); ?></td>
      <td><?php
      $status = $product['status_product'];
      if ($status==1)
      {
        echo "Còn hàng";
      }
      else
      {
        echo "Hết hàng";
      }
      ?></td>

      <td align="center"><a href="edit_product.php?id=<?php echo $product['id_product']; ?>"><i
        class="fa fa-fw fa-pencil"
        style="font-size: 20px; color:#1b926c;"></i></a></td>
        <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
          href="delete_product.php?id=<?php echo $product['id_product']; ?>"><i
          class="fa fa-fw fa-trash"
          style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
        </tr>
         <?php 
    }
        ?> 
    </body>
</table>