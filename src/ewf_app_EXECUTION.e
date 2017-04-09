note
	description: "[
		application execution
	]"
	date: "$Date: 2016-10-21 09:45:18 -0800 (Fri, 21 Oct 2016) $"
	revision: "$Revision: 99331 $"

class
	EWF_APP_EXECUTION

inherit

	WSF_EXECUTION

create
	make

feature -- Initialization

feature -- Execution

	execute
		local
			file: WSF_FILE_RESPONSE
			db: DATABASE_MANAGER
			main_file: WSF_FILE_RESPONSE
			query_page: WSF_HTML_PAGE_RESPONSE
			output: STRING
			iterator: INTEGER
			kk: CHARACTER
			flag: BOOLEAN
			fields_of_db: ARRAY [STRING]
			temp_insert: LINKED_LIST [STRING]
			temp: STRING
		do
			kk := '"'
			create temp_insert.make
			create fields_of_db.make_filled ("", 1, 14)
			create output.make_empty
			create db.make
			create main_file.make_html ("www/forms_section1.html")
			if request.path_info.same_string ("/") or (request.path_info.same_string ("/forms_main.html") and request.is_get_request_method) then
				create file.make_html ("www/forms_main.html")
				response.send (file)
			elseif request.is_get_request_method and request.path_info.same_string ("/forms_section1.html") then
				response.send (main_file)
					-- Query : all people who took part in the voting
			elseif request.is_get_request_method and request.path_info.same_string ("/Query1.html") then
				iterator := 1
				create query_page.make
				query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
				query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
				output := "<table border=" + "1" + " bordercolor=" + kk.out + "white" + kk.out + " align=" + kk.out + "left" + kk.out + ">" + "<tr><th><font color=" + kk.out + "white" + kk.out + " size=" + "4" + "> ID </font></th><th><font color=" + kk.out + "white" + kk.out + " size=" + "4" + "> Name of the unit </font></th></tr>"
				across
					db.query_off_name as name
				loop
					output := output + "<tr><td><font color=" + kk.out + "white" + kk.out + " size=" + "4" + "> " + iterator.out + " </font></td><td><font color=" + kk.out + "white" + kk.out + " size=" + "4" + "> " + name.item + " </font></td></tr>"
					iterator := iterator + 1
				end
				output := output + "</table>"
				query_page.set_title ("Query_1")
				query_page.set_body ("<div class=" + kk.out + "container" + kk.out + ">" + "<nav class=" + kk.out + "navbar navbar-default" + kk.out + ">" + "<div class=" + kk.out + "container-fluid" + kk.out + ">" + "<div class=" + kk.out + "navbar-header" + kk.out + ">" + "<a class=" + kk.out + "navbar-brand" + kk.out + "href=" + kk.out + "forms_main.html" + kk.out + ">" + "EForms" + "</a>" + "</div>" + "<p class=" + kk.out + "navbar-text navbar-right" + kk.out + ">" + "<a href=" + kk.out + "eforms_admin_panel.html" + kk.out + "class=" + kk.out + "navbar-link" + kk.out + ">To admin panel" + "</a>" + "</p>" + "</div>" + "</div>" + "</nav>" + output)
				response.send (query_page)
				output := ""
				iterator := 1
					-- Query : Number of all participiants in voting
			elseif request.is_get_request_method and request.path_info.same_string ("/Query2.html") then
				create query_page.make
				query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
				query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
				query_page.set_title ("Query_2")
				query_page.set_body ("<div class=" + kk.out + "container" + kk.out + ">" + "<nav class=" + kk.out + "navbar navbar-default" + kk.out + ">" + "<div class=" + kk.out + "container-fluid" + kk.out + ">" + "<div class=" + kk.out + "navbar-header" + kk.out + ">" + "<a class=" + kk.out + "navbar-brand" + kk.out + "href=" + kk.out + "forms_main.html" + kk.out + ">" + "EForms" + "</a>" + "</div>" + "<p class=" + kk.out + "navbar-text navbar-right" + kk.out + ">" + "<a href=" + kk.out + "eforms_admin_panel.html" + kk.out + "class=" + kk.out + "navbar-link" + kk.out + ">To admin panel" + "</a>" + "</p>" + "</div>" + "</div>" + "</nav>" + "<p class=" + kk.out + "col-xs-offset-1" + kk.out + ">" + "<font size=" + kk.out + "6" + kk.out + " color=" + kk.out + "white" + kk.out + ">" + "Number of supervised students total : " + db.query_supervised.out + "</font>" + "</p>")
				response.send (query_page)
					-- Query : Cumulative info of a given unit
			elseif request.is_get_request_method and request.path_info.same_string ("/Query3.html") then
				create query_page.make
				query_page.set_title ("Query_3")
				query_page.set_body (output)
				response.send (query_page)
				output := ""
			elseif request.is_post_request_method and request.path_info.same_string ("/eforms_admin_panel.html") then
				if attached {WSF_STRING} request.form_parameter ("unit") as val then
					output := "<p><font color=" + kk.out + "white" + kk.out + " size=" + "5" + ">There is no unit with this name</font></p>"
					across
						db.query_off_name as name
					loop
						if val.value.same_string (name.item) then
							output := db.query_info (val.value)
						end
					end
				end
				create query_page.make
				query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
				query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
				query_page.set_title ("Query_3")
				query_page.set_body ("<div class=" + kk.out + "container" + kk.out + ">" + "<nav class=" + kk.out + "navbar navbar-default" + kk.out + ">" + "<div class=" + kk.out + "container-fluid" + kk.out + ">" + "<div class=" + kk.out + "navbar-header" + kk.out + ">" + "<a class=" + kk.out + "navbar-brand" + kk.out + "href=" + kk.out + "forms_main.html" + kk.out + ">" + "EForms" + "</a>" + "</div>" + "<p class=" + kk.out + "navbar-text navbar-right" + kk.out + ">" + "<a href=" + kk.out + "eforms_admin_panel.html" + kk.out + "class=" + kk.out + "navbar-link" + kk.out + ">To admin panel" + "</a>" + "</p>" + "</div>" + "</div>" + "</nav>" + output)
				response.send (query_page)
				output := ""
			elseif request.is_get_request_method and request.path_info.same_string ("/eforms_admin_panel.html") then
				create file.make_html ("www/eforms_admin_panel.html")
				response.send (file)
			elseif request.is_post_request_method and request.path_info.same_string ("/forms_section1.html") then
					-- Section 1
				fields_of_db.put ("off_name", 1)
				fields_of_db.put ("head_name", 2)
				fields_of_db.put ("date_start", 3)
				fields_of_db.put ("date_end", 4)
				fields_of_db.put ("courses", 5)
				fields_of_db.put ("examinations", 6)
				fields_of_db.put ("students_supervised", 7)
				fields_of_db.put ("reports", 8)
				fields_of_db.put ("theses", 9)
				fields_of_db.put ("grants", 10)
				fields_of_db.put ("research", 11)
				fields_of_db.put ("collaborations", 12)
				fields_of_db.put ("publications_conf", 13)
				fields_of_db.put ("publications_jour", 14)
				flag := true
				if attached {WSF_STRING} request.form_parameter ("off_name") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						temp_insert.extend (temp)
							--						db.insert ("off_name", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("head_name") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("head_name", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("date_start") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
						--					db.insert ("date_start", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("date_end") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
						--					db.insert ("date_end", l_val.value)
				end

					-- Section 2
				if attached {WSF_STRING} request.form_parameter ("courses") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("courses", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("examinations") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("examinations", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("students_supervised") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("students_supervised", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("reports") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("reports", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("theses") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("theses", l_val.value)
					end
				end

					-- Section 3
				if attached {WSF_STRING} request.form_parameter ("grants") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("grants", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("research") as l_val then
					temp := l_val.value.to_string_32
					temp.adjust
					if temp.count = 0 then
						flag := false
					else
						if flag = true then
							temp_insert.extend (temp)
						end
							--					db.insert ("research", l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("collaborations") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
						--					db.insert ("collaborations", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("publications_conf") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
						--					db.insert ("publications_conf", l_val.value)
				end
				if attached {WSF_STRING} request.form_parameter ("publications_jour") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
						--					db.insert ("publications_jour", l_val.value)
				end
				if flag = true then
					from
						iterator := 1
					until
						iterator = fields_of_db.count
					loop
						db.insert (fields_of_db.at (iterator), temp_insert.i_th (iterator))
						iterator := iterator + 1
					end
					db.execute_insert
					create file.make_html ("www/forms_main.html")
					response.send (file)
				else
					create file.make_html ("www/forms_section1.html")
					response.send (file)
				end
			end
		end

end
