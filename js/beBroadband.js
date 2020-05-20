//declare variable functions
var sliders = {
	welcomeCards: function() {
		$('.welcomeCards').slick({
			infinite: false,
			slidesToShow: 1,
			centerMode: true,
			prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
			nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>'
		});
	},
	welcomeCardsChange: function() {
		$('.welcomeCards').on('afterChange', function() {
			$('.card.slick-current').each(function() {
				var dataVisible = $(this).attr('data-toggle');
				$(dataVisible).fadeIn(800);
				$(dataVisible).siblings().hide();
				if (dataVisible == "#purchase_buttons") {
					sliders.productSlide();
				}
				if ($(this).hasClass('active')) {
					$(this).removeClass('active');
				} else {
					$(this).addClass('active');
				}

				$(this).siblings().removeClass('active');
			});
		});
	},
	mobileStart: function() {
		var startSlide = $('.card.slick-current').attr('data-toggle');
		$(startSlide).fadeIn(800);
		$('.card.slick-current').addClass('active');
	},
	productSlide: function() {
		$('.products').not('.slick-initialized').slick({
			infinite: true,
			slidesToShow: 3,
			slidesToScroll: 3,
			prevArrow: '<i class="fa fa-chevron-left" aria-hidden="true"></i>',
			nextArrow: '<i class="fa fa-chevron-right" aria-hidden="true"></i>',
			responsive: [{
					breakpoint: 2560,
					settings: {
						settings: "unslick"
					}
				},
				{
					breakpoint: 768,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						infinite: true,
						arrows: true,
						dots: false,
						centerMode: true
					}
				}
			]
		});
	},
	cards: function() {
		$('.card').each(function() {
			var dataVisible = $(this).attr('data-toggle');
			$(this).on('click', function() {
				$(dataVisible).fadeIn(800);
				$(dataVisible).siblings().hide();
				if (dataVisible == "#purchase_buttons") {
					sliders.productSlide();
				}
				if ($(this).hasClass('active')) {
					$(this).removeClass('active');
				} else {
					$(this).addClass('active');
				}

				$(this).siblings().removeClass('active');
			});
		});
	},
	startCard: function() {
		var card = $('#Login').attr('data-toggle');
		$(card).show(800);
		$('#Login').addClass('active');
	}
};

$(function() {
	$(window).on("load resize", function() {
		if ($(window).width() <= 768) {
			var kidCards = $('.welcomeCards').children().length;
			if (kidCards >= 3) {
				sliders.welcomeCards();
				sliders.mobileStart();
				sliders.welcomeCardsChange();
			} else {
				sliders.startCard();
				sliders.cards();
			}
		} else {
			sliders.cards();
		}
	});


	$('.productTitle').each(function() {
		var splittin = $(this).text().split(" ");
		$(this).html("<span class='dataAmount'>" + splittin[0] + "</span><span class='dataText'>" + splittin[1] + " " + splittin[2] + "</span>");
	});
});