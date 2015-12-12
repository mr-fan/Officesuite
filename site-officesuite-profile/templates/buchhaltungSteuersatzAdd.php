<?php 
include ("./head.inc"); 
?>
<?php include("./scripts/subNavigation.php");  ?>
 
<div class="row">
  <div class="span12">
		<hr />
<?php 

$required_fields = array(
	'title' => $sanitizer->text($input->post->title)
);

// check if the form was submitted
if($input->post->submit) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, create a new page
  if(!$error) {
		$p = new Page(); // create new page object
		$p->template = 'buchhaltungKostenart'; // set template
		$p->parent = wire('pages')->get('/buchhaltung/system/settings/buchhaltungSteuersaetze/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->addStatus(Page::statusHidden);
		$p->save(); //save the populated fields
		$success = true; 
		}
	}
	if(!$success) 
	{ 
  		if($error) 
  		{
        	echo $error_message; 
  		} 
	}  
	else 
	{
  echo $success_message; 
	} ?>

<form action="./" method="post" id="submitform" class="form-horizontal">
	<div class="control-group">
    	<label class="control-label" for="title">Neuen Steuersatz anlegen</label>
    	<div class="controls">
      		<input type="text" id="title" name="title" required />
    	</div>
  </div>  
  	<div class="control-group">
    	<label class="control-label"></label>
    	<div class="controls">
      		<input type="submit" name="submit" value="Speichern" class="btn btn-info" />
    	</div>
  </div> 
	
</form>
<hr />
  <h4>Vorhandene Steuersätze</h4>
<table class="table table-bordered table-condensed table-hover table-striped">
      			<?php
				$steuersaetze = $pages->get("/buchhaltung/system/settings/buchhaltungSteuersaetze/")->children("include=hidden");
				foreach ($steuersaetze as $steuersatz) {
					echo " <tr><td>{$steuersatz->title} %</td></tr>	";
				}
				?>
</table>
  </div>
</div>
<?php include ("./foot.inc"); ?>
