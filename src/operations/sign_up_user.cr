class SignUpUser < User::SaveOperation
  # include Translator

  param_key :user
  # Change password validations in src/operations/mixins/password_validations.cr
  include PasswordValidations

  permit_columns email, lang
  attribute password : String
  attribute password_confirmation : String

  before_save do
    validate_uniqueness_of email
    validate_inclusion_of lang, in: Translator::LANGUAGES_AVAILABLE

    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
