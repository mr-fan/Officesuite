<?php 
  if($_POST['ajaxcall'] == 1){  	
    	$newTitle = $sanitizer->text($_POST["value"]);
		$ajaxId = $sanitizer->text($_POST["pk"]);
  if(!$error) {
  		$p = $pages->get("id=$ajaxId");
		$p->of(false); // turn off output formatting
		$p->title = $newTitle; 
		$p->save(); //save the populated fields
		$success = true; 
		}
		exit(); // exit ist wichtig, damit der rest der seite nicht ausgeführt wird
	}
  if($_POST['ajaxcall'] == 2){  	
    	$newWert = str_replace(",", ".",$sanitizer->text($_POST["value"])); 
		$ajaxId = $sanitizer->text($_POST["pk"]);
  if(!$error) {
  		$p = $pages->get("id=$ajaxId");
		$p->of(false); // turn off output formatting
		$p->buchungWert = str_replace(",", ".",$newWert); 
		$p->save(); //save the populated fields
		$success = true; 
		}
		exit(); // exit ist wichtig, damit der rest der seite nicht ausgeführt wird
	}
include ("./head.inc"); 
?> 
<?php include("./scripts/subNavigation.php");  ?>
<div class="row">
  <div class="span12">
		<hr />
<?php 
$required_fields = array(
	'wert' => $sanitizer->text($input->post->title)
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
		$p->template = 'invoicePosten'; // set template
		$p->parent = wire('pages')->get('/rechnungen/system/settings/rechnungsposten/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->buchungWert = str_replace(",", ".",$sanitizer->text($input->post->wert));
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
    	<label class="control-label" for="title">Name</label>
    	<div class="controls">
      		<input type="text" id="title" name="title" required/>
    	</div>
  </div>  
	<div class="control-group">		
    		<label class="control-label" for="wert">Wert (netto)</label>
    		<div class="controls">
      			<input type="text" id="wert" name="wert" required class="span1"/><button class="btn disabled">€</button> 	
    	</div>
  	</div>  
  	<div class="control-group">
    	<label class="control-label"></label>
    	<div class="controls">
    	
      		<input type="submit" name="submit" value="Posten anlegen" class="btn btn-info" />
    	</div>
  </div> 
	
</form>
 <hr />
  <h4>Vorhandene Posten</h4>
<table class="table table-bordered table-condensed table-hover table-striped">
	<tr>
		<th>#</th>
		<th>Bezeichnung</th>
		<th>Wert</th>
	</tr>
      			<?php
				$rechnungsposten = $pages->get("/rechnungen/system/settings/rechnungsposten/")->children("include=hidden");
				$i = 1;
				foreach ($rechnungsposten as $posten) {
					echo " <tr>
								<td width='3%'>{$i}</td>
								<td width='25%'><a href='#' class='editierbar1' data-type='text' data-pk='{$posten->id}' data-url='./' data-original-title='{$posten->title}'>{$posten->title}</a></td>		
								<td><a href='#' class='editierbar2'  data-type='text' data-pk='{$posten->id}' data-url='./' data-original-title='{$posten->buchungWert}'>{$posten->buchungWert}</a> EUR</td>							
							</tr>	";
							$i++;
				}
				?>
</table> 
 </div>
</div>
<script src="<?php echo $config->urls->templates?>js/bootstrap-editable-inline.min.js"></script>
<script type="text/javascript"> 
	$('.editierbar1').editable( {params: function(params) {    
    	params.ajaxcall = 1;
    	return params;
	}});
	$('.editierbar2').editable( {params: function(params) {    
    	params.ajaxcall = 2;
    	return params;
	}});
	$('#ajaxFinished').ajaxComplete(function() {		
        $(this).html("<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Wert gespeichert.</strong> </div>").delay(500).fadeIn('slow').delay(2000).fadeOut('slow');       
	});
</script>
<?php include ("./foot.inc"); ?>
