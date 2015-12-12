<?php include("./head.inc");  ?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li><a href="<?php echo $pages->get("/settings/")->url ; ?>">Daten</a></li>
				<?php				
				$systempages = $pages->get("/settings/")->children("include=hidden"); 		
				foreach($systempages as $child) {
					$class = $child === $page ? " class='active'" : '';
					if (!$child->headline)
					{
						echo ' ';
					}
					else {
						echo "<li$class><a href='{$child->url}'>{$child->headline}</a></li>";	
					}
				}
			?>
			</ul>
		</div>
	</div>
</div>
<hr />

<div class="row">
	<div class="span12">
  <table class="table table-bordered table-condensed table-hover table-striped">
	<thead>
	<tr>
		<th>Vorname</th>
		<th>Name</th>
		<th>Telefon</th>
		<th>Str. / Nr.</th>
		<th >PLZ</th>
		<th>Ort</th>
		<th>Rolle</th>
	</tr>		
	</thead>
<tbody>
	
<?php
foreach ($users as $angestellter) {
	if ($angestellter->Name)
	{
	echo " 		<tr>
						<td><a href='{$angestellter->url}'>{$angestellter->Vorname}</a></td>
						<td>{$angestellter->Name}</td>
						<td>{$angestellter->Telefon}</td>
						<td>{$angestellter->Strasse}</td>
						<td>{$angestellter->Plz}</td>
						<td>{$angestellter->Ort}</td>
						<td> ";	
					foreach($angestellter->roles as $rolle)
					{
						if ($rolle->name != guest) {echo $rolle->name." ";}
					}
	echo "					
						</td>
                    </tr>   ";                       
                           	
	}

}
?>
</tbody>
</table>
  </div>
</div>
<?php include ("./foot.inc"); ?>