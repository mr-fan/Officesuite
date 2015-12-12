<?php 
	$choosen = $sanitizer->text($input->get->delpage);
	include ("./head.inc"); 
	include ("./buchhaltungNavigation.php");
?>

<div class="row">
  <div class="span12">
		<hr />
<?php 

// set and sanitize our form field values
$form = array(
	'delpage' => $sanitizer->text($input->post->delpage)	
	);

$required_fields = array(
	'delpage' => $sanitizer->text($input->post->delpage)
	);

// check if the form was submitted
if($input->post->submit) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, delete the page
  if(!$error) {
  		$name = $sanitizer->pageName($input->post->delpage);
		if(strlen($name)) {
  			$p = $pages->get("/buchhaltung/buchungen/")->child("id=$name");
  			if($p->id) $p->delete();
  			$success = true;  
			}		
		}
	}
?>

<?php 
	if(!$success) { 
  		if($error) {
        	echo $error_message; 
	 	}
  ?>
  	<h3 class='alert alert-danger'>Achtung Sie löschen eine Buchung</h3>
	<form action="./" method="post" id="submitform" class="">
		<?php $delpage = $pages->get("/buchhaltung/buchungen/")->child("title=$choosen"); ?>
  		<input type="hidden" name="delpage" id="delpage" value="<?php echo $delpage; ?>"  /> 	
		<input type="submit" name="submit" value="Buchung Löschen" class="btn btn-primary" />
	</form>
<?php }  else { echo $success_message ;?>
	<a href='<?= $pages->get('template=buchhaltung')->url ?>' title='zurück' class='btn'>Zurück</a> 
  <?php } ?>
</div>
</div>
<?php include ("./foot.inc"); ?>
