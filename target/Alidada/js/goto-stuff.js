$(function() {
	$('#qr-code').popover({
		html : true,
		placement : 'left'
	});

	// Click to change Dark or Light for xs
	$('#dark').click(function() {
		if ($('#li-dark').hasClass('active')) {
			$('body').css({
				'color' : '#5a5a5a',
				'background' : ''
			});
			$('.featurette').css('color', '');
			$('#li-dark').removeClass('active');
		} else {
			$('body').css({
				'color' : '#666',
				'background' : '#34495E'
			});
			$('.featurette').css('color', '#95A5A6');
			$('#li-dark').addClass('active');
		}
	});
	// Click to change Dark or Light for sm,md,lg
	$('#btn-dark').click(function() {
		if ($('#btn-dark').hasClass('btn-default')) {
			$('body').css({
				'color' : '#5a5a5a',
				'background' : ''
			});
			$('.featurette').css('color', '');
			$('#btn-dark').attr('class', 'btn btn-primary');
		} else {
			$('body').css({
				'color' : '#666',
				'background' : '#2C3E50'
			});
			$('.featurette').css('color', '#95A5A6');
			$('#btn-dark').attr('class', 'btn btn-default');
		}
	});
	// Click to Push Pin
	$('#push-pin').click(function() {
		if (!$('#push-pin').hasClass('active')) {
			$('#affix').affix({
				offset : {
					// Clear shake in mobile (sew between navbar and sidebar)
					top : -1
				}
			});
			$('#affix').css('position', '');
			$('#push-pin').addClass('active');
		} else {
			$('#affix').css('position', 'relative');
			$('#push-pin').removeClass('active');
		}
	});

	/*
	 * Demo Scripts for Making Twitter Bootstrap 3 Tab Play Nicely With The Masonry
	 * Library
	 */
	
	// Initialize Masonry inside Bootstrap 3 Tab component
	var $container = $('.masonry-container');
	$container.imagesLoaded(function() {
		$container.masonry({
			itemSelector : '.item', // range items
			gutter : 0
		// gutter of items
		// (REALLY IMPORTANT!!! the defult gutter will make the width longer)
		});
	});

	// Reinitialize masonry inside each panel after the relative pill tab link
	// is
	// clicked -
	$('a[data-toggle=pill]').each(function() {
		var $this = $(this);

		$this.on('click', function() {

			$container.imagesLoaded(function() {
				$container.masonry({
					columnWidth : '.item',
					itemSelector : '.item',
					gutter : 0
				});
			});

		}); // end shown
	}); // end each


	//add to watch list
	$('#cd-add-watchlist').click(function(){
		var remove_num, add_num;
		var icon_heart = $(this).find('.cd-item-icon'),
			watching_num = $(this).parent().find('.watching-num');
		if(icon_heart.hasClass('watch')) {
			icon_heart.removeClass('watch');
			icon_heart.addClass('watching');
			//add ajax sentences here

			remove_num = parseInt(remove_num_separator(watching_num.html())) + 1;
			add_num = add_num_separator(remove_num);
			watching_num.html(add_num);
			$(this).find('.cd-item-watch').html('Now watching!');
		} else {
			icon_heart.removeClass('watching');
			icon_heart.addClass('watch');
			//add ajax sentences here

			remove_num = parseInt(remove_num_separator(watching_num.html())) - 1;
			add_num = add_num_separator(remove_num);
			watching_num.html(add_num);
			$(this).find('.cd-item-watch').html('Add to watchlist');
		}	
	});

	//become a fan
	$('#be-fans').click(function(){
		var remove_num, add_num;
		var icon_heart = $(this).find('.fui-heart'),
			fans_num = $(this).parent().find('.fans-num');
		if(icon_heart.hasClass('fan')) {
			icon_heart.removeClass('fan');
			icon_heart.addClass('faned');
			//add ajax sentences here

			remove_num = parseInt(remove_num_separator(fans_num.html())) + 1;
			add_num = add_num_separator(remove_num);
			fans_num.html(add_num);
			$(this).find('.be-fans-text').html('You are a fan now!');
		} else {
			icon_heart.removeClass('faned');
			icon_heart.addClass('fan');
			//add ajax sentences here

			remove_num = parseInt(remove_num_separator(fans_num.html())) - 1;
			add_num = add_num_separator(remove_num);
			fans_num.html(add_num);
			$(this).find('.be-fans-text').html('Become a fan');
		}	
	});

	//see more /OR see less bid history
	$('#history-more').click(function() {
		var show_hidden = $('#bid-history-hidden');
		if(show_hidden.hasClass('bid-history-hidden')) {
			show_hidden.removeClass('bid-history-hidden');
			$('#history-more').html('see less');
		} else {
			show_hidden.addClass('bid-history-hidden');
			$('#history-more').html('see more');
		}
	});

	$('.cd-comments .media-list li').hover(function() {
		/* Stuff to do when the mouse enters the element */
		$(this).find('.gs-flag').css('display', 'inline');
	}, function() {
		/* Stuff to do when the mouse leaves the element */
		$(this).find('.gs-flag').css('display', 'none');
	});

	//remove separator from number
	function remove_num_separator(num){
		var number = num.replace(/\,/g, '');
		return number;
	};

	//add separator to number
	function add_num_separator(num){
		var number = '',
			num = num.toString();
		num = num_reverse(num);
		for(var i = 0, len = num.length; i < len; i++) {
			if(i != 0 && i % 3 == 0) {
				number += ',';
			}
			number += num[i];
		}
		number = num_reverse(number);
		return number;
	};

	//reverse string of number
	function num_reverse(num){
		var result = '';
		for(var i = num.length; i > 0; i--) {
			result += num.charAt(i - 1);
		}
		return result;	
	};
});
