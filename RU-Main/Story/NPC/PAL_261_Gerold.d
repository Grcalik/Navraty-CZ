
instance PAL_261_Gerold(Npc_Default)
{
	name[0] = "Герольд";
	guild = GIL_PAL;
	id = 261;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Blade,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_261;
};


func void Rtn_Start_261()
{
	TA_Stand_Guarding(8,0,22,0,"OC_PRISON_GUARD_01");
	TA_Stand_Guarding(22,0,8,0,"OC_PRISON_GUARD_01");
};

func void Rtn_Food_261()
{
	TA_Stand_Guarding(8,0,23,10,"OC_PRISON_GUARD_01");
	TA_Stand_Guarding(23,10,8,0,"OC_MAGE_IN");
};

