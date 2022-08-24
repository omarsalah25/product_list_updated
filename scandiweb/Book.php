<?php
include_once 'product.php';

class Book extends Product
{
    private $weight;

    public function __construct()
    {
        $this->setType(3);
    }

    public function setAttribute()
    {
        $this->weight = "weight";
    }

    public function getAttribute()
    {
        return $this->weight;
    }
}
