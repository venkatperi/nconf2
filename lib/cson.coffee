cson = require 'cson'

csonFormat =
  stringify : cson.stringifySync
  parse : cson.parseSync

module.exports = ( nconf ) ->
  nconf.csonFile = ( name, opts ) ->
    opts.format = csonFormat
    nconf.file name, opts

  nconf
    
