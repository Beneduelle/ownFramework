<?php

namespace app\controllers\admin;

use app\models\User;
use fw\core\base\View;

class UserController extends AppController{

//    public $layout = 'default';

    public function indexAction(){
        View::setMeta('Admin panel :: Main page', 'Admin page description', 'Keywords');
        $test = 'Test variable';
        $data = ['test', '2'];
        /*$this->set([
            'test' => $test,
            'data' => $data,
        ]);*/
        $this->set(compact('test', 'data'));
    }

    public function loginAction(){
        if(!empty($_POST)){
            $user = new User();
            if(!$user->login(true)){
                $_SESSION['error'] = 'Login/password incorrect!';
            }
            if(User::isAdmin()){
                redirect(ADMIN);
            }else{
                redirect();
            }
        }
        $this->layout = 'login';
    }

}