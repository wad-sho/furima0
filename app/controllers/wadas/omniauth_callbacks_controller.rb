# frozen_string_literal: true

class Wadas::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorization
   end
  
   def google_oauth2
    authorization
   end
  
   private
  
   def authorization
    sns_info = Wada.from_omniauth(request.env["omniauth.auth"])
    @wada = sns_info[:wada]
     if @wada.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @wada, event: :authentication
    else #ユーザー情報が未登録なので、新規登録画面へ遷移する
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
   end
end
