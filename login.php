<?php

$conn = mysqli_connect("localhost", "root", "","botin");

if(!$conn){
    die ("Connection Failed!");
}

$username = $_POST['username'];
$password = $_POST['password'];

$sql = " SELECT * FROM employees WHERE username = '$username' AND password = '$password'";
$result = mysqli_query($conn,$sql);

if (mysqli_num_rows($result)>0) {
    echo "Success!";
    exit();
} else {
    echo "Login Failed!";
}

mysqli_close($conn);

?>