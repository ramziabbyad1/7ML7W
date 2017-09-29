extern "C" 
{
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}

#include "RtMidi.h"
static RtMidiOut midi;

int midi_send(lua_State* L) 
{
	double status = lua_tonumber(L, -3);	
	double data1 = lua_tonumber(L, -2);	
	double data2 = lua_tonumber(L, -1);	

	std::vector<unsigned char> message(3);
	message[0] = static_cast<unsigned char>(status);
	message[1] = static_cast<unsigned char>(data1);
	message[2] = static_cast<unsigned char>(data2);

	midi.sendMessage(&message);

	return 0;
}

int main(int argc, const char* argv[])
{
	if(argc < 1) {return -1;}

	unsigned int ports = midi.getPortCount();
	printf("%i ports\n", ports);
	
	using namespace std;
	std::string portName;
	for(size_t i = 0; i < ports; i++) {
		try {
			portName = midi.getPortName(i);
		}
		catch (RtMidiError &error) {
			error.printMessage();
			return -1;
		}
		std::cout << "  Output Port #" << i+1 << ": " << portName << '\n';
	}
	cout << portName << " portName" << endl;
	if(ports < 2) {return -1; }
	if (midi.isPortOpen()) {
		cout << " Ports are already open.. closing open port" << endl;
		midi.closePort();
	}
	cout << " Preparing to open port " << (ports-1) << endl;
	cout << midi.getCurrentApi() << " midi.getCurrentApi()" << endl;
	midi.openPort(ports - 1);
	cout << "Opened port " << midi.getPortName(ports - 1 ) << endl;
	cout << midi.getCurrentApi() << " midi.getCurrentApi()" << endl;

	cout << " Opened port " << (ports-1) << endl;
	lua_State* L = luaL_newstate();
	luaL_openlibs(L);

	lua_pushcfunction(L, midi_send);
	lua_setglobal(L, "midi_send");

	int scripRes = luaL_dofile(L, argv[1]);
	cout << "Result of dofile " << scripRes << endl;
	lua_close(L);
	
	return scripRes;
}
