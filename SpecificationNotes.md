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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~