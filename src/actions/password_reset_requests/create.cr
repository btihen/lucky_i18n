class PasswordResetRequests::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    RequestPasswordReset.new(params).submit do |operation, user|
      if user
        PasswordResetRequestEmail.new(user).deliver
        flash.success = t("auth.pwd_reset_req_success")
        redirect SignIns::New
      else
        html NewPage, operation: operation
      end
    end
  end
end
