<?php
  if($_POST['ajaxcall'] == 1){  	
    	$newHeadline = $sanitizer->text($_POST["value"]);
		$ajaxId = $sanitizer->text($_POST["pk"]);
  if(!$error) {
  		$p = $pages->get("id=$ajaxId");
		$p->of(false); // turn off output formatting
		$p->headline = $newHeadline; 
		$p->save(); //save the populated fields
		$success = true; 
		}
		exit(); // exit ist wichtig, damit seite nicht ausgeführt wird
	}
include("./head.inc"); ?>
<?php include("./scripts/subNavigation.php");  ?>
<div class="row">
	<div class="span12">		
		<hr />
	</div>
</div>
<?php 
$datumstring = explode("-", $page->datum);
$displayform = $datumstring[1].'-'.$datumstring[0].'-'.$datumstring[2];

$erstellt = date("d.m.Y",$page->created);
$modified = date("d.m.Y",$page->modified);
	
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
		$p->template = 'invoiceAddedPosten'; // set template
		$p->parent = $page; // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->invoiceAddedPostenPage = $sanitizer->text($input->post->posten);
		$p->headline = $sanitizer->text($input->post->postenbeschreibung); 
		$p->buchungWert = $sanitizer->text($input->post->anzahl); 
		$p->addStatus(Page::statusHidden);
		$p->save(); //save the populated fields
		$success = true; 
		}
	}
// check if the 2nd form was submitted
if($input->post->submit2) {
	  	$p = $pages->get("/rechnungen/vorgaenge");  //update the counter fields  	
		if ($p->counterRg == 0)
		{
			$vorgangnr = 1;
		}
		else 
		{
			$vorgangnr = $p->counterRg;	
			$vorgangnr++;
		}			
		$p->of(false); // turn off output formatting
		$p->counterRg = $vorgangnr;
		$p->save();
		$vorgangnr = $rgkreis.$vorgangnr;
		
	$p = $pages->get("id=$page->id");	

	$p->of(false); // turn off output formatting
	$p->invoiceVorgangsart = $sanitizer->text($input->post->umwandeln) ;
			
		if ($systemsets->settingsCustomRg==1) // check if own invoice number is wished, if so populate the own number else generate it
		{
			$p->headline = $sanitizer->text($input->setVorgangNr);	
		}
		else 
		{
			$p->headline = $vorgangnr;
		}	
	$p->save();			
	$success = true; 
}
// check if the form was submitted
if($input->post->invoicePostenDel) {

  if(!$error) {
  	$name = $sanitizer->pageName($input->post->invoicePostenid);
		if(strlen($name)) {
  			$p = $page->child("id=$name, include=hidden");
  			if($p->id) $p->delete();
			echo "<div class='alert fade in'>
					<button type='button' class='close' data-dismiss='alert'>×</button>
					<strong>Posten gelöscht</strong></div>
				";
			}	 		
		}
	}
// check if the form was submitted
if($input->post->invoicefaellig) { //create a new entry in the calendar by grabbing the date from the invoice

  if(!$error) {
  		$datumstring = explode("-", $input->post->faelligdatum);
	  	$calendarioform = $datumstring[1].'-'.$datumstring[0].'-'.$datumstring[2]; 
		$p = $page;
		$p->of(false); // turn off output formatting
  		$p->datum = $sanitizer->text($calendarioform);
  		$p->save(); //save the page
  		$success = true;  		 		
		}
	}
// check if the form was submitted
if($input->post->invoiceclose1) { //close the invoice without adding it to the accounting module

  if(!$error) {
  			$p = $page;
			$p->of(false); // turn off output formatting
  			$p->buchungKontenInaktiv = 1;
  			$p->save(); //save the page
  			$success = true;  				 		
		}
	}
// check if the form was submitted
if($input->post->invoiceclose2) { //close the invoice and add it to the accounting module

  if(!$error) {
  			$tag =date("j") ;
	  		$monat =date("m") ;
	  		$jahr = date("Y");
  			$nameandtitle = "buchung".time();
			$rechnungswert = $sanitizer->text($input->post->rechnungssumme);
  			$p = $page;
			$p->of(false); // turn off output formatting
  			$p->buchungKontenInaktiv = 1;
			$p->invoiceInAccounting = 1;
  			$p->save(); //save the page
  			$p = new Page(); // create new page object in accounting
			$p->template = 'buchung'; // set template
			$p->parent = wire('pages')->get('/buchhaltung/buchungen/'); // set the parent 
			$p->name = $nameandtitle; // give it a name used in the url for the page
			$p->title = $nameandtitle; // set page title (not neccessary but recommended)
			$p->save(); //create the page
			// populate fields
			$p->buchungBuchungstext = $page->headline ; // Populate a field
			$p->buchungTag = $tag ; // Populate a field
			$p->buchungMonat = $monat ; // Populate a field
			$p->buchungJahr = $jahr ; // Populate a field
			$p->buchungKostenart = $page->invoiceBuchungsKonto->id ; // Populate a field
			$p->buchungSteuersatz = $pages->get('/settings/')->settingsTax->id ; // Populate a field
			$p->buchungWert = $rechnungswert ; // Populate a field
			$p->buchungArt = E ; // Populate a field
			$p->buchungbelegid = $page->headline ; // Populate a field		
			$p->save(); //save the populated fields			
			$success = true; 
			} 				 		
		}
	
// check if the form was submitted
if($input->post->invoiceopen) {

  if(!$error) {
  			$p = $page;
			$p->of(false); // turn off output formatting
  			$p->buchungKontenInaktiv = 0;
  			$p->save(); //save the page
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
	}
	
$vorgangsart = "Angebot"; // catch the type of the invoice
if ($page->invoiceVorgangsart == R)
	{
		$vorgangsart = "Rechnung";
	}	
?>
<div id='ajaxFinished' style="display:none"> </div> 
<div class="row">
	<div class="span6">
		<ul class="unstyled">
			<li><?= $page->invoiceKunde->kundeAnrede; ?></li>			
			<li><?= $page->invoiceKunde->settingsFirma; ?> <?= $page->invoiceKunde->Vorname; ?> <?= $page->invoiceKunde->Name; ?></li>
			<li><?= $page->invoiceKunde->Strasse; ?></li>
			<li><?= $page->invoiceKunde->Plz; ?> <?= $page->invoiceKunde->Ort; ?></li>
		</ul>
	</div>
	<div class="span6">
		<ul class="unstyled pull-right">			
			<li><h4><?= $vorgangsart; ?> <small><?= $page->headline; ?></small></h4></li>
			<li><?= $page->title; ?></li>
			<li>Erstellt durch: <?= $page->createdUser->name; ?></li>
			<li>Erstellt am: <?= $erstellt; ?></li>
			<li>Bearbeitet am: <?= $modified; ?></li>	
		</ul>		
	</div>
</div>
<div class="row">
	<div class="span12">	
		<hr />	
		<div class="row">
			<div class="span6">
				<?php  if ($page->buchungKontenInaktiv == 0) { ?>
					<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neuerPosten"><i class='icon-white icon-plus-sign'></i> Posten zufügen</a>	
				<?php } ?>	
				<?php if ($page->invoiceVorgangsart == "R" && $page->buchungKontenInaktiv == 0){ ?>
					<a class='btn btn-info btn-big' data-toggle="collapse" data-target="#faelligdatum"><i class='icon-calendar icon-white'></i> Fälligkeitsdatum</a>	
				<?php } ?>					
			</div>
			<div class="span6">
					<a href="<?= $pages->get("/rechnungen/system/functions/invoiceprint/")->url; ?>?invoice=<?=$page->id; ?>" class='btn btn-inverse btn-big pull-right' ><i class='icon icon-white icon-file'></i> PDF Export</a>				
			</div>
		</div>
<?php if ($page->invoiceVorgangsart == "R" && $page->buchungKontenInaktiv == 0){ ?>
	<div id="faelligdatum" class="collapse">
		<hr />
		<form action="./" method="post" id="submitform" class="form-horizontal">
			<div class="control-group">
    			<label class="control-label">Datum der Fälligkeit</label>
    			<div class="controls">
  						<input type="text" name="faelligdatum" class="span2 datepicker" value="<?= $displayform ?>" id="dp1" data-date-format="dd-mm-yyyy"/>
  						<input type="submit" name="invoicefaellig" class="btn btn-big btn-primary" value="Speichern" />					
    			</div>
    		</div>
		</form>
	</div>	
<?php } ?>				
<?php  if ($page->buchungKontenInaktiv == 0) { ?>
<div id="neuerPosten" class="collapse">
	<hr />
<form action="./" method="post" id="submitform" class="form-horizontal">
	<div class="control-group">		
    		<label class="control-label" for="posten">Posten wählen</label>
    		<div class="controls">
      			<select id="posten" required data-placeholder="Posten wählen..." name="posten" class="input-xlarge chzn-select">
      				<option value=""></option>
      				<?php
					$rechnungsposten = $pages->get("/rechnungen/system/settings/rechnungsposten/")->children("include=hidden");
					foreach ($rechnungsposten as $posten) {				
					echo " <option value='{$posten->id}' >{$posten->title} {$posten->buchungWert} EUR</option>	";
					}
					?>
      		</select>
    	</div>
  	</div>
	<div class="control-group">		
    		<label class="control-label" for="postenbeschreibung">Beschreibung</label>
    		<div class="controls">
      			<input type="text" id="postenbeschreibung" name="postenbeschreibung" required />
    	</div>
  	</div>  
	<div class="control-group">		
    		<label class="control-label" for="anzahl">Menge</label>
    		<div class="controls">
      			<input type="number" id="anzahl" name="anzahl" class="span1" min="1" value="1" required />
    	</div>
  	</div> 
  	<div class="control-group">
    	<label class="control-label"></label>
    	<div class="controls">
    		<input type="hidden" name="title" id="title" value="<?= time();?>" />
      		<input type="submit" name="submit" value="Posten anlegen" class="btn btn-info" />
    	</div>
  </div> 
</form>
</div>		
<?php } ?>

<hr />
  <table class="table table-bordered table-condensed table-hover table-striped">
	<thead>
	<tr>
		<th class="center" colspan="6">Buchungskonto: <?= $page->invoiceBuchungsKonto->title; ?></th>
	</tr>
	<tr>
		<th class="center">Position</th>
		<th>Leistungsbeschreibung</th>
		<th class="center">Menge</th>
		<th class="center">Einzelpreis</th>
		<th class="center">Gesamt</th>
		<th class="center"></th>
	</tr>		
	</thead>
<tbody>
	
<?php
$rechnungposten = $page->children("include=hidden");
$i = 1;
$rechnungsumme = 0;
if ($page->buchungKontenInaktiv == 1 OR $page->invoiceInAccounting == 1)
{
	$hideIt = "style=display:none;";
}
foreach ($rechnungposten as $posten) {
	
	$postengesamt = $posten->buchungWert*$posten->invoiceAddedPostenPage->buchungWert;
	?>		<tr>
						<td class='center'><?= $i ?></td>
						<td><?= $posten->invoiceAddedPostenPage->title ?>
							<?php if ($page->buchungKontenInaktiv == 0 OR $page->invoiceInAccounting == 0) { ?>
							<a href='#' class='editierbar' data-type='text' data-pk='<?= $posten->id ?>' data-url='./' data-original-title='<?= $posten->headline ?>'><?= $posten->headline ?></a>
							<?php } else { ?>
							<?= $posten->headline ?>	
							<?php } ?>	
						</td>
						<td class='center'><?= $posten->buchungWert ?></td>
						<td class='center'><?= str_replace(".", ",", $posten->invoiceAddedPostenPage->buchungWert) ?> EUR</td>
						<td class='center'><?= number_format($postengesamt, 2, ',', '.') ?> EUR</td>
						<td class='center'>
							<?php if ($page->buchungKontenInaktiv == 0 OR $page->invoiceInAccounting == 0) { ?> 
							<form action='./' method='post' class='tableform' >
								<input type='hidden' name='invoicePostenid' value='<?= $posten->id ?>' />
								<button type='submit' name='invoicePostenDel' class='label label-important link' data-original-title='Posten löschen' title='Posten löschen'><i class='icon icon-white icon-minus-sign'></i></button>						
							</form>
							<?php } ?>							
						</td>												
                    </tr>                         
<?
	 $i++;
	 $rechnungsumme +=$postengesamt;
}
	if ($systemsets->settingsKleinunternehmer == 0) {
		$steuersatz = $systemsets->settingsTax->title/100;
	 	$steuern = $rechnungsumme*$steuersatz;
	 	$rechnungswert = $rechnungsumme+$steuern;
	}
?>
</tbody>
<tfoot>
	<tr>
		<td colspan="6"></td>
	</tr>
	<?php if($systemsets->settingsKleinunternehmer == 0) { ?>  
	<tr>
		<td colspan="4" style="text-align: right">Summe (netto)</td>
		<td class="center"><?= $rechnungsumme ?> EUR</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: right">zzgl: <?= $systemsets->settingsTax->title ?> % Ust</td>
		<td class="center"><?= number_format($steuern, 2, ',', '.') ?> EUR</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: right">Summe (brutto)</td>
		<td class="center"><strong><?= number_format($rechnungswert, 2, ',', '.') ?> EUR</strong></td>
		<td></td>
	</tr>
	<?php } else { ?>
	<tr>
		<td colspan="4" style="text-align: right">Summe </td>
		<td class="center"><strong><?= number_format($rechnungsumme, 2, ',', '.') ?> EUR</strong></td>
		<td></td>
	</tr>	
	<?php } ?>
</tfoot>
</table>
<?php if ($page->invoiceVorgangsart == "A" && $page->buchungKontenInaktiv == 0){ ?>
<form action="./" method="post" class="form-horizontal">
	<input type="hidden" name="umwandeln" value="R" />				
	<?php if ($systemsets->settingsCustomRg==1) { ?>
	<button type="button" class="btn btn-success " data-toggle="collapse" data-target="#rechnungsnummer">In Rechnung umwandeln <b class="caret"></b></button> <button type="submit" name="invoiceclose1" class="btn btn-primary btn-big">Vorgang Schließen</button>
 	<div id="rechnungsnummer" class="collapse"> 
 		<hr />
  		<div class="control-group">
    		<label class="control-label" for="setVorgangNr">Rechnungsnummer vergeben</label>
    		<div class="controls">
      			<input class="span4" type="text" id="setVorgangNr" name="setVorgangNr"  /> 
    		</div>
  		</div> 
 		<div class="control-group">
    		<label class="control-label" ></label>
    		<div class="controls">
      			<input type="submit" name="submit2" value="Speichern" class="btn btn-info btn-big" />
    		</div>
  		</div>   		
 </div>	
<?php } ?>	
<?php if ($systemsets->settingsCustomRg==0) { ?>
	<input type="submit" name="submit2" class="btn btn-info btn-big" value="In Rechnung umwandeln" /> <input type="submit" name="invoiceclose1" class="btn btn-primary btn-big" value="Vorgang Schließen" />
<?}?>
</form>			
<?}?>

<?php if ($page->buchungKontenInaktiv == 0 && $page->invoiceVorgangsart == R) {?>
	<form action='./' method='post' >
		<?php if($systemsets->settingsKleinunternehmer == 0) { ?>  
		<input type="hidden" name="rechnungssumme" value="<?= number_format($rechnungswert, 2, '.', '') ?>" />	
		<?php } else { ?>
		<input type="hidden" name="rechnungssumme" value="<?= number_format($rechnungsumme, 2, '.', '') ?>" />	
		<?php	} ?>
		<div class="dropdown">
  			<a class="dropdown-toggle btn btn-primary btn-big" data-toggle="dropdown" href="#">Als Bezahlt markieren <b class="caret"></b></a>
  				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    				<li class="menuform">
    					<a class="link" data-placement="right" data-original-title="Vorgang ohne Übergabe abschliessen">
    						<i class="icon-inbox"></i><input type="submit" name="invoiceclose1" value="Ohne Buchung" />
    					</a>
    				</li>
    				<li class="divider"></li>
    				<li class="menuform">
    					<a class="link" data-placement="right" data-original-title="Vorgang schließen und an das Buchhaltungsmodul übergeben ">
    						<i class="icon-book"></i><input type="submit" name="invoiceclose2" value="Mit Buchung" />
    					</a>
    				</li>
  				</ul>
		</div>		
	</form>	
<?php }  if ($page->buchungKontenInaktiv == 1 && $page->invoiceInAccounting == 0) { ?>
	<h4 class="alert alert-success">Vorgang ist als abgeschlossen markiert.</h4>
	<form action='./' method='post' >
		<input type="submit" name="invoiceopen" class="btn btn-big btn-primary" value="Erneut öffnen" />
	</form>	
<?php } ?>
<?php if ($page->buchungKontenInaktiv == 1 && $page->invoiceInAccounting == 1) { ?>
	<h4 class="alert alert-success">Vorgang ist gebucht. Erneutes Öffnen nicht möglich.</h4>	
<?php } ?>
 
  </div>
</div>
<script src="<?php echo $config->urls->templates?>js/bootstrap-editable-inline.min.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/bootstrap-datepicker.js"></script>
<script type="text/javascript"> 
	$('.datepicker').datepicker({autoclose:true}); 
	$(".chzn-select").select2(); 
	$(".chzn-select-deselect").select2({allow_single_deselect:true});
	$('.editierbar').editable( {params: function(params) {    
    	params.ajaxcall = 1;
    	return params;
	}});
	$('#ajaxFinished').ajaxComplete(function() {		
        $(this).html("<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Wert gespeichert.</strong> </div>").delay(500).fadeIn('slow').delay(2000).fadeOut('slow');       
	});
</script>
<?php include("./foot.inc"); ?> 
