<?php

require_once( 'model/user.php' );

/****************************
* ----- LOAD SIGNUP PAGE -----
****************************/

function signupPage() {

  $user     = new stdClass();
  $user->id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;

  if( !$user->id ):
    require('view/auth/signupView.php');
  else:
    require('view/homeView.php');
  endif;

}

/***************************
* ----- Create user FUNCTION -----
***************************/
function newuser() {
  $user     = new stdClass();
  $User = new user;
  $User->createUser(); 
  //	$_POST['email']; $_POST['password']; $_POST['password_confirm'];
  $user->id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;



}