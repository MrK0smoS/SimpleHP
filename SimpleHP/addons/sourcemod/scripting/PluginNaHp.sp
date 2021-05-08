#include <sourcemod>

public Plugin:myinfo = 
{
	name = "SimpleHP",
	author = "Mr.Kosmos",
	description = "Simple hp add",
	version = "1.0",
	url = "http://sourcemod.net"
}

public void OnPluginStart() {
    RegConsoleCmd("sm_hp", MojStanZdrowia);
}

public Action MojStanZdrowia(int client, int args) {
    int hp = GetClientHealth(client);

    if (hp >= 100) {
        PrintToChat(client, "Masz ponad 100 hp!");
    }
    else if (hp < 100 && hp > 20) { 
        PrintToChat(client, "Masz pomiędzy 20 a 100 hp!");
    }
    else {
        if (!GraczJestVipem(client)) {
            PrintToChat(client, "Nie jesteś vipem, niemożesz tego użyć!");
        }
        else {
            PrintToChat(client, "Pozostało Ci poniżej 20hp, zwiększam do 40...");
            SetEntityHealth(client, 40);
        }
    }
    return Plugin_Continue;
}

bool GraczJestVipem(int client) {
    if (GetUserFlagBits(client) & ADMFLAG_RESERVATION) {
        return true;
    }

    return false;
}