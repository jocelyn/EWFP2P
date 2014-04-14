note
	description: "{CHARSET} is an enumerator for character sets."
	author: "Mischael Schill"
	date: "$Date: 2014-02-21 15:16:42 +0100 (Fri, 21 Feb 2014) $"
	revision: "$Revision: 94459 $"

expanded class
	CHARSET

create
	default_create

create {CHARSET}
	make

feature {NONE} -- Initialization
	make (a_value: INTEGER)
		do
			value := a_value
		end



feature
	is_unknown: BOOLEAN
		do
			Result := Current = unknown
		end

	is_utf_8: BOOLEAN
		do
			Result := Current = utf_8
		end

	is_utf_16: BOOLEAN
		do
			Result := Current = utf_16
		end

	is_utf_32: BOOLEAN
		do
			Result := Current = utf_32
		end

	unknown: CHARSET
		do
		end

	utf_8: CHARSET
		do
			create Result.make (1)
		end

	utf_16: CHARSET
		do
			create Result.make (2)
		end

	utf_32: CHARSET
		do
			create Result.make (3)
		end

feature {NONE} -- Implementation
	value: INTEGER

end