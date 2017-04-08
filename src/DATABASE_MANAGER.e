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
			create l_modify.make ("CREATE TABLE IF NOT EXISTS FORM (off_name TEXT, head_name TEXT, date_start TEXT, date_end TEXT, " +
			"courses TEXT, examinations TEXT, students_supervised TEXT, reports TEXT, theses TEXT, grants TEXT, research TEXT, collaborations TEXT, " +
			"publications_conf TEXT, publications_jour TEXT);", database)
			l_modify.execute
			create query_answer.make_empty
			create columns.make_empty
			create values.make_empty
			create args.make_empty
			i := 0
			c := '"'
			create set.make
			create array.make_filled ("", 2, 1000)
		end

feature
	insert(column: STRING; data: STRING)
		do
			--				-- Create a insert statement with variables
		i:= i+1
			if (i = 1)  then
				columns:= column
				args:= c.out + data +c.out
			else
				columns:= column + ", " + columns
				args:= c.out + data + c.out+ ", " + args
			end
		end

feature
	execute_insert
		local
			l_insert: SQLITE_INSERT_STATEMENT
		do
			create l_insert.make ("INSERT INTO FORM ("+ columns +") VALUES (" + args + ");", database)
			check l_insert_is_compiled: l_insert.is_compiled end
			database.begin_transaction (False)
			l_insert.execute
				-- Commit changes
			database.commit
			i:=0
		end

feature
	query_off_name :LINKED_SET[STRING]
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
					create l_query.make ("SELECT off_name FROM FORM;", database)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
							-- Print the text value, regardless of type.
						if not ia_row.is_null (j) then
							add_in_set(set, ia_row.string_value(j))
						end
						j := j + 1

					end
				end)
				Result:= set
		end

feature
	add_in_set(l_set: LINKED_SET[STRING]; val: STRING)
	local
		flag:BOOLEAN
	do
		flag:= true
		across
			l_set as k
		loop
			if k.item ~ val then
				flag:=false
			end
		end

		if flag	then
			l_set.extend (val)
		end

	end

feature
	query_supervised :INTEGER
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT students_supervised FROM FORM;", database)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
							-- Print the text value, regardless of type.
						if not ia_row.is_null (j) then
						 supervised:=supervised + ia_row.string_value(j).character_32_occurrences (';')
						end

						j := j + 1
					end
				end)
				Result:= supervised
		end

feature
	query_info(name: STRING): STRING
		local
			l_query: SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT * FROM FORM WHERE off_name = " + c.out + name + c.out + ";", database)
			query_answer:= "<font color=" + c.out + "white" + c.out + " size=" + "4" + ">Info about " + name + " :</font><p><table border=" + "1" + " bordercolor=" + c.out + "white" + c.out + " align=" + c.out + "left" + c.out + ">"
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
							-- Print the text value, regardless of type.
						if not ia_row.is_null (j) then
							query_answer :=  query_answer + "<tr><td><font color=" + c.out + "white" + c.out + " size=" + "4" + ">" + ia_row.column_name(j) +
							"</font></td><td><font color=" + c.out + "white" + c.out + " size=" + "4" + ">" + ia_row.string_value (j) + "</font></td></tr>"
						end

						j := j + 1
					end
				end)
				Result := query_answer + "</table></p>"
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
						print (ia_row.column_name(j))
						print (":")

							-- Print the text value, regardless of type.
						if not ia_row.string_value(j).is_empty then
							print (ia_row.string_value(j))
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


feature {NONE}
    database: SQLITE_DATABASE
    query_answer: STRING
    columns: STRING
    args: STRING
    values: STRING
    i: INTEGER
    c: CHARACTER
    supervised: INTEGER
    set: LINKED_SET[STRING]
	array : ARRAY2[STRING]
end

