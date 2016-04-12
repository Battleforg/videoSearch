define(function(require, exports, modules) {
    require('bootstrap');

    var jumpToshot = function(obj) {
        var video = document.getElementById('video');
        // calculate shot's start postion
        var startPos = $(obj).find('span').text();
        console.log(startPos);
        video.currentTime = startPos;
    }

    $('.shots').click(function() {
        jumpToshot(this);
    });

    var setBarsWidth = function() {
        var video = document.getElementById('video');
        video.addEventListener('loadedmetadata', function() {
            console.log("load complete");
            var duration = Math.round(video.duration);

            var bars = $('.progress').find('.progress-bar');
            for (var i = 0; i < bars.length; i++) {
                var widthStr;
                
                if (i < bars.length - 1) {
                    widthStr = $(bars[i + 1]).find('span').text()
                                - $(bars[i]).find('span').text();
                } else {
                    widthStr = duration - $(bars[i]).find('span').text();
                }
                
                widthStr = Math.round(widthStr * 100 / duration);

                $(bars[i]).width(widthStr + '%');
            }

            $('#timeBar').show();
        });
    }

    setBarsWidth();
});