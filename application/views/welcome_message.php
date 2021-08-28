<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Welcome to CodeIgniter</title>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<style type="text/css">
			body,html {height: 100%;}
		</style>
	</head>
	<body class="bg-primary">

		<div class="container h-100">
		 	<div class="row h-100 justify-content-center align-items-center" id="ajax-content">
			    <div class="col-6">
			    	<div class="form-group">
			        	<input type="text" class="form-control" id="name" placeholder="Enter your name" value="" required>
			        </div>
			        <div class="form-group align-items-center">
			        	<center><button id="submit" class="btn btn-lg btn-danger px-5">Next</button></center>
			        </div>
			    </div>   
			</div>  
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
			  $('#submit').click(function() {
			    var name = $('#name').val();
			    if (name) {
			    	$.ajax({
					        type: "POST",
					        url: '<?php echo base_url("quiz/registerUser"); ?>',
					        data: {name:name},
					        success: function(data){
					        	$('#ajax-content').html(data); 
					        	$.getScript('js/quiz.js', function() {console.debug('Script loaded.');});
					        	sessionStorage.setItem("question", 1);
					        }
			        });
			    }else{
			    	alert('Name field cannot be empty');
			    }
			    
							  });
			});
		</script>
	</body>
</html>