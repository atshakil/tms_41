MySql Setup:
	> Please follow instructions here: https://www.digitalocean.com/community/tutorials/how-to-use-mysql-with-your-ruby-on-rails-application-on-ubuntu-14-04
	> Please add root password for mysql under 'common' section


########################################
Incompatibility management section

Please remove before: last pull request
########################################

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Tahmid Shakil:

	> Incompatibility 1
		> Requires: session implementation
		> File: subject_controllers.rb
		> Method: load_user
		> Modification: Replace User.first with current_user

	> Incompatibility 2
		> Requires: db course attribute "deadline"
		> File: supervisor/subjects/show.html.erb
		> Modification:
		> Replace "NOT IMPLEMENTED YET" with current_user
		> Replace '#' links with paths in corresponding comment block
			
	> Incompatibility 3
		> Requires: Subject lock attribute
		> File: supervisor/subjects_controller.rb && supervisor/subjects/show.html.erb
		> Modification: Disable "Delete" button based on lock state, remove failure block from controller
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~