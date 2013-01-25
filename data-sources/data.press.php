<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcepress extends SectionDatasource{

		public $dsParamROOTELEMENT = 'press';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'link-url',
				'thumbnails: thumbnail-image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'press',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://myiabonner.co.uk/beta',
					'email' => 'david@sumnoise.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-09-27T11:57:35+00:00'
			);
		}

		public function getSource(){
			return '15';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
