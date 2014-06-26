module ApplicationHelper
	def  devise_links
		if current_user #log out doesn't work here
			link_to 'Log Out', destroy_user_session_path, method: :delete  
		else 
			link_to 'Log In', new_user_session_path
		end
	end
end
