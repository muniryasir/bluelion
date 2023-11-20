jQuery(document).ready(function($){
    var dragging = false,
        resizing = false;
    //cache jQuery objects
    var imageComparisonContainers = $('.cd-image-container');
    //check if the .cd-image-container is in the viewport
    //if yes, animate it
    $('.modal-comp-trigger').on('click', function(){
        $('.modal-comp').addClass('is-active');
        $('.cd-image-container').addClass('is-visible');
    });

    //make the .cd-handle element draggable and modify .cd-resize-img width according to its position
    imageComparisonContainers.each(function(){
        var actual = $(this);
        drags(actual.find('.cd-handle'), actual.find('.cd-resize-img'), actual, actual.find('.cd-image-label[data-type="original"]'), actual.find('.cd-image-label[data-type="modified"]'));
    });

    //update images label visibility
    $(window).on('resize', function(){
        if( !resizing) {
            resizing =  true;
            ( !window.requestAnimationFrame )
                ? setTimeout(function(){checkLabel(imageComparisonContainers);}, 100)
                : requestAnimationFrame(function(){checkLabel(imageComparisonContainers);});
        }
    });


    function checkLabel(container) {
        container.each(function(){
            var actual = $(this);
            updateLabel(actual.find('.cd-image-label[data-type="modified"]'), actual.find('.cd-resize-img'), 'left');
            updateLabel(actual.find('.cd-image-label[data-type="original"]'), actual.find('.cd-resize-img'), 'right');
        });

        resizing = false;
    }

    //draggable funtionality - credits to http://css-tricks.com/snippets/jquery/draggable-without-jquery-ui/
    function drags(dragElement, resizeElement, container, labelContainer, labelResizeElement) {
        dragElement.on("mousedown vmousedown touchstart", function(e1) {
            dragElement.addClass('cd-draggable');
            resizeElement.addClass('resizable');
            var dragWidth = dragElement.outerWidth(),
                containerOffset = container.offset().left,
                containerWidth = container.outerWidth(),
                minLeft = containerOffset + 10,
                maxLeft = containerOffset + containerWidth - dragWidth - 10;
            if(e1.type == 'touchstart'){
                var xPosition = dragElement.offset().left + dragWidth - e1.touches[0].pageX;
            }else{
                var xPosition = dragElement.offset().left + dragWidth - e1.pageX;
            }
            dragElement.parents().on("mousemove vmousemove touchmove", function(e2) {
                if( !dragging) {
                    dragging =  true;
                    ( !window.requestAnimationFrame )
                        ? setTimeout(function(){animateDraggedHandle(e2, xPosition, dragWidth, minLeft, maxLeft, containerOffset, containerWidth, resizeElement, labelContainer, labelResizeElement);}, 100)
                        : requestAnimationFrame(function(){animateDraggedHandle(e2, xPosition, dragWidth, minLeft, maxLeft, containerOffset, containerWidth, resizeElement, labelContainer, labelResizeElement);});
                }
            }).on("mouseup vmouseup touchend", function(e){
                dragElement.removeClass('cd-draggable');
                resizeElement.removeClass('resizable');
                dragElement.parents().unbind();
            });
            e1.preventDefault();
        }).on("mouseup vmouseup touchend", function(e) {
            dragElement.removeClass('cd-draggable');
            resizeElement.removeClass('resizable');
        });
    }

    function animateDraggedHandle(e2, xPosition, dragWidth, minLeft, maxLeft, containerOffset, containerWidth, resizeElement, labelContainer, labelResizeElement) {
        if(e2.type == 'touchmove'){
            var leftValue = e2.touches[0].pageX + xPosition - dragWidth;
        }else{
            var leftValue = e2.pageX + xPosition - dragWidth;
        }
        //constrain the draggable element to move inside his container
        if(leftValue < minLeft ) {
            leftValue = minLeft;
        } else if ( leftValue > maxLeft) {
            leftValue = maxLeft;
        }

        var widthValue = (leftValue + dragWidth/2 - containerOffset)*100/containerWidth+'%';
        $('.cd-draggable').css('left', widthValue).on("mouseup vmouseup touchend", function() {
            $(this).removeClass('cd-draggable');
            resizeElement.removeClass('resizable');
        });

        $('.resizable').css('width', widthValue);

        updateLabel(labelResizeElement, resizeElement, 'left');
        updateLabel(labelContainer, resizeElement, 'right');
        dragging =  false;
    }

    function updateLabel(label, resizeElement, position) {
        if(position == 'left') {
            ( label.offset().left + label.outerWidth() < resizeElement.offset().left + resizeElement.outerWidth() ) ? label.removeClass('is-hidden') : label.addClass('is-hidden') ;
        } else {
            ( label.offset().left > resizeElement.offset().left + resizeElement.outerWidth() ) ? label.removeClass('is-hidden') : label.addClass('is-hidden') ;
        }
    }
});