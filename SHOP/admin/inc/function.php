<?php
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
?>

<?php
// kiểm tra duyệt đơn hàng -> giao hàng
//Hàm này được sử dụng để kiểm tra xem một đơn hàng có đủ số lượng sản phẩm để giao hàng hay không. Nó truy vấn cơ sở dữ liệu để lấy thông tin về kích thước (size), số lượng (quantity), và kích thước sản phẩm (array_size) từ bảng tb_order và tb_product. Sau đó, nó so sánh kích thước và số lượng của sản phẩm trong đơn hàng với kích thước sản phẩm trong bảng tb_product và trả về true nếu số lượng đủ để giao hàng, ngược lại trả về false.
function check_order($code_order){
  global $dbc;
  $query = "SELECT tb_order.size_product size, tb_order.quantity_product quantity, tb_product.size_product array_size FROM tb_order,tb_product WHERE tb_order.id_product = tb_product.id_product && tb_order.code_order = $code_order";
  $result = mysqli_query($dbc,$query);
   
  while($rows = mysqli_fetch_array($result)){
    extract($rows);
    $array_size = unserialize($array_size);
    if( array_key_exists($size, $array_size) || array_key_exists(strtolower($size), $array_size) ){
      if ($array_size[strtolower($size)] < $quantity) {
       return true;
     } else {
      // echo "hihi";
     } 
   } 
 }
}
// Kiem tra so luong san pham có đủ de duyet don hang
//Hàm này được sử dụng để kiểm tra xem có đủ số lượng sản phẩm để duyệt đơn hàng hay không. Nó truy vấn cơ sở dữ liệu để lấy thông tin về kích thước sản phẩm (size_product) từ bảng tb_product dựa trên id_product. Sau đó, nó so sánh số lượng sản phẩm có sẵn trong kích thước (size_product) với quantity_order và trả về true nếu số lượng đủ để duyệt đơn hàng, ngược lại trả về false.
function check_product($id_product,$size, $quantity_order){
    global $dbc;
    $query = "SELECT size_product FROM tb_product WHERE id_product=$id_product";
    $result = mysqli_query($dbc,$query);
    extract(mysqli_fetch_array($result, MYSQLI_ASSOC));
    $size_product = unserialize($size_product);
    if ($size_product[strtolower($size)] <  $quantity_order) {
      return true;
    }
}

  // tạo code_order ramdom 7 số  bên bill
  //Hàm này được sử dụng để tạo một mã ngẫu nhiên gồm 7 chữ số cho đơn hàng. Nó kiểm tra xem mã ngẫu nhiên đã tồn tại trong bảng tb_bill hay chưa, nếu đã tồn tại thì tạo mã mới. Cuối cùng, nó trả về mã đơn hàng mới.
function ramdom_code(){
  global $dbc;
  $rd = rand(0000000,9999999);
  $query = "SELECT code_bill FROM tb_bill";
  $result = mysqli_query($dbc,$query);
  $list_code_bill = array();
  while ($array_code = mysqli_fetch_array($result,MYSQLI_NUM) ) {
    array_push($list_code_bill, $array_code[0]);
  }
  if (in_array($rd, $list_code_bill)) {
    ramdom_code();
  }
  else{
    return $rd;
  }
}
 // tạo code_order ramdom 7 số  bên bill
 //Hàm này tương tự như ramdom_code() nhưng tạo mã ngẫu nhiên gồm 7 chữ số cho vận chuyển.
function ramdom_code_ship(){
  global $dbc;
  $rd = rand(0000000,9999999);
  $query = "SELECT code_ship FROM tb_ship";
  $result = mysqli_query($dbc,$query);
  $list_code_ship = array();
  while ($array_code = mysqli_fetch_array($result,MYSQLI_NUM) ) {
    array_push($list_code_ship, $array_code[0]);
  }
  if (in_array($rd, $list_code_ship)) {
    ramdom_code_ship();
  }
  else{
    return $rd;
  }
}

//Hàm này được sử dụng để tạo mã sản phẩm ngẫu nhiên dựa trên mã loại sản phẩm ($code). Nó kiểm tra xem mã sản phẩm ngẫu nhiên đã tồn tại trong bảng tb_product hay chưa, nếu đã tồn tại thì tạo mã mới. Cuối cùng, nó trả về mã sản phẩm mới.
function ramdom_code_product($code){
  global $dbc;
  $rd = $code.rand(0,9999);
  $query = "SELECT code_product FROM tb_product WHERE code_product='{$rd}'";
  $result = mysqli_query($dbc,$query);
  // $list_code_order = array();
  // while ($array_code = mysqli_fetch_array($result,MYSQLI_NUM) ) {
  //   array_push($list_code_order, $array_code[0]);
  // }
  if ( mysqli_num_rows($result) >= 1) {
    ramdom_code_product($code);
  }
  else{
    return $rd;
  }
}
// tạo code_product
//Hàm này được sử dụng để tạo mã sản phẩm dựa trên mã loại sản phẩm ($id_loai). Đầu tiên, nó sử dụng hàm get_id_category($id_loai) để lấy mã danh mục sản phẩm cấp cao nhất dựa trên mã loại. Sau đó, nó lấy tên danh mục từ bảng tb_category, loại bỏ dấu tiếng Việt và tách thành mảng các từ. Tiếp theo, nó tạo mã ngẫu nhiên bằng cách kết hợp viết hoa chữ cái đầu tiên của mỗi từ trong mảng và số ngẫu nhiên. Cuối cùng, nó kiểm tra xem mã sản phẩm đã tồn tại trong bảng tb_product hay chưa, nếu đã tồn tại thì tạo mã mới. Cuối cùng, nó trả về mã sản phẩm mới.
function creat_code_product($id_loai) {
  global $dbc;
  // lấy mã loại cáo nhất của loai dua vào
  $id_loai = get_id_category($id_loai);
  // lấy những chữ cái của tên loại
  $query="SELECT name_category FROM tb_category WHERE id_category={$id_loai}";
  $result= mysqli_query($dbc,$query);
  kt_query($result,$query);
  list($name_category) = mysqli_fetch_row($result);
  $name_category = stripUnicode($name_category);
  $array_text_category = explode(" ", $name_category);
  $code = '';
  for ($i = 0; $i < count($array_text_category);  $i++) {
   $code .= strtoupper(substr($array_text_category[$i], 0,1));
 }
                // Tạo ra số ramdom
 $code = ramdom_code_product($code);
  // kiểm tra mã này có tồn tại chưa
 return $code;
}

//kiếm tra xem kết quả trả về có đúng hay không.
//Hàm này được sử dụng để loại bỏ các dấu tiếng Việt trong một chuỗi ký tự và trả về chuỗi ký tự không dấu.
function stripUnicode($str){
  if(!$str) return false;
  $unicode = array(
    'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ|À|Á',
    'd'=>'đ',
    'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
    'i'=>'í|ì|ỉ|ĩ|ị',
    'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
    'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
    'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
  );
  foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
  return str_replace(" ","", $str);
}
//Hàm này được sử dụng để kiểm tra xem câu truy vấn SQL đã thành công hay không. Nếu không thành công, nó sẽ hiển thị thông báo lỗi và kết thúc chương trình.
function kt_query($result,$query)
{
  global $dbc;
  if (!$result){
    die("Query {$query} \n<br/> MYSQL Errors : " .mysqli_error($dbc));
  }
}
//Hàm này được sử dụng để hiển thị các danh mục sản phẩm trong một thẻ <select>. Nó truy vấn cơ sở dữ liệu để lấy các danh mục sản phẩm có parent_id tương ứng với parent_id được truyền vào. Sau đó, nó sử dụng đệ quy để hiển thị các danh mục con bên trong các thẻ <option>. Biến $insert_text được sử dụng để thêm dấu gạch chân để chỉ ra cấp độ của danh mục.
function show_categories($parent_id=0,$insert_text=""){
  global $dbc;
  $query="SELECT * FROM tb_category WHERE parent_id={$parent_id}";
  $result= mysqli_query($dbc,$query);
  kt_query($result,$query);
  while($parent=mysqli_fetch_array($result,MYSQLI_ASSOC)){
    echo ("<option value='".$parent['id_category']."'>".$insert_text.$parent['name_category']."</option>");
    show_categories($parent['id_category'],$insert_text."- ");
  }

}
// lay id category cha cap cao nhat cua id dua vao
//Hàm này được sử dụng để lấy mã danh mục sản phẩm cấp cao nhất (danh mục cha) dựa trên mã danh mục con được truyền vào. Nó truy vấn cơ sở dữ liệu để lấy parent_id của danh mục con, sau đó tiếp tục lặp lại quá trình này cho đến khi không còn danh mục cha nữa. Cuối cùng, nó trả về mã danh mục cha cấp cao nhất.
function get_id_category($id_category)
{
  global $dbc;
  $query="SELECT id_category,parent_id FROM tb_category WHERE id_category={$id_category}";
  $result= mysqli_query($dbc,$query);
  kt_query($result,$query);
  list($id_category,$parent_id) = mysqli_fetch_row($result);
  if($parent_id != 0) {
    $query="SELECT id_category,parent_id FROM tb_category WHERE id_category={$parent_id}";
    $result= mysqli_query($dbc,$query);
    kt_query($result,$query);
    list($id_category,$parent_id) = mysqli_fetch_row($result);
    if($parent_id != 0) {
      $query="SELECT id_category,parent_id FROM tb_category WHERE id_category={$parent_id}";
      $result= mysqli_query($dbc,$query);
      kt_query($result,$query);
      list($id_category,$parent_id) = mysqli_fetch_row($result);
      if($parent_id != 0) { 
        $query="SELECT id_category,parent_id FROM tb_category WHERE id_category={$parent_id}";
        $result= mysqli_query($dbc,$query);
        kt_query($result,$query);
        list($id_category,$parent_id) = mysqli_fetch_row($result);
        if($parent_id != 0) {

        } else {

          return $id_category;
        }

      } else {

        return $id_category;
      }

    } else {

      return $id_category;
    }
  } else {

    return $id_category;
  }
//    kết thúc if
}
//Hàm này được sử dụng để tạo một thẻ <select> chứa danh mục sản phẩm. Nó truy vấn cơ sở dữ liệu và sử dụng hàm show_categories() để hiển thị các danh mục trong thẻ <select>. Biến $name và $class được sử dụng để thiết lập thuộc tính name và class của thẻ <select>. Biến $current_id có thể được sử dụng để thiết lập danh mục được chọn mặc định.
function ctrSelect($name,$class,$current_id =""){
  global $dbc;

  echo "<select name='$name' class='$class' style='padding:5px 10px;border-radius:4px;display:block'>";
  echo "<option value='0'>Danh mục cha</option>";
  show_categories();
  echo "</select>";
}

// Xứ lí form search file list_category.php
//Hàm này được sử dụng để tìm kiếm các danh mục sản phẩm dựa trên một chuỗi tìm kiếm. Nó truy vấn cơ sở dữ liệu để tìm các danh mục có tên hoặc mã danh mục chứa chuỗi tìm kiếm. Sau đó, nó hiển thị kết quả tìm kiếm trong một bảng.
function category_search($text_search) {
  global $dbc;

         // 
  $query = "SELECT * FROM tb_category WHERE name_category LIKE". "'%".$text_search."%' || code_category LIKE". "'%".$text_search."%'";
  $result = mysqli_query($dbc, $query);
  kt_query($query,$result);
        // echo 
  if( mysqli_num_rows($result) <= 0) {
   echo "<tr>
   <td colspan='5' class='text-danger text-center'>Không tìm thấy kết quả</td>
   </tr>";
 }  else {
  while ($category = mysqli_fetch_array($result, MYSQLI_ASSOC)) { ?>
  <tr>
    <td><?php echo $category['code_category']; ?></td>
    <td><?php echo $category['name_category']; ?></td>
    <td><?php
    $parent_id = $category['parent_id'];
    if($parent_id ==0){
      echo "Danh mục gốc";
    }else{
      $query_parent_category = "SELECT id_category,name_category,parent_id FROM tb_category WHERE  id_category={$parent_id} ORDER BY  name_category DESC ";
      $result_parent_category= mysqli_query($dbc, $query_parent_category);
      kt_query($query_parent_category, $result_parent_category);
      list($id_category,$name_category,$parent_id)=mysqli_fetch_array($result_parent_category,MYSQLI_NUM);
      echo $name_category;
    }
    ?>
  </td>


  <td align="center"><a href="edit_category.php?id=<?php echo $category['id_category']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
      <?php 
          if ( $_SESSION['type_user'] == 0 ) {
      ?>
    <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_category.php?id=<?php echo $category['id_category']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
      </tr> 
    <?php 
      }
    ?>
      <?php
    }



  }
}
// template list_category
//Hàm này được sử dụng để hiển thị danh sách các danh mục sản phẩm trong một bảng. Nó truy vấn cơ sở dữ liệu để lấy tất cả các danh mục sản phẩm và hiển thị chúng trong bảng.
function list_category() { 
 global $dbc;
 $query = "SELECT * FROM tb_category ORDER BY id_category";
 $result = mysqli_query($dbc, $query);
 kt_query($query, $result);
 while ($category = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  ?>
  <tr>
    <td><?php echo $category['code_category']; ?></td>
    <td><?php echo $category['name_category']; ?></td>
    <td><?php
    $parent_id = $category['parent_id'];
    if($parent_id ==0){
      echo "Danh mục gốc";
    }else{
      $query_parent_category = "SELECT id_category,name_category,parent_id FROM tb_category WHERE  id_category={$parent_id} ORDER BY  name_category DESC ";
      $result_parent_category= mysqli_query($dbc, $query_parent_category);
      kt_query($query_parent_category, $result_parent_category);
      list($id_category,$name_category,$parent_id)=mysqli_fetch_array($result_parent_category,MYSQLI_NUM);
      echo $name_category;
    }
    ?>
  </td>
    <td align="center"><a href="edit_category.php?id=<?php echo $category['id_category']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
  <?php 
      if ( $_SESSION['type_user'] == 0 ) {
  ?>
    <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_category.php?id=<?php echo $category['id_category']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
    </tr>
  <?php 
    }
  ?>
    <?php
  }

}
// Xứ lí form search file list_city.php
// Xử lý form search cho danh sách thành phố. Truyền vào các tham số là text_search (chuỗi tìm kiếm), page (trang hiện tại), và limit (số lượng kết quả hiển thị trên mỗi trang). Hàm này thực hiện các công việc sau:
//   Kết nối đến cơ sở dữ liệu ($dbc là biến kết nối cơ sở dữ liệu toàn cục).
//   Tính toán vị trí bắt đầu ($start) và số lượng kết quả hiển thị trên mỗi trang ($lm).
//   Thực hiện truy vấn SQL để lấy danh sách thành phố phù hợp với chuỗi tìm kiếm. Kết quả được lưu trong biến $result.
//   Kiểm tra số lượng kết quả trả về từ truy vấn. Nếu không có kết quả, hiển thị thông báo "Không tìm thấy kết quả". Ngược lại, hiển thị danh sách thành phố.
function city_search($text_search,$page, $limit) {
  global $dbc;
   $start = ( $page - 1 ) * $limit ;
  $lm = $limit;
  $query = "SELECT * FROM tb_city WHERE name_city LIKE". "'%" .$text_search."%' OR code_city LIKE". "'%" .$text_search."%' LIMIT $start,$lm";
  $result = mysqli_query($dbc, $query);
  kt_query($query,$result);
        // echo 
  if( mysqli_num_rows($result) <= 0) {
   echo "<tr>
   <td colspan='5' class='text-danger text-center'>Không tìm thấy kết quả</td>
   </tr>";
 }  else {
  $stt = 0;
  while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) { 
     $stt++;
    ?>
   <tr>
    <th><?php echo $stt; ?></th>
    <td><?php echo $rows['code_city']; ?></td>
    <td><?php echo $rows['name_city']; ?></td>

    <td align="center"><a href="edit_city.php?id=<?php echo $rows['id_city']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
    <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_city.php?id=<?php echo $rows['id_city']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
  </tr>
      <?php
    }



  }
}

// template list_city
// Hiển thị danh sách thành phố. Truyền vào các tham số là page (trang hiện tại) và limit (số lượng kết quả hiển thị trên mỗi trang). Hàm này thực hiện các công việc sau:
// Tính toán vị trí bắt đầu ($start) và số lượng kết quả hiển thị trên mỗi trang ($lm).
// Thực hiện truy vấn SQL để lấy danh sách thành phố theo trang. Kết quả được lưu trong biến $result.
// Hiển thị danh sách thành phố.
function list_city($page, $limit) { 
  $start = ( $page - 1 ) * $limit ;
  $lm = $limit;
 global $dbc;
 $query = "SELECT * FROM tb_city ORDER BY code_city LIMIT $start,$lm";
 $result = mysqli_query($dbc, $query);
 kt_query($query, $result);
 $stt = 0;
 while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  $stt++;
  ?>
  <tr>
    <th><?php echo $stt; ?></th>
    <td><?php echo $rows['code_city']; ?></td>
    <td><?php echo $rows['name_city']; ?></td>

    <td align="center"><a href="edit_city.php?id=<?php echo $rows['id_city']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
    <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_city.php?id=<?php echo $rows['id_city']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
  </tr>

    <?php
  }

}
// Xứ lí form search file list_district.php
//Nhận vào các tham số text_search (chuỗi tìm kiếm), page (trang hiện tại), và limit (số lượng kết quả trên mỗi trang). Hàm này thực hiện tìm kiếm các quận/huyện trong cơ sở dữ liệu dựa trên text_search, sau đó hiển thị kết quả trên trang. Hàm sẽ truy vấn cơ sở dữ liệu để lấy thông tin quận/huyện và tỉnh/thành phố tương ứng với điều kiện tìm kiếm, sau đó hiển thị kết quả dưới dạng bảng.
function district_search($text_search,$page, $limit) {
  global $dbc;
  $start = ( $page - 1 ) * $limit ;
  $lm = $limit;
  $query = "SELECT * FROM tb_district, tb_city WHERE tb_district.id_city = tb_city.id_city  && (name_district LIKE". "'%" .$text_search."%' OR code_district LIKE". "'%" .$text_search."%') LIMIT $start,$lm";
  $result = mysqli_query($dbc, $query);
  kt_query($query,$result);
        // echo 
  if( mysqli_num_rows($result) <= 0) {
   echo "<tr>
   <td colspan='5' class='text-danger text-center'>Không tìm thấy kết quả</td>
   </tr>";
 }  else {
  $stt = 0;
  while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) { 
     $stt++;
    ?>
  <tr>
    <th><?php echo $stt; ?></th>
    <td><?php echo $rows['code_district']; ?></td>
    <td><?php echo $rows['name_district']; ?></td>
    <td><?php echo $rows['name_city']; ?></td>
    <td ><a href="edit_district.php?id=<?php echo $rows['id_district']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
    <td><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_district.php?id=<?php echo $rows['id_district']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
  </tr>
      <?php
    }



  }
}
// template list_district
// Nhận vào các tham số page (trang hiện tại) và limit (số lượng kết quả trên mỗi trang). Hàm này thực hiện lấy danh sách các quận/huyện từ cơ sở dữ liệu và hiển thị trên trang dưới dạng bảng. Hàm cũng hỗ trợ phân trang bằng cách sử dụng page và limit để chỉ lấy các kết quả ứng với trang hiện tại.
function list_district($page, $limit) { 
 global $dbc;
 $start = ( $page - 1 ) * $limit ;
$lm = $limit;
 $query = "SELECT * FROM tb_district, tb_city WHERE tb_district.id_city = tb_city.id_city ORDER BY id_district LIMIT $start, $lm";
 $result = mysqli_query($dbc, $query);
 kt_query($query, $result);
 $stt = 0;
 while ($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  $stt++;
  ?>
  <tr>
    <th><?php echo $stt; ?></th>
    <td><?php echo $rows['code_district']; ?></td>
    <td><?php echo $rows['name_district']; ?></td>
    <td><?php echo $rows['name_city']; ?></td>
    <td><a href="edit_district.php?id=<?php echo $rows['id_district']; ?>"><i
    class="fa fa-fw fa-pencil"
    style="font-size: 20px; color:#1b926c;"></i> </a></td>
    <td><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
      href="delete_district.php?id=<?php echo $rows['id_district']; ?>"><i
      class="fa fa-fw fa-trash"
      style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
  </tr>

    <?php
  }

}
// Xứ lí form search file list_label.php
//Nhận vào tham số text_search (chuỗi tìm kiếm). Hàm này tìm kiếm các nhãn hiệu trong cơ sở dữ liệu dựa trên text_search và hiển thị kết quả trên trang dưới dạng bảng.
function label_search($text_search) {
  global $dbc;
    // 
  $query = "SELECT * FROM tb_label WHERE name_label LIKE". "'%".$text_search."%' || code_label LIKE" . "'%".$text_search."%'";
  $result = mysqli_query($dbc, $query);
  kt_query($query,$result);
        // echo 
  if( mysqli_num_rows($result) <= 0) {
   echo "<tr>
   <td colspan='4' class='text-danger text-center'>Không tìm thấy kết quả</td>
   </tr>";
 }  else {
  while ($label = mysqli_fetch_array($result, MYSQLI_ASSOC)) { ?>
  <tr>

    <td><?php echo $label['code_label']; ?></td>
    <td><?php echo $label['name_label']; ?></td>

    <td align="center"><a href="edit_label.php?id=<?php echo $label['id_label']; ?>"><i
      class="fa fa-fw fa-pencil"
      style="font-size: 20px; color:#1b926c;"></i></a></td>
     <?php 
         if ( $_SESSION['type_user'] == 0 ) {
      ?>
      <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
        href="delete_label.php?id=<?php echo $label['id_label']; ?>"><i
        class="fa fa-fw fa-trash"
        style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
    <?php 
      }
    ?>

        </tr> <?php
      }



    }
  }

// temlate list_label
//Hàm này lấy danh sách các nhãn hiệu từ cơ sở dữ liệu và hiển thị trên trang dưới dạng bảng.
  function list_label() {
   global $dbc;
   $query = 'SELECT * FROM tb_label ORDER BY id_label DESC';
   $result = mysqli_query($dbc, $query);
   kt_query($query, $result);
   while ($label = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    ?>
    <tr>
      <td><?php echo $label['code_label']; ?></td>
      <td><?php echo $label['name_label']; ?></td>

      <td align="center"><a href="edit_label.php?id=<?php echo $label['id_label']; ?>"><i
        class="fa fa-fw fa-pencil"
        style="font-size: 20px; color:#1b926c;"></i></a></td>
        <?php 
            if ( $_SESSION['type_user'] == 0 ) {
        ?>
        <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
          href="delete_label.php?id=<?php echo $label['id_label']; ?>"><i
          class="fa fa-fw fa-trash"
          style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
          <?php 
            }
          ?>
        </tr>

        <?php
      }

    }

// Xử lý form search file list_product.php
//Nhận vào các tham số text_search (chuỗi tìm kiếm), page (trang hiện tại) và limit (số lượng kết quả trên mỗi trang). Hàm này tìm kiếm các sản phẩm trong cơ sở dữ liệu dựa trên text_search và hiển thị kết quả trên trang dưới dạng bảng. Hàm cũng hỗ trợ phân trang bằng cách sử dụng page và limit để chỉ lấy các kết quả ứng với trang hiện tại.
    function product_search($text_search, $page = 1, $limit = 15){
     global $dbc;
     $start = ( $page - 1 ) * $limit ;
     $lm = $limit;
     $query = "SELECT * FROM tb_product WHERE name_product LIKE ". "'%".$text_search."%'" . " || code_product LIKE " . "'%".$text_search."%'" . " LIMIT $start, $lm";
     $result = mysqli_query($dbc, $query);
     kt_query($query,$result);
     if( mysqli_num_rows($result) <= 0) {
       echo "<tr>
       <td colspan='14' class='text-danger text-center'>Không tìm thấy kết quả</td>
       </tr>";
     }  else {
      while ($product = mysqli_fetch_array($result, MYSQLI_ASSOC)) { 
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
      <td><?php echo $sl; ?></td>
      <td><?php echo $product['id_category']; ?></td>
      <td><?php echo $product['id_label']; ?></td>
      <td><?php

      $img_product = explode(" ",  $product['image']);
      $stt = 0;
      foreach ($img_product as $value) {
        if(isset($value) && !empty($value)){
          ?>

          <img  style="width: 50px;" src="../<?php echo $value; ?>"  style="margin: 0 auto">

          <?php
          $stt++;
        }
      }
      ?></td>
      <td><?php echo number_format($product['price_product']) ; ?><br/><strong> VND</strong></td>
      <td><?php echo number_format($product['saleprice_product']) ; ?><br/><strong> VND</strong></td>
      <td><?php echo $product['describe_product']; ?></td>
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
          <?php 
              if ( $_SESSION['type_user'] == 0 ) {
          ?>
        <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
          href="delete_product.php?id=<?php echo $product['id_product']; ?>"><i
          class="fa fa-fw fa-trash"
          style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
          <?php 
            }
          ?>
        </tr>

        <?php
      }



    }
  }
  // template list_product 
  // Hàm này được sử dụng để hiển thị danh sách các sản phẩm. Hàm sẽ truy vấn dữ liệu từ bảng tb_product, tb_category, và tb_label và hiển thị kết quả dưới dạng bảng.
  function list_product($page = 1, $limit = 15) {
    global $dbc;
    $start = ( $page - 1 ) * $limit ;
    $lm = $limit;
    $query = "SELECT * FROM tb_product,tb_category,tb_label WHERE tb_product.id_category = tb_category.id_category && tb_label.id_label = tb_product.id_label  ORDER BY id_product DESC LIMIT $start, $lm";
    $result = mysqli_query($dbc, $query);
    kt_query($query, $result);
    while ($product = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
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
         <td><?php echo $sl; ?></td>
        <td><?php echo $product['name_category']; ?></td>
        <td><?php echo $product['name_label']; ?></td>
        <td><?php

        $img_product = explode(" ",  $product['image']);
        $stt = 0;
        foreach ($img_product as $value) {
          if(isset($value) && !empty($value)){
            ?>

            <img  style="width: 50px" src="../<?php echo $value; ?>"  style="margin: 0 auto">

            <?php
            $stt++;
          }
        }
        ?></td>
        <td><?php echo number_format($product['price_product']) ; ?><br/><strong> VND</strong></td>
        <td><?php echo number_format($product['saleprice_product']) ; ?><br/><strong> VND</strong></td>
        <td><?php echo $product['describe_product']; ?></td>
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
            <?php 
                if ( $_SESSION['type_user'] == 0 ) {
            ?>
          <td align="center"><a onClick="return confirm('Bạn thật sự muốn xóa không ?');"
            href="delete_product.php?id=<?php echo $product['id_product']; ?>"><i
            class="fa fa-fw fa-trash"
            style="font-size: 20px; color:rgba(26,27,23,0.87);"></i></a></td>
            <?php 
              }
            ?>
          </tr>

          <?php
        }

      }
      // temlate size 
      // file : edit_product.php
      //Hàm này tạo ra các phần tử HTML checkbox và input number dựa trên một mảng kích thước được cung cấp. Mảng $arary_size chứa các kích thước được truyền vào hàm. Hàm này sử dụng một mảng cố định $arary_size_text để định nghĩa các kích thước text như 's', 'm', 'l', 'xl', 'xxl', 'xxxl'. Dùng vòng lặp foreach để duyệt qua các kích thước và kiểm tra xem kích thước đó có tồn tại trong mảng $arary_size hay không. Nếu tồn tại, thì hiển thị checkbox đã được chọn và input number với giá trị tương ứng từ mảng $arary_size. Ngược lại, hiển thị checkbox không được chọn và input number với giá trị mặc định là 10.
      function temlate_size_text( $arary_size = array() ) {
        $arary_size_text = array('s', 'm', 'l', 'xl', 'xxl', 'xxxl');
        foreach ($arary_size_text as  $size) {
          if( array_key_exists( $size, $arary_size ) ) {
            ?>
            <input type="checkbox" id="<?php echo $size; ?>" name="size_<?php echo $size; ?>" value="<?php echo $size; ?>" class="check" checked>
            <label for="<?php echo $size; ?>" class="title-size"><?php echo strtoupper($size); ?></label>
            <input type="number" name="sl_<?php echo $size; ?>" value="<?php echo $arary_size[$size]; ?>" class="number">
            <?php
          } else {
            ?>
            <input type="checkbox" id="<?php echo $size; ?>" name="size_<?php echo $size; ?>" value="<?php echo $size; ?>" class="check">
            <label for="<?php echo $size; ?>" class="title-size"><?php echo strtoupper($size); ?></label>
            <input type="number" name="sl_<?php echo $size; ?>" value="10" class="number" disabled="disabled">
            <?php 
          }
        } 
      }
      //Hàm này tương tự như temlate_size_text, nhưng thay vì tạo ra các phần tử cho kích thước text, nó tạo ra các phần tử cho kích thước số. Hàm này sử dụng một mảng cố định $arary_size_number để định nghĩa các kích thước số từ '27' đến '44'.
      function temlate_size_number( $arary_size = array() ) {
        $arary_size_number = array('27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44');
        foreach ($arary_size_number as  $size) {
          if( array_key_exists( $size, $arary_size ) ) {
            ?>
            <input type="checkbox" id="<?php echo $size; ?>" name="size_<?php echo $size; ?>" value="<?php echo $size; ?>" class="check" checked>
            <label for="<?php echo $size; ?>" class="title-size"><?php echo strtoupper($size); ?></label>
            <input type="number" name="sl_<?php echo $size; ?>" value="<?php echo $arary_size[$size]; ?>" class="number">
            <?php
          } else {
            ?>
            <input type="checkbox" id="<?php echo $size; ?>" name="size_<?php echo $size; ?>" value="<?php echo $size; ?>" class="check">
            <label for="<?php echo $size; ?>" class="title-size"><?php echo strtoupper($size); ?></label>
            <input type="number" name="sl_<?php echo $size; ?>" value="10" class="number" disabled="disabled">
            <?php 
          }
        } 

      }
      // kết thúc temlate size
      function patination_product(){

      }
        // Hàm chuyển số tiền sang chữ
        // Đây là một hàm chuyển đổi số sang chữ. Hàm này chuyển đổi một số (được đưa vào qua tham số $number) thành biểu diễn chữ của số đó bằng tiếng Việt. Hàm này sử dụng một mảng $dictionary để định nghĩa các từ tương ứng với các chữ số và các đơn vị trong hệ số. Hàm sử dụng các phép toán và điều kiện để phân tách số thành các phần tử và xử lý chúng. Kết quả là một chuỗi chữ được tạo ra từ số đầu vào.
      function convert_number_to_words($number) {

        $hyphen      = ' ';
        $conjunction = '  ';
        $separator   = ' ';
        $negative    = 'negative ';
        $decimal     = ' point ';
        $dictionary  = array(
          0                   => 'Không',
          1                   => 'Một',
          2                   => 'Hai',
          3                   => 'Ba',
          4                   => 'Bốn',
          5                   => 'Năm',
          6                   => 'Sáu',
          7                   => 'Bảy',
          8                   => 'Tám',
          9                   => 'Chín',
          10                  => 'Mười',
          11                  => 'Mười một',
          12                  => 'Mười hai',
          13                  => 'Mười ba',
          14                  => 'Mười bốn',
          15                  => 'Mười năm',
          16                  => 'Mười sáu',
          17                  => 'Mười bảy',
          18                  => 'Mười tám',
          19                  => 'Mười chín',
          20                  => 'Hai mươi',
          30                  => 'Ba mươi',
          40                  => 'Bốn mươi',
          50                  => 'Năm mươi',
          60                  => 'Sáu mươi',
          70                  => 'Bảy mươi',
          80                  => 'Tám mươi',
          90                  => 'Chín mươi',
          100                 => 'trăm',
          1000                => 'ngàn',
          1000000             => 'triệu',
          1000000000          => 'tỷ',
          1000000000000       => 'nghìn tỷ',
          1000000000000000    => 'ngàn triệu triệu',
          1000000000000000000 => 'tỷ tỷ'
        );

        if (!is_numeric($number)) {
          return false;
        }

        if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
// overflow
          trigger_error(
            'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
            E_USER_WARNING
          );
          return false;
        }

        if ($number < 0) {
          return $negative . convert_number_to_words(abs($number));
        }

        $string = $fraction = null;

        if (strpos($number, '.') !== false) {
          list($number, $fraction) = explode('.', $number);
        }

        switch (true) {
          case $number < 21:
          $string = $dictionary[$number];
          break;
          case $number < 100:
          $tens   = ((int) ($number / 10)) * 10;
          $units  = $number % 10;
          $string = $dictionary[$tens];
          if ($units) {
            $string .= $hyphen . $dictionary[$units];
          }
          break;
          case $number < 1000:
          $hundreds  = $number / 100;
          $remainder = $number % 100;
          $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
          if ($remainder) {
            $string .= $conjunction . convert_number_to_words($remainder);
          }
          break;
          default:
          $baseUnit = pow(1000, floor(log($number, 1000)));
          $numBaseUnits = (int) ($number / $baseUnit);
          $remainder = $number % $baseUnit;
          $string = convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
          if ($remainder) {
            $string .= $remainder < 100 ? $conjunction : $separator;
            $string .= convert_number_to_words($remainder);
          }
          break;
        }

        if (null !== $fraction && is_numeric($fraction)) {
          $string .= $decimal;
          $words = array();
          foreach (str_split((string) $fraction) as $number) {
            $words[] = $dictionary[$number];
          }
          $string .= implode(' ', $words);
        }

        return $string;
      }
      ?>

