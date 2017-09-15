(function ($) {
    $(function () {

        /* articles carousel vertical */
        $('.jcarousel').jcarousel({
            wrap: 'circular',
            animation: {
                duration: 1100,
                easing: 'swing'
            }
        });

        $('.jcarousel').jcarouselAutoscroll({
            'target': '+=1',
            interval: 5500
        });

        $('.jcarousel-control-prev')
            .on('active.jcarouselcontrol', function () {
                $(this).removeClass('inactive');
            })
            .on('inactive.jcarouselcontrol', function () {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });

        $('.jcarousel-control-next')
            .on('active.jcarouselcontrol', function () {
                $(this).removeClass('inactive');
            })
            .on('inactive.jcarouselcontrol', function () {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

        $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function () {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function () {
                $(this).removeClass('active');
            })
            .jcarouselPagination({
                'perPage': 1,

                'item': function (page, carouselItems) {
                    return '<a href="#' + page + '">' + page + '</a>';
                }
            });


    });
})(jQuery);
