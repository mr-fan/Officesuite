<?php 
include ("./head.inc"); 
$erstellt = date("d.m.Y",$page->created);
$modified = date("d.m.Y",$page->modified);
?>
<?php include("./scripts/subNavigation.php");  ?>
<?php 
$required_fields = array(
);

// check if the form was submitted
if($input->post->submit) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) 
  	{
        if( trim($value) == '' ) 
        {
          $error = true;
        }
  }
// if no errors, update the page
  if(!$error) {  			
  			$p = $pages->get("id=$page->id");
			$p->of(false); // turn off output formatting
    		
			$p->Name = $sanitizer->text($input->post->kundename) ; // Populate a field
			$p->Vorname = $sanitizer->text($input->post->kundevorname) ; // Populate a field
			$p->Strasse = $sanitizer->text($input->post->kundestrasse) ; // Populate a field
			$p->Plz = $sanitizer->text($input->post->kundeplz) ; // Populate a field
			$p->Ort = $sanitizer->text($input->post->kundeort) ; // Populate a field
			$p->email = $sanitizer->text($input->post->kundeemail) ; // Populate a field
			$p->Telefon = $sanitizer->text($input->post->kundetelefon) ; // Populate a field
			$p->kommentar  = $sanitizer->text($input->post->kundekommentar) ;	
			$p->settingsFirma  = $sanitizer->text($input->post->firmenname) ;			
			$p->save();			
			$success = true; 
		}
	}

$required_fields = array(
	'kunde' => $sanitizer->text($input->post->title)
);

// /////////////// Create a new Invoice for this client //////////////////
// check if the form was submitted
if($input->post->submit2) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {          
          $error = true;
        }
  }
// if no errors, create a new page
  if(!$error) {
    		$p = $pages->get("/rechnungen/vorgaenge");  //update the counter fields  	
    		$p->of(false); // turn off output formatting	
    		if ($p->counterVg == 0)
			{
				$anzahlvorgaenge = 1;
				$p->counterVg = $anzahlvorgaenge;
				$p->save();
			}	
			else {
				$anzahlvorgaenge = $p->counterVg;
				$anzahlvorgaenge++;
				$p->counterVg = $anzahlvorgaenge;
				$p->save();
			} 
  		if ($input->post->vorgangsart == R) //look which type of invoice is created, count the special type and give it +1 to form the invoice number
		{
			if ($p->counterRg == 0)
			{
				$vorgangnr = 1;
			}
			else 
			{
				$vorgangnr = $p->counterRg;	
				$vorgangnr++;
			}	
					
			$p->counterRg = $vorgangnr;
			$p->save();
			$vorgangnr = $rgkreis.$vorgangnr;
		}
		else 
		{
			if ($p->counterAg == 0)
			{
				$vorgangnr = 1;
			}
			else 
			{
				$vorgangnr = $p->counterAg;	
				$vorgangnr++;
			}	
			$p->counterAg = $vorgangnr;
			$p->save();
			$vorgangnr = $agkreis.$vorgangnr;
		}
		$p = new Page(); // create new page object
		$p->template = 'invoiceDetail'; // set template
		$p->parent = wire('pages')->get('/rechnungen/vorgaenge/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->invoiceKunde = $sanitizer->text($input->post->kunde);
		if ($systemsets->settingsCustomRg==1) // check if own invoice number is wished, if so populate the own number else generate it
		{
			$p->headline = $sanitizer->text($input->setVorgangNr);	
		}
		else 
		{
			$p->headline = $vorgangnr;
		}	
		$p->invoiceVorgangsart = $sanitizer->text($input->post->vorgangsart);
		$p->invoiceBuchungsKonto = $sanitizer->text($input->post->kostenart); 
		$p->save(); //save the populated fields
		$newInvoice = $p->url;
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
		$vorgaenge = $pages->get("/rechnungen/vorgaenge/"); 
		$count = $vorgaenge->counterVg; 
		$count++;	
		if (empty($count))
		{
			$count = 1;
		}	 
 ?>
<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?>
<div class="row">
	<div class="span12">
		<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neuerVorgang"><i class='icon icon-white icon-plus-sign'></i> Neuen Vorgang anlegen</a>
		<?if ($newInvoice) { echo"<a href='$newInvoice' class='btn btn-info btn-big'><i class='icon-white icon-folder-open'></i> Erstellten Vorgang aufrufen</a>"; }  ?>
		<hr />
		<div id="neuerVorgang" class="collapse">
			<form action="./" method="post" id="submitform" class="form-horizontal">
				<div class="control-group">
    				<label class="control-label" for="vorgangsart">Vorgangsart bestimmen</label>
    				<div class="controls">
      					<select id="vorgangsart" name="vorgangsart">
      						<option value="R">Rechnung</option>
      						<option value="A">Angebot</option>
      					</select><span class="help-inline">Die Vorgangsart kann später in der Detailansicht geändert werden.</span>
    				</div>
  				</div> 
  				 <?php if ($systemsets->settingsCustomRg==1) { ?>
  				<div class="control-group">
    				<label class="control-label" for="setVorgangNr">Vorgangsnummer</label>
    				<div class="controls">
      					<input class="span4" type="text" id="setVorgangNr" name="setVorgangNr"  required /> 
    				</div>
  				</div> 		
  				<?php } ?> 
  				<div class="control-group">		
    				<label class="control-label" for="buchungstext">Buchungskonto</label>
    				<div class="controls">
      					<select id="kostenart" data-placeholder="Buchungskonto wählen..." name="kostenart" class="input-xxlarge chzn-select">
      						<option value=""></option>
      						<?php
							$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden,buchungKontenTyp=Einnahme, buchungKontenInaktiv=0");
							foreach ($kostenarten as $kostenart) 
							{
								echo " <option class='optiontyp' value='{$kostenart->id}' >{$kostenart->title}</option>	";
							}
							?>
      					</select>
      					
    				</div>
  				</div>  
  				<div class="control-group">
    				<label class="control-label"></label>
    				<div class="controls">
    					<input type="hidden" name="title" value="Vorgang-<?= $count ?>" />
    					<input type="hidden" name="kunde" value="<?= $page->id ?>" />
      					<input type="submit" name="submit2" value="Vorgang anlegen" class="btn btn-info" />
    				</div>
  				</div> 
  				
				<hr />
			</form>
		</div>
	</div>
</div>	
<?php } ?> <!-- check role end -->
				<div class="row">
					<form action="./" method="post"  class="form-horizontal" >
						<div class="span6">  
						<h4>Kundendaten</h4>  
						<hr /> 
						<div class="control-group">
    						<label class="pull-left" for="firmenname">Firmenname</label>
    						<div class="controls">
      							<input type="text" id="firmenname" name="firmenname" value="<?= $page->settingsFirma; ?>"/>
    						</div>
  						</div>
  						    			
          				<div class="control-group">
    						<label class="pull-left" for="mitarbeitername">Name</label>
    						<div class="controls">
      							<input type="text" id="kundename" name="kundename" value="<?=  $page->Name; ?>" />
    						</div>
  						</div>  
  						
  						<div class="control-group">
    						<label class="pull-left" for="kundevorname">Vorname</label>
    						<div class="controls">
      							<input type="text" id="kundevorname" name="kundevorname" value="<?=  $page->Vorname ; ?>"/>
    						</div>
  						</div> 
  						
  						<div class="control-group">
    						<label class="pull-left" for="kundestrasse">Straße</label>
    						<div class="controls">
      							<input type="text" id="kundestrasse" name="kundestrasse"  value="<?=  $page->Strasse ; ?>"/>
    						</div>
  						</div> 
  						
  						<div class="control-group">
    						<label class="pull-left" for="kundeplz">PLZ</label>
    						<div class="controls">
      							<input type="text" id="kundeplz" name="kundeplz" value="<?=  $page->Plz ; ?>" />
    						</div>
  						</div> 
  						
  						<div class="control-group">
    						<label class="pull-left" for="kunderort">Ort</label>
    						<div class="controls">
      							<input type="text" id="kundeort" name="kundeort" value="<?=  $page->Ort ; ?>" />
    						</div>
  						</div> 
  						
    					<div class="control-group">
    						<label class="pull-left" for="kundetelefon">Telefonnummer</label>
    						<div class="controls">
      							<input type="text" id="kundetelefon" name="kundetelefon"  value="<?=  $page->Telefon ; ?>"/>
    						</div>
  						</div>
  						
      					<div class="control-group">
    						<label class="pull-left" for="kundeemail">
    							<?php if(!$page->email) { ?> 
    								E-Mail Adresse
    							<?php } else { ?> 
    								<a href="mailto:<?= $page->email ?>">E-Mail Adresse</a>
    							<?php } ?>    							
    						</label>
    						<div class="controls">
      							<input type="text" id="kundeemail" name="kundeemail"  value="<?=  $page->email ; ?>"/>
    						</div>
  						</div>  
  								
				</div>	<!-- /span6-->
				<div class="span6">
					<h4>KundenNr: <?php echo $page->kundeNr; ?></h4>
					<hr />
					<p class="well">
          				erstellt: <i class="icon-user"></i>  <a href="<?= $page->createdUser->url; ?>"><?= $page->createdUser->name; ?></a> 
         				<i class="icon-calendar"></i> <?= $erstellt; ?>
          				| editiert: <i class="icon-user"></i> <a href="<?= $page->modifiedUser->url; ?>"><?= $page->modifiedUser->name; ?></a>
          				<i class="icon-pencil"></i> <?= $modified; ?>
        			</p>        			
					<hr />
					<h5>Anmerkungen</h5>							
					<textarea id="kundekommentar" name="kundekommentar" class="span6"><?= $page->kommentar ?></textarea>				
					<hr />
					<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?>
					<h5>Offene Vorgänge:</h5>
						<table class="table table-condensed table-hover table-bordered table-striped">
							<tr>
								<th class="center">Vorgang</th>
								<th colspan="2">Erstellt am</th>
							</tr>
						<?php 
						$vorgaenge = $pages->find("parent=/Rechnungen/vorgaenge/, invoiceKunde=$page->id,buchungKontenInaktiv=0, include=hidden");
						foreach($vorgaenge as $vorgang)
						{
							$erstellt = date("d.m.Y",$vorgang->created);
							echo "
							<tr>
								<td class='center'><a href='$vorgang->url'>$vorgang->headline</a></td>	
								<td>$erstellt</td>
								<td class='center'><a href='$vorgang->url' class='label label-info link' data-original-title='Vorgang bearbeiten'><i class='icon icon-white icon-pencil'></i></a></td>						
							</tr>";
						};
						?>						
						</table>
						<?php }?><!-- end role check -->
					</div>
					<?php if($user->hasRole("kunden") OR $user->isSuperuser()) { ?>					
					<div class="span12">
						<hr />	
						<input type="submit" name="submit" value="Änderungen speichern" class="btn btn-primary" />
						<a class="btn btn-danger pull-right" href="<?= $pages->get("/kunden/system/functions/kundeDel")->url; ?>?choosen=<?= $page->id?>">Kunden Löschen</a> 
					</div>
					<?php } ?> 
				</form>
		</div>	 
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript"> 
	$(".chzn-select").select2(); 
	$(".chzn-select-deselect").select2({allow_single_deselect:true});
</script> 
<?php include ("./foot.inc"); ?>