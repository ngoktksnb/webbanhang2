<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 9/15/2017
 * Time: 4:40 PM
 */
?>
<style type="text/css">
</style>
<?PHP 
    include('includes/header.php');
    include('inc/function.php');
?> 
    <div class="row">
        <div class="col-xs-12">
            <h2 style=" color: red;">Danh Sách Giao hàng  <a href="list_delivery_sent.php" class="btn btn-primary" style="float: right;">Các các đơn hàng đã gửi </a></h2> 
            <table class="table table-striped"> 
                <thead> 
                    <tr>
                        <th>Mã hóa đơn</th>
                        <th>Mã ship</th>
                        <th>Họ và tên</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Ngày đặt hàng</th>
                        <th class="text-center">Xem chi tiết</th>
                        <th class="text-center">Đã gữi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        $query = "SELECT code_ship, name_customer, phone_customer, address_customer, order_day, code_bill, status_ship, 
                        tb_district.name_district, tb_city.name_city
                 FROM tb_order
                 INNER JOIN tb_district ON tb_order.id_district = tb_district.id_district
                 INNER JOIN tb_city ON tb_district.id_city = tb_city.id_city
                 INNER JOIN tb_bill ON tb_order.id_order = tb_bill.id_order
                 INNER JOIN tb_ship ON tb_bill.id_bill = tb_ship.id_bill
                 WHERE (status_ship = '0' OR status_ship = '2')
                 GROUP BY code_ship;
                 ";
                        $result = mysqli_query($dbc,$query);
                        kt_query($query, $result);
                        while ($order = mysqli_fetch_array($result, MYSQLI_NUM)) {
                        ?>                    
                    <tr style="<?php echo $order[6]==2 ?  'background: #e1e1e1' : ''; ?>">
                         <td ><?php echo $order[5]; ?></td>
                        <td><?php echo $order[0]; ?></td>
                        <td><?php echo $order[1]; ?></td>
                        <td><?php echo $order[2]; ?></td>
                        <td><?php echo $order[3]. ", " . $order[7]. ", " . $order[8]; ?></td>
                        <td><?php $date=date_create($order[4]);
                            echo date_format($date,"H:i - d/m/Y"); ?></td>
                         <td class="text-center"><a  href="delivery_detail.php?code_ship=<?php echo $order[0]; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                        <?php 
                            if ( $order[6] == 0 ) {
                           ?>
                       

                        <td class="text-center"><a onClick="return confirm('Hóa đơn đã được gửi');" href="functions/review_ship.php?code_ship=<?php echo $order[0]; ?>"><i class="glyphicon glyphicon-ok"></i></a></td>
                        <?php
                            } else {
                                ?>
                                <td></td>
                                <?php
                            }
                        ?>
                    </tr>
                    <?php
                        }
                    ?>
                </tbody>
            </table>
    </div>  



<?PHP 
    include('includes/footer.php');
?>

<script language="JavaScript">
    $("tr").attr("disabled", "disabled").off('click');
    function chkallClick(o) {
        var form = document.frmForm;
        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox" && form.elements[i].name!="chkall") {
                form.elements[i].checked = document.frmForm.chkall.checked;
            }
        }
    }
</script>
<script type="text/javascript">
    $('.giao-hang .collapse').addClass('in');
    $('.giao-hang .giaohang').css({'background-color': '#e1e1e1'});
</script>