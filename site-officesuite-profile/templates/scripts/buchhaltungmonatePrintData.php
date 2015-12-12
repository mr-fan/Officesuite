<style type="text/css">
<!--
table { vertical-align: top; }
tr    { vertical-align: top; }
td    { vertical-align: top; }
p {margin:2px 0; padding:0; }
h3 {margin:0;padding:0}
.center {text-align: center}
.bordered {width:100%}
.bordered th{border-bottom:1px solid gray; font-size:10pt; margin:0;padding:2px 0;}
.bordered td{border-bottom:1px solid gray; font-size:9pt; margin:0 2px;padding:4px 0;}
-->
</style>
<page backtop="0" backbottom="30mm" backleft="11mm" backright="11mm" footer="page" style="font-size: 11pt">
	<h2>Buchungsjournal <?= $monat ?> / <?= $jahr ?></h2>
	<?php if ($systemsets->settingsFirma){ ?> 
    <p><strong>Firma :</strong> <?= $systemsets->settingsFirma ?></p>
    <p><strong>Name :</strong> <?= $systemsets->Vorname ?> <?= $systemsets->Name ?></p>
    <?php } else { ?>
    <p><strong>Name :</strong> <?= $systemsets->Vorname ?> <?= $systemsets->Name ?></p>
    <?php } ?>	
	<p><strong>Tätigkeit :</strong> <?= $systemsets->settingsBerufsbezeichnung ?></p>
	<p><strong>Adresse :</strong> <?= $systemsets->Strasse ?> <?= $systemsets->Plz ?> <?= $systemsets->Ort ?></p>
	<p><strong>Steuernummer :</strong> <?= $systemsets->settingsSteuernummer ?></p>
	
     <br />  <br /> 
     
	<table class="bordered" cellspacing="0">
			<tr>
				<th style="width:5%" class='center'>#</th>				
				<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
					<th style="width:10%"  class='center'>Typ</th>
					<th style="width:25%" >Konto</th>
					<th style="width:25%" >Buchungstext</th>
					<th style="width:10%"  class='center'>Wert</th> 
					<? } else { ?>
					<th style="width:5%"  class='center'>Typ</th>
					<th style="width:20%" >Konto</th>
					<th style="width:15%" >Buchungstext</th>
					<th style="width:10%"  class='center'>Wert (brutto)</th>
					<th style="width:7%"  class='center'>Steuersatz</th>
					<th style="width:10%"  class='center'>enth. Steuer</th>
					<th style="width:9%"  class='center'>Wert (netto)</th>
				<? }; ?>	
				<th style="width:10%"  class='center' >Datum</th>
			</tr>		
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
					$eOderA = 'E';
						} else {
						$eOderA = 'A';
					};
				?>
					<tr>
						<td style="width:5%"  class='center'><?= $i ?></td>
						<td style="width:5%"  class='center'><?= $eOderA ?></td>						
						<td style="width:20%" ><?= $kostenArt ?></td>
						<td style="width:15%" ><?= $buchung->buchungBuchungstext ?></td>						
						<td style="width:9%"  class='center'><?= number_format($wert, 2, ',', '.') ?>EUR</td> 
						<?php if ($systemsets>settingsKleinunternehmer == 1){ ?>
							<td style="width:10%" class='center'><?= $buchung->buchungTag.$buchung->buchungMonat.$buchung->buchungJahr ?></td>
							</tr> 
							<?php } else { ?>
								<td style="width:7%"  class='center'><?= $steuersatztitle ?> %</td>
									<td  style="width:10%" class='center'><?= number_format($enthalten, 2, ',', '.') ?> EUR</td>
									<td  style="width:8%" class='center'><?= number_format($wertnetto, 2, ',', '.') ?> EUR</td>
									<td  style="width:10%" class='center'><?= $buchung->buchungTag.'.'.$buchung->buchungMonat.'.'.$buchung->buchungJahr ?> </td>
									</tr>
							<?php }; $i++; }	?>				
	</table>
		
	<br />
	<hr />
			<?php if ($systemsets->settingsKleinunternehmer == 0){ ?>
			<table style="width:100%; font-size:9pt">	
					<tr>
						<th style="width:20%">Umsatzsteuer</th>
						<th style="width:20%">Vorsteuer</th>
						<th style="width:20%">
						<?php if ($zahllast > 0) { ?>
							 Zahllast 
						<? } else { $zahllast = $zahllast *-1?>
							Überhang
						<? } ?>
						</th>
					</tr>	
					<tr>
						<td style="width:20%"><?php echo number_format($ustEinnahmen, 2, ',', '.')   .' EUR'; ?></td>
						<td style="width:20%"><?php echo number_format($vorsteuer, 2, ',', '.')   .' EUR'; ?></td>
						<td style="width:20%"><?php echo number_format($zahllast, 2, ',', '.')   .' EUR'; ?></td>
					</tr>	
			</table>
			<?php } ?>
				
			<br />
			
				<table style="width:100%; font-size:9pt">
					<tr>
						<th style="width:20%">Übertrag Vormonat</th>
						<th style="width:20%">
							<?php if ($ertrag <= 0) {?>
								Unterdeckung
							<? } else { ?>
								Überdeckung
							<? } ?>
						</th>
						<th style="width:20%">Einnahmen</th>
						<th style="width:20%">Ausgaben</th>
					</tr>		
					<tr>
						<td style="width:20%"><?= number_format($uebertrag, 2, ',', '.') ; ?> EUR</td>
						<td style="width:20%"><?= number_format($ertrag, 2, ',', '.') ; ?> EUR</td>
						<td style="width:20%"><?= number_format($einnahmeSumme, 2, ',', '.'); ?>  EUR</td>
						<td style="width:20%"><?= number_format($ausgabeSumme, 2, ',', '.'); ?>  EUR</td>
					</tr>	
			</table>
			<h5>Berechnet am: <?= $heute ?></h5>		  


</page>