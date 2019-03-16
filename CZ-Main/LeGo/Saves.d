/***********************************\
                SAVES
\***********************************/

var int _LeGo_LevelChangeIsExecuted;
var int _LeGo_LevelChangeCounter;

func void BW_Savegame() {

};

func void BR_Savegame() {

};


func void _LeGo_ChangeLevelHookBegin() {
    _LeGo_LevelChangeIsExecuted = TRUE;
};

func void _LeGo_ChangeLevelHookEnd() {
    _LeGo_LevelChangeIsExecuted = FALSE;
    _LeGo_LevelChangeCounter = 0;
};

func int _LeGo_IsLevelChange() {
    return _LeGo_LevelChangeIsExecuted;
};

//========================================
// [intern] Gibt Pfad zur Speicherdatei zurück
//========================================
func string _BIN_GetSavefilePath(var int slot) {
    var string path;
    var string cmd; cmd = MEM_GetCommandLine();

    path = "Saves";

    if(slot) {
        path = ConcatStrings(path, "/savegame");
        path = ConcatStrings(path, IntToString(slot));
    }
    else {
        path = ConcatStrings(path, "/quicksave");
    };

    path = ConcatStrings(path, "/SCRPTSAVE.SAV");
    return path;
};

//========================================
// [intern] Speicherslot herausfinden
//========================================
func int _BR_GetSelectedSlot() {
    var CGameManager man; man = _^(MEM_ReadInt(MEMINT_gameMan_Pointer_address));
    return MEM_ReadInt(man.menu_load_savegame + 3276);
};

//========================================
// [intern] Ruft BW_Savegame auf
//========================================
func void _BW_SaveGame() {
    var int ext; ext = MEM_ReadInt(EBP+60);
    if(_LeGo_Flags & LeGo_Gamestate) {
        _Gamestate_Init(Gamestate_Saving);
    };
    if(BW_NewFile(_BIN_GetSavefilePath(ext))) {
        if(_LeGo_Flags & LeGo_PermMem) {
            _PM_Archive();
        };
        BW_Savegame();
        BW_Close();
    };
};

//========================================
// [intern] Ruft BR_Savegame auf
//========================================
func void _BR_LoadGame() {
    var int slot; slot = _BR_GetSelectedSlot();
    if(slot == -1) {
        if(_LeGo_Flags & LeGo_Gamestate) {
            _Gamestate_Init(Gamestate_WorldChange);
        };
        return;
    };
    if(BR_OpenFile(_BIN_GetSavefilePath(slot))) {
        if(_LeGo_Flags & LeGo_PermMem) {
            _PM_UnArchive();
        };
        BR_Savegame();
        BR_Close();
    };
    if(_LeGo_Flags & LeGo_Gamestate) {
        _Gamestate_Init(Gamestate_Loaded);
    };
};