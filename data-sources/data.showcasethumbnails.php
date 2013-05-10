<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceshowcasethumbnails extends SectionDatasource{

		public $dsParamROOTELEMENT = 'showcasethumbnails';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '10';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'thumbnail-image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'showcasethumbnails',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/myiabonner',
					'email' => 'david@sumnoise.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2013-05-10T14:03:51+00:00'
			);
		}

		public function getSource(){
			return '17';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
