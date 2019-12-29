class PasswordResets::NewPage < AuthLayout
  needs operation : ResetPassword
  needs user_id : Int64

  def content
    h1 t("auth.pwd_reset")
    render_password_reset_form(@operation)
  end

  private def render_password_reset_form(op)
    form_for PasswordResets::Create.with(@user_id) do
      mount Shared::Field.new(op.password), &.password_input(autofocus: "true")
      mount Shared::Field.new(op.password_confirmation), &.password_input

      submit t("auth.pwd_update"), flow_id: "update-password-button"
    end
  end
end
