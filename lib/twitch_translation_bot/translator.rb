require "google/cloud/translate/v2"

module TwitchTranslationBot
  class Translator
    def initialize
      @translator = Google::Cloud::Translate::V2.new
    end

    def language_of(text)
      translator.detect(text.force_encoding("UTF-8")).language
    end

    def translate(text, to:)
      translator.translate(text.force_encoding("UTF-8"), to: to).text
    end

    private
      attr_reader :translator
      attr_reader :target_language
  end
end
