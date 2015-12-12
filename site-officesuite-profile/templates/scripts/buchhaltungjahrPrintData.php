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
.lastRow td {border-top:1px solid black}
-->
</style>
<page backtop="0" backbottom="30mm" backleft="11mm" backright="11mm" footer="page" style="font-size: 11pt">
	<h2>Buchungsjournal <?= $jahr ?></h2>
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
  		<h4 > Jahresübersicht für <?php echo $jahr; ?>	</h4>								
		<hr />
		<table  class="bordered" cellspacing="0" >
			<thead>
			<tr>
				<th class="center" style="width:10%" >Monat</th>
				<th class="center" style="width:20%" >Übertrag</th>
				<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
				<th class="center" style="width:25%" >Einnahmen</th>
				<th class="center" style="width:25%" >Ausgaben</th>
				<? } else { ?>
				<th class="center" style="width:25%" >Einnahmen (brutto)</th>
				<th class="center" style="width:25%" >Ausgaben (brutto)</th>	
				<? }; ?>	
				<th class="center" style="width:20%" >Saldo</th>	
			</tr>				
			</thead>
			<tbody>
			<?php	
			$i = 1; //set the index
			
			$einnahmenVorjahr = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungJahr<$jahr"); // get income from the passed years
			$ausgabenVorjahr = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungJahr<$jahr");	 // get expense from the passed years
			// go trough our entries and sum them
			foreach ($einnahmenVorjahr as $einnahmeVorjahr) {
			 		$einnahmeSummeVorjahr += $einnahmeVorjahr->buchungWert;							
					}	
				foreach ($ausgabenVorjahr as $ausgabeVorjahr) {
			 		$ausgabeSummeVorjahr += $ausgabeVorjahr->buchungWert;								
					}				
			$saldoVorjahr = $einnahmeSummeVorjahr - $ausgabeSummeVorjahr; // get the sum from the passed years
			$uebertrag = $uebertrag + $saldoVorjahr;	
						
			while ($i < 13){										// start a loop 12 times
				$einnahmeSumme = 0;						// set the money to zero :(
				$ausgabeSumme = 0;
								
				$einnahmen = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungJahr=$jahr, buchungMonat=$i");  // get the actual income
				$ausgaben = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungJahr=$jahr, buchungMonat=$i");		// get the actual expense
				
				switch($i){			// give the index some names
     			case 1 : $month = "Januar"; break;
      			case 2 : $month = "Februar"; break;
      			case 3 : $month = "März"; break;
	 		 	case 4 : $month = "April"; break;
	  			case 5 : $month = "Mai"; break;
	  			case 6 : $month = "Juni"; break;
	  			case 7 : $month = "Juli"; break;
	  			case 8 : $month = "August"; break;
	  			case 9 : $month = "September"; break;
	  			case 10 : $month = "Oktober"; break;
	  			case 11 : $month = "November"; break;
	  			case 12 : $month = "Dezember"; break;	  
      			default : break;
   				}	
				// add our income every month, the best part	
				foreach ($einnahmen as $einnahme) {
			 		$einnahmeSumme += $einnahme->buchungWert;							
					}	
				//add our expense every month, the sadest part
				foreach ($ausgaben as $ausgabe) {
			 		$ausgabeSumme += $ausgabe->buchungWert;								
					}					
				$saldoMonat = $einnahmeSumme - $ausgabeSumme;	  // what have we earned this month?
				
				//throw a warning if our income < expense this month
				if (number_format($saldoMonat, 2, ',', '.') < 0)
				{
					$marker = "error";     // set the name for the TR CLASS
				}
				else {
					$marker = '';  // if we got money, there is no need to warn us :)
				}
				
				// render the table				 
				echo "<tr class='$marker'>
							<td class='center' style='width:10%' >$month</td>
							<td class='center' style='width:20%' >". number_format($uebertrag, 2, ',', '.')." EUR</td>
							<td class='center' style='width:25%' >". number_format($einnahmeSumme, 2, ',', '.')." EUR</td>
							<td class='center' style='width:25%' >". number_format($ausgabeSumme, 2, ',', '.')." EUR</td>
							<td class='center' style='width:20%' >". number_format($saldoMonat, 2, ',', '.')." EUR</td>
				</tr>";	
				$uebertrag = $uebertrag + $saldoMonat;		//get our earned money and sum it with the month	
				$jahresEinnahme = $jahresEinnahme+$einnahmeSumme;
				$jahresAusgabe = $jahresAusgabe+$ausgabeSumme;
				$jahresSaldo = $jahresSaldo+$saldoMonat;
				$i++;													//give the index Google+1 ;)				
			}
			echo "<tr class='lastRow'>
							<td class='center' style='width:10%' ><strong>Summen</strong></td>
							<td class='center' style='width:20%' ><strong>". number_format($uebertrag, 2, ',', '.')." EUR</strong></td>
							<td class='center' style='width:25%' ><strong>". number_format($jahresEinnahme, 2, ',', '.')."  EUR</strong></td>
							<td class='center' style='width:25%' ><strong>". number_format($jahresAusgabe, 2, ',', '.')."  EUR</strong></td>
							<td class='center' style='width:20%' ><strong>". number_format($jahresSaldo, 2, ',', '.')."  EUR</strong></td>
				</tr>";	
			?>				
			</tbody>
	</table>   

			<h5>Berechnet am: <?= $heute ?></h5>		  


</page>