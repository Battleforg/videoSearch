define(function(require, exports, modules) {
	require('loadTemplate');
	require('bootstrap');

	$('#editModal').on('hidden.bs.modal', function(e) {
		$('button#reset').click();
	});
});