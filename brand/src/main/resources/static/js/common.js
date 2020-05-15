var honorsvilleBrand = honorsvilleBrand || {};
var $window = $(window);
var scrollTop;
var $header = $('#header');
var isScrolling = false;
honorsvilleBrand = {
	common : function(){
        
        //Gnb
        var $gnb = $header.find('.header .gnb'),
            $depth2 = $gnb.find('.depth2'),
            $depth2Item = $depth2.find('li'),
            ListItemH = $depth2Item.outerHeight(),
            ArrayListLen = [],
            $gnbBg = $header.find('.bg');

        $depth2.each(function(){
            var len = $(this).find('li').length;
            ArrayListLen.push(len);
        });

        var MaxListLen = Math.max.apply(null, ArrayListLen),
            gnbBgH = MaxListLen * ListItemH + 20;
                
        $header.mouseenter(function(){
            if ( isScrolling == false ) {
                $header.addClass('on');
            }
            $depth2.height(gnbBgH);
            $gnbBg.height(gnbBgH).addClass('on');
        }).mouseleave(function(){
            if ( isScrolling == false ) {
                $header.removeClass('on');
            } else {
                $header.addClass('on');
            }
            $depth2.height(0);
            $gnbBg.height(0).removeClass('on');
        });

        //Footer
        var $familySite = $('.family_site');
        $familySite.click(function(e){
            e.preventDefault();
            var $this = $(this);
            if ( $this.hasClass('on') ){
                $this.removeClass('on');
            } else {
                $this.addClass('on');
            }
        });

    },
    
    stickyGnb : function(){
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
            console.log(scrollTop);
            
            if ( scrollTop > 0 ) {
                isScrolling = true;
                $header.addClass('on');
            } else {
                isScrolling = false;
                $header.removeClass('on');
            }
        });
    },

    subTab : function(){
        var $tabItem = $('.tab_wrap ul li'),
            tabItemLen = $tabItem.length,
            tabItemW = 100 / tabItemLen;
        $tabItem.css('width', tabItemW+'%');
    },

    stickyTab : function(){
        var $window = $(window),
            $tab = $('.tab_wrap'),
            tabOffset = $tab.offset().top;
        
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
            if ( scrollTop > tabOffset ) {
                $tab.addClass('sticky');
            } else {
                $tab.removeClass('sticky');
            }
            
        });
    }
}
honorsvilleBrand.common();