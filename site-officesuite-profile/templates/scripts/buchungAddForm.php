<?php 
$heute = date('j-m-Y');
$required_fields = array(
	'title' => $sanitizer->text($input->post->title),
	'datum' => $sanitizer->text($input->post->buchungdatum),
	'buchungstext' => $sanitizer->text($input->post->buchungstext),
	'kostenart' => $sanitizer->text($input->post->kostenart),
	'steuersatz' => $sanitizer->text($input->post->steuersatz),
	'wert' => $sanitizer->text($input->post->wert),
	'ea' => $sanitizer->text($input->post->ea)	
);

// check if the form was submitted
if($input->post->submit) {
  	$datumstring = explode("-", $input->post->buchungdatum);
	$buchungTag = $datumstring[0]; 
	$buchungMonat = $datumstring[1]; 
	$buchungJahr = $datumstring[2]; 
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, create a new page
  if(!$error) {
		$p = new Page(); // create new page object
		$p->template = 'buchung'; // set template
		$p->parent = wire('pages')->get('/buchhaltung/buchungen/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->buchungBuchungstext = $sanitizer->text($input->post->buchungstext) ; // Populate a field
		$p->buchungTag = $sanitizer->text($buchungTag) ; // Populate a field
		$p->buchungMonat = $sanitizer->text($buchungMonat) ; // Populate a field
		$p->buchungJahr = $sanitizer->text($buchungJahr) ; // Populate a field
		$p->buchungKostenart = $sanitizer->text($input->post->kostenart) ; // Populate a field
		$p->buchungSteuersatz = $sanitizer->text($input->post->steuersatz) ; // Populate a field
		$p->buchungWert = str_replace(",", ".", $sanitizer->text($input->post->wert)) ; // Populate a field
		$p->buchungArt = $sanitizer->text($input->post->ea) ; // Populate a field
		$p->buchungbelegid = $sanitizer->text($input->post->buchungbelegid) ; // Populate a field	
		$p->save(); //save the populated fields
		$success = true; 
		}
	}
?>
<form action="./" method="post" id="submitform" class="form-horizontal">

		<div class="control-group">
    		<label class="control-label">Datum der Buchung</label>
    		<div class="controls">
      			<div class="input-append">
  					<input type="text" name="buchungdatum" class="span2 datepicker" value="<?= $heute ?>" id="dp1" data-date-format="dd-mm-yyyy"/>
				</div>
    		</div>
  	</div> 
	<hr /> <!-- Date -->
	
	<div class="control-group">		
    		<label class="control-label" for="buchungstext">Buchungskonto</label>
    		<div class="controls">
      			<select id="kostenart" data-placeholder="Buchungskonto wählen..." required name="kostenart" class="input-xxlarge chzn-select">
      				<option value=""></option>
      				<?php
					$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden, buchungKontenInaktiv=0");
					foreach ($kostenarten as $kostenart) {
					if ($kostenart->buchungKontenTyp == "Einnahme") {
						$marker = 'E';
					}
					else {
						$marker = 'A';
					}
					echo " <option class='optiontyp' data-buchungstyp='{$marker}' value='{$kostenart->id}' >{$marker} : {$kostenart->title} </option>	";
					}
					?>
      		</select>
    	</div>
  	</div>
  	<hr /> <!-- Konto -->
	<div class="control-group">
    	<label class="control-label" for="buchungbelegid">Beleg ID</label> 
    	<div class="controls">
      		<input type="text" id="buchungbelegid" name="buchungbelegid"  /><span class="help-inline">z.B. Rechnungsnummer</span>
    	</div>
  </div>
	<div class="control-group">
    	<label class="control-label" for="buchungstext">Beschreibung</label>
    	<div class="controls">
      		<input type="text" id="buchungstext" name="buchungstext" required /><span class="help-inline">z.B. Anschaffung neuer PC</span>  
    	</div>
  </div>
  <hr /> <!-- BelegID & Desc -->
	<div class="control-group">
    	<label class="control-label" for="wert">Wert (brutto) und Steuersatz</label>
    	<div class="controls">
      		      	<input type="text" id="wert" name="wert" required class="span1"/><button class="btn disabled">€</button> 	
      	 			<select id="steuersatz" name="steuersatz" class="span1">
      				<?php
						$steuersaetze = $pages->get("/buchhaltung/system/settings/buchhaltungSteuersaetze/")->children("include=hidden");
							foreach ($steuersaetze as $steuersatz) {
								echo " <option value='{$steuersatz->id}' >{$steuersatz->title} %</option>	";
						}?>			
      				</select> 
    	</div>
  </div>
  <hr /> <!-- Money & Tax -->

  <input type="hidden" name="title" id="title" value="buchung<?php echo time(); ?>" />
  <input type="hidden"  name="ea" id="ea" value=" " /> 
 
  	<div class="control-group">
    	<label class="control-label" ></label>
    	<div class="controls">
      		<input type="submit" name="submit" value="Buchung speichern" class="btn btn-info" />
    	</div>
  </div> 	
</form>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$('.datepicker').datepicker({autoclose:true}); 
$(".chzn-select").select2(); 
$(".chzn-select-deselect").select2({allow_single_deselect:true});

$(".chzn-select").select().change(
		function() 
		{
			$("input[name=ea]").val(
				$(this).children('option:selected').data('buchungstyp')
				);
		});
 </script>