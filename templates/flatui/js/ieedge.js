window.MSStream && window.addEventListener("DOMContentLoaded", function (){
    var base = document.getElementsByTagName('base')[0].href,
        links = document.getElementsByTagName('a');
    for(var l = links.length, i =0; l > i; i++){
        var a = links[i], href = a.getAttribute("href");
        if(href && href.indexOf('http') !== 0 && href.indexOf('/') !== 0){
            a.setAttribute("href", base + href);
        }
    }
});
