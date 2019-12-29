class SignIns::Delete < BrowserAction
  delete "/sign_out" do
    sign_out
    flash.info = t("auth.signed_out")
    redirect to: SignIns::New
  end
end
