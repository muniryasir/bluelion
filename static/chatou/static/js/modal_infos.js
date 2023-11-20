$(document).ready(function() {

    $(".info-tooltip").click(function (elt) {
        $('.modal-infos').addClass("is-active");
    });
    $('.navbar-infos li').click(function(elt){
        target = $(elt.currentTarget).find("a").attr("data-target");
        selectTab(target);
    });
    $('.infos-action').click(function(elt){
        $('.modal-infos').addClass("is-active");
        target = $(elt.currentTarget).attr("data-target");
        selectTab(target);
    });
});
function selectTab(target){
    $(".modal-infos a").removeClass('is-active');
    $('.modal-infos .section').removeClass('is-active');
    $(".modal-infos a[data-target='" + target + "']").addClass("is-active");
    $("#" + target).addClass("is-active");
}