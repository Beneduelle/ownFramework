<?php

namespace app\controllers;

/**
 * Description of Page
 *
 */
class PageController extends AppController{
    
    public function viewAction(){
        $menu = $this->menu;
        $title = 'Page';
        $this->set(compact('title', 'menu'));
//        debug($this->route);
        
    }
    
}
