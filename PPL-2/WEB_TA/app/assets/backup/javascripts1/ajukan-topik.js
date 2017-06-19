    $(function() {
        $('input[name=topik1]').on('click init-post-format', function() {
            $('#input-topik1').toggle($('#inputTopik1').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=topik1]').on('click init-post-format', function() {
            $('#pilih-topik1').toggle($('#pilihTopik1').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=topik2]').on('click init-post-format', function() {
            $('#input-topik2').toggle($('#inputTopik2').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=topik2]').on('click init-post-format', function() {
            $('#pilih-topik2').toggle($('#pilihTopik2').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=topik3]').on('click init-post-format', function() {
            $('#input-topik3').toggle($('#inputTopik3').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=topik3]').on('click init-post-format', function() {
            $('#pilih-topik3').toggle($('#pilihTopik3').prop('checked'));
        }).trigger('init-post-format');
    });

    $('#choose-topik1').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionstopik1').css({'width': '50%'}).toggle();
        $('#optionskategori1').hide();
        $('#optionsdosen1').hide();
    });

    $('#optionstopik1').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-topik1').text(val);
        $(this).hide();
    });

    $('#optionstopik1').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-kategori1').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionskategori1').css({'width': '50%'}).toggle();
        $('#optionstopik1').hide();
        $('#optionsdosen1').hide();
    });

    $('#optionskategori1').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-kategori1').text(val);
        $(this).hide();
    });

    $('#optionskategori1').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-dosen1').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionsdosen1').css({'width': '50%'}).toggle();
        $('#optionstopik1').hide();
        $('#optionskategori1').hide();
    });

    $('#optionsdosen1').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-dosen1').text(val);
        $(this).hide();
    });

    $('#optionsdosen1').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-topik2').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionstopik2').css({'width': '50%'}).toggle();
        $('#optionskategori2').hide();
        $('#optionsdosen2').hide();
    });

    $('#optionstopik2').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-topik2').text(val);
        $(this).hide();
    });

    $('#optionstopik2').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-kategori2').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionskategori2').css({'width': '50%'}).toggle();
        $('#optionstopik2').hide();
        $('#optionsdosen2').hide();
    });

    $('#optionskategori2').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-kategori2').text(val);
        $(this).hide();
    });

    $('#optionskategori2').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-dosen2').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionsdosen2').css({'width': '50%'}).toggle();
        $('#optionstopik2').hide();
        $('#optionskategori2').hide();
    });

    $('#optionsdosen2').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-dosen2').text(val);
        $(this).hide();
    });

    $('#optionsdosen2').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-topik3').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionstopik3').css({'width': '50%'}).toggle();
        $('#optionskategori3').hide();
        $('#optionsdosen3').hide();
    });

    $('#optionstopik3').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-topik3').text(val);
        $(this).hide();
    });

    $('#optionstopik3').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-kategori3').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionskategori3').css({'width': '50%'}).toggle();
        $('#optionstopik3').hide();
        $('#optionsdosen3').hide();
    });

    $('#optionskategori3').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-kategori3').text(val);
        $(this).hide();
    });

    $('#optionskategori3').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });

    $('#choose-dosen3').click(function (e) {
        e.stopPropagation();
        $(this).siblings('#optionsdosen3').css({'width': '50%'}).toggle();
        $('#optionstopik3').hide();
        $('#optionskategori3').hide();
    });

    $('#optionsdosen3').change(function (e) {
        e.stopPropagation();
        var val = this.value || 'Select options';
        $(this).siblings('#choose-dosen3').text(val);
        $(this).hide();
    });

    $('#optionsdosen3').find('option').on({
        'mouseover': function () {
            $('.hover').removeClass('hover');
            $(this).addClass('hover');
        },
        'mouseleave': function () {
            $(this).removeClass('hover');
        },
        'click' : function() {
            $('.current').removeClass('current');
            $(this).addClass('current');
        }

    });
