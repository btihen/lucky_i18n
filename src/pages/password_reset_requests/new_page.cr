class PasswordResetRequests::NewPage < AuthLayout
  needs operation : RequestPasswordReset

  def content
    h1 t("auth.pwd_reset_request")
    render_form(@operation)
  end

  private def render_form(op)
    form_for PasswordResetRequests::Create do
      mount Shared::Field.new(op.email), &.email_input
      submit t("auth.pwd_reset"), flow_id: "request-password-reset-button"
    end
  end
end
