class SignIns::Delete < BrowserAction
  delete "/sign_out" do
    # assign the flash before loosing the current_user
    flash.info = t("auth.signed_out")
    sign_out
    redirect to: SignIns::New
  end
end
