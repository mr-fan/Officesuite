<?
// check if the owner wanna display his logo 
$logo = '';
if ($pages->get("/settings/")->settingsBranding ==1) {
	$logothumb = $pages->get("/settings/")->image->last()->height(19);
	$logo = "<a class='brand' href='{$config->urls->root}'><img src='$logothumb->url' title='Logo' alt='Logo' /></a>";
}
//error handling for submit forms
$success_message = "<div class='alert alert-success savemsg fade in'><button type='button' class='close' data-dismiss='alert'>×</button><h4>Erfolgreich gespeichert</h4></div>";								
$error_message = "<div class='alert fade in'><button type='button' class='close' data-dismiss='alert'>×</button><h4>Es ist ein Fehler aufgetreten, bitte prüfen Sie Ihre Eingabe!</h4></div>";


// Handle logouts
$homepage = $pages->get("/"); 
if($input->get->logout == 1) {
        $session->logout();
        $session->redirect($homepage->url);
}

// If they aren't logged in, then show the login form
if(!$user->isLoggedin()){

// check for login before outputting markup
if($input->post->user && $input->post->pass) {

        $user = $sanitizer->username($input->post->user);
        $pass = $input->post->pass;

        if($session->login($user, $pass)) {
                // login successful
                $session->redirect($homepage->url);
        }  else {
                $session->login_error = 'Login fehlgeschlagen. Bitte erneut versuchen.';
        }
} ?>

<!DOCTYPE html>
<html lang="de">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/<?php echo $pages->get("/settings/")->settingsStyle; ?>.css" />
	<script type="text/javascript" src="<?= $config->urls->templates?>js/jquery.js"></script>
	<script type="text/javascript" src="<?= $config->urls->templates?>js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="span4 offset4 well">
			<legend>Bitte einloggen</legend>
				<? if($input->post->user && $input->post->pass) {
        			echo "<div class='alert alert-error'>
                		<a class='close' data-dismiss='alert' href='#'>×</a>" . $session->login_error . "
            		</div>";
        	}?>          	
			<form method="post" action="./" accept-charset="UTF-8">
			<input type="text" id="user" class="span4" name="user" placeholder="Benutzername" required />
			<input type="password" id="pass" class="span4" name="pass" placeholder="Passwort" required />
            <button type="submit" name="submit" class="btn btn-success btn-block">Login</button>
			</form>    
		</div>
	</div>
</div>


</body>
</html>
<?
die(); // don't go any further if not logged in
} // end !logged in



//check if the systemsettings are filled
$kleinunternehmer = $pages->get("/settings/"); 
$systemsets = $kleinunternehmer;
	if (
		!$systemsets->Vorname OR
		!$systemsets->Name OR
		!$systemsets->Strasse OR
		!$systemsets->Plz OR
		!$systemsets->Ort OR
		!$systemsets->settingsSteuernummer
		) 
		{
			if ($page->url != $systemsets->url) 
			{ ?>
				<!DOCTYPE html>
				<html lang="de">
					<head>
						<meta http-equiv="content-type" content="text/html; charset=utf-8" />
						<title>System einrichten</title>
							<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/<?= $pages->get("/settings/")->settingsStyle; ?>.css" />
					</head>
					<body>
				<div class='container'>
					<div class='row'>
						<div class='span12'>
							<h1 class='alert alert-success'>System erfolgreich installiert.</h1>
							<h2>Bitte richten Sie nun das System ein</h2>
							<p>Sie finden die Systemeinstellungen <a href='<?= $systemsets->url; ?>' class='btn btn-big btn-success'>HIER</a></p>
						</div>
					</div>
				</div>
			</body>
		</html>
			<?php	die(); 
			}		
		}
//set prefix for invoices and clients
$rgkreis = $systemsets->settingsRechnungskreis;
$agkreis = $systemsets->settingsAngebotskreis;
$kdkreis = $systemsets->settingsKundennr;


?>
