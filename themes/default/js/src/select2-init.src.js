/**
 * Integration for select2
 */

$(function() {

	"use strict";

	/**
	 * Initialize select2 and attach all events
	 */
	function init() {
		setup($(document));
		$(document).trigger('afterselect2init');
	}

	function setup(scope) {
		var selects = scope.find("select.js-select2"),
			i;

		for(i =0; i < selects.length; i = i + 1) {
			setupSelect($(selects[i]));
		}

		attachEvents(scope);
	}

	function setupSelect(select) {
		var config = getConfig(select);

		select.select2(config);

		// make sure selects still get placeholder in list if values set at pageload
		select.trigger('change');
	}


	/**
	 * Attach event handlers to sleect related components
	 * @param Object Select
	 */
	function attachEvents(scope) {

	}

	/**
	 * Create config for select2 objects from select attributes
	 * @param select DOM Object
	 */
	function getConfig(select) {
		var config = {
				dropdownCssClass: ':all:',
				closeOnSelect: true,
				language: {},
				multiple: true
			};


		return config;
	}

	init();

});
