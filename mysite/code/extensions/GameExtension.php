<?php
/**
 *
 */

class GameExtension extends DataExtension {

	private static $db = array(
		'Colour' => 'Varchar(255)'
	);

	private static $has_one = array(
		'SplashImage' => 'Image'
	);

	public function updateCMSFields(FieldList $fields) {

		$fields->addFieldToTab(
			'Root.Branding',
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
			)
		);


		$fields->insertAfter($image = UploadField::create('SplashImage', 'Splash Image'),'Colour');

		$image->setFolderName('Uploads/Splash-Images');
	}


	public function getIntro(){
		return $this->owner->Brief;
	}
}
