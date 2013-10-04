module AppBlog
	require 'padrino-helpers'
		class App < Padrino::Application
			register SassInitializer
			use ActiveRecord::ConnectionAdapters::ConnectionManagement
			register Padrino::Rendering
			register Padrino::Mailer
			register Padrino::Helpers
			register Padrino::Admin::AccessControl
				enable :sessions
				enable :authentication
				enable :store_location
				set    :login_page, '/admin/sessions/new'
					access_control.roles_for :any do |role|
					role.protect '/new_comment'

		end
	end
end
