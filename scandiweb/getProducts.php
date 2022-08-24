
<?php
  include_once("DbConfig.php");
   include_once("Book.php");
	$query="SELECT * FROM product
    INNER JOIN attribute_type ON product.type_id = attribute_type.attribute_type_id
    INNER JOIN product_value ON product.sku = product_value.sku";
    $product=new Book();
    $product->getProducts($connection,$query);
?>
