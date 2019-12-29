module Translator

  LANGUAGE_DEFAULT = "en"
  LANGUAGES_AVAILABLE = ["en", "de"]
  # SELECTOR
  # The first element is the display name
  # The second element is the value sent to the form
  LANGUAGES_SELECTOR_LIST = [{"English", "en"}, {"Deutsch", "de"}]

  def t(key : String)
    I18n.translate(key, user_lang)
  end

  def t(key : String, count : Int32)
    I18n.translate(key, user_lang, count)
  end

  def user_lang(current_user=nil)
    current_user.try(&.lang) || LANGUAGE_DEFAULT
  end
end
