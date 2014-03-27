# hubot-thunderpush

A Hubot script to interact with a Thunderpush server as an API console.

Thunderpush is a Tornado and SockJS based push service. It provides a Beaconpush (beaconpush.com) inspired HTTP API and client. (https://github.com/thunderpush/thunderpush)

## Installing

Add dependency to Hubot's package.json:

```json
{
  ...
  "dependencies": {
    ...
    "hubot-thunderpush": "latest"
  }
}
```

Include package in Hubot's external-scripts.json:

```json
["hubot-thunderpush"]
```

## Configuration

```
HUBOT_THUNDERPUSH_URL     # Thunderpush API server URL
HUBOT_THUNDERPUSH_KEY     # Thunderpush API Key
HUBOT_THUNDERPUSH_SECRET  # Thunderpush API Secret Key
```

## UNIX

To launch hubot locally with the correct environment variable value:

```
./scripts/console
```

To add the correct environment variable to an existing and working Heroku deployment, you'll issue something like:

```
heroku config:add HUBOT_THUNDERPUSH_URL=http://thunderpush.myhost.com
heroku config:add HUBOT_THUNDERPUSH_KEY=key
heroku config:add HUBOT_THUNDERPUSH_SECRET=secret
```

## Commands

```
# Post message to a channel
hubot thunder send #<channel> <message>

# Post message to a user
hubot thunder send @<user> <message>

# Get all online users
hubot thunder get all users

# Get user online status
hubot thunder get @<user> [status]

# Get channel online users
hubot thunder get #<channel> users

# Get channel online users
hubot thunder disconnect @<user>
```

## Links

GitHub: https://github.com/thunderpush/hubot-thunderpush

npmjs: https://npmjs.org/package/hubot-thunderpush

Thunderpush: https://github.com/thunderpush/thunderpush