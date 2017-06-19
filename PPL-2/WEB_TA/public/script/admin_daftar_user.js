	$(function() {
        $('input[name=register]').on('click init-post-format', function() {
            $('#inputDataMahasiswa').toggle($('#registerMahasiswa').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=register]').on('click init-post-format', function() {
            $('#inputDataDosen').toggle($('#registerDosen').prop('checked'));
        }).trigger('init-post-format');
    });

		$(function() {
	        $('input[name=register]').on('click init-post-format', function() {
	            $('#inputDataTU').toggle($('#registerTU').prop('checked'));
	        }).trigger('init-post-format');
	    });

	    $(function() {
	        $('input[name=register]').on('click init-post-format', function() {
	            $('#inputDataAdmin').toggle($('#registerAdmin').prop('checked'));
	        }).trigger('init-post-format');
	    });
