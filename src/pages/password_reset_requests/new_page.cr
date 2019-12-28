class PasswordResetRequests::NewPage < AuthLayout
  needs operation : RequestPasswordReset
  needs translator : Translator

  def content
    h1 @translator.t("auth.reset_pwd_request")
    render_form(@operation)
  end

  private def render_form(op)
    form_for PasswordResetRequests::Create do
      mount Shared::Field.new(op.email), &.email_input
      submit @translator.t("auth.reset_pwd_request"), flow_id: "request-password-reset-button"
    end
  end
end
