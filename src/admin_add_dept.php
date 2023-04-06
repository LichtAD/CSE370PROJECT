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

    if(isset($_POST['add_dept'])){                                          //ekahne change
        $dep_build = $_POST['buidno'];
        $dep_name = $_POST['dept'];
        // $t_gender = $_POST['gender'];

        $sql = "INSERT INTO dept (d_build_no,d_name) VALUES ('$dep_build','$dep_name')";

        $result = mysqli_query($data, $sql);

        if($result){
            // echo "<script type='text/javascript'>
            // alert('Data Uploaded Successfully');
            // </script>";
            header("location:admin_view_dept.php");
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
	<title>Admin ADD Dept Info</title>

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
            width: 395px;
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
		<h1>Add Department Info</h1>

		<div class="div_deg">

            <form action="#" method="POST">
                
                <!-- <div>
                    <label>Exam No</label>
                    <input type="number" name="examno" >
                </div> -->

                <div>
                    <label>Department Building No </label>
                    <input type="text" name="buidno" >
                </div>

                <div>
                    <label>Department Name</label>
                    <input type="radio" name="dept" value="CSE" >CSE
                    <input type="radio" name="dept" value="EEE" >EEE
                    <input type="radio" name="dept" value="BBA" >BBA
                    <input type="radio" name="dept" value="ENG" >ENG
                    <input type="radio" name="dept" value="ARC" >ARC
                    <!-- <input type="radio" name="dept" value="CIVIL" >CIVIL -->
                    <!-- <input type="radio" name="dept" value="MECHA" >MECHA -->
                    <input type="radio" name="dept" value="PHR" >PHR
                </div><br>
                
                <div>
                    <input type="submit" class="btn btn-primary" name="add_dept" value="Add Department" >
                </div>

            </form>

        </div>
        </center>

	</div>

</body>
</html>