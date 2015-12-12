<?php 
	$choosen = $sanitizer->text($input->get->setHidden);
	$showOrHide = $sanitizer->text($input->get->hide);
	include ("./head.inc"); 
?>
<?php include("./scripts/subNavigation.php");  ?>
<div class="row">
  <div class="span12">
		<hr />
<?php 

$required_fields = array(
	'pageHide' => $sanitizer->text($input->post->pageHide),	
	'setStatus' => $sanitizer->text($input->post->setStatus)	
);

// check if the form was submitted
if($input->post->submit) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, update the page
  if(!$error) {
  		$name = $sanitizer->pageName($input->post->pageHide);
		if(strlen($name)) {			
  			$p = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->child("id=$name, include=hidden");
			$p->of(false); // turn off output formatting
			$p->buchungKontenInaktiv = $input->post->setStatus;
			$p->save();
			$success = true;
			}		
		}
	}
?>

<?php if(!$success) { ?>
 
  <?php if($error) { echo $error_message;} ?>
	<?php if($showOrHide==1) { ?>
 			<h3>Buchungskonto Ausblenden</h3>
			<form action="./" method="post" id="submitform" class="">
				<?php $updatepage = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->child("id=$choosen, include=hidden"); ?>
				<input type="hidden" name="setStatus" id="setStatus" value="1"  /> 
  				<input type="hidden" name="pageHide" id="pageHide" value="<?php echo $updatepage; ?>"  /> 	
				<input type="submit" name="submit" value="Konto Ausblenden" class="btn btn-primary" />
			</form>
	
		<?php }  else {?>
	 		<h3>Buchungskonto Einblenden</h3>
			<form action="./" method="post" id="submitform" class="">
				<?php $updatepage = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->child("id=$choosen, include=hidden"); ?>
				<input type="hidden" name="setStatus" id="setStatus" value="0"  /> 	
  				<input type="hidden" name="pageHide" id="pageHide" value="<?php echo $updatepage; ?>"  /> 	
				<input type="submit" name="submit" value="Konto Einblenden" class="btn btn-primary" />
			</form>
		<?php } ?> 

	
	<?php }  else { echo $success_message."<a href='../../../../buchhaltung/system/functions/buchhaltungkostenartadd/' title='zurück' class='btn'>Zurück</a> "; }?>

</div>
</div>
<?php include ("./foot.inc"); ?>