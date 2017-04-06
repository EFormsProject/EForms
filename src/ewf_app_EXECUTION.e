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
		do
			create output.make_empty
			create db.make
			create main_file.make_html ("www/forms_section1.html")
			if request.path_info.same_string ("/") then
				create file.make_html ("www/forms_main.html")
				response.send (file)
			end
			if request.is_get_request_method and request.path_info.same_string ("/forms_section1.html") then
					--				create file.make_html ("forms_section1.html")
				response.send (main_file)
			-- Query : all people who took part in the voting
			elseif request.is_get_request_method and request.path_info.same_string ("/Query1.html") then
				iterator := 1
				create query_page.make
				query_page.add_style ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css", "")
				query_page.add_style ("https://cdn.rawgit.com/EFormsProject12345qwerty/EForms12345qwerty/23f632a2/css/forms.css", "")
				output := output + "%N<table border=" + "1" + "><tr><th>ID</th><th>Name of the unit</th></tr>"
				across
					db.query_off_name as name
				loop
					output := output + "<tr><td>" + iterator.out + "</td><td>" + name.item + "</td></tr>"
					iterator := iterator + 1
				end
				output := output + "</table>"
				query_page.set_title ("Query_1")
				query_page.set_body (output)
				response.send (query_page)
				output := ""
				iterator := 1
			elseif request.is_get_request_method and request.path_info.same_string ("/Query2.html") then
				create query_page.make
				query_page.set_title ("Query_2")
				query_page.set_body ("Number of supervised students total : " + db.query_supervised.out)
				response.send (query_page)
			elseif request.is_get_request_method and request.path_info.same_string ("/Query3.html") then
				create query_page.make
				query_page.set_title ("Query_3")
				query_page.set_body (output)
				response.send (query_page)
				output := ""
			elseif request.is_post_request_method and request.path_info.same_string ("/eforms_admin_panel.html") then
				output := ""
				if attached {WSF_STRING} request.form_parameter ("unit") as val then
					output := db.query_info (val.value)
				end
				create file.make_html ("www/Query3.html")
				response.send (file)
--				create query_page.make
--				query_page.set_title ("Query_3")
--				query_page.set_body (output)
--				response.send (query_page)
			elseif request.is_get_request_method and request.path_info.same_string ("/eforms_admin_panel.html") then
				create file.make_html ("www/eforms_admin_panel.html")
				response.send (file)
			elseif request.is_post_request_method and request.path_info.same_string ("/forms_section1.html")then
					-- Section 1
				if attached {WSF_STRING} request.form_parameter ("off_name") as val_1 then
					if val_1.is_empty then
						create file.make_html ("www/forms_section1.html")
						response.send (main_file)
					else
						if attached {WSF_STRING} request.form_parameter ("head_name") as val_2 then
							if val_2.is_empty then
								create file.make_html ("www/forms_section1.html")
								response.send (main_file)
							else
								db.insert ("off_name", val_1.value)
								db.insert ("head_name", val_2.value)
								if attached {WSF_STRING} request.form_parameter ("date_start") as val_3 then
									db.insert ("date_start", val_3.value)
								end
								if attached {WSF_STRING} request.form_parameter ("date_end") as val_4 then
									db.insert ("date_end", val_4.value)
								end

									-- Section 2
								if attached {WSF_STRING} request.form_parameter ("courses") as val_5 then
									if val_5.is_empty then
										create file.make_html ("www/forms_section1.html")
										response.send (file)
									else
										db.insert ("courses", val_5.value)
										if attached {WSF_STRING} request.form_parameter ("examinations") as val_6 then
											if val_6.is_empty then
												create file.make_html ("www/forms_section1.html")
												response.send (file)
											else
												db.insert ("examinations", val_6.value)
												if attached {WSF_STRING} request.form_parameter ("students_supervised") as val_7 then
													if val_7.is_empty then
														create file.make_html ("www/forms_section1.html")
														response.send (file)
													else
														db.insert ("students_supervised", val_7.value)
														if attached {WSF_STRING} request.form_parameter ("reports") as val_8 then
															if val_8.is_empty then
																create file.make_html ("www/forms_section1.html")
																response.send (file)
															else
																db.insert ("reports", val_8.value)
																if attached {WSF_STRING} request.form_parameter ("theses") as val_9 then
																	if val_9.is_empty then
																		create file.make_html ("www/forms_section1.html")
																		response.send (file)
																	else
																		db.insert ("theses", val_9.value)

																			-- Section 3
																		if attached {WSF_STRING} request.form_parameter ("grants") as val_10 then
																			if val_10.is_empty then
																				create file.make_html ("www/forms_section1.html")
																				response.send (file)
																			else
																				db.insert ("grants", val_10.value)
																				if attached {WSF_STRING} request.form_parameter ("research") as val_11 then
																					if val_11.is_empty then
																						create file.make_html ("www/forms_section1.html")
																						response.send (file)
																					else
																						db.insert ("research", val_11.value)
																						if attached {WSF_STRING} request.form_parameter ("collaborations") as val_12 then
																							db.insert ("collaborations", val_12.value)
																						end
																						if attached {WSF_STRING} request.form_parameter ("publications_conf") as val_13 then
																							db.insert ("publications_conf", val_13.value)
																						end
																						if attached {WSF_STRING} request.form_parameter ("publications_jour") as val_14 then
																							db.insert ("publications_jour", val_14.value)
																						end
																						db.execute_insert
																						db.querytest
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

end
