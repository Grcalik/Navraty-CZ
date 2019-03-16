
instance SLD_801_TORLOF_LI(Npc_Default)
{
	name[0] = "Торлоф";
	guild = GIL_SLD;
	id = 8059;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_torlof_axt);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Torlof,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8059;
};


func void rtn_start_8059()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

