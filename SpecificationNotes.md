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
		> Line: 19
		> Modification: Replace User.first with current_user

	> Incompatibility 2
		> Requires: layout/bootstrap implementation
		> File: application.html.erb, custon.css.scss
		> Tag: body
		> Modification: Replace specified tag and scss file with required layout modification, if necessary
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~