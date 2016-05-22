var casper = require('casper').create({
  pageSettings: {
    loadImages: true,//The script is much faster when this field is set to false
    loadPlugins: true,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'
  }
});
casper.options.viewportSize = {width: 1600, height: 950};//Set bigger screen
 
//First step is to open Twitter
casper.start().thenOpen("https://twitter.com/login", function() {
  console.log("Open Twitter");
});
 
//Now we have to populate username and password, and submit the form
casper.then(function(){
  console.log("Login using username and password");
  this.evaluate(function(){
    document.getElementsByClassName("js-username-field")[0].value = "";
    document.getElementsByClassName("js-password-field")[0].value = "";
    document.getElementsByClassName('submit')[1].click();
  });
});
 
//Make a screenshot of home page
casper.waitWhileSelector('.js-username-field', function() {
  console.log("Make a screenshot of Home page");
  this.capture('Home.png');
});
 
casper.then(function(){
  var jsonResult = this.evaluate(function(){
    var pageTweets = document.getElementsByClassName('js-tweet-text');
    var result=new Array();
    for (var i=0; i < pageTweets.length; i++) {
      result.push(pageTweets[i].innerHTML);
    }
    return JSON.stringify(result);  
  });
  console.log(jsonResult);
});
casper.run();