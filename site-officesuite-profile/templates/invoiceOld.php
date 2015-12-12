<?php 
include("./head.inc"); 
include("./scripts/subNavigation.php");  
// check if the form was submitted
if($input->post->invoicedel) {

  if(!$error) {
  	$name = $sanitizer->pageName($input->post->invoiceid);
		if(strlen($name)) {
  			$p = $pages->get("/rechnungen/vorgaenge/")->child("id=$name, include=hidden");
  			if($p->id) 
			$pages->delete($p, true);
			echo "<div class='alert fade in'>
					<button type='button' class='close' data-dismiss='alert'>×</button>
					<h4>Rechnung gelöscht</h4></div>
				"; 
			}	 		
		}
	}
	if(!$success) { 
 		 if($error) {
        	echo $error_message; 
 		}
 		}  ?>
<div class="row">
	<div class="span12">		
<h4 class="alert alert-info">Geschlossene Rechnungen</h4>
  <table class="table table-bordered table-condensed table-hover table-striped" id="datenGrid">
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
$rechnungen = $pages->get("/rechnungen/vorgaenge/")->children("invoiceVorgangsart=R, include=hidden, buchungKontenInaktiv=1, universalCheck=0");
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

	$gesamtwert +=$rechnungsumme;
	?>		<tr>
						<td>
							<?php if ($rechnung->invoiceInAccounting == 1) { ?> 
								<?= $rechnung->headline ?>
							<? } else { ?>
							<a href='<?= $rechnung->url ?>'> <?= $rechnung->headline ?></a>
							<? } ?>
						</td>
						<td>[<?= $rechnung->invoiceKunde->kundeNr ?>] <?= $rechnung->invoiceKunde->kundeAnrede ?> <?= $rechnung->invoiceKunde->settingsFirma ?> <?= $rechnung->invoiceKunde->Vorname ?> <?= $rechnung->invoiceKunde->Name ?></td>
						<td>
							<?= $erstellt ?>
							<?php if ($rechnung->invoiceInAccounting == 1) { ?> 
								|| Vorgang ist gebucht
							<? }?>
						</td>
						<td class='center'><?= $rechnungwert ?></td>
						<td class='center'>
							<?php if ($rechnung->invoiceInAccounting == 1) { ?> 
								<i class='icon-lock'></i>
							<? } else { ?>
							<form action='./' method='post' class='tableform'>
								<input type='hidden' name='invoiceid' value='<?= $rechnung->id ?>' />
								<button type='submit' name='invoicedel' class='label label-important link' data-original-title='Rechnung löschen' title='Rechnung löschen'><i class='icon-white icon-minus-sign'></i></button>	
								<a href='<?= $rechnung->url ?>' class='label label-info link' data-original-title='Rechnung bearbeiten'><i class='icon icon-white icon-pencil'></i></a> 
								<a href='<?= $pages->get("/rechnungen/system/functions/invoiceprint/")->url ?>?invoice=<?= $rechnung->id ?>' class='label label-inverse link' data-original-title='Rechnung als PDF exportieren'><i class='icon icon-white icon-file'></i></a>						
							</form>
							<? } ?>							
						</td>												
                    </tr>                         
 <? } ?>
</tbody>
<tfoot>
	<tr>
		<td colspan="5"></td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td><strong>Summe aller Rechnungen :</strong></td>
		<td class="center"><strong><?= number_format($gesamtwert, 2, ',', '.') ; ?> EUR</strong></td>	
		<td></td>	
	</tr>
</tfoot>
</table>
  </div>
</div>

<div class="row">
	<div class="span12">
		<hr />
		<h4 class="alert alert-info">Geschlossene Angebote</h4>
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
$rechnungen = $pages->get("/rechnungen/vorgaenge/")->children("invoiceVorgangsart=A, include=hidden, buchungKontenInaktiv=1, universalCheck=0");
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
	$gesamtwert +=$rechnungsumme;
	echo " 		<tr>
						<td><a href='{$rechnung->url}'>{$rechnung->headline}</a></td>
						<td>[{$rechnung->invoiceKunde->kundeNr}] {$rechnung->invoiceKunde->kundeAnrede} {$rechnung->invoiceKunde->settingsFirma} {$rechnung->invoiceKunde->Vorname} {$rechnung->invoiceKunde->Name}</td>
						<td>{$erstellt}</td>
						<td class='center'>{$rechnungwert}</td>
						<td class='center'>
							<form action='./' method='post' class='tableform'>
								<input type='hidden' name='invoiceid' value='$rechnung->id' />
								<button type='submit' name='invoicedel' class='label label-important link' data-original-title='Angebot löschen' title='Angebot löschen'><i class='icon-white icon-minus-sign'></i></button>	
								<a href='{$rechnung->url}' class='label label-info link' data-original-title='Angebot bearbeiten'><i class='icon icon-white icon-pencil'></i></a> 
								<a href='' class='label label-inverse link' data-original-title='Angebot als PDF exportieren'><i class='icon icon-white icon-file'></i></a>						
							</form>							
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
<script type="text/javascript" src="<?= $config->urls->templates?>js/chosen.jquery.js"></script>
<script type="text/javascript"> 
$(".chzn-select").chosen(); 
$(".chzn-select-deselect").chosen({allow_single_deselect:true});
 </script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/scripts.js"  charset="utf-8"></script>
<?php include("./foot.inc"); ?> 
