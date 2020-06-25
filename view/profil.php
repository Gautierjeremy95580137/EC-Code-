<?php ob_start(); ?>


        <h2 class="title">mon profil</h2>

          <ul>
			<li><a href="index.php?action=DeleteAcc">Suppression du compte</a></li>
            <li><a href="index.php?action=changeE">Modification de l'email</a></li>
            <li><a href="index.php?action=changeMDP">Modification du mot de passe</a></li>
          </ul>
<?php
echo "Modification du mot de passe (avec confirmation par l’ancien mot de passe)<br>";
echo "Modification de l’adresse email<br>";
echo "Suppression complète du compte avec confirmation par le mot de passe. Ceci entraînera la<br>";

?>
<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>
