electron      = require 'electron'
app           = electron().app
BrowserWindow = electron.BrowserWindow

mainWindow = undefined

console.log 'ELECTRON IS', electron

app.on 'ready', ->
  mainWindow = new BrowserWindow (width: 800, height: 600)
  mainWindow.loadURL 'file://' + __dirname + '/public/index.html'
  mainWindow.webContents.openDevTools()
  mainWindow.on 'closed', ->
    mainWindow = null