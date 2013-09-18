namespace :user_delete_jobs do

	desc "deleting all users which reachet expiration level"
	task :delete_users => :environment do
		@users = User.all
		@users.each {|user| user.destroy}
	end


end