# Description:
#   Use thunderpush console via hubot. https://github.com/thunderpush/hubot-thunderpush
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_THUNDERPUSH_URL
#   HUBOT_THUNDERPUSH_KEY
#   HUBOT_THUNDERPUSH_SECRET
#
# Commands:
#   hubot thunder send #<channel> <message> - Post message to a channel
#   hubot thunder send @<user> <message> - Post message to a channel
#   hubot thunder get all users - Get all online users
#   hubot thunder get @<user> [status] - Get user online status
#   hubot thunder get #<channel> users - Get channel online users
#   hubot thunder disconnect @<user> - Get channel online users
# Authors:
#   jrschumacher, <Ryan Schumacher> github:jrschumacher
VERSION = '1.0.0'

API_PATH = "/api/1.0.0/#{process.env.HUBOT_THUNDERPUSH_KEY}"
URL = "#{process.env.HUBOT_THUNDERPUSH_URL}" + API_PATH
PRIV_USERS = "#{process.env.HUBOT_THUNDERPUSH_PRIVUSERS}"

http = (message, path) ->
  
  message.http("#{URL}#{path}/")
    .header('Accept', 'application/json')
    .header('X-Thunder-Secret-Key', process.env.HUBOT_THUNDERPUSH_SECRET)

module.exports = (robot) ->

# hubot thunder send #<channel> <message> - Post message to a channel
  robot.respond /thunder send #([\S]+) (.+)/i, (message) ->
    try
      json = JSON.parse(message.match[2])
      http(message, '/channels/' + message.match[1])
        .post(message.match[2]) (err, res, body) ->
          message.send(body)
    catch error
      message.send 'Message was not valid JSON'

# hubot thunder send @<user> <message> - Post message to a channel
  robot.respond /thunder send @([\S]+) (.+)/i, (message) ->
    try
      json = JSON.parse(message.match[2])
      http(message, '/users/' + message.match[1])
        .post(message.match[2]) (err, res, body) ->
          message.send(body)
    catch error
      message.send 'Message was not valid JSON'

# hubot thunder get all users [online] - Get all online users
  robot.respond /thunder get all users/i, (message) ->
    message.finish()
    http(message, '/users')
      .get() (err, res, body) ->
        message.send(body)

# hubot thunder get @<user> [status] - Get user online status
  robot.respond /thunder get @([\S]+)/i, (message) ->
    console.log('Thunderpush::getting status of user ' + message.match[1])
    message.finish()
    http(message, '/users/' + message.match[1])
      .get() (err, res, body) ->
        message.send(body)

# hubot thunder get #<channel> [users] - Get channel online users
  robot.respond /thunder get #([\S]+)/i, (message) ->
    message.finish()
    http(message, '/channels/' + message.match[1])
      .get() (err, res, body) ->
        message.send(body)

# hubot thunder disconnect @<user> - Get channel online users
  robot.respond /thunder disconnect @([\S]+)/i, (message) ->
    message.finish()
    http(message, '/users/' + message.match[1])
      .delete() (err, res, body) ->
        message.send(body)
