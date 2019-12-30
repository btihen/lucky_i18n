class SignIns::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    SignInUser.new(params).submit do |operation, authenticated_user|
      if authenticated_user
        sign_in(authenticated_user)
        flash.success = translator.t("auth.success")
        Authentic.redirect_to_originally_requested_path(self, fallback: Home::Index)
      else
        flash.failure = I18n.t("auth.failure", Translator::DEFAULT_LANGUAGE)
        html NewPage, operation: operation
      end
    end
  end
end
