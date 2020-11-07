require "zircon"

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
    end

    def run
      client.on_privmsg do |message|
        client.privmsg(client.channel, message.body)
      end

      puts ""
      puts "*** Twitch Translator Bot ***"
      puts "Press Ctrl + C to quit"
      puts ""

      client.run!
    end

    private
      attr_reader :client
  end
end
