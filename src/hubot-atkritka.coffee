# Description:
#   Show random Atkritka from Atkritka.com by keyword.
#   Показывает случайную Аткрытку с Atkritka.com по ключевому слову
#
# Dependencies:
#   "jsdom": 1.0.0-pre.1
#
# Configuration:
#   None
#
# Commands:
#   аткрытку|аткрытку мне <ключевое слово> - Покажет случайную открытку по ключевому слову
#
# Author:
#   skibish

run = require("../scripts/helper.coffee")

module.exports = (robot) ->
  robot.hear /(аткрытку|аткрытку мне) (.*)/i, (msg) ->
    tag = run.unicodeToWin1251_UrlEncoded msg.match[2].toLowerCase()
    run.getPageCount tag, (pageCount) ->
      if pageCount > 0
        rndPage = run.randInt(1, pageCount)
        run.getImage tag, rndPage, (url) ->
          msg.send url
      else
        msg.send "Я не нашел Аткрытку :("
