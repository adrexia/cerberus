<?php
class Page extends SiteTree {

	private static $icon = "mysite/images/sitetree_images/page.png";

	private static $db = array(
		'Intro' => 'Text',
		'Colour' => 'Varchar(255)'
	);


	private static $has_one = array(
		'SplashImage' => 'Image'
	);


	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->insertBefore(TextareaField::create('Intro', 'Intro'),'Content');

		$fields->insertAfter(
			ColorPaletteField::create(
				"Colour", "Colour",
				[
					'air'=> '#D0C9BB',
					'underworld'=> '#1C1F25',
					'passion'=> '#F15051',
					'sunlight'=>'#FFA600',
					'earth'=> '#79c608',
					'water'=> '#56ABCC',
					'inspiration'=> '#783980',
					'people'=> '#de347f',
				]
			), "Intro"
		);


		$fields->insertBefore($image = UploadField::create('SplashImage', 'Splash Image'),'Content');

		$image->setFolderName('Uploads/Splash-Images');

		return $fields;
	}

	public function getCurrentRegistration(){
		$member = Member::currentUser();
		if(!$member) return false;

		$reg = Registration::get()->filter(array(
			'MemberID' => $member->ID,
			'ParentID' => $this->getCurrentEvent()->ID,
		));

		if(!$reg){
			return false;
		}

		return $reg->First();
	}

	public function getCurrentEvent(){
		return SiteConfig::current_site_config()->CurrentEvent();
	}

}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
	);

	public function init() {
		parent::init();

	}



	public function getGameListingPage(){
		return GameListingPage::get()->First();
	}

	public function getCurrentSliderItems() {
		return $this->SliderItems()->filter('Archived', false);
	}

	public function getMemberProfilePage(){
		return MemberProfilePage::get()->First();
	}

	public function HomePage() {
		return HomePage::get_one('HomePage');
	}

	public function getGroupedGames() {

		// show all if in draft mode
		$mode = Versioned::get_reading_mode();

		if($mode == 'Stage.Stage') {
			$items = GroupedList::create(Game::get()->filter(array(
				'ParentID' => $this->getCurrentEvent()->ID
			))->sort('Session'));
		} else {
			$items = GroupedList::create(Game::get()->filter(array(
				'ParentID' => $this->getCurrentEvent()->ID,
				'Status'=> true
			))->sort('Session'));
		}

		return $items;
	}

	public function LoginLink() {
		return Controller::join_links(
			Injector::inst()->get('Security')->Link(),
			'login',
			'?BackURL=' . urlencode($this->Link())
		);
	}

	public function CMSAccess() {
		return Permission::check('ADMIN') || Permission::check('CMS_ACCESS_LeftAndMain');
	}

	// Strip underscores and spaces from a string
	public function NiceString($title, $sentenceCase = false) {
		$title = str_replace("_",  " ", $title);
		if ($sentenceCase) {
			$title = ucfirst($title);
		}
		return str_replace("-",  " ", $title);
	}

	public function isStaged() {
		return $mode == 'Stage.Stage' ? true : false;
	}

}
