should = require 'should'
assert = require 'assert'
Conf = require '..'

describe 'conf', ->

  conf = undefined

  before ->
    conf = Conf()
    
  after ->
    
  beforeEach ->
  
  afterEach ->

  it 'factory',  ->
    assert conf.get('source') is 'factory'
    assert conf.get('factory') is true

    
