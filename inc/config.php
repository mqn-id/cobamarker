<?php 
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "monitoring";

$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
if ($conn->connect_error) {
    die("Koneksi Error: " . $conn->connect_error);
}
 ?>