
instance VLK_439_VATRAS_LI(Npc_Default)
{
	name[0] = "Vatras";
	guild = GIL_KDW;
	id = 8063;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,ItAr_KDW_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	//aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8063;
};


func void rtn_start_8063()
{
	TA_Read_Bookstand(8,0,23,0,"SHIP_IN_22");
	TA_Sleep(23,0,8,0,"SHIP_IN_04");
};

