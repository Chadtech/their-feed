(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var app, doIt, dummyData;

app = Elm.Main.fullscreen();

app.ports.search.subscribe(function(msg) {
  console.log('MSG!!', msg);
  return doIt();
});

dummyData = [
  {
    content: 'Ye',
    name: 'cool',
    handle: 'yes',
    image: 'this is image',
    date: 'cool'
  }
];

doIt = (function(_this) {
  return function() {
    return app.ports.handOver.send(dummyData);
  };
})(this);


},{}]},{},[1])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJzcmMvanMvYXBwLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBLElBQUE7O0FBQUEsR0FBQSxHQUFNLEdBQUcsQ0FBQyxJQUFJLENBQUMsVUFBVCxDQUFBOztBQUVOLEdBQUcsQ0FBQyxLQUFLLENBQUMsTUFBTSxDQUFDLFNBQWpCLENBQTJCLFNBQUMsR0FBRDtFQUN6QixPQUFPLENBQUMsR0FBUixDQUFZLE9BQVosRUFBcUIsR0FBckI7U0FDQSxJQUFBLENBQUE7QUFGeUIsQ0FBM0I7O0FBSUEsU0FBQSxHQUFZO0VBQ1I7SUFBQSxPQUFBLEVBQVMsSUFBVDtJQUNBLElBQUEsRUFBTSxNQUROO0lBRUEsTUFBQSxFQUFRLEtBRlI7SUFHQSxLQUFBLEVBQU8sZUFIUDtJQUlBLElBQUEsRUFBTSxNQUpOO0dBRFE7OztBQVFaLElBQUEsR0FBTyxDQUFBLFNBQUEsS0FBQTtTQUFBLFNBQUE7V0FDTCxHQUFHLENBQUMsS0FBSyxDQUFDLFFBQVEsQ0FBQyxJQUFuQixDQUF3QixTQUF4QjtFQURLO0FBQUEsQ0FBQSxDQUFBLENBQUEsSUFBQSIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCJhcHAgPSBFbG0uTWFpbi5mdWxsc2NyZWVuKClcblxuYXBwLnBvcnRzLnNlYXJjaC5zdWJzY3JpYmUgKG1zZykgLT5cbiAgY29uc29sZS5sb2cgJ01TRyEhJywgbXNnXG4gIGRvSXQoKVxuXG5kdW1teURhdGEgPSBbKFxuICAgIGNvbnRlbnQ6ICdZZSdcbiAgICBuYW1lOiAnY29vbCdcbiAgICBoYW5kbGU6ICd5ZXMnXG4gICAgaW1hZ2U6ICd0aGlzIGlzIGltYWdlJ1xuICAgIGRhdGU6ICdjb29sJ1xuICApXVxuXG5kb0l0ID0gPT5cbiAgYXBwLnBvcnRzLmhhbmRPdmVyLnNlbmQgZHVtbXlEYXRhIl19
