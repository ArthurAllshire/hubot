# Description:
#   Allows for the lookup of different events
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot team <team_number> - Looks up the specified team number and returns details.
#
# Author:
#   Arthur Allshire
token = process.env.HUBOT_SLACK_TOKEN

module.exports = (robot) ->

  robot.hear /[bag and tag|bagntag|bag n tag] (.*)/i, (msg) ->
    today = new Date()
    bagntag= new Date(2016,2,23,23,59,59)
    DAY = 1000*60*60*24
    days_to_go = Math.round((bagntag.getTime()-today.getTime())/DAY)
    message = "There are " + days_to_go + " days until bag and tag."
    if token = null
      message = stripslack(message)
    msg.send(message)

  stripslack = (toStrip) ->
    toStrip = toStrip.replace(new RegExp('\\*', 'g'), '')
    toStrip = toStrip.replace(new RegExp('\\_', 'g'), '')
    return toStrip
