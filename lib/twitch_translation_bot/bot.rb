require "zircon"
require "twitch_translation_bot/translator"

module TwitchTranslationBot
  class Bot
    def initialize(username: ENV["BOT_NAME"], password: ENV["BOT_ACCESS_TOKEN"], channel: ENV["CHANNEL_NAME"], target_language: ENV["TARGET_LANGUAGE"])
      @client = Zircon.new(
        server:   "irc.chat.twitch.tv",
        port:     "6697",
        use_ssl:  true,
        username: username,
        password: password,
        channel:  "#" + channel
      )
      @translator = TwitchTranslationBot::Translator.new(target_language: target_language)
    end

    def run
      client.on_privmsg do |message|
        translated_message = translator.translate(message.body)

        puts "user: #{message.from}"
        puts "original: #{message.body}"
        puts "translate: #{translated_message}"
        puts ""

        client.privmsg(client.channel, ":#{message.from} : #{translated_message}")
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
