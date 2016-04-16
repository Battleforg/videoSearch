define(function(require, exports, modules) {
    require('bootstrap');

    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').focus()
    });
});