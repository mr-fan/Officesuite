<?php 
include("./head.inc");  
include("./scripts/kalenderfunction.php");  
?>


<div class="row">
	<div class="span12">
		<br /><br />
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
		<?php if($user->hasRole("kalender") OR $user->isSuperuser()) { ?>
		<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#terminadd"><i class='icon-calendar icon-white'></i> Termin eintragen</a>	
		<hr />
		<div id="terminadd" class="collapse">
		
		<form action="./" method="post" id="submitform" class="form-horizontal">
			<div class="control-group">
    			<label class="control-label">Datum</label>
    			<div class="controls">
  						<input type="text" name="termindatum" class="span2 datepicker" value="<?= $heute ?>" id="dp1" data-date-format="dd-mm-yyyy"/>  											
    			</div>
    		</div>
    		<div class="control-group">
    			<label class="control-label">Beschreibung</label>
    			<div class="controls">
  						<input type="text" name="termintext" class="span6" />  											
    			</div>
    		</div>
    		<div class="control-group">
    			<label class="control-label"></label>
    			<div class="controls">
  						<input type="submit" name="terminnew" class="btn btn-big btn-info" value="Speichern" />										
    			</div>
    		</div>    		
		</form>
		<hr />
	</div>	
	<?php } ?> <!-- end role check -->
		<div class="custom-calendar-wrap">
			<div id="custom-inner" class="custom-inner">
				<div class="custom-header clearfix">
					<nav>
						<span id="custom-prev" class="custom-prev"><i class="icon-chevron-left icon-white"></i></span>
						<span id="custom-today" class="custom-today"><i class="icon-home icon-white"></i></span>
						<span id="custom-next" class="custom-next"><i class="icon-chevron-right icon-white"></i></span>
					</nav>
					<h2 id="custom-month" class="custom-month"></h2>
					<h3 id="custom-year" class="custom-year"></h3>
				</div>
				<div id="calendar" class="fc-calendar-container"></div>
			</div>
		</div>
		<hr />		
		<p><span class="calendarEventPointer">&nbsp;</span> - Anzeige eines eingetragenen Termins</p>
		<p><span class="badge badge-warning"><i class="icon-warning-sign icon-white"></i></span> - Zeigt die Fälligkeit einer Rechnung</p>
	</div>	
</div>

<script type="text/javascript" src="<?= $config->urls->templates?>js/modern.js"></script>
<script type="text/javascript" src="<?= $config->urls->templates?>js/calendario.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/bootstrap-datepicker.js"></script>
<script type="text/javascript"> 
	$('.datepicker').datepicker({autoclose:true}); 	
			$(function() {
			
				var transEndEventNames = {
						'WebkitTransition' : 'webkitTransitionEnd',
						'MozTransition' : 'transitionend',
						'OTransition' : 'oTransitionEnd',
						'msTransition' : 'MSTransitionEnd',
						'transition' : 'transitionend'
					},
					transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
					$wrapper = $( '#custom-inner' ),
					$calendar = $( '#calendar' ),
					cal = $calendar.calendario( {
						onDayClick : function( $el, $contentEl, dateProperties ) {

							if( $contentEl.length > 0 ) {
								showEvents( $contentEl, dateProperties );
							}

						},
						caldata : {
						<?= getTermine(); ?> //grab the events
						},
						displayWeekAbbr : false
					} ),
					$month = $( '#custom-month' ).html( cal.getMonthName() ),
					$year = $( '#custom-year' ).html( cal.getYear() );

				$( '#custom-next' ).on( 'click', function() {
					cal.gotoNextMonth( updateMonthYear );
				} );
				$( '#custom-today' ).on( 'click', function() {
					cal.gotoNow( updateMonthYear );
				} );
				$( '#custom-prev' ).on( 'click', function() {
					cal.gotoPreviousMonth( updateMonthYear );
				} );

				function updateMonthYear() {				
					$month.html( cal.getMonthName() );
					$year.html( cal.getYear() );
				}

				function showEvents( $contentEl, dateProperties ) {

					hideEvents();
					
					var $events = $( '<div id="custom-content-reveal" class="custom-content-reveal"><h4>Termine am ' + dateProperties.day + '. ' + dateProperties.monthname + ' ' + dateProperties.year + '</h4></div>' ),
						$close = $( '<span class="custom-content-close"></span>' ).on( 'click', hideEvents );

					$events.append( $contentEl.html() , $close ).insertAfter( $wrapper );
					
					setTimeout( function() {
						$events.css( 'top', '0%' );
					}, 25 );

				}
				function hideEvents() {

					var $events = $( '#custom-content-reveal' );
					if( $events.length > 0 ) {
						
						$events.css( 'top', '100%' );
						Modernizr.csstransitions ? $events.on( transEndEventName, function() { $( this ).remove(); } ) : $events.remove();

					}

				}
			
			});
		</script>
<?php include("./foot.inc"); ?> 
