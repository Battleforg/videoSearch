define(function(require, exports, modules) {
    require('loadTemplate');
    require('bootstrap');

    $('[data-toggle="tooltip"]').tooltip();

    var showUpload = function() {
        $('#uploadImg').slideToggle();
    };
    $('#openUpload').click(function() {
        showUpload();
    });


    var showSample = function() {
        $('#useSamepleImg').slideToggle();
    };
    $('#sampleBtn').click(function() {
        showSample();
    });

    var uploadOneFile = function() {
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        var file = document.getElementById('uploadFile').files[0];
        fd.append("multipartFile", file);
        
        xhr.open("POST", "pictureUpload");
        xhr.send(fd);

    };
    $('#uploadBtn').click(function() {
        uploadOneFile();
    });
});