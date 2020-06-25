<?php

require_once( 'database.php' );

class User {

  protected $id;
  protected $email;
  protected $password;

  public function __construct( $user = null ) {

    if( $user != null ):
      $this->setId( isset( $user->id ) ? $user->id : null );
      $this->setEmail( $user->email );
      $this->setPassword( $user->password, isset( $user->password_confirm ) ? $user->password_confirm : false );
    endif;
  }

  /***************************
  * -------- SETTERS ---------
  ***************************/

  public function setId( $id ) {
    $this->id = $id;
  }

  public function setEmail( $email ) {

    if ( !filter_var($email, FILTER_VALIDATE_EMAIL)):
      throw new Exception( 'Email incorrect' );
    endif;

    $this->email = $email;

  }

  public function setPassword( $password, $password_confirm = false ) {
    if( $password_confirm && $password != $password_confirm ):
      throw new Exception( 'Vos mots de passes sont différents' );
	endif;

    $this->password = $password;
  }

  /***************************
  * -------- GETTERS ---------
  ***************************/

  public function getId() {
    return $this->id;
  }

  public function getEmail() {
    return $this->email;
  }

  public function getPassword() {
    return $this->password;
  }

  /***********************************
  * -------- CREATE NEW USER ---------
  ************************************/

  public function createUser() {
    // Open database connection *****************
    $db   = init_db();
	$this->setEmail($_POST['email']);
	// Check if password = confirm password *********
	$this->setpassword($_POST['password'],$_POST['password_confirm']);
    // Check if email already exist ******************
    $req  = $db->prepare( "SELECT * FROM user WHERE email = '".$_POST['email']."'" );
    $req->execute( array( $this->getEmail() ) );
	$user = $req->fetch();
	$count = $req->rowCount();
	if( $count == 0 ) 
		{	
			// Insert new user
			$req->closeCursor();
			$req  = $db->prepare( "INSERT INTO user ( email, password ) VALUES ( '".$_POST['email']."','".$_POST['password']."')" );
			$req->execute( array(
			'email'     => $this->getEmail(),
			'password'  => $this->getPassword()
			));
			 echo "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;Bravo <b>".$this->getEmail()."</b> votre compte est crée ! <br>";
			 echo "<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Veuillez-vous connecter ! <b>";
			 require('view/auth/loginView.php');
			 
			 // ************** Generate random key
			$cle = md5(microtime(TRUE)*100000);
  
			// Insert key in DB (user table)
			$stmt = $db->prepare("UPDATE user SET cle=:cle WHERE email = :email");
			$stmt->bindParam(':cle', $cle);
			$stmt->bindParam(':email', $_POST['email']);
			$stmt->execute();
			 
			// setup email with activation link
			$email = $_POST['email'];
			$email = "jeremy.gautier@edu.itescia.fr";
			$destinataire = $email;
			$sujet = "Activer votre compte" ;
			$entete = "From: inscription@codflix.com" ;
			 
			// Activation link  + login: email and key
			$message = 'Bienvenue sur VotreSite,
			 
			Pour activer votre compte, veuillez cliquer sur le lien ci-dessous
			ou copier/coller dans votre navigateur Internet.
			 
			http://votresite.com/activation.php?log='.urlencode($email).'&cle='.urlencode($cle).'
			 
			 
			---------------
			Ceci est un mail automatique, Merci de ne pas y répondre.';
			 
			 $email = $_POST['email'];
			mail($destinataire, $sujet, $message, $entete) ; // Envoi du mail
		}
	else
		{
			$user = $req->fetch();
			echo "<br><br>   Erreur cet email:<b>".$this->getEmail()."</b> existe deja ! " ;
			require('view/auth/signupView.php');
		}
    // Close database connection
    $db = null;

  }

  /**************************************
  * -------- GET USER DATA BY ID --------
  ***************************************/

  public static function getUserById( $id ) {

    // Open database connection
    $db   = init_db();

    $req  = $db->prepare( "SELECT * FROM user WHERE id = ?" );
    $req->execute( array( $id ));

    // Close databse connection
    $db   = null;

    return $req->fetch();
  }

  /***************************************
  * ------- GET USER DATA BY EMAIL -------
  ****************************************/

  public function getUserByEmail() {

    // Open database connection
    $db   = init_db();

    $req  = $db->prepare( "SELECT * FROM user WHERE email = ?" );
    $req->execute( array( $this->getEmail() ));

    // Close databse connection
    $db   = null;

    return $req->fetch();
  }

}
