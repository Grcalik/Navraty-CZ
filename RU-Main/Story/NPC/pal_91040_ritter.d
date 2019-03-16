
instance PAL_91040_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91040;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough02,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91040;
};


func void rtn_start_91040()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_04");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_04");
};

func void rtn_inbattle_91040()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8604");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8604");
};

