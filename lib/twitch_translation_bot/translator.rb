require "google/cloud/translate/v2"

module TwitchTranslationBot
  class Translator
    def initialize(target_language:)
      @translator   = Google::Cloud::Translate::V2.new
      @target_language = target_language
    end

    def translate(text)
      result = @translator.translate(text.force_encoding("UTF-8"), to: target_language)

      puts "detected language: #{result.from}"

      result.text
    end

    private
      attr_reader :translator
      attr_reader :target_language
  end
end
