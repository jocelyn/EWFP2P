note
	description: "{INPUT_STREAM_READER} reads strings out of an input stream."
	author: "Mischael Schill"
	date: "$Date: 2014-02-21 15:03:09 +0100 (Fri, 21 Feb 2014) $"
	revision: "$Revision: 94458 $"

class
	INPUT_STREAM_READER

inherit
	ITERATION_CURSOR[ESTRING_32]
		rename
			forth as read
		end

create
	make

feature {NONE} -- Initialization
	make (a_stream: INPUT_STREAM)
			-- Creates a new reader from the given stream. Assumes network byte order.
		do
			stream := a_stream
		ensure
			stream = a_stream
		end

feature -- Access
	item: ESTRING_32
			-- The last item read

feature -- Status report
	after: BOOLEAN
			-- Whether there are still items available

	buffer_size: INTEGER
			-- The initial size of the buffer allocated for each element. The buffer grows as needed.
		attribute
			Result := 64
		end

	delimiter: CHARACTER_32
			-- The delimiting symbol.
		attribute
			Result := '%N'
		end

	drop_cr: BOOLEAN
			-- Remove a CR symbol preceding LF if LF is set as `delimiter'
		attribute
			Result := True
		end

feature -- Status setting
	read
		local
			l_buf: STRING_32
			c: CHARACTER_32
		do
			after := stream.is_closed
			from
				create l_buf.make (buffer_size)
				stream.read_character_32
				c := stream.last_character_32
			until
				stream.is_closed or c = delimiter
			loop
				l_buf.extend (c)
				stream.read_character_32
				c := stream.last_character_32
			end
			if delimiter = '%N' and drop_cr and l_buf.count > 0 and then l_buf[l_buf.count] = '%R' then
				l_buf.remove_tail (1)
			end
			item := l_buf
		end

	stream: INPUT_STREAM

feature {NONE} -- Initialization


end