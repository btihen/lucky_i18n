class SignIns::NewPage < AuthLayout
  needs operation : SignInUser
  # needs translator : Translator

  def content
    h1 @translator.t("auth.sign_in")
    render_sign_in_form(@operation)
  end

  private def render_sign_in_form(op)
    form_for SignIns::Create do
      sign_in_fields(op)
      submit @translator.t("auth.sign_in"), flow_id: "sign-in-button"
    end
    link @translator.t("auth.reset_pwd_request"), to: PasswordResetRequests::New
    text " | "
    link @translator.t("auth.sign_up"), to: SignUps::New
  end

  private def sign_in_fields(op)
    mount Shared::Field.new(op.email), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password), &.password_input
  end
end
