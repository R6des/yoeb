package.path = GetPackagePath();
local loadArr={"自动任务"};
for i=1,#loadArr
do
	package.loaded[loadArr[i]]=nil;
	require(loadArr[i]);
end

--指定职业  野蛮人、女巫、贵族、游侠、决斗者、暗影、圣堂武僧、
g_newRoleJob="女巫"
--升华职业 勇士、暴徒、酋长、侠客、锐眼、追猎者、秘术家、元素使、召唤师、处刑者、卫士、冠军、判官、圣宗、守护者、暗影大师、欺诈师、破坏者、升华使徒、
g_shengHuaJob="召唤师"
--设置使用的武器 支持(盾}箭袋}爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 如果需要用两样中间用|分开
SetUseWeapon("短杖|盾")
--设置自己用的装备类型 
SetUseZhuangBeiTypeData("Int","鞋子|衣服|头盔|手套")
SetUseZhuangBeiTypeData("Str","项链")

--SetNeedSkillLineData(val,str,invalidLv,pos)--设置换技能宝石数据 
--val=每块宝石的比重值
--str="宝石1,宝石1类名|宝石2,宝石2类名|宝石3,宝石3类名" 名与类名之间用,隔开 宝石之间用|隔开
--invalidLv=失效等级 超过这个等级就不会需要他了
--pos=指定位置 nil为自动选择 2为衣服 3为主武器 4为副武器 5为头盔 6为项链 7为左戒指 8为右戒指 9为护手 10为鞋子 11为腰带
--nType 有效场景 nil为无论何时都有效 0为没在刷异界才有效 1为只在刷异界才有效

SetNeedSkillLineData(10,"火球,nil",10,nil)
SetNeedSkillLineData(87,"淨化烈焰,nil|精準破壞輔助,nil|施放迴響輔助,nil|能量偷取輔助,nil",nil,2,0)
SetNeedSkillLineData(86,"殭屍復甦,nil|召喚物傷害輔助,nil|癱瘓輔助,nil|近戰物理傷害輔助,nil",nil,nil,0)
SetNeedSkillLineData(85,"召喚骷髏,nil|殘虐輔助,nil|召喚物傷害輔助,nil|豢養狂熱輔助,nil",nil,nil,0)
SetNeedSkillLineData(84,"鋼筋鐵骨,nil|褻瀆,nil|召喚探測機獸,nil",nil,nil,4)
SetNeedSkillLineData(82,"喚醒幽魂,nil|召喚食腐魔像,nil|召喚幻影輔助,nil|召喚物傷害輔助,nil",nil,nil,0)
SetNeedSkillLineData(81,"烈焰衝刺,nil|元素淨化,nil|號召,nil",nil,3,0)--主武器 

SetNeedSkillLineData(94,"召喚食腐魔像,nil|召喚聖物,nil|重盾衝鋒,nil",nil,3,1)
SetNeedSkillLineData(95,"受傷時施放輔助,nil|鋼筋鐵骨,nil|持續時間延長輔助,nil",nil,4,1)
SetNeedSkillLineData(96,"元素淨化,nil|暗影迷蹤,nil|暴風之盾,nil|恐懼之旗,nil",nil,9,1)
SetNeedSkillLineData(97,"殭屍復甦,nil|護體輔助,nil|多重打擊輔助,nil|召喚物傷害輔助,nil",nil,5,1)
SetNeedSkillLineData(98,"喚醒幽魂,nil|施放迴響輔助,nil|豢養狂熱輔助,nil|召喚物傷害輔助,nil",nil,10,1)
SetNeedSkillLineData(100,"霸氣之擊,nil|護體輔助,nil|先祖怒嚎輔助,nil|多重打擊輔助,nil|召喚物傷害輔助,nil|近戰物理傷害輔助,nil",nil,2,1)

--添加攻击技能 name=技能名 className=技能类名 noLine=不在直线就能攻击 挑选攻击技能会从上到下寻找，要把厉害的技能加在前面
AddAttackSkillData("霸氣之擊","Dominating Blow")
AddAttackSkillData("淨化烈焰","Kinetic Bolt")
AddAttackSkillData("火球","fireball")
AddAttackSkillData("普通攻击","melee")

SetSkillLimitMaxLv("暗影迷蹤",nil,1)

SetUseBuffSkill("脆弱","vulnerability",nil,"curse_vulnerability")

-- SetYiJieZhaoHuanLingTiData(mapClassName,name,className)--设置异界时召唤的灵体数据 mapClassName=剧情图类名 name=灵体名 className=灵体类名
SetYiJieZhaoHuanLingTiData("2_8_12_1","日耀神守衛","Metadata/Monsters/HolyFireElemental/HolyFireElementalSolarisBeam")

---------------------------------------换装设置
--SetAtuoChangeEquipData(job,pos,name,val,yijie) 计算方式如下 定义过的属性值乘以比重值  哪样装备高就会用哪样
--job 职业 支持(暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧) 可填多个，中间用|隔开
--pos 部位 支持(戒指|项链|腰带|鞋子|手套|衣服|头盔|盾|箭袋|爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 可填多个，中间用|隔开
--name 属性名 支持游戏内的装备属性名 还有其他的自定义名(物理伤害、护甲、护盾、闪避、连洞、总洞)
--val 比重值 支持小数
--nType 换装类型 0或nil或不填为一直有效 1为跑图时才有效 2为异界时才有效
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","fire_and_cold_damage_resistance_%",0.25)--火焰与冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","fire_and_lightning_damage_resistance_%",0.25)--火焰与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","cold_and_lightning_damage_resistance_%",0.2)--冰霜与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","base_resist_all_elements_%",0.35)--全元素抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","base_fire_damage_resistance_%",0.15)--基础火焰伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","base_cold_damage_resistance_%",0.1)--基础冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","base_lightning_damage_resistance_%",0.1)--基础闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","cold_damage_resistance_%",0.1)--冰霜抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","fire_damage_resistance_%",0.15)--火焰抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","lightning_damage_resistance_%",0.1)--闪电抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","base_movement_velocity_+%",0.3)--基础移动速度 +%
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔","movement_velocity_+%",0.3)--移动速度 +%

--女巫
SetAtuoChangeEquipData("女巫","鞋子|衣服|手套|头盔","护盾",0.1)--每一护盾
SetAtuoChangeEquipData("女巫","盾","护甲",0.1)--盾加护甲用来放受伤施放宝石
SetAtuoChangeEquipData("女巫","短杖","物理伤害",1,1)

--女巫--孔色
SetZhengTiColorVarData(2,0,0,6,0,600,true)
SetZhengTiColorVarData(2,0,0,5,0,500,true)
SetZhengTiColorVarData(2,0,0,4,0,400,true)
SetZhengTiColorVarData(2,0,0,3,0,300,true)
SetZhengTiColorVarData(2,0,0,2,0,200,true)
SetZhengTiColorVarData(2,0,0,1,0,100)

SetZhengTiColorVarData(3,0,0,3,0,300)
SetZhengTiColorVarData(3,0,0,2,0,200)
SetZhengTiColorVarData(3,0,0,1,0,100)

SetZhengTiColorVarData(4,1,1,1,0,300)
SetZhengTiColorVarData(4,1,1,0,0,200)
SetZhengTiColorVarData(4,1,0,0,0,100)

SetZhengTiColorVarData(5,2,0,2,0,400,true)
SetZhengTiColorVarData(5,1,0,2,0,300,true)
SetZhengTiColorVarData(5,1,0,2,0,200,true)
SetZhengTiColorVarData(5,0,0,1,0,100)

SetZhengTiColorVarData(9,2,0,2,0,400,true)
SetZhengTiColorVarData(9,1,0,2,0,300,true)
SetZhengTiColorVarData(9,1,0,2,0,200,true)
SetZhengTiColorVarData(9,0,0,1,0,100)
SetZhengTiColorVarData(9,0,0,1,0,100)

SetZhengTiColorVarData(10,0,1,3,0,600,true)
SetZhengTiColorVarData(10,0,0,4,0,500,true)
SetZhengTiColorVarData(10,0,0,3,0,400,true)
SetZhengTiColorVarData(10,0,1,2,0,300,true)
SetZhengTiColorVarData(10,0,0,2,0,200,true)
SetZhengTiColorVarData(10,0,0,1,0,100,false)

AddShengJiZhuangBeiGoodsData("点金石","Metadata/Items/Currency/CurrencyUpgradeToRare",0,36,0)--主线生效 超过50级就用点金点白色装备
AddShengJiZhuangBeiGoodsData("富豪石","Metadata/Items/Currency/CurrencyUpgradeMagicToRare",1,36,0)--主线生效 超过50级就用富豪点蓝色装备

--掉落率+稀有率 异界时才有效
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_rarity_+%",0.5,2)--基礎物品掉落品質 +%
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_quantity_+%",1.5,2)--物品掉落數量增加 %

--高级换装设置
SetGaoJiHuanZhuangData("女巫","简易之袍","Metadata/Items/Armours/BodyArmours/BodyInt1","无尽之衣","Tabula Rasa")
SetGaoJiHuanZhuangData("女巫","裂脏钩","Metadata/Items/Weapons/OneHandWeapons/Claws/Claw12","超越壁垒","Advancing Fortress",nil,nil,nil,3)
SetGaoJiHuanZhuangData("女巫","坚毅塔盾","Metadata/Items/Armours/Shields/ShieldStr17","狮眼的荣耀之盾","Lioneye's Remorse",nil,nil,nil,4)
SetGaoJiHuanZhuangData("女巫","精兵之盔","Metadata/Items/Armours/Helmets/HelmetStrDex5","光輝之顱","Skullhead")
SetGaoJiHuanZhuangData("女巫","鋼影護手","Metadata/Items/Armours/Gloves/GlovesStrDex4","富贵之运","Aurseize")
SetGaoJiHuanZhuangData("女巫","環帶長靴","Metadata/Items/Armours/Boots/BootsDexInt3","日耀","Sundance")
SetGaoJiHuanZhuangData("女巫","飾布腰帶","Metadata/Items/Belts/Belt5","普蘭德斯之印","Perandus Blazon")
SetGaoJiHuanZhuangData("女巫","金光戒指","Metadata/Items/Rings/Ring4","貪慾之記","Andvarius",nil,nil,nil,8)
SetGaoJiHuanZhuangData("女巫","帝金护身符","Metadata/Items/Amulets/Amulet6","比斯克的项圈","Bisco's Collar",nil,nil,nil,6)
SetGaoJiHuanZhuangData("女巫","鍛鐵戒指","Metadata/Items/Rings/Ring1","英靈寶環","Le Heup of All",nil,nil,nil,7)
SetGaoJiHuanZhuangData("女巫","大型复合药剂","Metadata/Items/Flasks/FlaskHybrid3","宝视精华","Divination Distillate",nil,nil,2)

--SetNeedAddTianFu(tfStr)--设置天赋加点 
SetNeedAddTianFu("女巫=energy_shield1631-能量護盾和魔力|energy_shield1632-能量護盾和魔力回復|minion_damage2252-召喚物傷害和生命|minion_speed2253-召喚物攻擊和施放速度|minion_damage2251-召喚物傷害和生命|deep_wisdom900-沉靜智慧|life700-魔力和生命|life_mana_notable1638-心與靈|life_mana1639-魔力和生命|savant901-奧術師之統御|minion_damage285-召喚物傷害|lord_of_the_dead1122-亡靈之主|intelligence918-智慧|strength828-力量|minion_duration2624_-召喚物傷害和持續時間|minion_duration2625-召喚物傷害和持續時間|minion_duration_notable2626-持久合作|mastery_minionoffence186-召喚物侵略專精-47429|intelligence905-智慧|intelligence893-智慧|minion_life_resists2631-召喚物生命|minion_life_resists2632-召喚物生命和元素抗性|minion_life_resists_notable2634-頑固軍隊|intelligence882-智慧|mana388-魔力回復和生命|mana397-魔力回復和生命|life_mana_notable1730-快速回復|mastery_life147-生命專精-47642|intelligence890-智慧|intelligence886-智慧|agility834-靈敏|intelligence921-智慧|intelligence955-智慧|minion_life1125-召喚物生命和傷害|minion_damage1128-召喚物傷害|minion_damage1129-召喚物傷害|additional_spectre278-亡靈諧曲|dexterity869-敏捷|intelligence885-智慧|minion_damage1152-召喚物生命|minion_life1124-召喚物生命|additional_minions1150-獻祭|mastery_miniondefence180-召喚物防禦專精-43400|minion_damage769-召喚物攻擊和施放速度|player_and_minion_notable2237-精神號令|mastery_minionoffence185-召喚物侵略專精-57179|spellcaster_notable1873-制裁|life1407-生命|discipline_and_training1194-嚴峻訓練|life1405-生命|melee_notable1874-聖潔之力|strength786-力量|dexterity973-敏捷|strength998-力量|strength1002-力量|strength827-力量|strength814-力量|shield_block32-持盾元素抗性|shield_defences1063-盾牌格擋和持盾元素抗性|shield_mastery34-庇護聖所|shield_block_and_block_recovery29-持盾盾牌法術格擋和元素抗性|life_reduced_mana_cost1934-生命與減少消耗|life_reduced_mana_cost1936-生命與減少消耗|life_reduced_mana_cost1935-生命與減少消耗|life_reduced_mana_notable1937-冷酷|mastery_life142-生命專精-64381|minion_damage1126-召喚物傷害和命中|minion_damage1127-召喚物傷害和命中|minion_damage284-召喚物傷害和命中|additional_minions1123-亡靈之約|mastery_minionoffence184-召喚物侵略專精-40073|intelligence945-智慧|strength809-力量|strong_arm118-為戰而生|life599-生命|heart_of_the_gladiator825-戰士之心|life600-生命|troll's_blood203-戰士之血|armour173-元素抗性|shield_mastery730-珍鑽肌膚|intelligence919-智慧|intelligence912-智慧|life1161-生命和能量護盾|fitness1212-肉體之純潔|intelligence917-智慧|damage_and_minion_damage2228-召喚物傷害和生命|damage_and_minion_damage2227-召喚物傷害和生命|player_and_minion_notable2236-正義軍團|speed_and_minion_speed2231-召喚物傷害和攻擊和施放速度|speed_and_minion_speed2230-召喚物傷害和攻擊和施放速度|player_and_minion_notable2238-救贖|strength811-力量|strength824-力量|life1209-生命|fitness1186-奉獻|life1210-生命|strength999-力量|strength1985-力量|strength997-力量|life181-生命|life_notable1697-構成|life1164-生命|strength773-力量|strength789-力量|sentinel1541-哨兵|lightning_resistance1290-閃電抗性|cold_resistance1289-冰冷抗性|mastery_shield212-盾牌專精-30612|life180-生命|life193-生命|life184-生命|life1406-生命|life182-生命和能量護盾|life187-生命和能量護盾|life204-生命和護甲|life185-生命和護甲|armour87-生命和護甲|life186-生命和護甲|")
SetNeedAddTianFu("女巫升华=AscendancyNecromancer6-召喚物傷害、光環效果|AscendancyNecromancer12-黑暗統御者|AscendancyNecromancer3-召喚物傷害和生命|AscendancyNecromancer7-無意識侵略|AscendancyNecromancer2-召喚物傷害和生命|AscendancyNecromancer8-超自然之力|") 