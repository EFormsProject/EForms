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
	query_page: WSF_HTML_PAGE_RESPONSE

feature -- Execution

	execute
		local
			temp: STRING
			file: WSF_FILE_RESPONSE
			db: DATABASE_MANAGER
			output: STRING
			iterator: INTEGER
			kk: CHARACTER
			flag: BOOLEAN
			fields_of_db: ARRAY [STRING]
			temp_insert: LINKED_LIST [STRING]
		do
			kk := '"'
			create temp_insert.make
			create fields_of_db.make_filled ("", 1, 15)
			create output.make_empty
			create db.make
			if request.path_info.same_string ("/") or (request.path_info.same_string ("/forms_main.html") and request.is_get_request_method) then
				load_main_page
			elseif request.is_get_request_method and request.path_info.same_string ("/forms_section1.html") then
				load_form_section
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
				load_admin_panel

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
					end
				end
				if attached {WSF_STRING} request.form_parameter ("date_start") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
				end
				if attached {WSF_STRING} request.form_parameter ("date_end") as l_val then
					if flag = true then
						temp_insert.extend (l_val.value)
					end
				end

					-- Section 2

				temp := fill_form4 ("courses-name-", "courses-semester-", "courses-level-", "courses-number-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form4 ("exam-name-", "exam-semester-", "exam-kind-", "exam-number-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form2 ("studs-name-", "studs-number-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form3 ("reports-name-", "reports-title-", "reports-plans-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form6 ("theses-name-", "theses-degree-", "theses-supervisor-", "theses-committee-", "theses-inst-name-", "theses-title-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end

					-- Section 3
				temp := fill_form5 ("grants-title-", "grants-agency-", "grants-period-", "grants-type-", "grants-amount-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form5 ("research-title-", "research-personnel-", "research-expersonnel-", "research-expersonnel-", "research-sources-")
				temp.adjust
				if temp.count = 0 then
					flag := false
				else
					if flag = true then
						temp_insert.extend (temp)
					end
				end
				temp := fill_form5 ("col-country-", "col-name-", "col-departament-", "col-contact-", "col-nature-")
				temp.adjust
				temp_insert.extend (temp)
				temp := fill_form2 ("conf-au-", "conf-pub-")
				temp.adjust
				temp_insert.extend (temp)
				temp := fill_form2 ("journal-au-", "journal-pub-")
				temp.adjust
				temp_insert.extend (temp)
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
					db.querytest
					load_main_page
				else
					load_form_section
				end
			end
		end

feature

	fill_form4 (field1: STRING; field2: STRING; field3: STRING; field4: STRING): STRING
		local
			checker: INTEGER
			i: INTEGER
			temp: STRING
		do
			from
				checker := 1
				i := 1
				temp := ""
				print (temp)
			until
				checker = 0
			loop
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field2 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field3 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field4 + i.out) as l_val then
					temp := temp + ", " + l_val.value + ";"
				end
				i := i + 1
				print (i.out + temp)
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					l_val.value.to_string_32.adjust
					checker := l_val.value.count
				else
					checker := 0
				end
			end
			Result := temp
		end

feature

	fill_form2 (field1: STRING; field2: STRING): STRING
		local
			checker: INTEGER
			i: INTEGER
			temp: STRING
		do
			from
				checker := 1
				i := 1
				temp := ""
				print (temp)
			until
				checker = 0
			loop
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field2 + i.out) as l_val then
					temp := temp + ", " + l_val.value + ";"
				end
				i := i + 1
				print (i.out + temp)
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					l_val.value.to_string_32.adjust
					checker := l_val.value.count
				else
					checker := 0
				end
			end
			Result := temp
		end

feature

	fill_form3 (field1: STRING; field2: STRING; field3: STRING): STRING
		local
			checker: INTEGER
			i: INTEGER
			temp: STRING
		do
			from
				checker := 1
				i := 1
				temp := ""
				print (temp)
			until
				checker = 0
			loop
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field2 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field3 + i.out) as l_val then
					temp := temp + ", " + l_val.value + ";"
				end
				i := i + 1
				print (i.out + temp)
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					l_val.value.to_string_32.adjust
					checker := l_val.value.count
				else
					checker := 0
				end
			end
			Result := temp
		end

	fill_form6 (field1: STRING; field2: STRING; field3: STRING; field4: STRING; field5: STRING; field6: STRING): STRING
		local
			checker: INTEGER
			i: INTEGER
			temp: STRING
		do
			from
				checker := 1
				i := 1
				temp := ""
				print (temp)
			until
				checker = 0
			loop
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field2 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field3 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field4 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field5 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field6 + i.out) as l_val then
					temp := temp + ", " + l_val.value + ";"
				end
				i := i + 1
				print (i.out + temp)
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					l_val.value.to_string_32.adjust
					checker := l_val.value.count
				else
					checker := 0
				end
			end
			Result := temp
		end

	fill_form5 (field1: STRING; field2: STRING; field3: STRING; field4: STRING; field5: STRING): STRING
		local
			checker: INTEGER
			i: INTEGER
			temp: STRING
		do
			from
				checker := 1
				i := 1
				temp := ""
				print (temp)
			until
				checker = 0
			loop
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					temp := temp + " " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field2 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field3 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field4 + i.out) as l_val then
					temp := temp + ", " + l_val.value
				end
				if attached {WSF_STRING} request.form_parameter (field5 + i.out) as l_val then
					temp := temp + ", " + l_val.value + ";"
				end
				i := i + 1
				print (i.out + temp)
				if attached {WSF_STRING} request.form_parameter (field1 + i.out) as l_val then
					l_val.value.to_string_32.adjust
					checker := l_val.value.count
				else
					checker := 0
				end
			end
			Result := temp
		end

	load_main_page
		local
			form_main: PLAIN_TEXT_FILE
			temp: STRING
		do
			create form_main.make_open_read ("body_forms_main.txt")
			create query_page.make
			query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
			query_page.set_title ("Welcome to EForms")
			create temp.make_empty
			from
            	form_main.read_line
            until
            	form_main.exhausted
           	loop
            	temp := temp + form_main.last_string
            	form_main.read_line
           	end
			query_page.set_body (temp)
			response.send (query_page)
		end

	load_form_section
		local
			form_section: PLAIN_TEXT_FILE
			temp: STRING
		do
			create form_section.make_open_read ("body_forms_section1.txt")
			create query_page.make
			query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
			query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
			query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/bootstrap-datetimepicker.min.css", "")
			query_page.set_title ("Fill forms")
			query_page.add_javascript_url ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/js/bootstrap.min.js")
			query_page.add_javascript_url ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/js/jquery-1.11.1.min.js")
			query_page.add_javascript_url ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/js/moment-with-locales.min.js")
			query_page.add_javascript_url ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/js/bootstrap-datetimepicker.min.js")
			create temp.make_empty
			from
            	form_section.read_line
            until
             	form_section.exhausted
           	loop
            	temp := temp + form_section.last_string
            	form_section.read_line
           	end
           	temp.remove (1)
           	temp.remove (1)
           	temp.remove (1)
			query_page.set_body (temp)
			response.send (query_page)
		end

	load_admin_panel
		local
			form_admin_panel: PLAIN_TEXT_FILE
			temp: STRING
		do
			create form_admin_panel.make_open_read ("body_admin_panel.txt")
			create query_page.make
			query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
			query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
			query_page.set_title ("Admin panel")
			create temp.make_empty
			from
            	form_admin_panel.read_line
            until
             	form_admin_panel.exhausted
           	loop
            	temp := temp + form_admin_panel.last_string
            	form_admin_panel.read_line
           	end
           	query_page.set_body (temp)
			response.send (query_page)
		end
end
