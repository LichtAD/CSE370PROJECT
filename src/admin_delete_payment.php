<?php 

// error_reporting(0);
session_start();


$host="localhost";

$user="root";

$password="";

$db="370project";


$data=mysqli_connect($host,$user,$password,$db);


if($_GET['payment_id']){
    $user_id = $_GET['payment_id'];

    $sql = "DELETE FROM payment WHERE p_id='$user_id' ";
    $result = mysqli_query($data, $sql);
    
    if($result){
        $_SESSION['message'] = 'Data has been deleted';
        header("location:admin_view_payment.php");
    }
}


?>