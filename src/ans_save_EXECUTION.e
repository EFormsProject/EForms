note
	description: "[
		application execution
	]"
	date: "$Date: 2016-10-21 09:45:18 -0800 (Fri, 21 Oct 2016) $"
	revision: "$Revision: 99331 $"

class
	ANS_SAVE_EXECUTION

inherit

	WSF_EXECUTION

create
	make

feature {NONE} -- Initialization

feature -- Execution

	execute
		local
			file: WSF_FILE_RESPONSE
		do
			if request.path_info.same_string ("/") then
				response.send (create {WSF_FILE_RESPONSE}.make_html ("forms_main.html"))
			end
			if request.is_get_request_method and request.path_info.same_string ("/forms_section1.html") then
				create file.make_html ("forms_section1.html")
				response.send (file)
			elseif request.is_get_request_method and request.path_info.same_string ("/signin.html") then
				create file.make_html ("signino.html")
				response.send (file)
			elseif request.is_post_request_method then
					-- Section 1
				print ("%N Section 1: General. Results: %N")
				if attached {WSF_STRING} request.form_parameter ("off_name") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("head_name") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("date_start") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("date_end") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end

					-- Section 2
				print ("%N Section 2: Teaching. Results: %N")
				if attached {WSF_STRING} request.form_parameter ("courses") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("examinations") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("students_supervised") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("reports") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("theses") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
					-- Section 3s
			end
			if request.is_post_request_method and request.path_info.same_string ("/admin_panel.html?") then
				if attached {WSF_STRING} request.form_parameter ("username") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
				if attached {WSF_STRING} request.form_parameter ("password") as l_val then
					print (l_val.key + " is " + l_val.value + "%N")
				end
			end
		end

end
