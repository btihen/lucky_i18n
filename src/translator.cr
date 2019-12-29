module Translator

  DEFAULT_LANGUAGE = "en"
  AVAILABLE_LANGUAGES = ["en", "de"]

  def t(key : String)
    I18n.translate(key, user_lang)
  end

  def t(key : String, count : Int32)
    I18n.translate(key, user_lang, count)
  end

  def user_lang(current_user=nil)
    current_user.try(&.lang) || DEFAULT_LANGUAGE
  end
end
