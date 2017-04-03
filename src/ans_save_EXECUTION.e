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
			user_cor, pas_cor: BOOLEAN
			db: DATABASE_MANAGER
		do
			create db.make
			if request.path_info.same_string ("/") then
				create file.make_html ("forms_main.html")
				response.send (file)
			end
			if request.is_get_request_method and request.path_info.same_string ("/forms_section1.html") then
				create file.make_html ("forms_section1.html")
				response.send (file)
			elseif request.is_get_request_method and request.path_info.same_string ("/signino.html") then
				create file.make_html ("signino.html")
				response.send (file)
			elseif request.is_post_request_method and request.path_info.same_string ("/signino.html") then
				if attached {WSF_STRING} request.form_parameter ("username") as l_val then
					if l_val.same_string ("user1") then
						user_cor := True
					else
						user_cor := False
					end
				end
				if attached {WSF_STRING} request.form_parameter ("password") as l_val then
					if l_val.same_string ("1234") then
						pas_cor := True
					else
						pas_cor := False
					end
				end
				if pas_cor and user_cor then
					create file.make_html ("eforms_admin_panel.html")
					response.send (file)
				else
					create file.make_html ("signino.html")
					response.send (file)
				end
			elseif request.is_post_request_method then
					-- Section 1
				if attached {WSF_STRING} request.form_parameter ("off_name") as l_val then
					db.insert ("off_name", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("head_name") as l_val then
					db.insert ("head_name", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("date_start") as l_val then
					db.insert ("date_start", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("date_end") as l_val then
					db.insert ("date_end", l_val.value)
				end

					-- Section 2
				if attached {WSF_STRING} request.form_parameter ("courses") as l_val then
					db.insert ("courses", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("examinations") as l_val then
					db.insert ("examinations", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("students_supervised") as l_val then
					db.insert ("students_supervised", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("reports") as l_val then
					db.insert ("reports", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("theses") as l_val then
					db.insert ("theses", l_val.value)
				end

					-- Section 3
				if attached {WSF_STRING} request.form_parameter ("grants") as l_val then
					db.insert ("grants", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("research") as l_val then
					db.insert ("research", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("collaborations") as l_val then
					db.insert ("collaborations", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("publications_conf") as l_val then
					db.insert ("publications_conf", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("publications_jour") as l_val then
					db.insert ("publications_jour", l_val.value)
				end
				db.execute_insert
				db.querytest
			end
			if request.is_get_request_method and request.path_info.same_string ("/eforms_admin_panel.html") then
				create file.make_html ("eforms_admin_panel.html")
				response.send (file)
			end
		end

end
