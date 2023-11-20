
$(document).ready(function() {
    music_handler.init();
});

function changeAudio(sourceUrl) {
    var audio = $("#audio_player");      
    $("#audio_player").attr("src", sourceUrl);
    /****************/
    audio[0].pause();
    audio[0].load();//suspends and restores all audio element

    //audio[0].play(); changed based on Sprachprofi's comment below
    audio[0].oncanplaythrough = audio[0].play();
    /****************/
}

var music_handler = {
    currentTrack:undefined,
    audioDom:undefined,
    $timeDom:undefined,
    $progressBarDom:undefined,
    $titleDom:undefined,
    $btnDom:undefined,
    currentState:"pause",
    timer:undefined,

    init: function () {

        this.audioDom = $('.audio-player audio').get(0);
        this.$timeDom = $('.audio-player .music-infos span:last-child');
        this.$progressBarDom = $('.audio-player .progress-bar-cont');
        this.$titleDom = $('.audio-player .music-infos span:first-child');
        this.$btnDom = $('.audio-player .button-play');
        var self = this;
        $('.music-close').click(function () {
            self.quit()
        })
        //On show
        $('.audio-player-cta').click(function (elt) {
            $(".audio-player").show();
            self.setCurrentTrack(elt);
            self.currentState = "play";
            self.play();
        })
        $('.button-play').click(function(elt) {
            if (self.currentState == "play"){
                self.currentState = "pause";
                self.pause();
            }else{
                self.currentState = "play";
                self.play();
            }
        });
        self.$progressBarDom.on('click', function (e) {
            self.updateProgressBar(e);
            self.updateElapsedTime();
        })
    },
    play:function () {
        var self = this;
        try {
            self.currentTrack.play();
            clearInterval(self.timer);
            self.timer = setInterval( self.run.bind(self), 50 );
            self.$btnDom.addClass('paused');
        }catch (e) {
            console.log("No audio handled")
        }
    },
    pause:function () {
        var self = this;
        try {
            self.currentTrack.pause();
            clearInterval(self.timer);
            self.$btnDom.removeClass('paused');
        }catch (e) {
            console.log("No audio handled")
        }
    },
    setCurrentTrack:function(elt){
        var self= this;
        self.currentTrack = $('audio[data-track=' + $(elt.currentTarget).attr("data-track") + ']').get(0);
    },
    updateProgressBar:function(){

    },
    animateProgressBarPosition: function()
    {
        var self                = this,
            percentage          = (self.audioDom.currentTime * 100 / self.audioDom.duration) + "%",
            styleProgress      = { "width": percentage };
            styleDraggable      = { "left": percentage};
        self.$progressBarDom.find('.progress-bar .progression').eq(0).css(styleProgress);
        self.$progressBarDom.find('.progress-bar .draggable').eq(0).css(styleDraggable);
    },
    updateElapsedTime:function()
    {
        var self      = this,
            time      = self.audioDom.currentTime,
            minutes   = self.getAudioMinutes(time),
            seconds   = self.getAudioSeconds(time),

            audioTime = minutes + ":" + seconds;

        self.$timeDom.text( audioTime );
    },
    getAudioSeconds: function(string)
    {
        var self    = this,
            string  = string % 60;
        string  = self.addZero( Math.floor(string), 2 );

        (string < 60) ? string = string : string = "00";

        return string;
    },

    getAudioMinutes: function(string)
    {
        var self    = this,
            string  = string / 60;
        string  = self.addZero( Math.floor(string), 2 );

        (string < 60) ? string = string : string = "00";

        return string;
    },
    addZero: function(word, howManyZero)
    {
        var word = String(word);

        while(word.length < howManyZero) word = "0" + word;

        return word;
    },
    run: function()
    {
        var self = this;

        self.animateProgressBarPosition();
        self.updateElapsedTime();

        if(self.audioDom.ended) self.quit();
    },
    quit:function(){
        var self = this;
        self.pause();
        $('.audio-player').hide();
    },
    updateProgressBar: function(e)
    {
        var self = this,
            mouseX,
            percentage,
            newTime;

        if(e.offsetX) mouseX = e.offsetX;
        if(mouseX === undefined && e.layerX) mouseX = e.layerX;

        percentage  = mouseX / self.$progressBarDom.width();
        newTime     = self.audioDom.duration * percentage;

        self.audioDom.currentTime = newTime;
        self.animateProgressBarPosition();
    },

}