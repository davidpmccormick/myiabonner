<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceshowcaseindex extends SectionDatasource{

		public $dsParamROOTELEMENT = 'showcaseindex';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'thumbnail-image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'showcaseindex',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/myiabonner',
					'email' => 'david@sumnoise.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2013-05-10T14:20:40+00:00'
			);
		}

		public function getSource(){
			return '17';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
