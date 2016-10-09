var casper = require('casper').create({
  pageSettings: {
    loadImages: true, //The script is much faster when this is false
    loadPlugins: true,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'
  }
});
casper.options.viewportSize = {width: 1440, height: 800};

var username = casper.cli.args[0];
var password = casper.cli.args[1];
var target = casper.cli.args[2];

casper.start().thenOpen("https://twitter.com/login");
 
//Now we have to populate username and password, and submit the form
casper.then(function(){
  this.evaluate(function(username, password){
    document.getElementsByClassName("js-username-field")[0].value = username;
    document.getElementsByClassName("js-password-field")[0].value = password;
    document.getElementsByClassName('submit')[1].click();
  }, username, password);
  this.capture("first.png");
});
 
//Make a screenshot of home page
casper.waitWhileSelector('.js-username-field', function() {
  // this.thenOpen("https://github.com/casperjs/casperjs/issues/1334", function(){
  this.thenOpen("https://twitter.com/" + target + "/following", function(){

  //   this.wait(10000, function () {
    this.page.scrollPosition = { top: 3000, left: 0 };
    console.log(this.page.scrollPosition.top);

    this.wait(5000, function(){
      casper.capture("who-theyre-following-2.png");
    });
  });
});

casper.run();