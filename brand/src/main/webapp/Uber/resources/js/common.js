var honorsvilleBrand = honorsvilleBrand || {};
var $window = $(window);
var scrollTop;
var $header = $('#header');
var isScrolling = false;

honorsvilleBrand = {
    common : function(){

        //gnb
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

        //SNS
        var $sns = $header.find('.sns_wrap'),
            $snsInner = $sns.find('.inner'),
            $realSns = $snsInner.find('.sns'),
            $snsTxt = $sns.find('.txt');
        $snsTxt.mouseenter(function(){
            $sns.stop().addClass('on');
        });
        $realSns.mouseleave(function(){
            $sns.stop().removeClass('on');
        });
        $header.mouseleave(function(){
            $sns.stop().removeClass('on');
        });

        //footer
        var $familySite = $('.family_site'),
            $defaultBtn = $familySite.find('.default_box a');
        $defaultBtn.click(function(e){
            e.preventDefault();
            if ( $familySite.hasClass('on') ){
                $familySite.removeClass('on');
            } else {
                $familySite.addClass('on');
            }
        });

        //radio
        var $radio = $('.radio_wrap'),
            $radioLabel = $radio.find('label'),
            $input = $radioLabel.find('input'),
            radioLen = $radio.length;
        if ( radioLen > 0 ) {
            $radioLabel.click(function(){
                var $this = $(this),
                    $thisInput = $this.find('input');
                $this.addClass('checked').siblings('label').removeClass('checked');
                $input.removeAttr('checked');
                $thisInput.attr("checked", "checked");
            });
        }
        
    },
    subHeader : function(){
        $header.addClass("sub");
    },
    
    stickyGnb : function(){
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
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
            // $contents = $('#contents'),
            // contH = $contents.outerHeight(),
            tabOffset = $tab.offset().top;
        
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
            if ( scrollTop > tabOffset ) {
                $tab.addClass('sticky');
            } else {
                $tab.removeClass('sticky');
            }
        });
    },
    btnFavor : function(){
        var $btn = $('.btn_favor');
        $btn.click(function(e){
            e.preventDefault();
            var $this = $(this);
            if ( $this.hasClass('on') ) {
                $this.removeClass('on');
            } else {
                $this.addClass('on');
            }
        });
    }
}
honorsvilleBrand.common();