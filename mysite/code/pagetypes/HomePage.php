<?php
class HomePage extends Page {

	private static $icon = "mysite/images/sitetree_images/home.png";
	public $pageIcon = "mysite/images/sitetree_images/home.png";

	private static $db = array(
		'Sidebar' => 'HTMLText'
	);

	private static $has_many = array(
		'NewsItems' => 'NewsItem',
		'SponsorLinks' => 'Link'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->insertAfter(new HTMLEditorField('Sidebar', 'Sidebar Content'),'Content');

		$gridField = new GridField(
			'SponsorLinks',
			'SponsorLinks',
			$this->SponsorLinks()->sort(array('Sort'=>'ASC')),
			$config = GridFieldConfig_RelationEditor::create()
		);
		$gridField->setModelClass('Link');
		$fields->addFieldToTab('Root.SponsorLinks', $gridField);
		$config->addComponent(new GridFieldOrderableRows());


		$gridField = new GridField(
			'NewsItems',
			'NewsItems',
			$this->NewsItems()->sort(array('Sort'=>'ASC','Archived'=>'ASC')),
			$config = GridFieldConfig_RelationEditor::create()
		);
		$gridField->setModelClass('NewsItem');
		$fields->addFieldToTab('Root.News', $gridField);
		$config->addComponent(new GridFieldOrderableRows());

		return $fields;
	}

}

class HomePage_Controller extends Page_Controller {


	public function getNews($pageSize = 5) {
		$items =  $this->NewsItems()->sort(array('Sort'=>'ASC','Created'=>'ASC'));
		// Apply pagination
		$list = new AjaxPaginatedList($items, $this->request);
		$list->setPageLength($pageSize);
		return $list;
	}

	public function RecentNews($pageSize = 10) {
		return $this->NewsItems()->Limit($pageSize);
	}

	public function getSponsorLinks() {
		return $this->SponsorLinks()->Sort('Sort');
	}


}
