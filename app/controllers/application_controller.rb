class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_id #get ID client for add lawsuit.client_id
  	$ID_CLIENT = @client.id
  end

  def set_client_id   #send client_id for lawsuit
  	$ID_CLIENT
  end
end