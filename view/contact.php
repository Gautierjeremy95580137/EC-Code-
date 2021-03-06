<?php ob_start(); ?>

<?php
/*
    ********************************************************************************************
    SETUP
    ********************************************************************************************
*/
// To: is your email address. To send email to multiple addresses, separate them by comma
$destinataire = 'contact@codflix.com';
 
// copy ? (send a copy to visitor)
$copie = 'oui';
 
// form action(if your page has URL parameters )
// si cette page est index.php?page=contact alors mettez index.php?page=contact
// sinon, laissez vide
$form_action = '';
 
// Confirmed mail message
$message_envoye = "Votre message nous est bien parvenu !";
$message_non_envoye = "L'envoi du mail a échoué, veuillez réessayer SVP.";
 
// Error form message 
$message_formulaire_invalide = "Vérifiez que tous les champs soient bien remplis et que l'email soit sans erreur.";
 
/*
    ********************************************************************************************
    END OF SETUP
    ********************************************************************************************
*/
 
/*
 * This function do the cleanup and record a text
 */
function Rec($text)
{
    $text = htmlspecialchars(trim($text), ENT_QUOTES);
    if (1 === get_magic_quotes_gpc())
    {
        $text = stripslashes($text);
    }
 
    $text = nl2br($text);
    return $text;
};
 
/*
 * This function check the email syntax 
 */
function IsEmail($email)
{
    $value = preg_match('/^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9_](?:[a-zA-Z0-9_\-](?!\.)){0,61}[a-zA-Z0-9_-]?\.)+[a-zA-Z0-9_](?:[a-zA-Z0-9_\-](?!$)){0,61}[a-zA-Z0-9_]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/', $email);
    return (($value === 0) || ($value === false)) ? false : true;
}
 
// form sent => get all fields.
$nom     = (isset($_POST['nom']))     ? Rec($_POST['nom'])     : '';
$email   = (isset($_POST['email']))   ? Rec($_POST['email'])   : '';
$objet   = (isset($_POST['objet']))   ? Rec($_POST['objet'])   : '';
$message = (isset($_POST['message'])) ? Rec($_POST['message']) : '';
 
// Check variables and email ...
$email = (IsEmail($email)) ? $email : ''; // OR email is empty => wrong  OR = email
$err_formulaire = false; // used to fill the form in case of error (if needed)
 
if (isset($_POST['envoi']))
{
    if (($nom != '') && ($email != '') && ($objet != '') && ($message != ''))
    {
        // The 4 variables are filled => we generate and send the email
        $headers  = 'From:'.$nom.' <'.$email.'>' . "\r\n";
        //$headers .= 'Reply-To: '.$email. "\r\n" ;
        //$headers .= 'X-Mailer:PHP/'.phpversion();
 
        // Send copy to visitor ?
        if ($copie == 'oui')
        {
            $cible = $destinataire.';'.$email;
        }
        else
        {
            $cible = $destinataire;
        };
 
        // Replace special characteres
        $caracteres_speciaux     = array('&#039;', '&#8217;', '&quot;', '<br>', '<br />', '&lt;', '&gt;', '&amp;', '…',   '&rsquo;', '&lsquo;');
        $caracteres_remplacement = array("'",      "'",        '"',      '',    '',       '<',    '>',    '&',     '...', '>>',      '<<'     );
 
        $objet = html_entity_decode($objet);
        $objet = str_replace($caracteres_speciaux, $caracteres_remplacement, $objet);
 
        $message = html_entity_decode($message);
        $message = str_replace($caracteres_speciaux, $caracteres_remplacement, $message);
 
        // Send email
        $num_emails = 0;
        $tmp = explode(';', $cible);
        foreach($tmp as $email_destinataire)
        {
            if (mail($email_destinataire, $objet, $message, $headers))
                $num_emails++;
        }
 
        if ((($copie == 'oui') && ($num_emails == 2)) || (($copie == 'non') && ($num_emails == 1)))
        {
            echo '<p>'.$message_envoye.'</p>';
        }
        else
        {
            echo '<p>'.$message_non_envoye.'</p>';
        };
    }
    else
    {
        // one variable or more than one is empty...
        echo '<p>'.$message_formulaire_invalide.'</p>';
        $err_formulaire = true;
    };
}; // end of if (!isset($_POST['envoi']))
 
if (($err_formulaire) || (!isset($_POST['envoi'])))
{
    // Display form
    echo '
    <div style="text-align: center" class="formclass">
    <form id="contact" method="post" action="'.$form_action.'">
    <fieldset><legend>Vos coordonnées</legend>
        <p><label for="nom">Nom :</label><input style="width: 300px; border-radius:10px"type="text" id="nom" name="nom" value="'.stripslashes($nom).'" /></p>
        <p><label for="email">Email :</label><input style="width: 300px; border-radius:10px" type="text" id="email" name="email" value="'.stripslashes($email).'" /></p>
    </fieldset>
 
    <fieldset><legend>Votre message</legend>
        <p><label for="objet">Objet :</label><input style="width: 300px; border-radius:10px" type="text" id="objet" name="objet" value="'.stripslashes($objet).'" /></p>
        <p><label  for="message">Message :</label><textarea style="border-radius:15px; "  id="message" name="message" cols="35" rows="7">'.stripslashes($message).'</textarea></p>
    </fieldset>
 
    <div style="text-align:center";><input style="background-color: #f72035; border-radius:10px"; type="submit" name="envoi" value="Envoyer le formulaire !" /></div>
    </form>
    </div>
    ';

};
?>


<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>
