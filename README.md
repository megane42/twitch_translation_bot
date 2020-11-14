# Twitch Translation Bot

![image](https://user-images.githubusercontent.com/8451003/98442856-bd2be880-214a-11eb-8068-9e0bdc9dd17a.png)

## Features

- Realtime Twitch chat translation from...
  - any language to `TARGET_LANGUAGE`
  - and `TARGET_LANGUAGE` to English

## Requirements

- Twitch account for bot
- OAuth token of above bot account
  - Sign in to twitch as bot account
  - Access https://twitchapps.com/tmi/
  - Connect
- API key for Google Cloud Translation API
  - See https://translatepress.com/docs/automatic-translation/generate-google-api-key/

## Usage

- Run following ruby script

```ruby
require "bundler/inline"

gemfile do
  gem "twitch_translation_bot", git: "https://github.com/megane42/twitch_translation_bot"
end

require "twitch_translation_bot"

ENV["CHANNEL_NAME"]     = "megane42"      # Chatroom name (= twitch user name) where you want to translate
ENV["BOT_NAME"]         = "megane42bot"   # Bot account name
ENV["BOT_ACCESS_TOKEN"] = "oauth:*******" # Oauth token of bot account
ENV["TARGET_LANGUAGE"]  = "ja"            # ISO 639-1 codes
ENV["TRANSLATE_KEY"]    = "*************" # API key for google cloud translation API

TwitchTranslationBot::Bot.new.run
```

## License

- [MIT](https://opensource.org/licenses/MIT)
