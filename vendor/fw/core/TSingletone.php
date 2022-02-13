<?php

namespace fw\core;

/**
 * Singleton pattern
 * Used for creating only one instance of object
 */

trait TSingletone{

    protected static $instance;

    public static function instance() {
        if(self::$instance === null){
            self::$instance = new self;
        }
        return self::$instance;
    }
    
}