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

    if(isset($_POST['add_payment'])){                                          //ekahne change
        $pay_date = $_POST['date'];
        $pay_method = $_POST['method'];
        // $t_gender = $_POST['gender'];
        // $t_phone = $_POST['phone'];
        // $t_email = $_POST['email'];
        // $t_title = $_POST['title'];
        // $t_dept = $_POST['dept'];
        // $user_type = "faculty";

        $sql = "INSERT INTO payment (p_date,p_method) VALUES ('$pay_date','$pay_method')";

        $result = mysqli_query($data, $sql);

        if($result){
            // echo "<script type='text/javascript'>
            // alert('Data Uploaded Successfully');
            // </script>";
            header("location:admin_view_payment.php");
        }
        else{
            echo "Upload Failed";
        }
    
    }

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Admin ADD Payment</title>

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
		<h1>Add Payment</h1>

		<div class="div_deg">

            <form action="#" method="POST">
                
                <div>
                    <label>Payment Date</label>
                    <input type="date" name="date" >
                </div>

                <div>
                    <label>Method</label>
                    <input type="radio" name="method" value="Cash" > Cash
                    <input type="radio" name="method" value="Online" > Online
                </div>
                
                <div>
                    <input type="submit" class="btn btn-primary" name="add_payment" value="Add Payment" >
                </div>

            </form>

        </div>
        </center>

	</div>

</body>
</html>