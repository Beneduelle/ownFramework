<?php

namespace fw\core;

/**
 * Description of Router
 *
 */
class Router {
    
    /**
     * routes table
     * @var array
     */
    protected static $routes = [];
    
    /**
     * current route
     * @var array
     */
    protected static $route = [];
    
    /**
     * f-n for adding new route in route table
     * '^page/(?P<alias>[a-z-]+)$', ['controller' => 'Page', 'action' => 'view']
     * 
     * @param string $regexp for route
     * @param array $route ([controller, action, params])
     */
    public static function add($regexp, $route = []) {
        self::$routes[$regexp] = $route;
    }
    
    /**
     * return routes table
     * 
     * @return array
     */
    public static function getRoutes() {
        return self::$routes;
    }
    
    /**
     * return current route (controller, action, [params])
     * 
     * @return array
     */
    public static function getRoute() {
        return self::$route;
    }
    
    /**
     * looking for route in routes
     * @param string $url входящий URL
     * @return boolean
     */
    public static function matchRoute($url) {
        foreach(self::$routes as $pattern => $route){
            if(preg_match("#$pattern#i", $url, $matches)){
                //f-n preg_match split url and after place all items into array
                foreach($matches as $k => $v){
                    if(is_string($k)){
                        $route[$k] = $v;
                    }
                }
                //default action
                if(!isset($route['action'])){
                    $route['action'] = 'index';
                }
                // prefix for admin controllers
                if(!isset($route['prefix'])){
                    $route['prefix'] = '';
                }else{
                    $route['prefix'] .= '\\';
                }
                $route['controller'] = self::upperCamelCase($route['controller']);
                self::$route = $route;
                return true;
            }
        }
        return false;
    }
    
    /**
     * redirect function
     * @param string $url
     * @return void
     */
    public static function dispatch($url){
        $url = self::removeQueryString($url);
        if(self::matchRoute($url)){
            $controller = 'app\controllers\\' . self::$route['prefix'] . self::$route['controller'] . 'Controller';
            // debug($controller);
            if(class_exists($controller)){
                $cObj = new $controller(self::$route);
                $action = self::lowerCamelCase(self::$route['action']) . 'Action';
                // debug($action);
                if(method_exists($cObj, $action)){
                    $cObj->$action();
                    $cObj->getView();
                }else{
                    throw new \Exception("Method <b>$controller::$action</b> does not exist", 404);
                }
            }else{
                throw new \Exception("Controller <b>$controller</b> does not exist", 404);
            }
        }else{
//            http_response_code(404);
//            include '404.html';
            throw new \Exception("Page not found", 404);
        }
    }
    
    /**
     * to CamelCase transformer
     * @param string $name
     * @return string
     */
    protected static function upperCamelCase($name) {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $name)));
    }
    
    /**
     * first letter lower and rest of string upper camelCase
     * @param string $name
     * @return string
     */
    protected static function lowerCamelCase($name) {
        return lcfirst(self::upperCamelCase($name));
    }
    
    /**
     * cut GET parameters
     * @param string $url
     * @return string
     */
    protected static function removeQueryString($url) {
        if($url){
            $params = explode('&', $url, 2);
            if(false === strpos($params[0], '=')){
                return rtrim($params[0], '/');
            }else{
                return '';
            }
        }
    }
    
}
