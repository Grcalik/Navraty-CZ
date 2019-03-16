
instance TPL_8014_TEMPLER(Npc_Default)
{
	name[0] = NAME_TPL;
	guild = GIL_TPL;
	id = 8014;
	voice = 8;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_1,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8014;
};


func void rtn_start_8014()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_PSICAMP_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_PSICAMP_01");
};

func void rtn_campon_8014()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_06");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_06");
};

func void rtn_inbattle_8014()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8681");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8681");
};

