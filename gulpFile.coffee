gulp       = require 'gulp'
autowatch  = require 'gulp-autowatch'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
cp         = require 'child_process'
stylus     = require 'gulp-stylus'
coffeeify  = require 'coffeeify'
browserify = require 'browserify'


n = '\n'
i = 0
until i is 8
  n = n + n
  i++


src =
  elm:    './src/elm/main.elm'
  css:    './src/css/*.styl'
  coffee: './src/js/*.coffee'


gulp.task 'coffee', ->
  bCache = {}
  b = browserify './src/js/app.coffee',
    debug: true
    interestGlobals: false
    cache: bCache
    extensions: ['.coffee']
  b.transform coffeeify
  b.bundle()
  .pipe source 'app.js'
  .pipe buffer()
  .pipe gulp.dest './public'


gulp.task 'watch', ->
  autowatch gulp, 
    elm:    './src/elm/*.elm'
    stylus: src.css
    coffee: src.coffee


gulp.task 'stylus', ->
  gulp.src src.css
  .pipe stylus()
  .pipe gulp.dest './public'


gulp.task 'elm', ->
  cmd  = 'elm-make '
  cmd += src.elm
  cmd += ' --output '
  cmd += './public'
  cmd += '/elm.js'

  cp.exec cmd, (err, stdout) ->
    console.log 'ELM ERROR', err if err
    console.log 'ELM ', stdout


gulp.task 'server', ->
  require './server.coffee'


gulp.task 'default', [ 'elm', 'coffee', 'stylus', 'watch', 'server' ]
