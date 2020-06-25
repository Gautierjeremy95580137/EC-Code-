<?php

/*************************************
* ----- INIT DATABASE CONNECTION -----
*************************************/

function init_db() {
  try {

    $host     = 'localhost';
    $dbname   = 'codflix';
    $charset  = 'utf8';
    $user     = 'root';
    $password = 'root';

    $db = new PDO( "mysql:host=$host;dbname=$dbname;charset=$charset", $user, $password );

  } catch(Exception $e) {

    die( 'Erreur : '.$e->getMessage() );

  }

  return $db;
}
/*************************************
* ----- INIT DATABASE SQLI CONNECTION -----
*************************************/

function init_sqli() {
  try {
	$serveurBD = "localhost";
    $nomUtilisateur = "root";
    $motDePasse = "root";
    $baseDeDonnees = "codflix";
	$conn = mysqli_connect($serveurBD, $nomUtilisateur, $motDePasse, $baseDeDonnees);
	$conn->set_charset("utf8");
  } catch(Exception $e) {

    die( 'Erreur : '.$e->getMessage() );

  }

  return $conn;
}
