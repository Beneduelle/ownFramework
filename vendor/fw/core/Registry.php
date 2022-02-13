<?php

namespace fw\core;

/**
 * Registry pattern
 * Used for global access to objects
 */

class Registry {

    use TSingletone; //Trait

    protected static $properties = [];

    public function setProperty($name, $value){
        self::$properties[$name] = $value;
    }

    public function getProperty($name){
        if(isset(self::$properties[$name])){
            return self::$properties[$name];
        }
        return null;
    }

    public function getProperties(){
        return self::$properties;
    }

}
