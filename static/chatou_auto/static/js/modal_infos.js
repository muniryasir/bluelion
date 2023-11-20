$(document).ready(function() {

    $(".info-tooltip").click(function (elt) {
        console.log('here1');
        $('.modal-infos-BLUE').addClass("is-active");
        $('.modal-infos-RED').addClass("is-active");
        
    });
    $(".info-tooltip-download").click(function (elt) {
        // console.log('here1');
        
        
        if (isIos()) {
            $('.modal-infos-download-BLUE').addClass("is-active");
            $('#ios-table').show();
            $('#android-table').hide();
         }
        else {
            console.log('here1');
            $('#ios-table').hide();
            $('#android-table').hide();
            downloadApp();
        }
        
    });
    $('.navbar-infos li').click(function(elt){
        target = $(elt.currentTarget).find("a").attr("data-target");
        selectTab(target);
    });
    $('.infos-action').click(function(elt){
        $('.modal-infos-BLUE').addClass("is-active");
        $('.modal-infos-RED').addClass("is-active");
        target = $(elt.currentTarget).attr("data-target");
        selectTab(target);
    });
});
function selectTab(target){
    console.log('here5');
    $(".modal-infos-BLUE a").removeClass('is-active');
    $(".modal-infos-RED a").removeClass('is-active');
    $('.modal-infos-BLUE .section').removeClass('is-active');
    $('.modal-infos-RED .section').removeClass('is-active');
    $(".modal-infos-BLUE a[data-target='" + target + "']").addClass("is-active");
    $(".modal-infos-RED a[data-target='" + target + "']").addClass("is-active");
    $("#" + target).addClass("is-active");
}