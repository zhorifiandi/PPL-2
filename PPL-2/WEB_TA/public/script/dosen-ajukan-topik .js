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
