<?PHP
include('includes/header.php');
?>

<style>
    .results{color:#009966;}
    .results1{color:#FF0000;}
</style>


 
<div class="row">
    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <?php
        include('inc/myconnect.php');
        include('inc/function.php');
        //nó kiểm tra xem có gửi dữ liệu thông qua phương thức POST hay không. Nếu có, nó tiến hành kiểm tra và xử lý các dữ liệu được gửi.
        if(isset($_POST['submit']))
        {
            $errors = array();
            //Nếu mã loại sản phẩm đã tồn tại, nó hiển thị thông báo lỗi.
            if(empty($_POST['code_category']))
            {
                $errors[] ='code_category';
            }
            else
            {
                $code=$_POST['code_category'];
            }

            if(empty($_POST['name_category']))
            {
                $errors[] ='name_category';
            }
            else
            {
                $name=$_POST['name_category'];
                $unaccentname_category= stripUnicode($name);
                $unaccentname_category= strtolower($unaccentname_category);
            }


            $parent_id=$_POST['parent_id'];
            if(empty($errors))
            {
                $query ="SELECT code_category FROM tb_category WHERE code_category='{$code}'";
                $result = mysqli_query($dbc,$query);
                kt_query($query,$result);

                if(mysqli_num_rows($result)==1)
                {
                    $message = "<p class='results1'>Loại sản phẩm này đã tồn tại</p>";
                }
                else
                {   
                    //Nếu mã loại sản phẩm chưa tồn tại, nó thực hiện một truy vấn SQL để chèn thông tin loại sản phẩm mới vào cơ sở dữ liệu.
                    $query_in = "INSERT INTO tb_category(code_category,name_category,unaccentname_category,parent_id)
									VALUES('{$code}','{$name}','{$unaccentname_category}','{$parent_id}')
						";
                    $result_in=mysqli_query($dbc,$query_in);
                    kt_query($query_in,$result_in);
                    //Nếu việc chèn thành công, nó hiển thị thông báo thành công và xóa các giá trị đã nhập từ form.
                    if($result_in==1)
                    {
                        echo "<p class='results'>Thêm mới thành công</p>";
                        $_POST['code_category'] ="";
                        $_POST['name_category'] ="";
                        $_POST['parent_id']=0;
                        $code=null;
                        $name=null;
                        $unaccentname_category=null;
                        $parent_id=null;
                    }
                    else
                    {//Nếu việc chèn không thành công, nó hiển thị thông báo lỗi.
                        echo "<p class='results1'>Thêm mới không thành công</p>";
                    }
                }
            }
            else
            {
                //Nếu có lỗi trong dữ liệu được gửi hoặc không có dữ liệu được gửi, nó hiển thị thông báo lỗi và chuyển hướng người dùng đến trang "list_category.php".
                $message = "<p class='results1'> Bạn hãy nhập đầy đủ thông tin </p>";
                header("Location: list_category.php");
            }
        }
        ?>
        <form name="frmadd-video" method="post">
            <?php
            if(isset($message)){echo $message;}
            ?>
            <h2 style="color: red">Thêm mới</h2>
            <div class="form-group">
                <label>Mã loại sản phẩm</label>
                <input type="text" name="code_category" value="<?php if(isset($_POST['code_category'])) {echo $_POST['code_category'];}?>" class="form-control"  placeholder='Nhập mã loại sản phẩm'/>
                <?php
                if (isset($errors) && in_array('code_category',$errors))
                {
                    echo "<p class='results1' >Bạn hãy nhập mã loại sản phẩm</p>";
                }
                ?>
            </div>

            <div class="form-group">
                <label>Tên loại sản phẩm</label>
                <input type="text" name="name_category" value="<?php if(isset($_POST['name_category'])) {echo $_POST['name_category'];}?>" class="form-control"  placeholder='Nhập tên loại sản phẩm'/>
                <?php
                if (isset($errors) && in_array('name_category',$errors))
                {
                    echo "<p class='results1' >Bạn hãy nhập tên loại sản phẩm</p>";
                }

                ?>
            </div>

            <div class="form-group">
                <label>Thuộc loại</label>
                <?php ctrSelect('parent_id','class'); ?>

            </div>

            <input type="submit" name="submit" class="btn btn-primary" value="Thêm mới"/>

        </form>
    </div>
</div>
<?PHP include('includes/footer.php');?>
<script type="text/javascript">
    $('.danh-muc .collapse').addClass('in');
    $('.danh-muc .loaisanpham').css({'background-color': '#e1e1e1'});
</script>