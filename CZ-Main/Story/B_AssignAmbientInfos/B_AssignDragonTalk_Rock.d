
instance DIA_Dragon_Rock_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Rock_Exit_Condition;
	information = DIA_Dragon_Rock_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Rock_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Rock_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Dost řečí. Tvá dočasná moc vypršela. Oko ztratilo svou sílu. Připrav se na smrt.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
	Wld_SpawnNpcRange(hero,StoneGolem_Dragon,2,500);
};


instance DIA_Dragon_Rock_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Rock_Hello_Condition;
	information = DIA_Dragon_Rock_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Rock_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_Hello_Info()
{
	Wld_SendTrigger("STONEDRAGON_GATE");
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Další troufalé stvoření, co se odvážilo vylézt do mých skal. Ty mrňavý človíčku. Tak statečný a zároveň tak zranitelný.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Hej, co mi ještě povíš?
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Vyrvu ti z těla vnitřnosti a nadělám z nich krmení pro krysy.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Ne tak rychle. Mám u sebe Innosovo oko. Budeš mě muset poslouchat a odpovídat na mé otázky.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(řve) Arrh. Ptej se.
};


instance DIA_Dragon_Rock_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Rock_WERBISTDU_Condition;
	information = DIA_Dragon_Rock_WERBISTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Dragon_Rock_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Rock_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Jsem nazýván Pedrakhanem a stáhnu z tebe kůži zaživa, až tě chytím.
};


instance DIA_Dragon_Rock_HIERARCHIE(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Rock_HIERARCHIE_Condition;
	information = DIA_Dragon_Rock_HIERARCHIE_Info;
	description = "Kdo je mezi draky ten nejsilnější?";
};


func int DIA_Dragon_Rock_HIERARCHIE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Rock_HIERARCHIE_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Kdo je mezi draky ten nejsilnější?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Čerpáme svou sílu z elementů tohoto světa. Jejich hierarchie je jasná a jednoduchá.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Země, kterou pokrývá měkká půda, poskytla život všem stvořením pod sluncem. Teď se otevře a všechny vás pohltí, pokud se dostanete příliš blízko.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Skály, jež by se raději rozpadly, než by se vzdaly, se pyšně tyčí k nebi a schovávají samy před sebou jistou nedbalost. A ještě poskytují nejlepší ochranu proti přílivu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Jiskřička života dřímá v žáru hlubin tohoto světa. A teď plameny spálí vše živé a nezůstane nic než popel.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Všechny naše elementy dokáží chránit i ničit. Ale pouze ve vodě, která se může stát tvrdou a pevnou jako skála, se vše přemění na věčnou nehybnost, kde je život stěží možný.
};

func void B_AssignDragonTalk_Rock(var C_Npc slf)
{
	DIA_Dragon_Rock_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

