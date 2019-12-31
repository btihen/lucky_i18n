module Api::Auth::RequireAuthToken
  include Translator

  macro included
    before require_auth_token
  end

  private def require_auth_token
    if current_user?
      continue
    else
      json auth_error_json, 401
    end
  end

  private def auth_error_json
    # since we have no valid user define `user_lang`
    user_lang = LANGUAGE_DEFAULT
    ErrorSerializer.new(
      message: t("auth_token.not_authenticated"), details: auth_error_details
    )
  end

  private def auth_error_details : String
    # since we have no valid user define `user_lang`
    user_lang = LANGUAGE_DEFAULT
    if auth_token
      t("auth_token.invalid")
    else
      t("auth_token.missing")
    end
  end

  # Tells the compiler that the current_user is not nil since we have checked
  # that the user is signed in
  private def current_user : User
    current_user?.not_nil!
  end
end
