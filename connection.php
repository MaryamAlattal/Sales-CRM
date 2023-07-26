<?php
function connect(){
    $servername = "localhost";
    $database = "crmdb";
    $username = "root";
    $password = "";
    // Create connection
    // echo "establishing connection";
    $conn = mysqli_connect($servername, $username, $password, $database);
    
    // Check connection
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // echo "Connected successfully";
    // mysqli_close($conn);
    return $conn;
}


?>