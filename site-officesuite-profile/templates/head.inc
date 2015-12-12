<?php include ("./systemcheck.php"); //Check the Systemsettings and throw a warning if there are empty fields 

?> 
<!DOCTYPE html>
<html lang="de">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title><?= $page->get("headline|title"); ?></title>
	<meta name="description" content="<?= $page->summary; ?>" />	
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/<?php echo $pages->get("/settings/")->settingsStyle; ?>.css" />
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/style.css" />
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/select2.css" />
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/bootstrap-editable.css" />
	<link rel="stylesheet" type="text/css" href="<?= $config->urls->templates?>css/calendar.css" />
	<script type="text/javascript" src="<?= $config->urls->templates?>js/jquery.js"></script>
	<script type="text/javascript" src="<?= $config->urls->templates?>js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="<?= $config->urls->templates?>js/html5shiv.js"></script>
	<![endif]-->
</head>
<body>
	<div class="navbar navbar-fixed-top">
  		<div class="navbar-inner">
  			<div class="container">
  				<div class="row">
  					<div class="span8">
  						<!-- Top Nav -->
  						<?= $logo ?>
  						<ul class='nav'><?php			
							$homepage = $pages->get("/"); 
							$children = $homepage->children;
							$children->prepend($homepage); 
		
							foreach($children as $child) {
							$class = $child === $page->rootParent ? " class='active'" : '';
								if ($child->title == "Buchhaltung" && $user->hasRole('rechnungen')){
									echo ' ';
								} else {
									echo "<li$class><a href='{$child->url}'>{$child->title}</a></li>";
								}									
							
							}
							?>							
						</ul>						
    				<!-- Search input -->
    					
    					</div>
    					<div class="span4">
    						<form id='search_form' action='<?= $config->urls->root?>search/' method='get' class="navbar-search">						
        					<div class="input-append">
           						<input type='text' name='q' id='search_query' value='<?= htmlentities($input->whitelist('q'), ENT_QUOTES, 'UTF-8'); ?>' />
            					<button type='submit' id='search_submit' class="btn"><i class="icon-search"></i></button>
        					</div>
    					</form>
                		<ul class="nav">
                    		<li><a href="?logout=1"><i class="icon-off"></i> Logout</a></li>
                		</ul>
              		</div>
  					</div>
  				</div>
  			</div>
		</div>


<div class="container">		<!-- Content Container closed in foot -->