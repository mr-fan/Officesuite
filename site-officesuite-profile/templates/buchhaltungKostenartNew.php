<?php include ("./head.inc"); ?>
<?php include("./scripts/subNavigation.php");  ?>
<div class="row">
  <div class="span12">
		<hr />
		<?php 

$required_fields = array(
	'title' => $sanitizer->text($input->post->title),
	'typ' => $sanitizer->text($input->post->typ)
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
		$p->template = 'buchhaltungKostenart'; // set template
		$p->parent = wire('pages')->get('/buchhaltung/system/settings/buchhaltungkostenart/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)		
		$p->save(); //create the page
		// populate fields
		$p->buchungKontenTyp = $sanitizer->text($input->post->typ); // give it a name used in the url for the page
		$p->addStatus(Page::statusHidden);
		$p->save(); //save the populated fields
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
	} ?>

<form action="./" method="post" id="submitform" class="form-horizontal">
	<div class="control-group">
    	<label class="control-label" for="title">Neues Buchungskonto</label>
    	<div class="controls">
      		<input type="text" id="title" name="title" required />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="typ">Konten Typ</label>
    	<div class="controls">
      		<select class="span2" name="typ" id="typ">
				<option value="Einnahme">Einnahme</option>
				<option value="Ausgabe">Ausgabe</option>
			</select>
    	</div>
  </div>   	
	  	<div class="control-group">
    	<label class="control-label" ></label>
    	<div class="controls">
      		<input type="submit" name="submit" value="Speichern" class="btn btn-info" />
    	</div>
  </div>
</form>

  <hr />
  <h4>Vorhandene Buchungskonten</h4>
  <div class="row">
  	<div class="span6">
  		<h5>Aktive Einnahmekonten</h5>
  		<table class="table table-bordered table-condensed table-hover table-striped">
  			 <thead>
  				<tr>
  					<th># / Bezeichnung</th>
  					<th></th>
  				</tr>
  			</thead>
      			<?php
				$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden, buchungKontenTyp=Einnahme, buchungKontenInaktiv=0");
				foreach ($kostenarten as $kostenart) {
					echo " <tr>
							<td>{$kostenart->title}</td>							
							<td class='center'><a href='../../functions/buchungKontoHide/?setHidden=$kostenart->id&hide=1' class='badge badge-important'><i class='icon-eye-close icon-white'></i></a></td>
					</tr>	";
				}
				?>
		</table>  
  		<h5>Inaktive Einnahmekonten</h5>
  		<table class="table table-bordered table-condensed table-hover table-striped">
  			 <thead>
  				<tr>
  					<th># / Bezeichnung</th>
  					<th></th>
  				</tr>
  			</thead>
      			<?php
				$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden, buchungKontenTyp=Einnahme, buchungKontenInaktiv=1");
				foreach ($kostenarten as $kostenart) {
					echo " <tr>
							<td>{$kostenart->title}</td>							
							<td class='center'><a href='../../functions/buchungKontoHide/?setHidden=$kostenart->id&hide=0' class='badge badge-info'><i class='icon-eye-open icon-white'></i></a></td>
					</tr>	";
				}
				?>
		</table>  		
  	</div>
  	<div class="span6">
  		<h5>Aktive Ausgabekonten</h5>
  		<table class="table table-bordered table-condensed table-hover table-striped">
  			 <thead>
  				<tr>
  					<th># / Bezeichnung</th>
  					<th></th>
  				</tr>
  			</thead>
      			<?php
				$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden, buchungKontenTyp=Ausgabe, buchungKontenInaktiv=0");
				foreach ($kostenarten as $kostenart) {
					echo " <tr>
							<td>{$kostenart->title}</td>							
							<td class='center'><a href='../../functions/buchungKontoHide/?setHidden=$kostenart->id&hide=1' class='badge badge-important'><i class='icon-eye-close icon-white'></i></a></td>
					</tr>	";
				}
				?>
		</table>  
  		<h5>Inaktive Ausgabekonten</h5>
  		<table class="table table-bordered table-condensed table-hover table-striped">
  			 <thead>
  				<tr>
  					<th># / Bezeichnung</th>
  					<th></th>
  				</tr>
  			</thead>
      			<?php
				$kostenarten = $pages->get("/buchhaltung/system/settings/buchhaltungkostenart/")->children("include=hidden, buchungKontenTyp=Ausgabe, buchungKontenInaktiv=1");
				foreach ($kostenarten as $kostenart) {
					echo " <tr>
							<td>{$kostenart->title}</td>							
							<td class='center'><a href='../../functions/buchungKontoHide/?setHidden=$kostenart->id&hide=0' class='badge badge-info'><i class='icon-eye-open icon-white'></i></a></td>
					</tr>	";
				}
				?>
		</table>  		
  	</div>
  </div>

</div>
</div>
<?php include ("./foot.inc"); ?>
