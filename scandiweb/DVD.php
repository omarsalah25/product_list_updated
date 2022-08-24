<?php

include_once 'product.php';

class DVD extends Product
{
    private $size;

    public function __construct()
    {
        $this->setType(1);
    }

    public function setAttribute()
    {
        $this->size = "size";
    }

    public function getAttribute()
    {
        return $this->size;
    }
}
