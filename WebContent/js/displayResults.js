define(function(require, exports, modules) {
    require('loadTemplate');
    require('bootstrap');

    var generateShotsItem = function(data) {
    	if (data == null || data == undefined) return false;
        if ($.type(data) != "array") data = [data];

        for (var i = 0; i < data.length; i++) {
        	$('#shotsDetailArea').loadTemplate("#shotAndHitTemplate", data[i], {
        		append:true
        	});
        }
    };

    var showVideo = function(obj) {
    	var videoUrl = $(obj).parent().prev('.videoUrl').text();
    	$('video#video').find('source').attr('src', videoUrl);
    	document.getElementById('video').load();


    	var shotPairs = $(obj).parent().parent().find('p.shotPairs');
    	for (var i = 0; i < shotPairs.length; i++) {

    		var shotsData = {
    			shotsAndHit : $(shotPairs[i]).text()
    		};
    		generateShotsItem(shotsData);
    	}
    };

    $('.showVideoBtn').click(function() {
    	showVideo(this);
    });


    $('#myModal').on('hidden.bs.modal', function(e) {
    	var video = document.getElementById("video");
    	video.pause();
    	$('#shotsDetailArea').empty();
    });

});