$(document).ready(function () {
    $(window).scroll(function(){
        if ($(window).scrollTop() >= 45) {
            $('header').addClass('fixed-header');
        }
        else {
            $('header').removeClass('fixed-header');
        }
    });

    /****/
    $(".toggle-menu").click(function () {
        $('header nav').slideToggle('open');
        $('body').toggleClass('navbar-toggle');
    });


    $(".get-started a").click(function () {
        $('html,body').animate({
            scrollTop: $('.' + $(this).attr('data-target') + '').offset().top - 0
        }, 'slow');
    });

    $("header a").click(function () {
        $('html,body').animate({
            scrollTop: $('.' + $(this).attr('data-target') + '').offset().top - 120
        }, 'slow');
    });
});

$(document).ready(function () {
    /********/
    $('.opemsubmenu, .submenu').hover(function () {
        $(this).parents('.submenu-wrapper').toggleClass('submenuToggle');
    });
});

/***home-slider***/
// $('.home-slider .owl-carousel').owlCarousel({
//     items: 1,
//     lazyLoad: true,
//     loop: true,
//     margin: 10
// });

$('.home-slider .owl-carousel').owlCarousel({
    loop: true,
    items: 1,
    autoplay:true,
    animateOut: 'fadeOut',
    autoplayTimeout:3000,
    autoplayHoverPause:false,
        responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        }
    }
});
/***category-slider***/
$('.category-slider .owl-carousel').owlCarousel({
    loop: true,
    autoplay:true,
    animateOut: 'fadeOut',
    autoplayTimeout:3000,
    autoplayHoverPause:false,
    responsive: {
        0: {
            items: 3
        },
        600: {
            items: 4
        },
        1000: {
            items: 6
        }
    }
});
/******latest-data-slider*****/
$('.latest-data-slider .owl-carousel').owlCarousel({
    loop: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        }
    }
});

/******latest-data-slider*****/
$('.latest-data-slider2 .owl-carousel').owlCarousel({
    loop: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 4
        }
    }
});

/****dance-gallery***/
$('.dance-gallery .owl-carousel').owlCarousel({
    loop: true,
    center: true,
    autoplay:true,
    animateOut: 'fadeOut',
    autoplayTimeout:2500,
    autoplayHoverPause:true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 4
        }
    }
});

/***gigs-slider***/
$('.gigs-slider .owl-carousel').owlCarousel({
    items: 1,
    lazyLoad: true,
    loop: true,
    margin: 10
});