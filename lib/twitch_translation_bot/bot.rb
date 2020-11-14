require "zircon"
require "twitch_translation_bot/translator"

module TwitchTranslationBot
  class Bot
    def initialize(
          username:          ENV["BOT_NAME"],
          password:          ENV["BOT_ACCESS_TOKEN"],
          channel:           ENV["CHANNEL_NAME"],
          target_language:   ENV["TARGET_LANGUAGE"],
          fallback_language: ENV["FALLBACK_LANGUAGE"]
        )
      @client = Zircon.new(
        server:   "irc.chat.twitch.tv",
        port:     "6697",
        use_ssl:  true,
        username: username,
        password: password,
        channel:  "#" + channel
      )
      @translator = TwitchTranslationBot::Translator.new
      @target_language   = target_language
      @fallback_language = fallback_language
    end

    def run
      client.on_privmsg do |message|
        username          = message.from
        original_text     = message.body
        detected_language = translator.language_of(original_text)
        translation       = translator.translate(original_text, to: detected_language == target_language ? fallback_language : target_language)

        puts "username: "          + username
        puts "original text: "     + original_text
        puts "detected language: " + detected_language
        puts "translation: "       + translation
        puts ""

        client.privmsg(client.channel, ":#{username} : #{translation}")
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
      attr_reader :target_language
      attr_reader :fallback_language
  end
end
