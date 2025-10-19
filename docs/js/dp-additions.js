    function darkmode() {
    var element = document.body;
    element.classList.toggle("dark-mode");
    } 

    if (String(window.location) !== 'https://daily-philosophy.com/'){
    var newPageLoadCountValue = Number(localStorage.getItem('pageLoadCount'));
    var prevPageLocation = String(localStorage.getItem('pageLocation'));
    var prevMonth = String(localStorage.getItem('prevMonth'));
    const month = new Date().getMonth();
    if (parseInt(month) != parseInt(prevMonth)) {
    newPageLoadCountValue = 0;
    localStorage.setItem('pageLoadCount', newPageLoadCountValue);
    }
    if ( prevPageLocation !== String(window.location) ) {
    newPageLoadCountValue += 1;
    localStorage.setItem('pageLoadCount', newPageLoadCountValue);
    localStorage.setItem('pageLocation', window.location);
    }
    localStorage.setItem('prevMonth', month );
    }
    
 //add simple support for background images:
 document.addEventListener('lazybeforeunveil', function(e){
     var bg = e.target.getAttribute('data-bg');
     var gradient = e.target.getAttribute('gradient');
     if(gradient){
	 e.target.style.backgroundImage = 'linear-gradient(to bottom, rgba(0,0,0,0), 70%, rgba(0,0,0,0.9)), url(' + bg + ')';
     } else {
	 e.target.style.backgroundImage = 'url(' + bg + ')';
     }
     if(bg){
	 e.target.style.backgroundPosition = 'center';
	 e.target.style.backgroundSize = 'cover';
	 e.target.style.backgroundRepeat = 'no-repeat';
     }
 });
