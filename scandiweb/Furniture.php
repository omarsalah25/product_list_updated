<?php

include_once 'product.php';

class Furniture extends Product
{
    private $dimension;

    public function __construct()
    {
        $this->setType(2);
    }

    public function setAttribute()
    {
        $this->dimension = "height x width x length";
    }

    public function getAttribute()
    {
        return $this->dimension;
    }
}
