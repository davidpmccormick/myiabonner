<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecollections extends SectionDatasource{

		public $dsParamROOTELEMENT = 'collections';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'items: thumbnail-image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'collections',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/myiabonner',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-09-13T10:35:06+00:00'
			);
		}

		public function getSource(){
			return '4';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
