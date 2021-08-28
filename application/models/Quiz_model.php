<?php 

class Quiz_model extends CI_Model {

	function register($name){ 
		$this->db->insert('user',  array('name' =>$name));
	    $user_id = $this->db->insert_id();
	    $set = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
	    $questions = [];
	    $keys = array_rand($set,10);
	    foreach ($keys as $value) {array_push($questions, $set[$value]);}
	    return ['user_id'=>$user_id,'questions' => $questions];
  	}

  	function getquestion($questionId){
  		$sql = "SELECT * FROM `questions` WHERE id=".$questionId;
    	$result = $this->db->query($sql);
    	if ($result->num_rows() > 0) { 
    		$question = $result->row();
    		$sql = "SELECT id,options FROM `answers` WHERE question_id=".$questionId;
    	$result = $this->db->query($sql);
    	if ($result->num_rows() > 0) { 
    		$options = $result->result_array();
    		return array('question' =>$question,'options' =>$options, );
    	} else {return false;}
    	} else {return false;}
  	}

  	function submit($questionId,$answerId){
  		$correct = '2';
  		if (!empty($answerId)) {
  			$sql = "SELECT correct FROM `answers` WHERE id=".$answerId." and question_id =".$questionId;
	    	$result = $this->db->query($sql);
	    	if ($result->num_rows() > 0) { 
	    		$correct = $result->row()->correct;
	    	} else {return false;}
  		}
		$result = array('user_id' =>$_SESSION['userId'] ,'question' =>$questionId ,'result' =>$correct , );
		$this->db->insert('results', $result);

  	}

  	public function result($userId){
  		$sql = "SELECT COUNT(CASE WHEN result='1' AND user_id=".$userId." THEN id END) as correct,
       COUNT(CASE WHEN result='0' AND user_id=".$userId." THEN id END) as wrong,
       COUNT(CASE WHEN result='2' AND user_id=".$userId." THEN id END) as skipped
	   FROM results";
	   $result = $this->db->query($sql);
	   if ($result->num_rows() > 0) { 
    		return $result->row();
    	} else {return false;}
  	}

}