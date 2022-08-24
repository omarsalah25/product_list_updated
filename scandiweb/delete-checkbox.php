<?php
   include_once("DbConfig.php");
   include_once("Book.php");
   $sku = $_GET['sku'];
   $productValueQuery = "DELETE FROM product_value WHERE sku IN $sku";
   $productQuery = "DELETE FROM product WHERE sku IN $sku";
   $product=new Book();
   $product->deleteProducts($connection,$productValueQuery,$productQuery);
?>

