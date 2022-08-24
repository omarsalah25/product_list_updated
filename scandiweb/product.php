<?php

abstract class Product
{
    private $sku;
    private $name;
    private $price;
    private $type;
 
    public function getSKU()
    {
        return $this->sku;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function getType()
    {
        return $this->type;
    }

    public function setSKU($sku)
    {
        $this->sku = $sku;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function setType($type)
    {
        $this->type = $type;
    }

    public function addProduct($connection,$insertProductQuery,$insertProductValueQuery){

        $insertProductResult = $connection->query($insertProductQuery);

        $insertProductValueResult = $connection->query($insertProductValueQuery);
        $res=0;
        if ($insertProductResult == false &&  $insertProductValueResult == false ) {
           $res=0;
           echo json_encode($res);
           }
        else {
          $res=1;
          echo json_encode($res);
          }
    }

    function getProducts($connection,$query){

        $result = $connection->query($query);
		
        $rows = array();
        
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        
        echo json_encode($rows);
 
    }

    function deleteProducts($connection,$productValueQuery,$productQuery){

        $productValueResult =$connection->query($productValueQuery);
        $productQueryResult = $connection->query($productQuery);
        $res=0;
        if ($productValueResult == false ||  $productQueryResult == false ) {
            $res=0;
            echo json_encode($res);
            }
        else if ($productValueResult == true &&  $productQueryResult == true ) {
            $res=1;
            echo json_encode($res);
            }
    }
    
    abstract function getAttribute();
    abstract function setAttribute();
}
