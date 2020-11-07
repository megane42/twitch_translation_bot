require "google/cloud/translate/v2"

module TwitchTranslatorBot
  class Translator
    def initialize(translate_to:)
      @translator   = Google::Cloud::Translate::V2.new
      @translate_to = translate_to
    end

    def translate(text)
      result = @translator.translate(text.force_encoding("UTF-8"), to: translate_to)
      result.text
    end

    private
      attr_reader :translator
      attr_reader :translate_to
  end
end
