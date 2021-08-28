console.log('quiz js loaded');
getquestion()


function getquestion() {
	$.ajax({
	        type: "POST",
	        url: 'http://localhost/quiz/quiz/getQuestion',
	        success: function(data){
	        	data = JSON.parse(data);
	        	fillQuestion(data);
	        }
    });
}

function fillQuestion(data) {
	$('#questionId').val(data.question.id);
	$('.h4').html(data.question.questions); 
	$('.h1').html('Question '+sessionStorage.getItem("question")); 

	$('#label1').html(data.options[0].options); 
	$('#label2').html(data.options[1].options); 
	$('#label3').html(data.options[2].options); 
	$('#label4').html(data.options[3].options); 

	$('#flexRadioDefault1').val(data.options[0].id);
	$('#flexRadioDefault2').val(data.options[1].id);
	$('#flexRadioDefault3').val(data.options[2].id);
	$('#flexRadioDefault4').val(data.options[3].id);
}

$('#submit').click(function() {
	var answer = $('input[name="flexRadioDefault"]:checked').val();
	var question = $('#questionId').val();
	if (answer) {submitanswer(question,answer);}
	else {alert("Answer cannot be empty");}
})

$('#skip').click(function() {
	if (confirm('Are you sure you want to save this thing into the database?')) {
		var question = $('#questionId').val();
		submitanswer(question,'');
	} else {console.log('Do Nothing');}
})

function submitanswer(question,answer) {
	var qno = parseInt(sessionStorage.getItem("question"))
		sessionStorage.setItem("question",qno+1);
	$.ajax({
	        type: "POST",
	        url: 'http://localhost/quiz/quiz/submit',
	        data: {question:question,answer:answer},
	        success: function(data){
	        	if (parseInt(sessionStorage.getItem("question"))<11) {
		        	data = JSON.parse(data);
		        	fillQuestion(data);	
	        	}else{$('#ajax-content').html(data);}

	        }
    });
}