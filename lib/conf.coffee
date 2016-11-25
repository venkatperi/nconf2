nconf = require 'nconf'
envPaths = require 'env-paths'
pkgUp = require 'pkg-up'
path = require 'path'

# prevent caching of this module so module.parent is always accurate
delete require.cache[ __filename ]
parentDir = path.dirname(module.parent.filename)

module.exports = ( opts = {} ) ->
  conf = new nconf.Provider()

  pkgPath = pkgUp.sync parentDir
  opts.projectName ?= require(pkgPath).name if pkgPath?
  projectDir = path.dirname pkgPath

  throw new Error "couldn't determine project path" unless opts.projectName?
  opts.name ?= 'config'
  opts.cwd ?= envPaths(opts.projectName).config

  conf.argv().env()

  conf.file 'project2', path.resolve(opts.cwd, "#{opts.name}.json")
  conf.file 'factory2', path.resolve(projectDir, "#{opts.name}.json")

  conf
    
