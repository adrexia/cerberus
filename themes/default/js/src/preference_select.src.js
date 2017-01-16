/*jslint browser: true*/
/*global $, jQuery*/

$(function() {
	"use strict";

	var enableFavs = $('#Form_Form_FavouriteID').length > 0;

	// Favourite must always be first. If it's not first, clear favourite
	function validateFavourite(object) {
		var form = $(object).closest('.preference-select'),
			favourite = form.find('.favourite');

		if(favourite !== undefined) {
			//check if favourite is first child
			if(!favourite.is( ":first-child")){
				favourite.removeClass('favourite');

				// clear hidden field
				form.find('favourite-id').val('');
			}
		}
	}

	function markFavourite(object) {
		var form = $(object).closest('.preference-select'),
			group = $(object).closest('.control-group'),
			id = group.find('input').attr('data-id');

		// allow toggling
		if (group.hasClass('favourite')) {
			group.removeClass('favourite');
			form.find('.favourite-id').val('');
		} else {
			// unset current favourite
			form.find('.favourite').removeClass('favourite');
			// set new favourite
			group.addClass('favourite');
			form.find('.favourite-id').val(id); // hidden field
		}
	}

	function updatePreferences(options) {
		var i;

		for(i = 0; i < options.length; i = i + 1) {
			$(options[i]).val(i+1);
		}

	}

	function moveToTop(object) {
		var group = $(object).closest('.preference-group'),
			options,
			favourite;

		group.prepend($(object).closest('.control-group'));

		// update input fields
		options = group.find('.control-group input');
		updatePreferences(options);
		validateFavourite(object);
	}

	function markup(prefGroup) {
		var favourite = '';

		if(enableFavs) {
			favourite = '<i class="icon icon-heart js-favourite" role="button" title="Mark as favourite"></i>';
		}

		prefGroup.find('.control-group').attr('title', 'Drag and drop to reorder');
		prefGroup.find('.extra').append('<i class="icon icon-up js-to-top" role="button" title="Move to top"></i>' + favourite);

	}

	function attachSortable(prefGroup) {
		prefGroup.sortable({
			axis: 'y',
			update: function (event, ui) {
				//update input fields
				var options = ui.item.closest('.preference-group').find('.control-group input');

				updatePreferences(options);
				validateFavourite(ui.item);
			}
		});
	}

	function attachEvents(prefSelect) {
		prefSelect.find('.js-to-top').on(Gumby.click, function(e){
			e.stopPropagation();
			moveToTop(this);
		});

		prefSelect.find('.js-favourite').on(Gumby.click, function(e){
			e.stopPropagation();
			if (enableFavs) {
				markFavourite(this);
			}
		});

		prefSelect.find('.field').on(Gumby.click, function(e) {
			if($(this).is( ":first-child")){
				if(!$(this).hasClass('isfinal') && enableFavs) {
					markFavourite(this);
				}
			} else {
				moveToTop(this);
			}
		});
	}

	function init() {

		var prefSelect = $('.preference-select'),
			prefGroup;

		if ($('.preference-select .preference-group') === undefined) {
			return;
		}

		prefGroup = prefSelect.find('.preference-group');
		markup(prefGroup);
		attachSortable(prefGroup);
		attachEvents(prefSelect);
	}

	init();

});
