class Translator
  def initialize(user : User? = nil)
    @lang = user.try(&.lang) || "en"
  end

  def t(key : String)
    I18n.locale = @lang  # should be only for one request - but don't like much
    I18n.t(key)
    # I18n.t(key, @lang) # this seems better but not available
  end

  def t(key : String, count : Int32)
    I18n.locale = @lang  # should be only for one request - but don't like much
    I18n.t(key, count)
    # I18n.t(key, @lang, count) # this seems better but not available
  end
end
