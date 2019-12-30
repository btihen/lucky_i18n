class Translator
  getter lang : String

  DEFAULT_LANGUAGE = "en"
  AVAILABLE_LANGUAGES = ["en", "de"]
  LANGUAGES_SELECTOR_LIST = [{"English", "en"}, {"Deutsch", "de"}]

  def initialize(user : User? = nil)
    @lang = user.try(&.lang) || DEFAULT_LANGUAGE
  end

  def t(key : String)
    I18n.t(key, @lang)
  end

  def t(key : String, count : Int32)
    I18n.t(key, @lang, count)
  end
end
