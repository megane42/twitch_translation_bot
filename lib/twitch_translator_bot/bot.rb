require "zircon"

module TwitchTranslatorBot
  class Bot
    def run
      client = Zircon.new(
        server:   "irc.chat.twitch.tv",
        port:     "6697",
        use_ssl:  true,
        username: ENV["BOT_NAME"],
        password: ENV["BOT_ACCESS_TOKEN"],
        channel:  ENV["CHANNEL_NAME"],
      )

      client.on_message do |message|
        puts "*** `on_message` responds with all received message ***"
        puts message.from
        puts message.to
        puts message.type
        puts message.body
      end

      client.run!
    end
  end
end
