chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'thunderpush', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/thunderpush')(@robot)


#   hubot thunder send #<channel> <message> - Post message to a channel
  it 'registers a respond listener for "thunder send #<channel> <message>"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder send #([\S]+) (.+)/i)

#   hubot thunder send @<user> <message> - Post message to a channel
  it 'registers a respond listener for "thunder send @<user> <message>"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder send @([\S]+) (.+)/i)

#   hubot thunder get all users - Get all online users
  it 'registers a respond listener for "thunder get all users"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder get all users/i)
    
#   hubot thunder get @<user> [status] - Get user online status
  it 'registers a respond listener for "thunder get @<user> true"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder get @([\S]+)/i)
    
#   hubot thunder get #<channel> users - Get channel online users
  it 'registers a respond listener for "thunder get #<channel> [users]"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder get #([\S]+)/i)
    
#   hubot thunder disconnect @<user> - Get channel online users
  it 'registers a respond listener for "thunder disconnect @<user>"', ->
    expect(@robot.respond).to.have.been.calledWith(/thunder disconnect @([\S]+)/i)