document.addEventListener('DOMContentLoaded', domReady);

    function domReady() {
      var imageComparisonCollection = document.querySelectorAll('.js-comparison-container');
      for (var i = 0; i < imageComparisonCollection.length; i++) {
        var imageWidget = imageComparisonCollection[i];
        var images = imageWidget.querySelectorAll('.comparison-image');
        new ImageComparison({
          container: imageWidget,
        //   startPosition: imageWidget.getAttribute('start-position'),
        startPosition:0,
          data: [
            {
              image: images[0],
              label: 'before'
            },
            {
              image: images[1],
              label: 'after'
            }
          ],
        });
      }
    }