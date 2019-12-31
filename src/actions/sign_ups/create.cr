class SignUps::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.success = t("auth.sign_up_success")
        sign_in(user)
        redirect to: Home::Index
      else
        # needed a user_lang when sign_up fails
        user_lang = LANGUAGE_DEFAULT
        flash.failure = t("auth.sign_up_failure")
        html NewPage, operation: operation
      end
    end
  end
end
