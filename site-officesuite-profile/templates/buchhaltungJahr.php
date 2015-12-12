<?php
include ("./head.inc");
if ($input->get->jahr == 0 )// get the head and set the year for our table, if the normal link is clicked the year will be the actual year, else the script grabs the year from the input
{
	$jahr = date("Y");
}
else {
	$jahr = $sanitizer->text($input->get->jahr);
};

?> 

<?php include("./scripts/subNavigation.php");  ?>

<div class="row">
	<div class="span12">
		<hr />
		<form class="form-inline" action="./" method="get">					
					<div class="row">
						<div class="span4">
							<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neueBuchung"><i class='icon icon-white icon-plus-sign'></i> Neue Buchung</a>
					</div>
					<div class="span4">
						<label class="control-label" for="year">Anderes Buchungsjahr wählen</label>
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
							</select><button type="submit" class="btn btn-info">Bestätigen</button>	
					</div>
					<div class="span4">
						<div class="btn-group pull-right">
  							<a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">Exportieren <span class="caret"></span></a>
  							<ul class="dropdown-menu">
    							<li><a href="<?php echo $pages->get("/Buchhaltung/system/functions/JahrPrint/")->url; ?>?jahr=<?php echo $jahr; ?>" ><i class="icon-file"> </i>PDF - Datei</a></li>
  								<!-- <li><a href="<?php echo $pages->get("/Buchhaltung/system/functions/JahrPrint/")->url; ?>?jahr=<?php echo $jahr; ?>" ><i class="icon-list-alt"> </i>Datev CSV</a></li> -->
  							</ul>
					</div>	
					</div>
				</div>								
			</form>
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
  		<h4 class="alert alert-info"> Jahresübersicht für <?php echo $jahr; ?>	</h4>								
		<hr />
		<table class="table table-bordered table-condensed table-hover table-striped display" >
			<thead>
			<tr>
				<th class="center">Monat</th>
				<th class="center">Übertrag</th>
				<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
				<th class="center" >Einnahmen</th>
				<th class="center" >Ausgaben</th>
				<? } else { ?>
				<th class="center" >Einnahmen (brutto)</th>
				<th class="center" >Ausgaben (brutto)</th>	
				<? }; ?>	
				<th class="center">Saldo</th>					
				<th class="center"></th>
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
							<td class='center'>$month</td>
							<td class='center'>". number_format($uebertrag, 2, ',', '.')." EUR</td>
							<td class='center'>". number_format($einnahmeSumme, 2, ',', '.')." EUR</td>
							<td class='center'>". number_format($ausgabeSumme, 2, ',', '.')." EUR</td>
							<td class='center'>". number_format($saldoMonat, 2, ',', '.')." EUR</td>
							<td class='center'><a href='system/functions/monate/?jahr=$jahr&monat=$i' class='btn btn-mini'>Details</a></td>
				</tr>";	
				$uebertrag = $uebertrag + $saldoMonat;		//get our earned money and sum it with the month	
				$jahresEinnahme = $jahresEinnahme+$einnahmeSumme;
				$jahresAusgabe = $jahresAusgabe+$ausgabeSumme;
				$jahresSaldo = $jahresSaldo+$saldoMonat;
				$i++;													//give the index Google+1 ;)				
			}
			echo "<tr>
						<td colspan='6'><hr /></td>
					</tr>
					<tr>
							<td class='center'><strong>Summen</strong></td>
							<td class='center'><strong>". number_format($uebertrag, 2, ',', '.')." EUR</strong></td>
							<td class='center'><strong>". number_format($jahresEinnahme, 2, ',', '.')."  EUR</strong></td>
							<td class='center'><strong>". number_format($jahresAusgabe, 2, ',', '.')."  EUR</strong></td>
							<td class='center'><strong>". number_format($jahresSaldo, 2, ',', '.')."  EUR</strong></td>
							<td></td>
				</tr>";
			?>				
			</tbody>
	</table>
</div>
</div>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/scripts.js"  charset="utf-8"></script>
<?php include ("./foot.inc"); ?>