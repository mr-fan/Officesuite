<?php
include ("./head.inc");
if ($input->get->jahr == 0 )
{
	$jahr = date("Y");
}
else {
	$jahr = $sanitizer->text($input->get->jahr);
};
if ($input->get->monat == 0 )
{
	$monat = date("m");
}
else {
	$monat = $sanitizer->text($input->get->monat);
};
?>
<?php include("./scripts/subNavigation.php");  ?>
<div class="row">
	<div class="span12">	
		<hr />
		<div class="row">
			<div class="span3">
				<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neueBuchung"><i class='icon icon-white icon-plus-sign'></i> Neue Buchung</a>
			</div>
			<div class="span3">
			<form class="form-inline" action="./" method="get">
					<label class="control-label" for="year">Monat</label>
					<select id="monat" name="monat" class="input-mini">
						<option></option>
						<?php  // look which months got entries from the choosen year
							$groups = array();
								foreach( $pages->get("/Buchhaltung/buchungen/")->children("buchungJahr=$jahr, sort=buchungMonat") as $p )  {
        							$groups[$p->buchungMonat][] = $p;
								}
							if(!empty($groups)) {
        					foreach($groups as $monate => $group) {                				
                				echo "<option value='$monate'>$monate</option>"; // Render months with entries in our select field
        					}
							}
						?>						
					</select>	
					<input type="hidden" name="jahr" value="<?php echo $jahr;?>">			
					<button type="submit" class="btn btn-info">Bestätigen</button>					
			</form>	
			</div>
			<div class="span3">
			<form class="form-inline" action="./" method="get">
					<label class="control-label" for="year">Jahr</label>
					<select id="jahr" name="jahr" class="input-mini">
						<option></option>					
						<?php  // look which years got entries 
							$groups = array();
								foreach( $pages->get("/Buchhaltung/buchungen/")->children("sort=buchungJahr") as $p )  {
        							$groups[$p->buchungJahr][] = $p;
								}
							if(!empty($groups)) {
        					foreach($groups as $jahre => $group) {                				
                				echo "<option value='$jahre'>$jahre</option>"; // Render years with entries in our select field
        					}
							}
						?>						
					</select>					
					<input type="hidden" name="monat" value="01">	
					<button type="submit" class="btn btn-info">Bestätigen</button>					
			</form>	
			</div>
			<div class="span3">
				<div class="btn-group pull-right">
  					<a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">Exportieren <span class="caret"></span></a>
  					<ul class="dropdown-menu">
    					<li><a href="<?php echo $pages->get("/Buchhaltung/system/functions/MonatePrint/")->url; ?>?jahr=<?php echo $jahr; ?>&monat=<?php echo $monat; ?>" ><i class="icon-file"> </i>PDF - Datei</a></li>
  						<!-- <li><a href="<?php echo $pages->get("/Buchhaltung/system/functions/MonatePrint/")->url; ?>?jahr=<?php echo $jahr; ?>&monat=<?php echo $monat; ?>" ><i class="icon-list-alt"> </i>Datev CSV</a></li> -->
  					</ul>
				</div>	
			</div>
		</div>	
		<div id="neueBuchung" class="collapse"> 
				<hr /> 
				<?php include ("./scripts/buchungAddForm.php"); ?>				
				<br /> 
			</div>
			<?php 
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
			?>		
  		<h4 class="alert alert-info"> Detailansicht für <?php echo $monat; ?> / <?php echo $jahr; ?>	</h4>
		<hr />	
		<div class="row">
			<div class="span8">
			<table class="table table-striped table-bordered table-condensed">
				<?php 
					//Get our money earned this month
					$einnahmen = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat=$monat,buchungJahr=$jahr"); 
					$ausgaben = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat=$monat,buchungJahr=$jahr");
					$einnahmeSumme = 0;
					$ausgabeSumme = 0;
					foreach ($einnahmen as $einnahme) {
			 			$einnahmeSumme += $einnahme->buchungWert;				
					}
					foreach ($ausgaben as $ausgabe) {
			 			$ausgabeSumme += $ausgabe->buchungWert;				
					}							
					$ertrag = $einnahmeSumme - $ausgabeSumme;
					//check if we earned enough money , else throw a warning
					if ($ertrag < 0) {
						$marker = 'style="color:red;font-weight:bold"';
					}
					else {
						$marker = '';
					}
					
					//check if its January, if so grab the sum from the past year
					if ($monat == 1)
					{
						$jahr2=$jahr;
						$monat2 = 13;
						$jahr2--;
						$einnahmenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat<$monat2,buchungJahr=$jahr2"); // get income from the passed years
						$ausgabenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat<$monat2,buchungJahr=$jahr2");	 // get expense from the passed years	
					}
					else {
						$einnahmenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat<$monat,buchungJahr=$jahr"); // get income from the passed years
						$ausgabenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat<$monat,buchungJahr=$jahr");	 // get expense from the passed years
					};
					// go trough our entries and sum them
					foreach ($einnahmenVormonat as $einnahmeVormonat) {
			 			$einnahmeSummeVormonat += $einnahmeVormonat->buchungWert;							
					}	
					foreach ($ausgabenVormonat as $ausgabeVormonat) {
			 			$ausgabeSummeVormonat += $ausgabeVormonat->buchungWert;								
					}				
				$saldoVormonat = $einnahmeSummeVormonat - $ausgabeSummeVormonat; // get the sum from the passed years
				$uebertrag = $uebertrag + $saldoVormonat;	
				
			?>
				<thead>
					<tr>
						<th class="center">Übertrag Vormonat</th>
						<th class="center">
							<?php 
							if ($ertrag <= 0) {
								echo 'Unterdeckung'; 
							}
							else {
								echo 'Überdeckung';
							};
							?>
						</th>
						<th class="center">Einnahmen</th>
						<th class="center">Ausgaben</th>
					</tr>					
				</thead>
				<tbody>
					<tr>
						<td class="center"><?php echo number_format($uebertrag, 2, ',', '.') ; ?> EUR</td>
						<td <?php echo $marker;?> class="center"><?php echo number_format($ertrag, 2, ',', '.') ; ?> EUR</td>
						<td class="center"><?php echo number_format($einnahmeSumme, 2, ',', '.'); ?>  EUR</td>
						<td class="center"><?php echo number_format($ausgabeSumme, 2, ',', '.'); ?>  EUR</td>
					</tr>	
				</tbody>
			</table>
				
			</div>
			<div class="span4" <?php if ($kleinunternehmer->settingsKleinunternehmer == 1) { echo 'style="display:none"';};	?>>
				<?php 
				$ustEinnahmen = 0;
				$vorsteuer = 0;
				foreach($pages->get("/Buchhaltung/system/settings/buchhaltungSteuersaetze/")->children("include=hidden") as $steuersatz)
				{
					$ustSatz = $steuersatz->title +100;
					$mwstSatz = $steuersatz->title +100;
					foreach ($pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat=$monat,buchungJahr=$jahr,buchungSteuersatz=$steuersatz->id") as $einnahme ) 
					{
						$summeEBrutto = $einnahme->buchungWert;
						$einnahmeSumme = $einnahme->buchungWert * 100;
						$summeUstNetto = $einnahmeSumme / $ustSatz;
						$gesamtUstNetto = $summeEBrutto - $summeUstNetto;
						$ustEinnahmen+=$gesamtUstNetto;						
					};
					foreach ($pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat=$monat,buchungJahr=$jahr,buchungSteuersatz=$steuersatz->id") as $ausgabe ) 
					{
						$summeABrutto = $ausgabe->buchungWert;
						$ausgabeSumme = $ausgabe->buchungWert * 100;
						$summeMwstNetto = $ausgabeSumme / $mwstSatz;
						$gesamtMwstNetto = $summeABrutto - $summeMwstNetto;
						$vorsteuer+=$gesamtMwstNetto;						
					};
					$zahllast = $ustEinnahmen - $vorsteuer;
				};
			
				
				?>
			<table class="table table-striped table-bordered table-condensed">
				
				<thead>
					<tr>
						<th class="center">Umsatzsteuer</th>
						<th class="center">Vorsteuer</th>
						<th class="center">
							<?php 
							if ($zahllast > 0) {
								echo 'Zahllast';
								$marker = 'style="color:red;font-weight:bold"';
							}
							else {
								$zahllast = $zahllast *-1;
								echo 'Überhang';
								$marker = '';
							}
							?>
						</th>
					</tr>					
				</thead>
				<tbody>
					<tr>
						<td class="center"><?php echo number_format($ustEinnahmen, 2, ',', '.')   .'EUR'; ?></td>
						<td class="center"><?php echo number_format($vorsteuer, 2, ',', '.')   .'EUR'; ?></td>
						<td class="center" <?php echo $marker; ?>><?php echo number_format($zahllast, 2, ',', '.')   .'EUR'; ?></td>
					</tr>	
				</tbody>
			</table>				
			</div>			
		</div>	
	<hr />
		
		<table class="table table-bordered table-condensed table-hover table-striped display" id="datenGrid">
			<thead>
			<tr>
				<th>#</th>
				<th>Typ</th>
				<th>Kostenart</th>
				<th>Buchungstext</th>
				<?php 
						if ($kleinunternehmer->settingsKleinunternehmer == 1)
							{
							echo "<th class='center'>Wert</th>";
							}
							else {
								echo "<th class='center'>Wert (brutto)</th>
										<th class='center'>Steuersatz</th>
										<th class='center'>enth. Steuer</th>
										<th class='center'>Wert (netto)</th>";
							}; 					
				?>
				<th>Datum</th>
				<th></th>
			</tr>				
			</thead>
			<tbody>
			<?php
			$buchungen = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungJahr=$jahr, buchungMonat=$monat");		
			$i = 1;
			foreach ($buchungen as $buchung) {
				$kostenArten = $pages-> find("parent=/Buchhaltung/system/settings/buchhaltungKostenart/, id=$buchung->buchungKostenart, include=hidden");
				$steuerSaetze = $pages-> find("parent=/Buchhaltung/system/settings/buchhaltungSteuersaetze/, id=$buchung->buchungSteuersatz, include=hidden");
				foreach ($kostenArten as $kostenArtTitle) {
							$kostenArt = $kostenArtTitle->title;
						};		
				foreach ($steuerSaetze as $steuerSatzTitle) {
							$steuersatztitle = $steuerSatzTitle->title;
						};				
				$steuersatz = $steuersatztitle + 100;
				$wert = $buchung->buchungWert;
				$buchung->buchungWert = str_replace(",", ".", $buchung->buchungWert);
				$bruttowert = $buchung->buchungWert * 100;
				$nettowert = $bruttowert / $steuersatz;
				$erg = $buchung->buchungWert - $nettowert;
				$enthalten = $erg;
				$wertnetto = $nettowert;
				if ($buchung -> buchungArt == E) {
					$marker = '';
					$eOderA = 'Einnahme';
						} else {
						$marker = 'error';
						$eOderA = 'Ausgabe';
					};
				echo " 
					<tr class='$marker' >
						<td class='center'>$i</td>
						<td>$eOderA</td>						
						<td>$kostenArt</td>
						<td>$buchung->buchungBuchungstext</td>						
						<td class='center'>". number_format($wert, 2, ',', '.')." EUR</td> ";
						if ($kleinunternehmer->settingsKleinunternehmer == 1)
							{
							echo "<td>$buchung->buchungTag.$buchung->buchungMonat.$buchung->buchungJahr </td>
							<td><a href='$buchung->url' title='Eintrag löschen' class='badge badge-important'>x</a></td>
							</tr> ";
							}
							else {
								echo "<td class='center'>$steuersatztitle %</td>
									<td class='center'>". number_format($enthalten, 2, ',', '.')." EUR</td>
									<td class='center'>". number_format($wertnetto, 2, ',', '.')." EUR</td>
									<td>$buchung->buchungTag.$buchung->buchungMonat.$buchung->buchungJahr </td>
									<td><a href='$buchung->url' title='Eintrag löschen' class='badge badge-important'>x</a></td>
									</tr>";
							}; 	
				$i++;
			}

		?>				
			</tbody>
	</table>
</div>
</div>

<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/scripts.js"  charset="utf-8"></script>

<?php
	include ("./foot.inc");
?>