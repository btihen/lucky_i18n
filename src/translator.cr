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

  # in places where current_user / user isn't available be sure to override this method with
  # 'quick_def user_lang, LANGUAGE_DEFAULT' or 'quick_def current_user, nil' (not recommended)
  def user_lang
    current_user.try(&.lang) || LANGUAGE_DEFAULT
  end
end
