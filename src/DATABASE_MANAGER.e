class
	DATABASE_MANAGER

inherit

	SQLITE_SHARED_API

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_modify: SQLITE_MODIFY_STATEMENT
		do
				-- Open/create a Database.
			create database.make_create_read_write ("database.db")

				-- Create a new table
			create l_modify.make ("CREATE TABLE IF NOT EXISTS FORM (off_name TEXT, head_name TEXT, date_start TEXT, date_end TEXT, " + "courses TEXT, examinations TEXT, students_supervised TEXT, reports TEXT, theses TEXT, grants TEXT, research TEXT, collaborations TEXT, " + "publications_conf TEXT, publications_jour TEXT);", database)
			l_modify.execute
			create query_answer.make_empty
			create columns.make_empty
			create values.make_empty
			create args.make_empty
			i := 0
			c := '"'
		end

feature

	insert (column: STRING; data: STRING)
		do
				-- Create a insert statement with variables
			i := i + 1
			if (i = 1) then
				columns := column
				args := c.out + data + c.out
			else
				columns := column + ", " + columns
				args := c.out + data + c.out + ", " + args
			end
		end

feature

	execute_insert
		local
			l_insert: SQLITE_INSERT_STATEMENT
		do
			create l_insert.make ("INSERT INTO FORM (" + columns + ") VALUES (" + args + ");", database)
			check
				l_insert_is_compiled: l_insert.is_compiled
			end
			database.begin_transaction (False)
			l_insert.execute
				-- Commit changes
			database.commit
			i := 0
		end

feature

	query_numbers: STRING
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT students_supervised FROM FORM;", database)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
					number: INTEGER
				do
					query_answer.append ("> Row " + ia_row.index.out + ": ")
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						number := current.elements_count (ia_row.string_value (j))
						query_answer.append ("Number of supervised students by the laboratory is " + number.out)
						counter := counter + number
						if j < j_count then
							query_answer.append ("; ")
						end
						j := j + 1
					end
					query_answer.append ("%N")
				end)
			query_answer.append ("Total number of supervised students is " + counter.out)
			Result := query_answer
		end

feature

	query_names: STRING
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT off_name FROM FORM;", database)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					query_answer.append ("> Row " + ia_row.index.out + ": ")
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						query_answer.append ("Voting participant name:")
						if not ia_row.string_value (j).is_empty then
							query_answer.append (ia_row.string_value (j))
						else
							query_answer.append ("<NULL>")
						end
						if j < j_count then
							query_answer.append ("; ")
						end
						j := j + 1
					end
					query_answer.append ("%N")
				end)
			Result := query_answer
		end

feature

	query_publications: STRING
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT publications_conf, publications_jour FROM FORM;", database)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					query_answer.append ("> Row " + ia_row.index.out + ": ")
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						if j \\ 2 = 1 then
							query_answer.append ("Conference publications:")
						else
							query_answer.append ("Journal publications:")
						end
						if not ia_row.string_value (j).is_empty then
							query_answer.append (ia_row.string_value (j))
						else
							query_answer.append ("<NULL>")
						end
						if j < j_count then
							query_answer.append ("; ")
						end
						j := j + 1
					end
					query_answer.append ("%N")
				end)
			Result := query_answer
		end

feature

	elements_count (input: STRING): INTEGER
		local
			int: INTEGER
		do
			across
				input.split (',') as element
			loop
				if not element.item.out.is_empty then
					int := int + 1
				end
			end
			Result := int
		end

feature

	querytest
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT * FROM FORM;", database)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					print ("> Row " + ia_row.index.out + ": ")
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
							-- Print the column name.
						print (ia_row.column_name (j))
						print (":")

							-- Print the text value, regardless of type.
						if not ia_row.string_value (j).is_empty then
							print (ia_row.string_value (j))
						else
							print ("<NULL>")
						end
						if j < j_count then
							print ("; ")
						end
						j := j + 1
					end
					print ("%N")
				end)
		end

feature

	close
		do
			database.close
		end

feature

	database: SQLITE_DATABASE

	query_answer: STRING

	columns: STRING

	args: STRING

	values: STRING

	i: INTEGER

	c: CHARACTER

	counter: INTEGER

end
