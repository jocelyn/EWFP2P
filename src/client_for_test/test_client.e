note
	description : "client_for_test application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	TEST_CLIENT

inherit
	ARGUMENTS
	SOCKET_RESOURCES

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			soc1: detachable NETWORK_STREAM_SOCKET
			addr: NETWORK_SOCKET_ADDRESS
		do
			create soc1.make_client_by_port (8888, "localhost")
			create addr.make_any_local (9999)
			soc1.set_address (addr)
			soc1.bind
			soc1.connect


			process(soc1)

			if attached soc1.address as my_addr then
				print("my port is ")
				print(my_addr.port)
			end

			soc1.cleanup



		rescue
            if soc1 /= Void then
                soc1.cleanup
            end
		end
	process(soc1: detachable NETWORK_STREAM_SOCKET)
		require
			socket_not_void: soc1 /= Void
		local
			pkt: MY_PACKET
		do
			create pkt.make(0,2)
			pkt.put (0, 0)
			pkt.put (1, 1)
			pkt.put (2, 2)
			pkt.independent_store (soc1)

		end

end
