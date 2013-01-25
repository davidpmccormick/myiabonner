<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecompilenewsimages extends SectionDatasource{

		public $dsParamROOTELEMENT = 'compilenewsimages';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'id' => '{$sessionmonster-add}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'compilenewsimages',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://myiabonner.co.uk/beta',
					'email' => 'david@sumnoise.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-10-04T09:25:42+00:00'
			);
		}

		public function getSource(){
			return '9';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
