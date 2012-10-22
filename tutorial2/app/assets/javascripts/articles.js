
$(window).ready(function() {
    $('.edit_article').click(function(){
        $('.card').toggleClass("flipped");
        return false;
    });
    $('#scroller').scroller({
        preset: 'select',
        theme: 'monthPicker',
        display: 'inline',
        mode: 'scroller',
        inputClass: 'nothing'
    });
    $('#scroller').change(function(){
        $.get('/articles/byMonth/' + this.value + '.json', function(articles) {
          if (articles) {
            $("#articles").empty();
            for(var i in articles) {
              $("#articles").append('<li><a href="'+ '/articles/' + articles[i].id +'">' + articles[i].title + '</a></li>')
            }
          }
        });
    });
});






