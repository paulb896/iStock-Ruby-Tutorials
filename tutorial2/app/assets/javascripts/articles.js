
$(window).ready(function() {
    $('.edit_article').click(function(){
        $('.card').toggleClass("flipped");
        return false;
    });
    $('#scroller').scroller({
        preset: 'select',
        theme: 'android-ics light',
        display: 'inline',
        mode: 'scroller',
        inputClass: 'nothing'
    });
    $('#scroller').change(function(){
        console.log(this.text);
        $.get('/articles/byMonth/' + this.value + '.json', function(articles) {
          if (articles) {
            $("h1").text("Articles");
            $("#articles").empty();
            for(var i in articles) {
              $("#articles").append('<li class="cool_list_item"><a href="'+ '/articles/' + articles[i].id + '">' + articles[i].title + '</a></li>')
            }
          }
        });
    });
});






