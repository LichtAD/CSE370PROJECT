<!-- admin -->

<?php

session_start();

    if(!isset($_SESSION['username'])){
        header("location:login.php");
    }
    elseif($_SESSION['usertype']=='student'){
        header("location:login.php");
    }

    $host="localhost";

    $user="root";

    $password="";

    $db="370project";

    $data=mysqli_connect($host,$user,$password,$db);

    if($_GET['payment_id']){
        $user_id = $_GET['payment_id'];
    
        $sql = "SELECT * FROM payment WHERE p_id='$user_id' ";

        $result = mysqli_query($data,$sql);

        $info=$result->fetch_assoc();

        if (isset($_POST['update'])) {
            $pay_date = $_POST['date']; //name same as from name in form
            $pay_method = $_POST['method'];
            // $user_gender = $_POST['gender'];
            // $user_phone = $_POST['phone'];
            // $user_email = $_POST['email'];
            // $user_title = $_POST['title'];
            // $user_dept = $_POST['dept'];
            

            $query = "UPDATE payment SET p_date='$pay_date', p_method='$pay_method' WHERE p_id='$user_id' ";
            $result2=mysqli_query($data,$query);

            if($result2){
                header("location:admin_view_payment.php");
            }

        }
    }

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Admin Dashboard</title>

    <style type="text/css">

        label{
            display: inline-block;
            text-align: right;
            width: 100px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .div_deg{
            background-color: skyblue;
            width: 400px;
            padding-top: 70px;
            padding-bottom: 70px;
        }

    </style>

<?php

include "admin_css.php"

?>

</head>
<body>

	<?php

    include "admin_sidebar.php"

    ?>


	<div class="content">
        <center>
		<h1>Update Payment</h1>
        <h3>Payment ID <?php echo "{$info['p_id']}"; ?></h3>

		<div class="div_deg">

            <form action="#" method="POST">

                <div>
                    <label>Payment Date</label>
                    <input type="date" name="date" value="<?php echo "{$info['p_date']}"; ?>" >
                </div>

                <div>
                    <label>Method</label>
                    <input type="radio" name="method" value="Cash" value="<?php echo "{$info['p_method']}"; ?>" > Cash
                    <input type="radio" name="method" value="Online" value="<?php echo "{$info['p_method']}"; ?>" > Online
                </div>

                <div>
                    <input type="submit" class="btn btn-primary" name="update" value="Update Payment" >
                </div>

            </form>

        </div>
        </center>

	</div>

</body>
</html>