class SignUps::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.success = t("auth.sign_in_success")
        sign_in(user)
        redirect to: Home::Index
      else
        # might be needed when user auth fails - but compiles without
        # user_lang = LANGUAGE_DEFAULT
        flash.failure = t("auth.sign_in_failure")
        html NewPage, operation: operation
      end
    end
  end
end
