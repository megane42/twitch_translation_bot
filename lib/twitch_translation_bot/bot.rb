require "zircon"
require "twitch_translation_bot/translator"

module TwitchTranslationBot
  class Bot
    def initialize(username: ENV["BOT_NAME"], password: ENV["BOT_ACCESS_TOKEN"], channel: ENV["CHANNEL_NAME"], translate_to: ENV["TRANSLATE_TO"])
      @client = Zircon.new(
        server:   "irc.chat.twitch.tv",
        port:     "6697",
        use_ssl:  true,
        username: username,
        password: password,
        channel:  "#" + channel
      )
      @translator = TwitchTranslationBot::Translator.new(translate_to: translate_to)
    end

    def run
      client.on_privmsg do |message|
        client.privmsg(client.channel, translator.translate(message.body))
      end

      puts ""
      puts "*** Twitch Translator Bot ***"
      puts "Press Ctrl + C to quit"
      puts ""

      client.run!
    end

    private
      attr_reader :client
      attr_reader :translator
  end
end
