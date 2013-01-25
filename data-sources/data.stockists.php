<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestockists extends SectionDatasource{

		public $dsParamROOTELEMENT = 'stockists';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'body: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'stockists',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/myiabonner',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-09-14T08:10:27+00:00'
			);
		}

		public function getSource(){
			return '11';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
