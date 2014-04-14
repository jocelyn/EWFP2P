note
	description: "[
		Mode used to open a database connection in SQLite.
	]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2011-11-04 10:32:23 +0100 (Fri, 04 Nov 2011) $"
	revision: "$Revision: 87721 $"

class
	SQLITE_OPEN_MODE

feature -- Constants

	read_only: INTEGER
		external
			"C inline use <sqlite3.h>"
		alias
			"return SQLITE_OPEN_READONLY"
		end

	read_write: INTEGER
		external
			"C inline use <sqlite3.h>"
		alias
			"return SQLITE_OPEN_READWRITE"
		end

	create_read_write: INTEGER
		external
			"C inline use <sqlite3.h>"
		alias
			"return SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE"
		end

feature -- Status

	is_valid_open_mode (a_mode: INTEGER): BOOLEAN
			-- Is `a_mode' a valid open mode?
		do
			Result :=  a_mode = read_only
					or a_mode = read_write
					or a_mode = create_read_write
		end

;note
	copyright: "Copyright (c) 1984-2011, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end