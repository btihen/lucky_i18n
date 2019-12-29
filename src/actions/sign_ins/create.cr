class SignIns::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    SignInUser.new(params).submit do |operation, authenticated_user|
      if authenticated_user
        sign_in(authenticated_user)
        flash.success = t("auth.sign_in_success")
        Authentic.redirect_to_originally_requested_path(self, fallback: Home::Index)
      else
        flash.failure = t("auth.sign_in_failure")
        html NewPage, operation: operation
      end
    end
  end
end
