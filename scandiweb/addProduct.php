<?php
require_once("DbConfig.php");
include_once("Book.php");
$sku = $_POST['sku'];	
$name = $_POST['name'];
$price = $_POST['price'];
$type=$_POST['type'];
$attributeValue=$_POST['attributeValue'];

$insertProductQuery="INSERT INTO product (sku,product_name,price,type_id)
VALUES ('$sku', '$name','$price' ,'$type')";

$insertProductValueQuery = "INSERT INTO product_value (sku,attribute_type_id,value)
VALUES ('$sku','$type','$attributeValue')";

$product=new Book();

$product->addProduct($connection,$insertProductQuery,$insertProductValueQuery);


?>
