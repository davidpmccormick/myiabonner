<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceshowcasedetail extends SectionDatasource{

		public $dsParamROOTELEMENT = 'showcasedetail';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$url-title';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'41' => '{$url-title}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'main-images: image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'showcasedetail',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/myiabonner',
					'email' => 'david@sumnoise.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2013-05-10T14:13:22+00:00'
			);
		}

		public function getSource(){
			return '17';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
