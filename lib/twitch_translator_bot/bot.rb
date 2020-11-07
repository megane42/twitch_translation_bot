require "zircon"
require "twitch_translator_bot/translator"

module TwitchTranslatorBot
  class Bot
    def initialize(username: ENV["BOT_NAME"], password: ENV["BOT_ACCESS_TOKEN"], channel: ENV["CHANNEL_NAME"])
      @client = Zircon.new(
        server:   "irc.chat.twitch.tv",
        port:     "6697",
        use_ssl:  true,
        username: username,
        password: password,
        channel:  "#" + channel
      )
      @translator = TwitchTranslatorBot::Translator.new(translate_to: ENV["TRANSLATE_TO"])
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
