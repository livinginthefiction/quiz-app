<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quiz extends CI_Controller {

    function __construct(){

        // Construct the parent class
        parent::__construct();
        $this->load->model('Quiz_model');
    }

    public function registerUser(){
    	$name = $this->input->post('name');
		$register=$this->Quiz_model->register($name);
		if ($register) {
	    	$this->session->set_userdata('userId', $register['user_id']);
	    	$this->session->set_userdata('questions', $register['questions']);
        	$this->session->set_userdata('name', $name);
    		echo $this->load->view('quizlayout','',TRUE);

        }else{redirect();}

    }


    public function getquestion(){
        if (!empty($_SESSION['questions'])) {
            $getquestion=$this->Quiz_model->getquestion($_SESSION['questions'][0]);
            unset($_SESSION['questions'][0]);
            $this->session->set_userdata('questions', array_values($_SESSION['questions']));
            echo json_encode($getquestion) ;
        } else {
            $this->result();
        }
        
        
    }


    public function submit(){
        $getquestion=$this->Quiz_model->submit($this->input->post('question'),$this->input->post('answer'));
        $this->getquestion();
    }

    public function result(){   
        $getresult=$this->Quiz_model->result($_SESSION['userId']);
        echo $this->load->view('resltlayout',array('result'=>$getresult),TRUE);
    }
}
        
