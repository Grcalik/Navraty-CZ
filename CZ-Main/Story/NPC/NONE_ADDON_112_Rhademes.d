
instance NONE_ADDON_112_Rhademes(Npc_Default)
{
	name[0] = "Rhademes";
	guild = GIL_NONE;
	id = 112;
	voice = 3;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	protection[PROT_POINT] = 99999999;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Ske_Head",0,BodyTex_N,ITAR_MayaZombie_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_112;
};


func void Rtn_Start_112()
{
	TA_GhostWusel(8,0,20,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
	TA_GhostWusel(20,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
};

func void Rtn_TOT_112()
{
	TA_Ghost(8,0,20,0,"TOT");
	TA_Ghost(20,0,8,0,"TOT");
};


instance NONE_ADDON_1159_Rhademes(Npc_Default)
{
	name[0] = "Rhademes";
	guild = GIL_NONE;
	id = 1159;
	voice = 3;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Ske_Head",0,BodyTex_N,ITAR_MayaZombie_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_1159;
};

func void Rtn_Start_1159()
{
	TA_Ghost_Main(8,0,20,0,"ADW_SATURAS_2_GOLDDRAGON");
	TA_Ghost_Main(20,0,8,0,"ADW_SATURAS_2_GOLDDRAGON");
};

func void Rtn_FreeMe_1159()
{
	TA_Ghost_Main(8,0,20,0,"ADW_ENTRANCE_BUILDING1_02");
	TA_Ghost_Main(20,0,8,0,"ADW_ENTRANCE_BUILDING1_02");
};

func void Rtn_TOT_1159()
{
	TA_Ghost_Main(8,0,20,0,"TOT");
	TA_Ghost_Main(20,0,8,0,"TOT");
};