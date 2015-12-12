<?php include("./head.inc");  ?>
<?php include("./scripts/subNavigation.php");  ?>
<?php include("./scripts/invoicefunc.php");  ?>
<div class="row">
	<div class="span12">
		<hr />
		<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neuerVorgang"><i class='icon icon-white icon-plus-sign'></i> Neuen Vorgang anlegen</a>
		<?if ($newInvoice) { echo"<a href='$newInvoice' class='btn btn-info btn-big'><i class='icon-white icon-folder-open'></i> Erstellten Vorgang aufrufen</a>"; }  ?>
		<hr />
		<div id="neuerVorgang" class="collapse">
		<form action="./" method="post" class="form-horizontal">
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
    		<label class="control-label" for="kostenart">Buchungskonto</label>
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
    		<label class="control-label" for="kunde">Kunden zuordnen</label>
    		<div class="controls">
      			<select id="kunde" required data-placeholder="Kunden wählen..." name="kunde" class="input-xxlarge chzn-select">
      				<option value=""></option>
      				<?php
					$kunden = $pages->get("/kunden/adressen/")->children("include=hidden");
					foreach ($kunden as $kunde) {					
					echo " <option class='optiontyp' value='{$kunde->id}' >{$kunde->settingsFirma} {$kunde->Vorname} {$kunde->Name} </option>	";
					}
					?>
      		</select>
    	</div>
  	</div>  
  	<div class="control-group">
    	<label class="control-label"></label>
    	<div class="controls">
    		<input type="hidden" name="title" value="Vorgang-<?= $count ?>" />
      		<input type="submit" name="submit" value="Vorgang anlegen" class="btn btn-info" />
    	</div>
  </div> 
</form>
		</div>
		<h4 class="alert alert-info">Offene Rechnungen</h4>
  <table class="table table-bordered table-condensed table-hover table-striped" id="datenGrid">
	<thead>
	<tr>
		<th>Nr.</th>
		<th>Kunde</th>
		<th>Erstellt</th>
		<th>Fällig am</th>
		<th class="center">Wert</th>
		<th class="center">Optionen</th>
	</tr>		
	</thead>
<tbody>
	
<?php
$rechnungen = $pages->get("/rechnungen/vorgaenge/")->children("invoiceVorgangsart=R,buchungKontenInaktiv=0, include=hidden, universalCheck=0");
foreach ($rechnungen as $rechnung) {
	$rechnungsposten = $rechnung->children("include=hidden");
	$datumstring = explode("-", $rechnung->datum);
	$displayform = $datumstring[1].'.'.$datumstring[0].'.'.$datumstring[2];
	$rechnungsumme = 0;
	foreach ($rechnungsposten as $posten)
	{
		$postengesamt = $posten->buchungWert*$posten->invoiceAddedPostenPage->buchungWert;	
		$rechnungsumme +=$postengesamt;		
		$rechnungwert = number_format($rechnungsumme, 2, ',', '.');
		$buchungsWert = str_replace(",", ".", $rechnungsumme) ;		
		$rechnungwert .=" EUR";
	}
	$erstellt = date("d.m.Y",$rechnung->created);
	if ($rechnungsumme == 0)
	{
		$rechnungwert	= "<a href='$rechnung->url'>Posten zufügen</a>";
	} ;
	
	$gesamtwert +=$rechnungsumme;
	?> 		<tr>
						<td><a href='<?= $rechnung->url ?>'><?= $rechnung->headline ?></a></td>
						<td>[<?= $rechnung->invoiceKunde->kundeNr ?>] <?= $rechnung->invoiceKunde->kundeAnrede ?> <?= $rechnung->invoiceKunde->settingsFirma ?> <?= $rechnung->invoiceKunde->Vorname ?> <?= $rechnung->invoiceKunde->Name ?></td>
						<td><?= $erstellt ?></td>
						<td><?= $displayform ?></td>
						<td class='center'><?= $rechnungwert ?></td>
						<td class='center'>
							<a href='<?= $rechnung->url ?>' class='label label-info link' data-original-title='Vorgang bearbeiten'><i class='icon icon-white icon-pencil'></i></a> 
							<a href='<?= $pages->get("/rechnungen/system/functions/invoiceprint/")->url ?>?invoice=<?= $rechnung->id ?>' class='label label-inverse link' data-original-title='Vorgang als PDF exportieren'><i class='icon icon-white icon-file'></i></a>								
							<form action='./' method='post' class="tableform pull-right">
								<input type="hidden" name="rechnungssumme" value="<?= $buchungsWert ?>" />	
								<input type="hidden" name="rechnungsid" value="<?= $rechnung->id ?>" />
								<input type="hidden" name="rechnungsheadline" value="<?= $rechnung->headline ?>" />
								<input type="hidden" name="rechnungsbuchkonto" value="<?= $rechnung->invoiceBuchungsKonto->id ?>" />
								<div class="dropdown">
  									<a class="dropdown-toggle label label-success link" data-original-title="Als Bezahlt markieren" data-toggle="dropdown" href="#"><i class="icon-thumbs-up icon-white"></i></a>
  									<ul class="dropdown-menu" role="menu" >
    									<li class="menuform" role="menuitem">
    										<i class="icon-inbox"></i><input type="submit" name="invoiceclose1" value="Ohne Buchung" />    										
    									</li>
    									<li class="divider" role="menuitem"></li>
    									<li class="menuform" role="menuitem">
    										<i class="icon-book"></i><input type="submit" name="invoiceclose2" value="Mit Buchung" />
    									</li>
  									</ul>
								</div>		
							</form>
						</td>												
                    </tr>                         

<?php } ?>


</tbody>
<tfoot>
	<tr>
		<td colspan="6"></td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td><strong>Summe aller Rechnungen :</strong></td>
		<td class="center"><strong><?= number_format($gesamtwert, 2, ',', '.') ; ?> EUR</strong></td>	
		<td colspan="2"></td>	
	</tr>
</tfoot>
</table>
  </div>
</div>

<div class="row">
	<div class="span12">
		<hr />
		<h4 class="alert alert-info">Offene Angebote</h4>
  <table class="table table-bordered table-condensed table-hover table-striped" id="datenGrid2">
	<thead>
	<tr>
		<th>Nr.</th>
		<th>Kunde</th>
		<th>Erstellt</th>
		<th class="center">Wert</th>
		<th class="center">Optionen</th>
	</tr>		
	</thead>
<tbody>
	
<?php
$rechnungen = $pages->get("/rechnungen/vorgaenge/")->children("invoiceVorgangsart=A,buchungKontenInaktiv=0, include=hidden, universalCheck=0");
$gesamtwert = 0;
foreach ($rechnungen as $rechnung) {
	$rechnungsposten = $rechnung->children("include=hidden");
	$rechnungsumme = 0;
	foreach ($rechnungsposten as $posten)
	{
		$postengesamt = $posten->buchungWert*$posten->invoiceAddedPostenPage->buchungWert;	
		$rechnungsumme +=$postengesamt;		
		$rechnungwert = number_format($rechnungsumme, 2, ',', '.');
		$rechnungwert .=" EUR";
	}
	$erstellt = date("d.m.Y",$rechnung->created);
	if ($rechnungsumme == 0)
	{
		$rechnungwert	= "<a href='$rechnung->url'>Posten zufügen</a>";
	} ;
	
	$gesamtwert +=$rechnungsumme;
	echo " 		<tr>
						<td><a href='{$rechnung->url}'>{$rechnung->headline}</a></td>
						<td>[{$rechnung->invoiceKunde->kundeNr}] {$rechnung->invoiceKunde->kundeAnrede} {$rechnung->invoiceKunde->settingsFirma} {$rechnung->invoiceKunde->Vorname} {$rechnung->invoiceKunde->Name}</td>
						<td>{$erstellt}</td>
						<td class='center'>{$rechnungwert}</td>
						<td class='center'>							
							<a href='{$rechnung->url}' class='label label-info link' data-original-title='Vorgang bearbeiten'><i class='icon icon-white icon-pencil'></i></a> 
							<a href='{$pages->get("/rechnungen/system/functions/invoiceprint/")->url}?invoice={$rechnung->id}' class='label label-inverse link' data-original-title='Vorgang als PDF exportieren'><i class='icon icon-white icon-file'></i></a>									
						</td>												
                    </tr>                         
                            ";
}
?>
</tbody>
<tfoot>
	<tr>
		<td colspan="5"></td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td><strong>Summe aller Angebote :</strong></td>
		<td class="center"><strong><?= number_format($gesamtwert, 2, ',', '.') ; ?> EUR</strong></td>	
		<td></td>	
	</tr>
</tfoot>
</table>
  </div>
</div> 	

<script type="text/javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript"> 
	$(".chzn-select").select2(); 
	$(".chzn-select-deselect").select2({allow_single_deselect:true});
</script>

<script type="text/javascript" src="<?php echo $config->urls->templates?>js/jquery.dataTables.js"></script>
<script type="text/javascript" src="<?php echo $config->urls->templates?>js/scripts.js"  charset="utf-8"></script> 
<?php include("./foot.inc"); ?> 
