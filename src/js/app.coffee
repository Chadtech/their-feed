app = Elm.Main.fullscreen()

app.ports.search.subscribe (msg) ->
  console.log 'MSG!!', msg
  doIt()

dummyData = [(
    content: 'Ye'
    name: 'cool'
    handle: 'yes'
    image: 'this is image'
    date: 'cool'
  )]

doIt = =>
  app.ports.handOverTweets.send dummyData