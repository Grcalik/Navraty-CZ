
instance BDT_1083_Addon_Esteban(Npc_Default)
{
	name[0] = "Esteban";
	guild = GIL_BDT;
	id = 1083;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit_Esteban] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_BDT_W);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1083;
};


func void Rtn_Start_1083()
{
	TA_Stand_ArmsCrossed(9,0,10,0,"BL_MID_07");
	TA_Stand_ArmsCrossed(10,0,9,0,"BL_MID_07");
};

