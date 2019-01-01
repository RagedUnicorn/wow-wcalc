/**
* @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
* @copyright Copyright (c) 2017
*
* Data based on bc patch 2.4.3
*/

/************ DEFINING VARIABLES ************/
-- set locale english
SET @locale_en := "en";

-- class id's
SET @warrior_id := 1;
SET @paladin_id := 2;
SET @hunter_id := 3;
SET @rogue_id := 4;
SET @priest_id := 5;
-- skip deathknight 6
SET @shaman_id := 7;
SET @mage_id := 8;
SET @warlock_id := 9;
SET @druid_id := 10;

-- tree id's
SET @warrior_tree_1     := 1;
SET @warrior_tree_2     := 2;
SET @warrior_tree_3     := 3;

SET @paladin_tree_1     := 4;
SET @paladin_tree_2     := 5;
SET @paladin_tree_3     := 6;

SET @hunter_tree_1      := 7;
SET @hunter_tree_2      := 8;
SET @hunter_tree_3      := 9;

SET @rogue_tree_1       := 10;
SET @rogue_tree_2       := 11;
SET @rogue_tree_3       := 12;

SET @priest_tree_1      := 13;
SET @priest_tree_2      := 14;
SET @priest_tree_3      := 15;

SET @shaman_tree_1  := 16;
SET @shaman_tree_2  := 17;
SET @shaman_tree_3  := 18;

SET @mage_tree_1    := 19;
SET @mage_tree_2    := 20;
SET @mage_tree_3    := 21;

SET @warlock_tree_1 := 22;
SET @warlock_tree_2 := 23;
SET @warlock_tree_3 := 24;

SET @druid_tree_1   := 25;
SET @druid_tree_2   := 26;
SET @druid_tree_3   := 27;

-- iterators
SET @tree     := 1;
SET @tree_id  := 0;

/************ INSERT DATA ************/
INSERT INTO `expansion`(`expansion`, `expansion_short`) VALUES
("The Burning Crusade", "bc");

INSERT INTO `class`(`id`, `class_name`) VALUES
(@warrior_id, "warrior"),
(@paladin_id, "paladin"),
(@hunter_id, "hunter"),
(@rogue_id, "rogue"),
(@priest_id, "priest"),
(@shaman_id, "shaman"),
(@mage_id, "mage"),
(@warlock_id, "warlock"),
(@druid_id, "druid");

INSERT INTO `tree` (`id`, `class_id`, `tree_name`, `tree_pos`) VALUES
-- warrior
(@warrior_tree_1, @warrior_id, "arms", @tree + 0),
(@warrior_tree_2, @warrior_id, "fury", @tree + 1),
(@warrior_tree_3, @warrior_id, "protection", @tree + 2),
-- paladin
(@paladin_tree_1, @paladin_id, "holy", @tree + 0),
(@paladin_tree_2, @paladin_id, "protection", @tree + 1),
(@paladin_tree_3, @paladin_id, "retribution", @tree + 2),
-- hunter
(@hunter_tree_1, @hunter_id, "beastmastery", @tree + 0),
(@hunter_tree_2, @hunter_id, "marksmanship", @tree + 1),
(@hunter_tree_3, @hunter_id, "survival", @tree + 2),
-- rogue
(@rogue_tree_1, @rogue_id, "assassination", @tree + 0),
(@rogue_tree_2, @rogue_id, "combat", @tree + 1),
(@rogue_tree_3, @rogue_id, "subtlety", @tree + 2),
-- priest
(@priest_tree_1, @priest_id, "discipline", @tree + 0),
(@priest_tree_2, @priest_id, "holy", @tree + 1),
(@priest_tree_3, @priest_id, "shadow", @tree + 2),
-- shaman
(@shaman_tree_1, @shaman_id, "elemental", @tree + 0),
(@shaman_tree_2, @shaman_id, "enhancement", @tree + 1),
(@shaman_tree_3, @shaman_id, "restoration", @tree + 2),
-- mage
(@mage_tree_1, @mage_id, "arcane", @tree + 0),
(@mage_tree_2, @mage_id, "fire", @tree + 1),
(@mage_tree_3, @mage_id, "frost", @tree + 2),
-- warlock
(@warlock_tree_1, @warlock_id, "affliction", @tree + 0),
(@warlock_tree_2, @warlock_id, "demonology", @tree + 1),
(@warlock_tree_3, @warlock_id, "destruction", @tree + 2),
-- druid
(@druid_tree_1, @druid_id, "balance", @tree + 0),
(@druid_tree_2, @druid_id, "feralcombat", @tree + 1),
(@druid_tree_3, @druid_id, "restoration", @tree + 2);

INSERT INTO `talent` (`id`, `tree_id`, `talent_name`, `icon`, `tier_pos`, `talent_pos`, `max_points`, `dependency`) VALUES
-- arms
(12282, @tree_id + 1, "Improved Heroic Strike", "ability_rogue_ambush", 0, 0, 3, NULL),
(16462, @tree_id + 1, "Deflection", "ability_parry", 0, 1, 5, NULL),
(12286, @tree_id + 1, "Improved Rend", "ability_gouge", 0, 2, 3, NULL),
(12285, @tree_id + 1, "Improved Charge", "ability_warrior_charge", 1, 0, 2, NULL),
(12300, @tree_id + 1, "Iron Will", "spell_magic_magearmor", 1, 1, 5, NULL),
(12287, @tree_id + 1, "Improved Thunder Clap", "ability_thunderclap", 1, 2, 3, NULL),
(12290, @tree_id + 1, "Improved Overpower", "inv_sword_05", 2, 0, 2, NULL),
(12296, @tree_id + 1, "Anger Management", "spell_holy_blessingofstamina", 2, 1, 1, NULL),
(12834, @tree_id + 1, "Deep Wounds", "ability_backstab", 2, 2, 3, NULL),
(12163, @tree_id + 1, "Two-Handed Weapon Specialization", "inv_axe_09", 3, 1, 5, NULL),
(16493, @tree_id + 1, "Impale", "ability_searingarrow", 3, 2, 2, 12834),
(12700, @tree_id + 1, "Poleaxe Specialization", "inv_axe_06", 4, 0, 5, NULL),
(12292, @tree_id + 1, "Death Wish", "spell_shadow_deathpact", 4, 1, 1, NULL),
(12284, @tree_id + 1, "Mace Specialization", "inv_mace_01", 4, 2, 5, NULL),
(12281, @tree_id + 1, "Sword Specialization", "inv_sword_27", 4, 3, 5, NULL),
(29888, @tree_id + 1, "Improved Intercept", "ability_rogue_sprint", 5, 0, 2, NULL),
(12289, @tree_id + 1, "Improved Hamstring", "ability_shockwave", 5, 2, 3, NULL),
(29723, @tree_id + 1, "Improved Disciplines", "ability_warrior_improveddisciplines", 5, 3, 3, NULL),
(29836, @tree_id + 1, "Blood Frenzy", "ability_warrior_bloodfrenzy", 6, 0, 2, NULL),
(12294, @tree_id + 1, "Mortal Strike", "ability_warrior_savageblow", 6, 1, 1, 12292),
(29834, @tree_id + 1, "Second Wind", "ability_hunter_harass", 6, 2, 2, NULL),
(35446, @tree_id + 1, "Improved Mortal Strike", "ability_warrior_savageblow", 7, 1, 5, 12294),
(29623, @tree_id + 1, "Endless Rage", "ability_warrior_endlessrage", 8, 1, 1, NULL),
-- fury
(12321, @tree_id + 2, "Booming Voice", "spell_nature_purge", 0, 1, 5, NULL),
(12320, @tree_id + 2, "Cruelty", "ability_rogue_eviscerate", 0, 2, 5, NULL),
(12324, @tree_id + 2, "Improved Demoralizing Shout", "ability_warrior_warcry", 1, 1, 5, NULL),
(12322, @tree_id + 2, "Unbridled Wrath", "spell_nature_stoneclawtotem", 1, 2, 5, NULL),
(12329, @tree_id + 2, "Improved Cleave", "ability_warrior_cleave", 2, 0, 3, NULL),
(12323, @tree_id + 2, "Piercing Howl", "spell_shadow_deathscream", 2, 1, 1, NULL),
(16487, @tree_id + 2, "Blood Craze", "spell_shadow_summonimp", 2, 2, 3, NULL),
(12318, @tree_id + 2, "Commanding Presence", "spell_nature_focusedmind", 2, 3, 5, NULL),
(23584, @tree_id + 2, "Dual Wield Specialization", "ability_dualwield", 3, 0, 5, NULL),
(20502, @tree_id + 2, "Improved Execute", "inv_sword_48", 3, 1, 2, NULL),
(12317, @tree_id + 2, "Enrage", "spell_shadow_unholyfrenzy", 3, 2, 5, NULL),
(12862, @tree_id + 2, "Improved Slam", "ability_warrior_decisivestrike", 4, 0, 2, NULL),
(12328, @tree_id + 2, "Sweeping Strikes", "ability_rogue_slicedice", 4, 1, 1, NULL),
(20504, @tree_id + 2, "Weapon Mastery", "ability_warrior_weaponmastery", 4, 3, 2, NULL),
(20500, @tree_id + 2, "Improved Berserker Rage", "spell_nature_ancestralguardian", 5, 0, 2, NULL),
(12319, @tree_id + 2, "Flurry", "ability_ghoulfrenzy", 5, 2, 5, 12317),
(29590, @tree_id + 2, "Precision", "ability_marksmanship", 6, 0, 3, NULL),
(23881, @tree_id + 2, "Bloodthirst", "spell_nature_bloodlust", 6, 1, 1, 12328),
(29721, @tree_id + 2, "Improved Whirlwind", "ability_whirlwind", 6, 2, 2, NULL),
(29759, @tree_id + 2, "Improved Berserker Stance", "ability_racial_avatar", 7, 2, 5, NULL),
(29801, @tree_id + 2, "Rampage", "ability_warrior_rampage", 8, 1, 1, 23881),
-- protection
(12301, @tree_id + 3, "Improved Bloodrage", "ability_racial_bloodrage", 0, 0, 2, NULL),
(12295, @tree_id + 3, "Tactical Mastery", "spell_nature_enchantarmor", 0, 1, 3, NULL),
(12297, @tree_id + 3, "Anticipation", "spell_nature_mirrorimage", 0, 2, 5, NULL),
(12298, @tree_id + 3, "Shield Specialization", "inv_shield_06", 1, 1, 5, NULL),
(12299, @tree_id + 3, "Toughness", "spell_holy_devotion", 1, 2, 5, NULL),
(12975, @tree_id + 3, "Last Stand", "spell_holy_ashestoashes", 2, 0, 1, NULL),
(12945, @tree_id + 3, "Improved Shield Block", "ability_defend", 2, 1, 1, 12298),
(12797, @tree_id + 3, "Improved Revenge", "ability_warrior_revenge", 2, 2, 3, NULL),
(12303, @tree_id + 3, "Defiance", "ability_warrior_innerrage", 2, 3, 3, NULL),
(12308, @tree_id + 3, "Improved Sunder Armor", "ability_warrior_sunder", 3, 0, 3, NULL),
(12313, @tree_id + 3, "Improved Disarm", "ability_warrior_disarm", 3, 1, 3, NULL),
(12302, @tree_id + 3, "Improved Taunt", "spell_nature_reincarnation", 3, 2, 2, NULL),
(12312, @tree_id + 3, "Improved Shield Wall", "ability_warrior_shieldwall", 4, 0, 2, NULL),
(12809, @tree_id + 3, "Concussion Blow", "ability_thunderbolt", 4, 1, 1, NULL),
(12311, @tree_id + 3, "Improved Shield Bash", "ability_warrior_shieldbash", 4, 2, 2, NULL),
(29598, @tree_id + 3, "Shield Mastery", "ability_warrior_shieldmastery", 5, 0, 3, NULL),
(16538, @tree_id + 3, "One-Handed Weapon Specialization", "inv_sword_20", 5, 2, 5, NULL),
(29593, @tree_id + 3, "Improved Defensive Stance", "ability_warrior_defensivestance", 6, 0, 3, NULL),
(23922, @tree_id + 3, "Shield Slam", "inv_shield_05", 6, 1, 1, 12809),
(29787, @tree_id + 3, "Focused Rage", "ability_warrior_focusedrage", 6, 2, 3, NULL),
(29140, @tree_id + 3, "Vitality", "inv_helmet_21", 7, 1, 5, NULL),
(20243, @tree_id + 3, "Devastate", "inv_sword_11", 8, 1, 1, NULL),
-- holy
(20262, @tree_id + 4, "Divine Strength", "ability_golemthunderclap", 0, 1, 5, NULL),
(20257, @tree_id + 4, "Divine Intellect", "spell_nature_sleep", 0, 2, 5, NULL),
(20205, @tree_id + 4, "Spiritual Focus", "spell_arcane_blink", 1, 1, 5, NULL),
(20224, @tree_id + 4, "Improved Seal of Righteousness", "ability_thunderbolt", 1, 2, 5, NULL),
(20237, @tree_id + 4, "Healing Light", "spell_holy_holybolt", 2, 0, 3, NULL),
(31821, @tree_id + 4, "Aura Mastery", "spell_holy_auramastery", 2, 1, 1, NULL),
(20234, @tree_id + 4, "Improved Lay on Hands", "spell_holy_layonhands", 2, 2, 2, NULL),
(9453, @tree_id + 4, "Unyielding Faith", "spell_holy_unyieldingfaith", 2, 3, 2, NULL),
(20210, @tree_id + 4, "Illumination", "spell_holy_greaterheal", 3, 1, 5, NULL),
(20244, @tree_id + 4, "Improved Blessing of Wisdom", "spell_holy_sealofwisdom", 3, 2, 2, NULL),
(31822, @tree_id + 4, "Pure of Heart", "spell_holy_pureofheart", 4, 0, 3, NULL),
(20216, @tree_id + 4, "Divine Favor", "spell_holy_heal", 4, 1, 1, 20210),
(20359, @tree_id + 4, "Sanctified Light", "spell_holy_healingaura", 4, 2, 3, NULL),
(31825, @tree_id + 4, "Purifying Power", "spell_holy_purifyingpower", 5, 0, 2, NULL),
(5923, @tree_id + 4, "Holy Power", "spell_holy_power", 5, 2, 5, NULL),
(31833, @tree_id + 4, "Light's Grace", "spell_holy_lightsgrace", 6, 0, 3, NULL),
(20473, @tree_id + 4, "Holy Shock", "spell_holy_searinglight", 6, 1, 1, 20216),
(31828, @tree_id + 4, "Blessed Life", "spell_holy_blessedlife", 6, 2, 3, NULL),
(31837, @tree_id + 4, "Holy Guidance", "spell_holy_holyguidance", 7, 1, 5, NULL),
(31842, @tree_id + 4, "Divine Illumination", "spell_holy_divineillumination", 8, 1, 1, NULL),
-- protection
(20138, @tree_id + 5, "Improved Devotion Aura", "spell_holy_devotionaura", 0, 1, 5, NULL),
(20127, @tree_id + 5, "Redoubt", "ability_defend", 0, 2, 5, NULL),
(20189, @tree_id + 5, "Precision", "ability_rogue_ambush", 1, 0, 3, NULL),
(20174, @tree_id + 5, "Guardian's Favor", "spell_holy_sealofprotection", 1, 1, 2, NULL),
(20143, @tree_id + 5, "Toughness", "spell_holy_devotion", 1, 3, 5, NULL),
(20217, @tree_id + 5, "Blessing of Kings", "spell_magic_magearmor", 2, 0, 1, NULL),
(20468, @tree_id + 5, "Improved Righteous Fury", "spell_holy_sealoffury", 2, 1, 3, NULL),
(20148, @tree_id + 5, "Shield Specialization", "inv_shield_06", 2, 2, 3, 20127),
(20096, @tree_id + 5, "Anticipation", "spell_magic_lesserinvisibilty", 2, 3, 5, NULL),
(31844, @tree_id + 5, "Stoicism", "spell_holy_stoicism", 3, 0, 2, NULL),
(20487, @tree_id + 5, "Improved Hammer of Justice", "spell_holy_sealofmight", 3, 1, 3, NULL),
(20254, @tree_id + 5, "Improved Concentration Aura", "spell_holy_mindsooth", 3, 2, 3, NULL),
(31846, @tree_id + 5, "Spell Warding", "spell_holy_improvedresistanceauras", 4, 0, 2, NULL),
(20911, @tree_id + 5, "Blessing of Sanctuary", "spell_nature_lightningshield", 4, 1, 1, NULL),
(20177, @tree_id + 5, "Reckoning", "spell_holy_blessingofstrength", 4, 2, 5, NULL),
(31848, @tree_id + 5, "Sacred Duty", "spell_holy_divineintervention", 5, 0, 2, NULL),
(20196, @tree_id + 5, "One-Handed Weapon Specialization", "inv_sword_20", 5, 2, 5, NULL),
(41021, @tree_id + 5, "Improved Holy Shield", "spell_holy_blessingofprotection", 6, 0, 2, NULL),
(20925, @tree_id + 5, "Holy Shield", "spell_holy_blessingofprotection", 6, 1, 1, 20911),
(31850, @tree_id + 5, "Ardent Defender", "spell_holy_ardentdefender", 6, 2, 5, NULL),
(31858, @tree_id + 5, "Combat Expertise", "spell_holy_weaponmastery", 7, 2, 5, NULL),
(31935, @tree_id + 5, "Avenger's Shield", "spell_holy_avengersshield", 8, 1, 1, 20925),
-- retribution
(20042, @tree_id + 6, "Improved Blessing of Might", "spell_holy_fistofjustice", 0, 1, 5, NULL),
(20101, @tree_id + 6, "Benediction", "spell_frost_windwalkon", 0, 2, 5, NULL),
(25956, @tree_id + 6, "Improved Judgement", "spell_holy_righteousfury", 1, 0, 2, NULL),
(20335, @tree_id + 6, "Improved Seal of the Crusader", "spell_holy_holysmite", 1, 1, 3, NULL),
(20060, @tree_id + 6, "Deflection", "ability_parry", 1, 2, 5, NULL),
(9452, @tree_id + 6, "Vindication", "spell_holy_vindication", 2, 0, 3, NULL),
(20117, @tree_id + 6, "Conviction", "spell_holy_retributionaura", 2, 1, 5, NULL),
(20375, @tree_id + 6, "Seal of Command", "ability_warrior_innerrage", 2, 2, 1, NULL),
(26022, @tree_id + 6, "Pursuit of Justice", "spell_holy_persuitofjustice", 2, 3, 3, NULL),
(9799, @tree_id + 6, "Eye for an Eye", "spell_holy_eyeforaneye", 3, 0, 2, NULL),
(20091, @tree_id + 6, "Improved Retribution Aura", "spell_holy_auraoflight", 3, 2, 2, NULL),
(31866, @tree_id + 6, "Crusade", "spell_holy_crusade", 3, 3, 3, NULL),
(20111, @tree_id + 6, "Two-Handed Weapon Specialization", "inv_hammer_04", 4, 0, 3, NULL),
(20218, @tree_id + 6, "Sanctity Aura", "spell_holy_mindvision", 4, 2, 1, NULL),
(31869, @tree_id + 6, "Improved Sanctity Aura", "spell_holy_mindvision", 4, 3, 2, NULL),
(20049, @tree_id + 6, "Vengeance", "ability_racial_avatar", 5, 1, 5, 20117),
(31876, @tree_id + 6, "Sanctified Judgement", "spell_holy_righteousfury", 5, 2, 3, NULL),
(32043, @tree_id + 6, "Sanctified Seals", "spell_holy_holysmite", 6, 0, 3, NULL),
(20066, @tree_id + 6, "Repentance", "spell_holy_prayerofhealing", 6, 1, 1, NULL),
(31871, @tree_id + 6, "Divine Purpose", "spell_holy_divinepurpose", 6, 2, 3, NULL),
(31879, @tree_id + 6, "Fanaticism", "spell_holy_fanaticism", 7, 1, 5, 20066),
(35395, @tree_id + 6, "Crusader Strike", "spell_holy_crusaderstrike", 8, 1, 1, NULL),
-- beastmastery
(19552, @tree_id + 7, "Improved Aspect of the Hawk", "spell_nature_ravenform", 0, 1, 5, NULL),
(19583, @tree_id + 7, "Endurance Training", "spell_nature_reincarnation", 0, 2, 5, NULL),
(35029, @tree_id + 7, "Focused Fire", "ability_hunter_silenthunter", 1, 0, 2, NULL),
(19549, @tree_id + 7, "Improved Aspect of the Monkey", "ability_hunter_aspectofthemonkey", 1, 1, 3, NULL),
(19609, @tree_id + 7, "Thick Hide", "inv_misc_pelt_bear_03", 1, 2, 3, NULL),
(24443, @tree_id + 7, "Improved Revive Pet", "ability_hunter_beastsoothe", 1, 3, 2, NULL),
(19559, @tree_id + 7, "Pathfinding", "ability_mount_jungletiger", 2, 0, 2, NULL),
(19596, @tree_id + 7, "Bestial Swiftness", "ability_druid_dash", 2, 1, 1, NULL),
(19616, @tree_id + 7, "Unleashed Fury", "ability_bullrush", 2, 2, 5, NULL),
(19572, @tree_id + 7, "Improved Mend Pet", "ability_hunter_mendpet", 3, 1, 2, NULL),
(19598, @tree_id + 7, "Ferocity", "inv_misc_monsterclaw_04", 3, 2, 5, NULL),
(19578, @tree_id + 7, "Spirit Bond", "ability_druid_demoralizingroar", 4, 0, 2, NULL),
(19577, @tree_id + 7, "Intimidation", "ability_devour", 4, 1, 1, NULL),
(19590, @tree_id + 7, "Bestial Discipline", "spell_nature_abolishmagic", 4, 3, 2, NULL),
(34453, @tree_id + 7, "Animal Handler", "ability_hunter_animalhandler", 5, 0, 2, NULL),
(19621, @tree_id + 7, "Frenzy", "inv_misc_monsterclaw_03", 5, 2, 5, 19598),
(34455, @tree_id + 7, "Ferocious Inspiration", "ability_hunter_ferociousinspiration", 6, 0, 3, NULL),
(19574, @tree_id + 7, "Bestial Wrath", "ability_druid_ferociousbite", 6, 1, 1, 19577),
(34462, @tree_id + 7, "Catlike Reflexes", "ability_hunter_catlikereflexes", 6, 2, 3, NULL),
(34466, @tree_id + 7, "Serpent's Swiftness", "ability_hunter_serpentswiftness", 7, 2, 5, NULL),
(34692, @tree_id + 7, "The Beast Within", "ability_hunter_beastwithin", 8, 1, 1, 19574),
-- marksmanship
(19407, @tree_id + 8, "Improved Concussive Shot", "spell_frost_stun", 0, 1, 5, NULL),
(19426, @tree_id + 8, "Lethal Shots", "ability_searingarrow", 0, 2, 5, NULL),
(19421, @tree_id + 8, "Improved Hunter's Mark", "ability_hunter_snipershot", 1, 1, 5, NULL),
(19416, @tree_id + 8, "Efficiency", "spell_frost_wizardmark", 1, 2, 5, NULL),
(34950, @tree_id + 8, "Go for the Throat", "ability_hunter_goforthethroat", 2, 0, 2, NULL),
(19454, @tree_id + 8, "Improved Arcane Shot", "ability_impalingbolt", 2, 1, 5, NULL),
(19434, @tree_id + 8, "Aimed Shot", "inv_spear_07", 2, 2, 1, NULL),
(34948, @tree_id + 8, "Rapid Killing", "ability_hunter_rapidkilling", 2, 3, 2, NULL),
(19464, @tree_id + 8, "Improved Stings", "ability_hunter_quickshot", 3, 1, 5, NULL),
(19485, @tree_id + 8, "Mortal Shots", "ability_piercedamage", 3, 2, 5, 19434),
(35100, @tree_id + 8, "Concussive Barrage", "spell_arcane_starfire", 4, 0, 3, NULL),
(19503, @tree_id + 8, "Scatter Shot", "ability_golemstormbolt", 4, 1, 1, NULL),
(19461, @tree_id + 8, "Barrage", "ability_upgrademoonglaive", 4, 2, 3, NULL),
(34475, @tree_id + 8, "Combat Experience", "ability_hunter_combatexperience", 5, 0, 2, NULL),
(19507, @tree_id + 8, "Ranged Weapon Specialization", "inv_weapon_rifle_06", 5, 3, 5, NULL),
(34482, @tree_id + 8, "Careful Aim", "ability_hunter_zenarchery", 6, 0, 3, NULL),
(19506, @tree_id + 8, "Trueshot Aura", "ability_trueshot", 6, 1, 1, 19503),
(35104, @tree_id + 8, "Improved Barrage", "ability_upgrademoonglaive", 6, 2, 3, 19461),
(34485, @tree_id + 8, "Master Marksman", "ability_hunter_mastermarksman", 7, 1, 5, NULL),
(34490, @tree_id + 8, "Silencing Shot", "ability_theblackarrow", 8, 1, 1, 34485),
-- survival
(24293, @tree_id + 9, "Monster Slaying", "inv_misc_head_dragon_black", 0, 0, 3, NULL),
(19151, @tree_id + 9, "Humanoid Slaying", "spell_holy_prayerofhealing", 0, 1, 3, NULL),
(19498, @tree_id + 9, "Hawk Eye", "ability_townwatch", 0, 2, 3, NULL),
(19159, @tree_id + 9, "Savage Strikes", "ability_racial_bloodrage", 0, 3, 2, NULL),
(19184, @tree_id + 9, "Entrapment", "spell_nature_stranglevines", 1, 0, 3, NULL),
(19295, @tree_id + 9, "Deflection", "ability_parry", 1, 1, 5, NULL),
(19228, @tree_id + 9, "Improved Wing Clip", "ability_rogue_trip", 1, 2, 3, NULL),
(19239, @tree_id + 9, "Clever Traps", "spell_nature_timestop", 2, 0, 2, NULL),
(19255, @tree_id + 9, "Survivalist", "spell_shadow_twilight", 2, 1, 5, NULL),
(19263, @tree_id + 9, "Deterrence", "ability_whirlwind", 2, 2, 1, NULL),
(19376, @tree_id + 9, "Trap Mastery", "ability_ensnare", 3, 0, 2, NULL),
(19290, @tree_id + 9, "Surefooted", "ability_kick", 3, 1, 3, NULL),
(19286, @tree_id + 9, "Improved Feign Death", "ability_rogue_feigndeath", 3, 3, 2, NULL),
(34494, @tree_id + 9, "Survival Instincts", "ability_hunter_survivalinstincts", 4, 0, 2, NULL),
(19370, @tree_id + 9, "Killer Instinct", "spell_holy_blessingofstamina", 4, 1, 3, NULL),
(19306, @tree_id + 9, "Counterattack", "ability_warrior_challange", 4, 2, 1, 19263),
(34491, @tree_id + 9, "Resourcefulness", "ability_hunter_resourcefulness", 5, 0, 3, NULL),
(19168, @tree_id + 9, "Lightning Reflexes", "spell_nature_invisibilty", 5, 2, 5, NULL),
(34497, @tree_id + 9, "Thrill of the Hunt", "ability_hunter_thrillofthehunt", 6, 0, 3, NULL),
(19386, @tree_id + 9, "Wyvern Sting", "inv_spear_02", 6, 1, 1, 19370),
(34500, @tree_id + 9, "Expose Weakness", "ability_rogue_findweakness", 6, 2, 3, NULL),
(34506, @tree_id + 9, "Master Tactician", "ability_hunter_mastertactitian", 7, 1, 5, NULL),
(23989, @tree_id + 9, "Readiness", "ability_hunter_readiness", 8, 1, 1, 34506),
-- assassination
(14162, @tree_id + 10, "Improved Eviscerate", "ability_rogue_eviscerate", 0, 0, 3, NULL),
(14144, @tree_id + 10, "Remorseless Attacks", "ability_fiegndead", 0, 1, 2, NULL),
(14138, @tree_id + 10, "Malice", "ability_racial_bloodrage", 0, 2, 5, NULL),
(14156, @tree_id + 10, "Ruthlessness", "ability_druid_disembowel", 1, 0, 3, NULL),
(14158, @tree_id + 10, "Murder", "spell_shadow_deathscream", 1, 1, 2, NULL),
(13733, @tree_id + 10, "Puncturing Wounds", "ability_backstab", 1, 3, 3, NULL),
(14179, @tree_id + 10, "Relentless Strikes", "ability_warrior_decisivestrike", 2, 0, 1, NULL),
(14168, @tree_id + 10, "Improved Expose Armor", "ability_warrior_riposte", 2, 1, 2, NULL),
(14128, @tree_id + 10, "Lethality", "ability_criticalstrike", 2, 2, 5, 14138),
(16513, @tree_id + 10, "Vile Poisons", "ability_rogue_feigndeath", 3, 1, 5, NULL),
(14113, @tree_id + 10, "Improved Poisons", "ability_poisons", 3, 2, 5, NULL),
(31208, @tree_id + 10, "Fleet Footed", "ability_rogue_fleetfooted", 4, 0, 2, NULL),
(14177, @tree_id + 10, "Cold Blood", "spell_ice_lament", 4, 1, 1, NULL),
(14174, @tree_id + 10, "Improved Kidney Shot", "ability_rogue_kidneyshot", 4, 2, 3, NULL),
(31244, @tree_id + 10, "Quick Recovery", "ability_rogue_quickrecovery", 4, 3, 2, NULL),
(14186, @tree_id + 10, "Seal Fate", "spell_shadow_chilltouch", 5, 1, 5, 14177),
(31226, @tree_id + 10, "Master Poisoner", "ability_creature_poison_06", 5, 2, 2, NULL),
(14983, @tree_id + 10, "Vigor", "spell_nature_earthbindtotem", 6, 1, 1, NULL),
(31380, @tree_id + 10, "Deadened Nerves", "ability_rogue_deadenednerves", 6, 2, 5, NULL),
(31233, @tree_id + 10, "Find Weakness", "ability_rogue_findweakness", 7, 2, 5, NULL),
(1329, @tree_id + 10, "Mutilate", "ability_rogue_shadowstrikes", 8, 1, 1, 14983),
-- combat
(13741, @tree_id + 11, "Improved Gouge", "ability_gouge", 0, 0, 3, NULL),
(13732, @tree_id + 11, "Improved Sinister Strike", "spell_shadow_ritualofsacrifice", 0, 1, 2, NULL),
(13712, @tree_id + 11, "Lightning Reflexes", "spell_nature_invisibilty", 0, 2, 5, NULL),
(14165, @tree_id + 11, "Improved Slice and Dice", "ability_rogue_slicedice", 1, 0, 3, NULL),
(13713, @tree_id + 11, "Deflection", "ability_parry", 1, 1, 5, NULL),
(13705, @tree_id + 11, "Precision", "ability_marksmanship", 1, 2, 5, NULL),
(13742, @tree_id + 11, "Endurance", "spell_shadow_shadowward", 2, 0, 2, NULL),
(14251, @tree_id + 11, "Riposte", "ability_warrior_challange", 2, 1, 1, 13713),
(13743, @tree_id + 11, "Improved Sprint", "ability_rogue_sprint", 2, 3, 2, NULL),
(13754, @tree_id + 11, "Improved Kick", "ability_kick", 3, 0, 2, NULL),
(13706, @tree_id + 11, "Dagger Specialization", "inv_weapon_shortblade_05", 3, 1, 5, NULL),
(13715, @tree_id + 11, "Dual Wield Specialization", "ability_dualwield", 3, 2, 5, 13705),
(13709, @tree_id + 11, "Mace Specialization", "inv_mace_01", 4, 0, 5, NULL),
(13877, @tree_id + 11, "Blade Flurry", "ability_warrior_punishingblow", 4, 1, 1, NULL),
(13960, @tree_id + 11, "Sword Specialization", "inv_sword_27", 4, 2, 5, NULL),
(13707, @tree_id + 11, "Fist Weapon Specialization", "inv_gauntlets_04", 4, 3, 5, NULL),
(31124, @tree_id + 11, "Blade Twisting", "ability_rogue_bladetwisting", 5, 0, 2, NULL),
(30919, @tree_id + 11, "Weapon Expertise", "spell_holy_blessingofstrength", 5, 1, 2, 13877),
(18427, @tree_id + 11, "Aggression", "ability_racial_avatar", 5, 2, 3, NULL),
(31122, @tree_id + 11, "Vitality", "ability_warrior_revenge", 6, 0, 2, NULL),
(13750, @tree_id + 11, "Adrenaline Rush", "spell_shadow_shadowworddominate", 6, 1, 1, NULL),
(31130, @tree_id + 11, "Nerves of Steel", "ability_rogue_nervesofsteel", 6, 2, 2, NULL),
(35541, @tree_id + 11, "Combat Potency", "inv_weapon_shortblade_38", 7, 2, 5, NULL),
(32601, @tree_id + 11, "Surprise Attacks", "ability_rogue_surpriseattack", 8, 1, 1, 13750),
-- subtlety
(13958, @tree_id + 12, "Master of Deception", "spell_shadow_charm", 0, 1, 5, NULL),
(14057, @tree_id + 12, "Opportunity", "ability_warrior_warcry", 0, 2, 5, NULL),
(30892, @tree_id + 12, "Sleight of Hand", "ability_rogue_feint", 1, 0, 2, NULL),
(14076, @tree_id + 12, "Dirty Tricks", "ability_sap", 1, 1, 2, NULL),
(13975, @tree_id + 12, "Camouflage", "ability_stealth", 1, 2, 5, NULL),
(13976, @tree_id + 12, "Initiative", "spell_shadow_fumble", 2, 0, 3, NULL),
(14278, @tree_id + 12, "Ghostly Strike", "spell_shadow_curse", 2, 1, 1, NULL),
(14079, @tree_id + 12, "Improved Ambush", "ability_rogue_ambush", 2, 2, 3, NULL),
(13983, @tree_id + 12, "Setup", "spell_nature_mirrorimage", 3, 0, 3, NULL),
(13981, @tree_id + 12, "Elusiveness", "spell_magic_lesserinvisibilty", 3, 1, 2, NULL),
(14171, @tree_id + 12, "Serrated Blades", "inv_sword_17", 3, 2, 3, NULL),
(30894, @tree_id + 12, "Heightened Senses", "ability_ambush", 4, 0, 2, NULL),
(14185, @tree_id + 12, "Preparation", "spell_shadow_antishadow", 4, 1, 1, NULL),
(14082, @tree_id + 12, "Dirty Deeds", "spell_shadow_summonsuccubus", 4, 2, 2, NULL),
(16511, @tree_id + 12, "Hemorrhage", "spell_shadow_lifedrain", 4, 3, 1, 14171),
(31221, @tree_id + 12, "Master of Subtlety", "ability_rogue_masterofsubtlety", 5, 0, 3, NULL),
(30902, @tree_id + 12, "Deadliness", "inv_weapon_crossbow_11", 5, 2, 5, NULL),
(31211, @tree_id + 12, "Enveloping Shadows", "ability_rogue_envelopingshadows", 6, 0, 3, NULL),
(14183, @tree_id + 12, "Premeditation", "spell_shadow_possession", 6, 1, 1, 14185),
(31228, @tree_id + 12, "Cheat Death", "ability_rogue_cheatdeath", 6, 2, 3, NULL),
(31216, @tree_id + 12, "Sinister Calling", "ability_rogue_sinistercalling", 7, 1, 5, 14183),
(36554, @tree_id + 12, "Shadowstep", "ability_rogue_shadowstep", 8, 1, 1, NULL),
-- discipline
(14522, @tree_id + 13, "Unbreakable Will", "spell_magic_magearmor", 0, 1, 5, NULL),
(14524, @tree_id + 13, "Wand Specialization", "inv_wand_01", 0, 2, 5, NULL),
(14523, @tree_id + 13, "Silent Resolve", "spell_nature_manaregentotem", 1, 0, 5, NULL),
(14749, @tree_id + 13, "Improved Power Word: Fortitude", "spell_holy_wordfortitude", 1, 1, 2, NULL),
(14748, @tree_id + 13, "Improved Power Word: Shield", "spell_holy_powerwordshield", 1, 2, 3, NULL),
(14531, @tree_id + 13, "Martyrdom", "spell_nature_tranquility", 1, 3, 2, NULL),
(33167, @tree_id + 13, "Absolution", "spell_holy_absolution", 2, 0, 3, NULL),
(14751, @tree_id + 13, "Inner Focus", "spell_frost_windwalkon", 2, 1, 1, NULL),
(14521, @tree_id + 13, "Meditation", "spell_nature_sleep", 2, 2, 3, NULL),
(14747, @tree_id + 13, "Improved Inner Fire", "spell_holy_innerfire", 3, 0, 3, NULL),
(14520, @tree_id + 13, "Mental Agility", "ability_hibernation", 3, 1, 5, NULL),
(14750, @tree_id + 13, "Improved Mana Burn", "spell_shadow_manaburn", 3, 3, 2, NULL),
(18551, @tree_id + 13, "Mental Strength", "spell_nature_enchantarmor", 4, 1, 5, NULL),
(14752, @tree_id + 13, "Divine Spirit", "spell_holy_divinespirit", 4, 2, 1, 14521),
(33174, @tree_id + 13, "Improved Divine Spirit", "spell_holy_divinespirit", 4, 3, 2, 14752),
(33186, @tree_id + 13, "Focused Power", "spell_shadow_focusedpower", 5, 0, 2, NULL),
(18544, @tree_id + 13, "Force of Will", "spell_nature_slowingtotem", 5, 2, 5, NULL),
(45234, @tree_id + 13, "Focused Will", "spell_arcane_focusedpower", 6, 0, 3, NULL),
(10060, @tree_id + 13, "Power Infusion", "spell_holy_powerinfusion", 6, 1, 1, 18551),
(33201, @tree_id + 13, "Reflective Shield", "spell_holy_powerwordshield", 6, 2, 5, NULL),
(34908, @tree_id + 13, "Enlightenment", "spell_arcane_mindmastery", 7, 1, 5, NULL),
(33206, @tree_id + 13, "Pain Suppression", "spell_holy_painsupression", 8, 1, 1, NULL),
-- holy
(14913, @tree_id + 14, "Healing Focus", "spell_holy_healingfocus", 0, 0, 2, NULL),
(14908, @tree_id + 14, "Improved Renew", "spell_holy_renew", 0, 1, 3, NULL),
(14889, @tree_id + 14, "Holy Specialization", "spell_holy_sealofsalvation", 0, 2, 5, NULL),
(27900, @tree_id + 14, "Spell Warding", "spell_holy_spellwarding", 1, 1, 5, NULL),
(18530, @tree_id + 14, "Divine Fury", "spell_holy_sealofwrath", 1, 2, 5, NULL),
(15237, @tree_id + 14, "Holy Nova", "spell_holy_holynova", 2, 0, 1, NULL),
(27811, @tree_id + 14, "Blessed Recovery", "spell_holy_blessedrecovery", 2, 1, 3, NULL),
(14892, @tree_id + 14, "Inspiration", "spell_holy_layonhands", 2, 3, 3, NULL),
(27789, @tree_id + 14, "Holy Reach", "spell_holy_purify", 3, 0, 2, NULL),
(14912, @tree_id + 14, "Improved Healing", "spell_holy_heal02", 3, 1, 3, NULL),
(14909, @tree_id + 14, "Searing Light", "spell_holy_searinglightpriest", 3, 2, 2, 18530),
(14911, @tree_id + 14, "Healing Prayers", "spell_holy_prayerofhealing02", 4, 0, 2, NULL),
(20711, @tree_id + 14, "Spirit of Redemption", "inv_enchant_essenceeternallarge", 4, 1, 1, NULL),
(14901, @tree_id + 14, "Spiritual Guidance", "spell_holy_spiritualguidence", 4, 2, 5, NULL),
(33150, @tree_id + 14, "Surge of Light", "spell_holy_surgeoflight", 5, 0, 2, NULL),
(14898, @tree_id + 14, "Spiritual Healing", "spell_nature_moonglow", 5, 2, 5, NULL),
(34753, @tree_id + 14, "Holy Concentration", "spell_holy_fanaticism", 6, 0, 3, NULL),
(724, @tree_id + 14, "Lightwell", "spell_holy_summonlightwell", 6, 1, 1, 20711),
(33142, @tree_id + 14, "Blessed Resilience", "spell_holy_blessedresillience", 6, 2, 3, NULL),
(33158, @tree_id + 14, "Empowered Healing", "spell_holy_greaterheal", 7, 1, 5, NULL),
(34861, @tree_id + 14, "Circle of Healing", "spell_holy_circleofrenewal", 8, 1, 1, NULL),
-- shadow
(15270, @tree_id + 15, "Spirit Tap", "spell_shadow_requiem", 0, 1, 5, NULL),
(15268, @tree_id + 15, "Blackout", "spell_shadow_gathershadows", 0, 2, 5, NULL),
(15318, @tree_id + 15, "Shadow Affinity", "spell_shadow_shadowward", 1, 0, 3, NULL),
(15275, @tree_id + 15, "Improved Shadow Word: Pain", "spell_shadow_shadowwordpain", 1, 1, 2, NULL),
(15260, @tree_id + 15, "Shadow Focus", "spell_shadow_burningspirit", 1, 2, 5, NULL),
(15392, @tree_id + 15, "Improved Psychic Scream", "spell_shadow_psychicscream", 2, 0, 2, NULL),
(15273, @tree_id + 15, "Improved Mind Blast", "spell_shadow_unholyfrenzy", 2, 1, 5, NULL),
(15407, @tree_id + 15, "Mind Flay", "spell_shadow_siphonmana", 2, 2, 1, NULL),
(15274, @tree_id + 15, "Improved Fade", "spell_magic_lesserinvisibilty", 3, 1, 2, NULL),
(17322, @tree_id + 15, "Shadow Reach", "spell_shadow_chilltouch", 3, 2, 2, NULL),
(15257, @tree_id + 15, "Shadow Weaving", "spell_shadow_blackplague", 3, 3, 5, NULL),
(15487, @tree_id + 15, "Silence", "spell_shadow_impphaseshift", 4, 0, 1, 15392),
(15286, @tree_id + 15, "Vampiric Embrace", "spell_shadow_unsummonbuilding", 4, 1, 1, NULL),
(27839, @tree_id + 15, "Improved Vampiric Embrace", "spell_shadow_improvedvampiricembrace", 4, 2, 2, 15286),
(33213, @tree_id + 15, "Focused Mind", "spell_nature_focusedmind", 4, 3, 3, NULL),
(14910, @tree_id + 15, "Shadow Resilience", "spell_shadow_grimward", 5, 0, 2, NULL),
(15259, @tree_id + 15, "Darkness", "spell_shadow_twilight", 5, 2, 5, NULL),
(15473, @tree_id + 15, "Shadowform", "spell_shadow_shadowform", 6, 1, 1, 15286),
(33221, @tree_id + 15, "Shadow Power", "spell_shadow_shadowpower", 6, 2, 5, NULL),
(33191, @tree_id + 15, "Misery", "spell_shadow_misery", 7, 2, 5, NULL),
(34914, @tree_id + 15, "Vampiric Touch", "spell_holy_stoicism", 8, 1, 1, 15473),
-- elemental
(16039, @tree_id + 16, "Convection", "spell_nature_wispsplode", 0, 1, 5, NULL),
(16035, @tree_id + 16, "Concussion", "spell_fire_fireball", 0, 2, 5, NULL),
(16043, @tree_id + 16, "Earth's Grasp", "spell_nature_stoneclawtotem", 1, 0, 2, NULL),
(28996, @tree_id + 16, "Elemental Warding", "spell_nature_spiritarmor", 1, 1, 3, NULL),
(16038, @tree_id + 16, "Call of Flame", "spell_fire_immolation", 1, 2, 3, NULL),
(16164, @tree_id + 16, "Elemental Focus", "spell_shadow_manaburn", 2, 0, 1, NULL),
(16040, @tree_id + 16, "Reverberation", "spell_frost_frostward", 2, 1, 5, NULL),
(16041, @tree_id + 16, "Call of Thunder", "spell_nature_callstorm", 2, 2, 5, NULL),
(16086, @tree_id + 16, "Improved Fire Totems", "spell_fire_sealoffire", 3, 0, 2, NULL),
(29062, @tree_id + 16, "Eye of the Storm", "spell_shadow_soulleech_2", 3, 1, 3, NULL),
(30160, @tree_id + 16, "Elemental Devastation", "spell_fire_elementaldevastation", 3, 3, 3, NULL),
(28999, @tree_id + 16, "Storm Reach", "spell_nature_stormreach", 4, 0, 2, NULL),
(16089, @tree_id + 16, "Elemental Fury", "spell_fire_volcano", 4, 1, 1, NULL),
(30664, @tree_id + 16, "Unrelenting Storm", "spell_nature_unrelentingstorm", 4, 3, 5, NULL),
(30672, @tree_id + 16, "Elemental Precision", "spell_nature_elementalprecision_1", 5, 0, 3, NULL),
(16578, @tree_id + 16, "Lightning Mastery", "spell_lightning_lightningbolt01", 5, 2, 5, 16041),
(16166, @tree_id + 16, "Elemental Mastery", "spell_nature_wispheal", 6, 1, 1, 16089),
(30669, @tree_id + 16, "Elemental Shields", "spell_nature_elementalshields", 6, 2, 3, NULL),
(30675, @tree_id + 16, "Lightning Overload", "spell_nature_lightningoverload", 7, 1, 5, NULL),
(30706, @tree_id + 16, "Totem of Wrath", "spell_fire_totemofwrath", 8, 1, 1, 30675),
-- enhancement
(17485, @tree_id + 17, "Ancestral Knowledge", "spell_shadow_grimward", 0, 1, 5, NULL),
(16253, @tree_id + 17, "Shield Specialization", "inv_shield_06", 0, 2, 5, NULL),
(16258, @tree_id + 17, "Guardian Totems", "spell_nature_stoneskintotem", 1, 0, 2, NULL),
(16255, @tree_id + 17, "Thundering Strikes", "ability_thunderbolt", 1, 1, 5, NULL),
(16262, @tree_id + 17, "Improved Ghost Wolf", "spell_nature_spiritwolf", 1, 2, 2, NULL),
(16261, @tree_id + 17, "Improved Lightning Shield", "spell_nature_lightningshield", 1, 3, 3, NULL),
(16259, @tree_id + 17, "Enhancing Totems", "spell_nature_earthbindtotem", 2, 0, 2, NULL),
(43338, @tree_id + 17, "Shamanistic Focus", "spell_nature_elementalabsorption", 2, 2, 1, NULL),
(16254, @tree_id + 17, "Anticipation", "spell_nature_mirrorimage", 2, 3, 5, NULL),
(16256, @tree_id + 17, "Flurry", "ability_ghoulfrenzy", 3, 1, 5, 16255),
(16252, @tree_id + 17, "Toughness", "spell_holy_devotion", 3, 2, 5, NULL),
(29192, @tree_id + 17, "Improved Weapon Totems", "spell_fire_enchantweapon", 4, 0, 2, NULL),
(16268, @tree_id + 17, "Spirit Weapons", "ability_parry", 4, 1, 1, NULL),
(16266, @tree_id + 17, "Elemental Weapons", "spell_fire_flametounge", 4, 2, 3, NULL),
(30812, @tree_id + 17, "Mental Quickness", "spell_nature_mentalquickness", 5, 0, 3, NULL),
(29082, @tree_id + 17, "Weapon Mastery", "ability_hunter_swiftstrike", 5, 3, 5, NULL),
(30816, @tree_id + 17, "Dual Wield Specialization", "ability_dualwieldspecialization", 6, 0, 3, NULL),
(30798, @tree_id + 17, "Dual Wield", "ability_dualwield", 6, 1, 1, 16268),
(17364, @tree_id + 17, "Stormstrike", "ability_shaman_stormstrike", 6, 2, 1, 16266),
(30802, @tree_id + 17, "Unleashed Rage", "spell_nature_unleashedrage", 7, 1, 5, NULL),
(30823, @tree_id + 17, "Shamanistic Rage", "spell_nature_shamanrage", 8, 1, 1, NULL),
-- restoration
(16182, @tree_id + 18, "Improved Healing Wave", "spell_nature_magicimmunity", 0, 1, 5, NULL),
(16179, @tree_id + 18, "Tidal Focus", "spell_frost_manarecharge", 0, 2, 5, NULL),
(16184, @tree_id + 18, "Improved Reincarnation", "spell_nature_reincarnation", 1, 0, 2, NULL),
(16176, @tree_id + 18, "Ancestral Healing", "spell_nature_undyingstrength", 1, 1, 3, NULL),
(16173, @tree_id + 18, "Totemic Focus", "spell_nature_moonglow", 1, 2, 5, NULL),
(16180, @tree_id + 18, "Nature's Guidance", "spell_frost_stun", 2, 0, 3, NULL),
(16181, @tree_id + 18, "Healing Focus", "spell_nature_healingwavelesser", 2, 1, 5, NULL),
(16189, @tree_id + 18, "Totemic Mastery", "spell_nature_nullward", 2, 2, 1, NULL),
(29187, @tree_id + 18, "Healing Grace", "spell_nature_healingtouch", 2, 3, 3, NULL),
(16187, @tree_id + 18, "Restorative Totems", "spell_nature_manaregentotem", 3, 1, 5, NULL),
(16194, @tree_id + 18, "Tidal Mastery", "spell_nature_tranquility", 3, 2, 5, NULL),
(29206, @tree_id + 18, "Healing Way", "spell_nature_healingway", 4, 0, 3, NULL),
(16188, @tree_id + 18, "Nature's Swiftness", "spell_nature_ravenform", 4, 2, 1, NULL),
(30864, @tree_id + 18, "Focused Mind", "spell_nature_focusedmind", 4, 3, 3, NULL),
(16178, @tree_id + 18, "Purification", "spell_frost_wizardmark", 5, 2, 5, NULL),
(16190, @tree_id + 18, "Mana Tide Totem", "spell_frost_summonwaterelemental", 6, 1, 1, 16187),
(30881, @tree_id + 18, "Nature's Guardian", "spell_nature_natureguardian", 6, 2, 5, NULL),
(30867, @tree_id + 18, "Nature's Blessing", "spell_nature_natureblessing", 7, 1, 3, NULL),
(30872, @tree_id + 18, "Improved Chain Heal", "spell_nature_healingwavegreater", 7, 2, 2, NULL),
(974, @tree_id + 18, "Earth Shield", "spell_nature_skinofearth", 8, 1, 1, 30867),
-- arcane
(11210, @tree_id + 19, "Arcane Subtlety", "spell_holy_dispelmagic", 0, 0, 2, NULL),
(11222, @tree_id + 19, "Arcane Focus", "spell_holy_devotion", 0, 1, 5, NULL),
(11237, @tree_id + 19, "Improved Arcane Missiles", "spell_nature_starfall", 0, 2, 5, NULL),
(6057, @tree_id + 19, "Wand Specialization", "inv_wand_01", 1, 0, 2, NULL),
(29441, @tree_id + 19, "Magic Absorption", "spell_nature_astralrecalgroup", 1, 1, 5, NULL),
(11213, @tree_id + 19, "Arcane Concentration", "spell_shadow_manaburn", 1, 2, 5, NULL),
(11247, @tree_id + 19, "Magic Attunement", "spell_nature_abolishmagic", 2, 0, 2, NULL),
(11242, @tree_id + 19, "Arcane Impact", "spell_nature_wispsplode", 2, 1, 3, NULL),
(28574, @tree_id + 19, "Arcane Fortitude", "spell_arcane_arcaneresilience", 2, 3, 1, NULL),
(11252, @tree_id + 19, "Improved Mana Shield", "spell_shadow_detectlesserinvisibility", 3, 0, 2, NULL),
(11255, @tree_id + 19, "Improved Counterspell", "spell_frost_iceshock", 3, 1, 2, NULL),
(18462, @tree_id + 19, "Arcane Meditation", "spell_shadow_siphonmana", 3, 3, 3, NULL),
(31569, @tree_id + 19, "Improved Blink", "spell_arcane_blink", 4, 0, 2, NULL),
(12043, @tree_id + 19, "Presence of Mind", "spell_nature_enchantarmor", 4, 1, 1, NULL),
(11232, @tree_id + 19, "Arcane Mind", "spell_shadow_charm", 4, 3, 5, NULL),
(31574, @tree_id + 19, "Prismatic Cloak", "spell_arcane_prismaticcloak", 5, 0, 2, NULL),
(15058, @tree_id + 19, "Arcane Instability", "spell_shadow_teleport", 5, 1, 3, 12043),
(31571, @tree_id + 19, "Arcane Potency", "spell_arcane_arcanepotency", 5, 2, 3, 11213),
(31579, @tree_id + 19, "Empowered Arcane Missiles", "spell_nature_starfall", 6, 0, 3, NULL),
(12042, @tree_id + 19, "Arcane Power", "spell_nature_lightning", 6, 1, 1, 15058),
(35578, @tree_id + 19, "Spell Power", "spell_arcane_arcanetorrent", 6, 2, 2, NULL),
(31584, @tree_id + 19, "Mind Mastery", "spell_arcane_mindmastery", 7, 1, 5, NULL),
(31589, @tree_id + 19, "Slow", "spell_nature_slow", 8, 1, 1, NULL),
-- fire
(11069, @tree_id + 20, "Improved Fireball", "spell_fire_flamebolt", 0, 1, 5, NULL),
(11103, @tree_id + 20, "Impact", "spell_fire_meteorstorm", 0, 2, 5, NULL),
(11119, @tree_id + 20, "Ignite", "spell_fire_incinerate", 1, 0, 5, NULL),
(11100, @tree_id + 20, "Flame Throwing", "spell_fire_flare", 1, 1, 2, NULL),
(11078, @tree_id + 20, "Improved Fire Blast", "spell_fire_fireball", 1, 2, 3, NULL),
(18459, @tree_id + 20, "Incineration", "spell_fire_flameshock", 2, 0, 2, NULL),
(11108, @tree_id + 20, "Improved Flamestrike", "spell_fire_selfdestruct", 2, 1, 3, NULL),
(11366, @tree_id + 20, "Pyroblast", "spell_fire_fireball02", 2, 2, 1, NULL),
(11083, @tree_id + 20, "Burning Soul", "spell_fire_fire", 2, 3, 2, NULL),
(11095, @tree_id + 20, "Improved Scorch", "spell_fire_soulburn", 3, 0, 3, NULL),
(11094, @tree_id + 20, "Molten Shields", "spell_fire_firearmor", 3, 1, 2, NULL),
(29074, @tree_id + 20, "Master of Elements", "spell_fire_masterofelements", 3, 3, 3, NULL),
(31638, @tree_id + 20, "Playing with Fire", "spell_fire_playingwithfire", 4, 0, 3, NULL),
(11115, @tree_id + 20, "Critical Mass", "spell_nature_wispheal", 4, 1, 3, NULL),
(11113, @tree_id + 20, "Blast Wave", "spell_holy_excorcism_02", 4, 2, 1, 11366),
(31641, @tree_id + 20, "Blazing Speed", "spell_fire_burningspeed", 5, 0, 2, NULL),
(11124, @tree_id + 20, "Fire Power", "spell_fire_immolation", 5, 2, 5, NULL),
(34293, @tree_id + 20, "Pyromaniac", "spell_fire_burnout", 6, 0, 3, NULL),
(11129, @tree_id + 20, "Combustion", "spell_fire_sealoffire", 6, 1, 1, 11115),
(31679, @tree_id + 20, "Molten Fury", "spell_fire_moltenblood", 6, 2, 2, NULL),
(31656, @tree_id + 20, "Empowered Fireball", "spell_fire_flamebolt", 7, 2, 5, NULL),
(31661, @tree_id + 20, "Dragon's Breath", "inv_misc_head_dragon_01", 8, 1, 1, 11129),
-- frost
(11189, @tree_id + 21, "Frost Warding", "spell_frost_frostward", 0, 0, 2, NULL),
(11070, @tree_id + 21, "Improved Frostbolt", "spell_frost_frostbolt02", 0, 1, 5, NULL),
(29438, @tree_id + 21, "Elemental Precision", "spell_ice_magicdamage", 0, 2, 3, NULL),
(11207, @tree_id + 21, "Ice Shards", "spell_frost_iceshard", 1, 0, 5, NULL),
(11071, @tree_id + 21, "Frostbite", "spell_frost_frostarmor", 1, 1, 3, NULL),
(11165, @tree_id + 21, "Improved Frost Nova", "spell_frost_freezingbreath", 1, 2, 2, NULL),
(11175, @tree_id + 21, "Permafrost", "spell_frost_wisp", 1, 3, 3, NULL),
(11151, @tree_id + 21, "Piercing Ice", "spell_frost_frostbolt", 2, 0, 3, NULL),
(12472, @tree_id + 21, "Icy Veins", "spell_frost_coldhearted", 2, 1, 1, NULL),
(11185, @tree_id + 21, "Improved Blizzard", "spell_frost_icestorm", 2, 3, 3, NULL),
(16757, @tree_id + 21, "Arctic Reach", "spell_shadow_darkritual", 3, 0, 2, NULL),
(11160, @tree_id + 21, "Frost Channeling", "spell_frost_stun", 3, 1, 3, NULL),
(11170, @tree_id + 21, "Shatter", "spell_frost_frostshock", 3, 2, 5, 11165),
(31667, @tree_id + 21, "Frozen Core", "spell_frost_frozencore", 4, 0, 3, NULL),
(11958, @tree_id + 21, "Cold Snap", "spell_frost_wizardmark", 4, 1, 1, NULL),
(11190, @tree_id + 21, "Improved Cone of Cold", "spell_frost_glacier", 4, 2, 3, NULL),
(31670, @tree_id + 21, "Ice Floes", "spell_frost_icefloes", 5, 0, 2, NULL),
(11180, @tree_id + 21, "Winter's Chill", "spell_frost_chillingblast", 5, 2, 5, NULL),
(11426, @tree_id + 21, "Ice Barrier", "spell_ice_lament", 6, 1, 1, 11958),
(31674, @tree_id + 21, "Arctic Winds", "spell_frost_arcticwinds", 6, 2, 5, NULL),
(31682, @tree_id + 21, "Empowered Frostbolt", "spell_frost_frostbolt02", 7, 1, 5, NULL),
(31687, @tree_id + 21, "Summon Water Elemental", "spell_frost_summonwaterelemental_2", 8, 1, 1, NULL),
-- affliction
(18174, @tree_id + 22, "Suppression", "spell_shadow_unsummonbuilding", 0, 1, 5, NULL),
(17810, @tree_id + 22, "Improved Corruption", "spell_shadow_abominationexplosion", 0, 2, 5, NULL),
(18179, @tree_id + 22, "Improved Curse of Weakness", "spell_shadow_curseofmannoroth", 1, 0, 2, NULL),
(18213, @tree_id + 22, "Improved Drain Soul", "spell_shadow_haunting", 1, 1, 2, NULL),
(18182, @tree_id + 22, "Improved Life Tap", "spell_shadow_burningspirit", 1, 2, 2, NULL),
(17804, @tree_id + 22, "Soul Siphon", "spell_shadow_lifedrain02", 1, 3, 2, NULL),
(18827, @tree_id + 22, "Improved Curse of Agony", "spell_shadow_curseofsargeras", 2, 0, 2, NULL),
(17783, @tree_id + 22, "Fel Concentration", "spell_shadow_fingerofdeath", 2, 1, 5, NULL),
(18288, @tree_id + 22, "Amplify Curse", "spell_shadow_contagion", 2, 2, 1, NULL),
(18218, @tree_id + 22, "Grim Reach", "spell_shadow_callofbone", 3, 0, 2, NULL),
(18094, @tree_id + 22, "Nightfall", "spell_shadow_twilight", 3, 1, 2, NULL),
(32381, @tree_id + 22, "Empowered Corruption", "spell_shadow_abominationexplosion", 3, 3, 3, NULL),
(32385, @tree_id + 22, "Shadow Embrace", "spell_shadow_shadowembrace", 4, 0, 5, NULL),
(18265, @tree_id + 22, "Siphon Life", "spell_shadow_requiem", 4, 1, 1, NULL),
(18223, @tree_id + 22, "Curse of Exhaustion", "spell_shadow_grimward", 4, 2, 1, 18288),
(18271, @tree_id + 22, "Shadow Mastery", "spell_shadow_shadetruesight", 5, 1, 5, 18265),
(30060, @tree_id + 22, "Contagion", "spell_shadow_painfulafflictions", 6, 1, 5, NULL),
(18220, @tree_id + 22, "Dark Pact", "spell_shadow_darkritual", 6, 2, 1, NULL),
(30054, @tree_id + 22, "Improved Howl of Terror", "spell_shadow_deathscream", 7, 0, 2, NULL),
(32477, @tree_id + 22, "Malediction", "spell_shadow_curseofachimonde", 7, 2, 3, NULL),
(30108, @tree_id + 22, "Unstable Affliction", "spell_shadow_unstableaffliction_3", 8, 1, 1, 30060),
-- demonology
(18692, @tree_id + 23, "Improved Healthstone", "inv_stone_04", 0, 0, 2, NULL),
(18694, @tree_id + 23, "Improved Imp", "spell_shadow_summonimp", 0, 1, 3, NULL),
(18697, @tree_id + 23, "Demonic Embrace", "spell_shadow_metamorphosis", 0, 2, 5, NULL),
(18703, @tree_id + 23, "Improved Health Funnel", "spell_shadow_lifedrain", 1, 0, 2, NULL),
(18705, @tree_id + 23, "Improved Voidwalker", "spell_shadow_summonvoidwalker", 1, 1, 3, NULL),
(18731, @tree_id + 23, "Fel Intellect", "spell_holy_magicalsentry", 1, 2, 3, NULL),
(18754, @tree_id + 23, "Improved Succubus", "spell_shadow_summonsuccubus", 2, 0, 3, NULL),
(18708, @tree_id + 23, "Fel Domination", "spell_nature_removecurse", 2, 1, 1, NULL),
(18748, @tree_id + 23, "Fel Stamina", "spell_shadow_antishadow", 2, 2, 3, NULL),
(30143, @tree_id + 23, "Demonic Aegis", "spell_shadow_ragingscream", 2, 3, 3, NULL),
(18709, @tree_id + 23, "Master Summoner", "spell_shadow_impphaseshift", 3, 1, 2, 18708),
(18769, @tree_id + 23, "Unholy Power", "spell_shadow_shadowworddominate", 3, 2, 5, NULL),
(18821, @tree_id + 23, "Improved Enslave Demon", "spell_shadow_enslavedemon", 4, 0, 2, NULL),
(18788, @tree_id + 23, "Demonic Sacrifice", "spell_shadow_psychicscream", 4, 1, 1, NULL),
(18767, @tree_id + 23, "Master Conjuror", "inv_ammo_firetar", 4, 3, 2, NULL),
(30326, @tree_id + 23, "Mana Feed", "spell_shadow_manafeed", 5, 0, 3, NULL),
(23785, @tree_id + 23, "Master Demonologist", "spell_shadow_shadowpact", 5, 2, 5, 18769),
(30319, @tree_id + 23, "Demonic Resilience", "spell_shadow_demonicfortitude", 6, 0, 3, NULL),
(19028, @tree_id + 23, "Soul Link", "spell_shadow_gathershadows", 6, 1, 1, 18788),
(35691, @tree_id + 23, "Demonic Knowledge", "spell_shadow_improvedvampiricembrace", 6, 2, 3, NULL),
(30242, @tree_id + 23, "Demonic Tactics", "spell_shadow_demonictactics", 7, 1, 5, NULL),
(30146, @tree_id + 23, "Summon Felguard", "spell_shadow_summonfelguard", 8, 1, 1, NULL),
-- destruction
(17793, @tree_id + 24, "Improved Shadow Bolt", "spell_shadow_shadowbolt", 0, 1, 5, NULL),
(17778, @tree_id + 24, "Cataclysm", "spell_fire_windsofwoe", 0, 2, 5, NULL),
(17788, @tree_id + 24, "Bane", "spell_shadow_deathpact", 1, 1, 5, NULL),
(18119, @tree_id + 24, "Aftermath", "spell_fire_fire", 1, 2, 5, NULL),
(18126, @tree_id + 24, "Improved Firebolt", "spell_fire_firebolt", 2, 0, 2, NULL),
(18128, @tree_id + 24, "Improved Lash of Pain", "spell_shadow_curse", 2, 1, 2, NULL),
(18130, @tree_id + 24, "Devastation", "spell_fire_flameshock", 2, 2, 5, NULL),
(17877, @tree_id + 24, "Shadowburn", "spell_shadow_scourgebuild", 2, 3, 1, NULL),
(18135, @tree_id + 24, "Intensity", "spell_fire_lavaspawn", 3, 0, 2, NULL),
(17917, @tree_id + 24, "Destructive Reach", "spell_shadow_corpseexplode", 3, 1, 2, NULL),
(17927, @tree_id + 24, "Improved Searing Pain", "spell_fire_soulburn", 3, 3, 3, NULL),
(18096, @tree_id + 24, "Pyroclasm", "spell_fire_volcano", 4, 0, 2, 18135),
(17815, @tree_id + 24, "Improved Immolate", "spell_fire_immolation", 4, 1, 5, NULL),
(17959, @tree_id + 24, "Ruin", "spell_shadow_shadowwordpain", 4, 2, 1, 18130),
(30299, @tree_id + 24, "Nether Protection", "spell_shadow_netherprotection", 5, 0, 3, NULL),
(17954, @tree_id + 24, "Emberstorm", "spell_fire_selfdestruct", 5, 2, 5, NULL),
(34935, @tree_id + 24, "Backlash", "spell_fire_playingwithfire", 6, 0, 3, NULL),
(17962, @tree_id + 24, "Conflagrate", "spell_fire_fireball", 6, 1, 1, 17815),
(30293, @tree_id + 24, "Soul Leech", "spell_shadow_soulleech_3", 6, 2, 3, NULL),
(30288, @tree_id + 24, "Shadow and Flame", "spell_shadow_shadowandflame", 7, 1, 5, NULL),
(30283, @tree_id + 24, "Shadowfury", "spell_shadow_shadowfury", 8, 1, 1, 30288),
-- balance
(16814, @tree_id + 25, "Starlight Wrath", "spell_nature_abolishmagic", 0, 0, 5, NULL),
(16689, @tree_id + 25, "Nature's Grasp", "spell_nature_natureswrath", 0, 1, 1, NULL),
(17245, @tree_id + 25, "Improved Nature's Grasp", "spell_nature_natureswrath", 0, 2, 4, NULL),
(16918, @tree_id + 25, "Control of Nature", "spell_nature_stranglevines", 1, 0, 3, NULL),
(35363, @tree_id + 25, "Focused Starlight", "inv_staff_01", 1, 1, 2, NULL),
(16821, @tree_id + 25, "Improved Moonfire", "spell_nature_starfall", 1, 2, 2, NULL),
(16836, @tree_id + 25, "Brambles", "spell_nature_thorns", 2, 0, 3, NULL),
(5570, @tree_id + 25, "Insect Swarm", "spell_nature_insectswarm", 2, 2, 1, NULL),
(16819, @tree_id + 25, "Nature's Reach", "spell_nature_naturetouchgrow", 2, 3, 2, NULL),
(16909, @tree_id + 25, "Vengeance", "spell_nature_purge", 3, 1, 5, 35363),
(16850, @tree_id + 25, "Celestial Focus", "spell_arcane_starfire", 3, 2, 3, NULL),
(33589, @tree_id + 25, "Lunar Guidance", "ability_druid_lunarguidance", 4, 0, 3, NULL),
(16880, @tree_id + 25, "Nature's Grace", "spell_nature_naturesblessing", 4, 1, 1, NULL),
(16845, @tree_id + 25, "Moonglow", "spell_nature_sentinal", 4, 2, 3, NULL),
(16896, @tree_id + 25, "Moonfury", "spell_nature_moonglow", 5, 1, 5, 16880),
(33592, @tree_id + 25, "Balance of Power", "ability_druid_balanceofpower", 5, 2, 2, NULL),
(33597, @tree_id + 25, "Dreamstate", "ability_druid_dreamstate", 6, 0, 3, NULL),
(24858, @tree_id + 25, "Moonkin Form", "spell_nature_forceofnature", 6, 1, 1, NULL),
(33600, @tree_id + 25, "Improved Faerie Fire", "spell_nature_faeriefire", 6, 2, 3, NULL),
(33603, @tree_id + 25, "Wrath of Cenarius", "ability_druid_twilightswrath", 7, 1, 5, NULL),
(33831, @tree_id + 25, "Force of Nature", "ability_druid_forceofnature", 8, 1, 1, NULL),
-- feralcombat
(16934, @tree_id + 26, "Ferocity", "ability_hunter_pet_hyena", 0, 1, 5, NULL),
(16858, @tree_id + 26, "Feral Aggression", "ability_druid_demoralizingroar", 0, 2, 5, NULL),
(16947, @tree_id + 26, "Feral Instinct", "ability_ambush", 1, 0, 3, NULL),
(16940, @tree_id + 26, "Brutal Impact", "ability_druid_bash", 1, 1, 2, NULL),
(16929, @tree_id + 26, "Thick Hide", "inv_misc_pelt_bear_03", 1, 2, 3, NULL),
(17002, @tree_id + 26, "Feral Swiftness", "spell_nature_spiritwolf", 2, 0, 2, NULL),
(16979, @tree_id + 26, "Feral Charge", "ability_hunter_pet_bear", 2, 1, 1, NULL),
(16942, @tree_id + 26, "Sharpened Claws", "inv_misc_monsterclaw_04", 2, 2, 3, NULL),
(16966, @tree_id + 26, "Shredding Attacks", "spell_shadow_vampiricaura", 3, 0, 2, NULL),
(16972, @tree_id + 26, "Predatory Strikes", "ability_hunter_pet_cat", 3, 1, 3, NULL),
(37116, @tree_id + 26, "Primal Fury", "ability_racial_cannibalize", 3, 2, 2, 16942),
(16998, @tree_id + 26, "Savage Fury", "ability_druid_ravage", 4, 0, 2, NULL),
(16857, @tree_id + 26, "Faerie Fire (Feral)", "spell_nature_faeriefire", 4, 2, 1, NULL),
(33872, @tree_id + 26, "Nurturing Instinct", "ability_druid_healinginstincts", 4, 3, 2, NULL),
(17003, @tree_id + 26, "Heart of the Wild", "spell_holy_blessingofagility", 5, 1, 5, 16972),
(33853, @tree_id + 26, "Survival of the Fittest", "ability_druid_enrage", 5, 2, 3, NULL),
(33851, @tree_id + 26, "Primal Tenacity", "ability_druid_primaltenacity", 6, 0, 3, NULL),
(17007, @tree_id + 26, "Leader of the Pack", "spell_nature_unyeildingstamina", 6, 1, 1, NULL),
(34297, @tree_id + 26, "Improved Leader of the Pack", "spell_nature_unyeildingstamina", 6, 2, 2, 17007),
(33859, @tree_id + 26, "Predatory Instincts", "ability_druid_predatoryinstincts", 7, 2, 5, NULL),
(33917, @tree_id + 26, "Mangle", "ability_druid_mangle2", 8, 1, 1, 17007),
-- restoration
(17050, @tree_id + 27, "Improved Mark of the Wild", "spell_nature_regeneration", 0, 1, 5, NULL),
(17056, @tree_id + 27, "Furor", "spell_holy_blessingofstamina", 0, 2, 5, NULL),
(17069, @tree_id + 27, "Naturalist", "spell_nature_healingtouch", 1, 0, 5, NULL),
(17063, @tree_id + 27, "Nature's Focus", "spell_nature_healingwavegreater", 1, 1, 5, NULL),
(16833, @tree_id + 27, "Natural Shapeshifter", "spell_nature_wispsplode", 1, 2, 3, NULL),
(17106, @tree_id + 27, "Intensity", "spell_frost_windwalkon", 2, 0, 3, NULL),
(17118, @tree_id + 27, "Subtlety", "ability_eyeoftheowl", 2, 1, 5, NULL),
(16864, @tree_id + 27, "Omen of Clarity", "spell_nature_crystalball", 2, 2, 1, NULL),
(24968, @tree_id + 27, "Tranquil Spirit", "spell_holy_elunesgrace", 3, 1, 5, NULL),
(17111, @tree_id + 27, "Improved Rejuvenation", "spell_nature_rejuvenation", 3, 2, 3, NULL),
(17116, @tree_id + 27, "Nature's Swiftness", "spell_nature_ravenform", 4, 0, 1, 17106),
(17104, @tree_id + 27, "Gift of Nature", "spell_nature_protectionformnature", 4, 1, 5, NULL),
(17123, @tree_id + 27, "Improved Tranquility", "spell_nature_tranquility", 4, 3, 2, NULL),
(33879, @tree_id + 27, "Empowered Touch", "ability_druid_empoweredtouch", 5, 0, 2, NULL),
(17074, @tree_id + 27, "Improved Regrowth", "spell_nature_resistnature", 5, 2, 5, 17111),
(34151, @tree_id + 27, "Living Spirit", "spell_nature_giftofthewaterspirit", 6, 0, 3, NULL),
(18562, @tree_id + 27, "Swiftmend", "inv_relics_idolofrejuvenation", 6, 1, 1, 17104),
(33881, @tree_id + 27, "Natural Perfection", "ability_druid_naturalperfection", 6, 2, 3, NULL),
(33886, @tree_id + 27, "Empowered Rejuvenation", "ability_druid_empoweredrejuvination", 7, 1, 5, NULL),
(33891, @tree_id + 27, "Tree of Life", "ability_druid_treeoflife", 8, 1, 1, 33886);

INSERT INTO `tooltip` (`talent_id`, `locale`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`) VALUES
-- warrior
(12282, @locale_en,
  "Reduces the cost of your Heroic Strike ability by 1 rage point.",
  "Reduces the cost of your Heroic Strike ability by 1 rage point.",
  "Reduces the cost of your Heroic Strike ability by 1 rage point.",
  NULL,
  NULL
),

(16462, @locale_en,
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%."
),

(12286, @locale_en,
  "Increases the bleed damage done by your Rend ability by 25%.",
  "Increases the bleed damage done by your Rend ability by 25%.",
  "Increases the bleed damage done by your Rend ability by 25%.",
  NULL,
  NULL
),

(12285, @locale_en,
  "Increases the amount of rage generated by your Charge ability by 3.",
  "Increases the amount of rage generated by your Charge ability by 3.",
  NULL,
  NULL,
  NULL
),

(12300, @locale_en,
  "Increases your chance to resist Stun and Charm effects by an additional 3%.",
  "Increases your chance to resist Stun and Charm effects by an additional 3%.",
  "Increases your chance to resist Stun and Charm effects by an additional 3%.",
  "Increases your chance to resist Stun and Charm effects by an additional 3%.",
  "Increases your chance to resist Stun and Charm effects by an additional 3%."
),

(12287, @locale_en,
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 40% and the slowing effect by an additional 4%.",
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 40% and the slowing effect by an additional 4%.",
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 40% and the slowing effect by an additional 4%.",
  NULL,
  NULL
),

(12290, @locale_en,
  "Increases the critical strike chance of your Overpower ability by 25%.",
  "Increases the critical strike chance of your Overpower ability by 25%.",
  NULL,
  NULL,
  NULL
),

(12296, @locale_en,
  "Generates 1 rage per 3 seconds while in combat.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12834, @locale_en,
  "Your critical strikes cause the opponent to bleed, dealing 20% of your melee weapon's average damage over 12  sec.",
  "Your critical strikes cause the opponent to bleed, dealing 20% of your melee weapon's average damage over 12  sec.",
  "Your critical strikes cause the opponent to bleed, dealing 20% of your melee weapon's average damage over 12  sec.",
  NULL,
  NULL
),

(12163, @locale_en,
  "Increases the damage you deal with two-handed melee weapons by 1%.",
  "Increases the damage you deal with two-handed melee weapons by 1%.",
  "Increases the damage you deal with two-handed melee weapons by 1%.",
  "Increases the damage you deal with two-handed melee weapons by 1%.",
  "Increases the damage you deal with two-handed melee weapons by 1%."
),

(16493, @locale_en,
  "Increases the critical strike damage bonus of your abilities in Battle, Defensive, and Berserker stance by 10%.",
  "Increases the critical strike damage bonus of your abilities in Battle, Defensive, and Berserker stance by 10%.",
  NULL,
  NULL,
  NULL
),

(12700, @locale_en,
  "Increases your chance to get a critical strike with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike with Axes and Polearms by 1%."
),

(12292, @locale_en,
  "When activated, increases your physical damage by 20% and makes you immune to Fear effects, but increases all damage taken by 5%.  Lasts 30  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12284, @locale_en,
  "Gives your melee attacks a chance to stun your target for 3  sec and generate 7 rage when using a Mace.",
  "Gives your melee attacks a chance to stun your target for 3  sec and generate 7 rage when using a Mace.",
  "Gives your melee attacks a chance to stun your target for 3  sec and generate 7 rage when using a Mace.",
  "Gives your melee attacks a chance to stun your target for 3  sec and generate 7 rage when using a Mace.",
  "Gives your melee attacks a chance to stun your target for 3  sec and generate 7 rage when using a Mace."
),

(12281, @locale_en,
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword."
),

(29888, @locale_en,
  "Reduces the cooldown of your Intercept ability by 5 sec.",
  "Reduces the cooldown of your Intercept ability by 5 sec.",
  NULL,
  NULL,
  NULL
),

(12289, @locale_en,
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5  sec.",
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5  sec.",
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5  sec.",
  NULL,
  NULL
),

(29723, @locale_en,
  "Reduces the cooldown of your Retaliation, Recklessness and Shield Wall abilities by 4 min and increases their duration by 2 sec.",
  "Reduces the cooldown of your Retaliation, Recklessness and Shield Wall abilities by 4 min and increases their duration by 2 sec.",
  "Reduces the cooldown of your Retaliation, Recklessness and Shield Wall abilities by 4 min and increases their duration by 2 sec.",
  NULL,
  NULL
),

(29836, @locale_en,
  "Your Rend and Deep Wounds abilities also increase all physical damage caused to that target by 2%.",
  "Your Rend and Deep Wounds abilities also increase all physical damage caused to that target by 2%.",
  NULL,
  NULL,
  NULL
),

(12294, @locale_en,
  "A vicious strike that deals weapon damage plus 85 and wounds the target, reducing the effectiveness of any healing by 50% for 10  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29834, @locale_en,
  "Whenever you are struck by a Stun or Immobilize effect you will generate 95 rage and 0% of your total health over 10  sec.",
  "Whenever you are struck by a Stun or Immobilize effect you will generate 95 rage and 0% of your total health over 10  sec.",
  NULL,
  NULL,
  NULL
),

(35446, @locale_en,
  "Reduces the cooldown of your Mortal Strike ability by 0.2 sec and increases the damage it causes by 1%.",
  "Reduces the cooldown of your Mortal Strike ability by 0.2 sec and increases the damage it causes by 1%.",
  "Reduces the cooldown of your Mortal Strike ability by 0.2 sec and increases the damage it causes by 1%.",
  "Reduces the cooldown of your Mortal Strike ability by 0.2 sec and increases the damage it causes by 1%.",
  "Reduces the cooldown of your Mortal Strike ability by 0.2 sec and increases the damage it causes by 1%."
),

(29623, @locale_en,
  "You generate 25% more rage from damage dealt.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12321, @locale_en,
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 10%.",
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 10%.",
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 10%.",
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 10%.",
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 10%."
),

(12320, @locale_en,
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%."
),

(12324, @locale_en,
  "Increases the melee attack power reduction of your Demoralizing Shout by 8%.",
  "Increases the melee attack power reduction of your Demoralizing Shout by 8%.",
  "Increases the melee attack power reduction of your Demoralizing Shout by 8%.",
  "Increases the melee attack power reduction of your Demoralizing Shout by 8%.",
  "Increases the melee attack power reduction of your Demoralizing Shout by 8%."
),

(12322, @locale_en,
  "Gives you a chance to generate an additional rage point when you deal melee damage with a weapon.",
  "Gives you a chance to generate an additional rage point when you deal melee damage with a weapon.",
  "Gives you a chance to generate an additional rage point when you deal melee damage with a weapon.",
  "Gives you a chance to generate an additional rage point when you deal melee damage with a weapon.",
  "Gives you a chance to generate an additional rage point when you deal melee damage with a weapon."
),

(12329, @locale_en,
  "Increases the bonus damage done by your Cleave ability by 40%.",
  "Increases the bonus damage done by your Cleave ability by 40%.",
  "Increases the bonus damage done by your Cleave ability by 40%.",
  NULL,
  NULL
),

(12323, @locale_en,
  "Causes all enemies within 10 yards to be Dazed, reducing movement speed by 50% for 6  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16487, @locale_en,
  "Regenerates 0% of your total Health over 6  sec after being the victim of a critical strike.",
  "Regenerates 0% of your total Health over 6  sec after being the victim of a critical strike.",
  "Regenerates 0% of your total Health over 6  sec after being the victim of a critical strike.",
  NULL,
  NULL
),

(12318, @locale_en,
  "Increases the melee attack power bonus of your Battle Shout and the health bonus of your Commanding Shout by 5%.",
  "Increases the melee attack power bonus of your Battle Shout and the health bonus of your Commanding Shout by 5%.",
  "Increases the melee attack power bonus of your Battle Shout and the health bonus of your Commanding Shout by 5%.",
  "Increases the melee attack power bonus of your Battle Shout and the health bonus of your Commanding Shout by 5%.",
  "Increases the melee attack power bonus of your Battle Shout and the health bonus of your Commanding Shout by 5%."
),

(23584, @locale_en,
  "Increases the damage done by your offhand weapon by 5%.",
  "Increases the damage done by your offhand weapon by 5%.",
  "Increases the damage done by your offhand weapon by 5%.",
  "Increases the damage done by your offhand weapon by 5%.",
  "Increases the damage done by your offhand weapon by 5%."
),

(20502, @locale_en,
  "Reduces the rage cost of your Execute ability by 2.",
  "Reduces the rage cost of your Execute ability by 2.",
  NULL,
  NULL,
  NULL
),

(12317, @locale_en,
  "Gives you a 5% melee damage bonus for 12  sec up to a maximum of 12 swings after being the victim of a critical strike.",
  "Gives you a 5% melee damage bonus for 12  sec up to a maximum of 12 swings after being the victim of a critical strike.",
  "Gives you a 5% melee damage bonus for 12  sec up to a maximum of 12 swings after being the victim of a critical strike.",
  "Gives you a 5% melee damage bonus for 12  sec up to a maximum of 12 swings after being the victim of a critical strike.",
  "Gives you a 5% melee damage bonus for 12  sec up to a maximum of 12 swings after being the victim of a critical strike."
),

(12862, @locale_en,
  "Decreases the casting time of your Slam ability by 0.5 sec.",
  "Decreases the casting time of your Slam ability by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(12328, @locale_en,
  "Your next 10 melee attacks strike an additional nearby opponent.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20504, @locale_en,
  "Reduces the chance for your attacks to be dodged by 1% and reduces the duration of all Disarm effects used against you by 25%.  This does not stack with other Disarm duration reducing effects.",
  "Reduces the chance for your attacks to be dodged by 1% and reduces the duration of all Disarm effects used against you by 25%.  This does not stack with other Disarm duration reducing effects.",
  NULL,
  NULL,
  NULL
),

(20500, @locale_en,
  "The Berserker Rage ability will generate 5 rage when used.",
  "The Berserker Rage ability will generate 5 rage when used.",
  NULL,
  NULL,
  NULL
),

(12319, @locale_en,
  "Increases your attack speed by 5% for your next 3 swings after dealing a melee critical strike.",
  "Increases your attack speed by 5% for your next 3 swings after dealing a melee critical strike.",
  "Increases your attack speed by 5% for your next 3 swings after dealing a melee critical strike.",
  "Increases your attack speed by 5% for your next 3 swings after dealing a melee critical strike.",
  "Increases your attack speed by 5% for your next 3 swings after dealing a melee critical strike."
),

(29590, @locale_en,
  "Increases your chance to hit with melee weapons by 1%.",
  "Increases your chance to hit with melee weapons by 1%.",
  "Increases your chance to hit with melee weapons by 1%.",
  NULL,
  NULL
),

(23881, @locale_en,
  "Instantly attack the target causing  damage.  In addition, the next 5 successful melee attacks will restore 10 health.  This effect lasts 8  sec.  Damage is based on your attack power.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29721, @locale_en,
  "Reduces the cooldown of your Whirlwind ability by 1 sec.",
  "Reduces the cooldown of your Whirlwind ability by 1 sec.",
  NULL,
  NULL,
  NULL
),

(29759, @locale_en,
  "Increases attack power by 2% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases attack power by 2% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases attack power by 2% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases attack power by 2% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases attack power by 2% and reduces threat caused by 2% while in Berserker Stance."
),

(29801, @locale_en,
  "Warrior goes on a rampage, increasing attack power by 30 and causing most successful melee attacks to increase attack power by an additional 30.  This effect will stack up to 5 times.  Lasts 30  sec.  This ability can only be used after scoring a critical hit.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12301, @locale_en,
  "Increases the instant rage generated by your Bloodrage ability by 3.",
  "Increases the instant rage generated by your Bloodrage ability by 3.",
  NULL,
  NULL,
  NULL
),

(12295, @locale_en,
  "You retain up to an additional 5 of your rage points when you change stances.  Also greatly increases the threat generated by your Bloodthirst and Mortal Strike abilities when you are in Defensive Stance.",
  "You retain up to an additional 5 of your rage points when you change stances.  Also greatly increases the threat generated by your Bloodthirst and Mortal Strike abilities when you are in Defensive Stance.",
  "You retain up to an additional 5 of your rage points when you change stances.  Also greatly increases the threat generated by your Bloodthirst and Mortal Strike abilities when you are in Defensive Stance.",
  NULL,
  NULL
),

(12297, @locale_en,
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4."
),

(12298, @locale_en,
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 1 rage when a block occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 1 rage when a block occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 1 rage when a block occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 1 rage when a block occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 1 rage when a block occurs."
),

(12299, @locale_en,
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%."
),

(12975, @locale_en,
  "When activated, this ability temporarily grants you 30% of your maximum health for 20  sec.  After the effect expires, the health is lost.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12945, @locale_en,
  "Allows your Shield Block ability to block an additional attack and increases the duration by 1 second.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12797, @locale_en,
  "Gives your Revenge ability a 15% chance to stun the target for 3  sec.",
  "Gives your Revenge ability a 15% chance to stun the target for 3  sec.",
  "Gives your Revenge ability a 15% chance to stun the target for 3  sec.",
  NULL,
  NULL
),

(12303, @locale_en,
  "Increases the threat generated by your attacks by 5% while in Defensive Stance and increases your expertise by 2.",
  "Increases the threat generated by your attacks by 5% while in Defensive Stance and increases your expertise by 2.",
  "Increases the threat generated by your attacks by 5% while in Defensive Stance and increases your expertise by 2.",
  NULL,
  NULL
),

(12308, @locale_en,
  "Reduces the cost of your Sunder Armor and Devastate abilities by 1 rage point.",
  "Reduces the cost of your Sunder Armor and Devastate abilities by 1 rage point.",
  "Reduces the cost of your Sunder Armor and Devastate abilities by 1 rage point.",
  NULL,
  NULL
),

(12313, @locale_en,
  "Increases the duration of your Disarm ability by 1 secs.",
  "Increases the duration of your Disarm ability by 1 secs.",
  "Increases the duration of your Disarm ability by 1 secs.",
  NULL,
  NULL
),

(12302, @locale_en,
  "Reduces the cooldown of your Taunt ability by 1 sec.",
  "Reduces the cooldown of your Taunt ability by 1 sec.",
  NULL,
  NULL,
  NULL
),

(12312, @locale_en,
  "Increases the effect duration of your Shield Wall ability by 3 secs.",
  "Increases the effect duration of your Shield Wall ability by 3 secs.",
  NULL,
  NULL,
  NULL
),

(12809, @locale_en,
  "Stuns the opponent for 5  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12311, @locale_en,
  "Gives your Shield Bash ability a 50% chance to silence the target for 3  sec.",
  "Gives your Shield Bash ability a 50% chance to silence the target for 3  sec.",
  NULL,
  NULL,
  NULL
),

(29598, @locale_en,
  "Increases the amount of damage absorbed by your shield by 10%.",
  "Increases the amount of damage absorbed by your shield by 10%.",
  "Increases the amount of damage absorbed by your shield by 10%.",
  NULL,
  NULL
),

(16538, @locale_en,
  "Increases physical damage you deal when a one-handed melee weapon is equipped by 2%.",
  "Increases physical damage you deal when a one-handed melee weapon is equipped by 2%.",
  "Increases physical damage you deal when a one-handed melee weapon is equipped by 2%.",
  "Increases physical damage you deal when a one-handed melee weapon is equipped by 2%.",
  "Increases physical damage you deal when a one-handed melee weapon is equipped by 2%."
),

(29593, @locale_en,
  "Reduces all spell damage taken while in Defensive Stance by 2%.",
  "Reduces all spell damage taken while in Defensive Stance by 2%.",
  "Reduces all spell damage taken while in Defensive Stance by 2%.",
  NULL,
  NULL
),

(23922, @locale_en,
  "Slam the target with your shield, causing 225 to 235 damage, modified by your shield block value, and dispels 1 magic effect on the target.  Also causes a high amount of threat.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29787, @locale_en,
  "Reduces the rage cost of your offensive abilities by 1.",
  "Reduces the rage cost of your offensive abilities by 1.",
  "Reduces the rage cost of your offensive abilities by 1.",
  NULL,
  NULL
),

(29140, @locale_en,
  "Increases your total Stamina by 1% and your total Strength by 2%.",
  "Increases your total Stamina by 1% and your total Strength by 2%.",
  "Increases your total Stamina by 1% and your total Strength by 2%.",
  "Increases your total Stamina by 1% and your total Strength by 2%.",
  "Increases your total Stamina by 1% and your total Strength by 2%."
),

(20243, @locale_en,
  "Sunder the target's armor causing the Sunder Armor effect.  In addition, causes 50% of weapon damage plus 15 for each application of Sunder Armor on the target.  The Sunder Armor effect can stack up to 5 times.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- paladin
(20262, @locale_en,
  "Increases your total Strength by 2%.",
  "Increases your total Strength by 2%.",
  "Increases your total Strength by 2%.",
  "Increases your total Strength by 2%.",
  "Increases your total Strength by 2%."
),

(20257, @locale_en,
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%."
),

(20205, @locale_en,
  "Gives your Flash of Light and Holy Light spells a 14% chance to not lose casting time when you take damage.",
  "Gives your Flash of Light and Holy Light spells a 14% chance to not lose casting time when you take damage.",
  "Gives your Flash of Light and Holy Light spells a 14% chance to not lose casting time when you take damage.",
  "Gives your Flash of Light and Holy Light spells a 14% chance to not lose casting time when you take damage.",
  "Gives your Flash of Light and Holy Light spells a 14% chance to not lose casting time when you take damage."
),

(20224, @locale_en,
  "Increases the damage done by your Seal of Righteousness and Judgement of Righteousness by 3%.",
  "Increases the damage done by your Seal of Righteousness and Judgement of Righteousness by 3%.",
  "Increases the damage done by your Seal of Righteousness and Judgement of Righteousness by 3%.",
  "Increases the damage done by your Seal of Righteousness and Judgement of Righteousness by 3%.",
  "Increases the damage done by your Seal of Righteousness and Judgement of Righteousness by 3%."
),

(20237, @locale_en,
  "Increases the amount healed by your Holy Light and Flash of Light spells by 4%.",
  "Increases the amount healed by your Holy Light and Flash of Light spells by 4%.",
  "Increases the amount healed by your Holy Light and Flash of Light spells by 4%.",
  NULL,
  NULL
),

(31821, @locale_en,
  "Increases the radius of your Auras to 40 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20234, @locale_en,
  "Gives the target of your Lay on Hands spell a 15% bonus to their armor value from items for 2  mins.  In addition, the cooldown for your Lay on Hands spell is reduced by 10 min.",
  "Gives the target of your Lay on Hands spell a 15% bonus to their armor value from items for 2  mins.  In addition, the cooldown for your Lay on Hands spell is reduced by 10 min.",
  NULL,
  NULL,
  NULL
),

(9453, @locale_en,
  "Increases your chance to resist Fear and Disorient effects by an additional 5%.",
  "Increases your chance to resist Fear and Disorient effects by an additional 5%.",
  NULL,
  NULL,
  NULL
),

(20210, @locale_en,
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell, gives you a 20% chance to gain mana equal to 60% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell, gives you a 20% chance to gain mana equal to 60% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell, gives you a 20% chance to gain mana equal to 60% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell, gives you a 20% chance to gain mana equal to 60% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell, gives you a 20% chance to gain mana equal to 60% of the base cost of the spell."
),

(20244, @locale_en,
  "Increases the effect of your Blessing of Wisdom spell by 10%.",
  "Increases the effect of your Blessing of Wisdom spell by 10%.",
  NULL,
  NULL,
  NULL
),

(31822, @locale_en,
  "Increases your resistance to Curse and Disease effects by 5%.",
  "Increases your resistance to Curse and Disease effects by 5%.",
  "Increases your resistance to Curse and Disease effects by 5%.",
  NULL,
  NULL
),

(20216, @locale_en,
  "When activated, gives your next Flash of Light, Holy Light, or Holy Shock spell a 100% critical effect chance.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20359, @locale_en,
  "Increases the critical effect chance of your Holy Light spell by 2%.",
  "Increases the critical effect chance of your Holy Light spell by 2%.",
  "Increases the critical effect chance of your Holy Light spell by 2%.",
  NULL,
  NULL
),

(31825, @locale_en,
  "Reduces the mana cost of your Cleanse, Purify and Consecration spells by 5% and increases the critical strike chance of your Exorcism and Holy Wrath spells by 10%.",
  "Reduces the mana cost of your Cleanse, Purify and Consecration spells by 5% and increases the critical strike chance of your Exorcism and Holy Wrath spells by 10%.",
  NULL,
  NULL,
  NULL
),

(5923, @locale_en,
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%."
),

(31833, @locale_en,
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15  sec.",
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15  sec.",
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15  sec.",
  NULL,
  NULL
),

(20473, @locale_en,
  "Blasts the target with Holy energy, causing 277 to 299 Holy damage to an enemy, or 351 to 379 healing to an ally.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31828, @locale_en,
  "All attacks against you have a 4% chance to cause half damage.",
  "All attacks against you have a 4% chance to cause half damage.",
  "All attacks against you have a 4% chance to cause half damage.",
  NULL,
  NULL
),

(31837, @locale_en,
  "Increases your spell damage and healing by 7% of your total Intellect.",
  "Increases your spell damage and healing by 7% of your total Intellect.",
  "Increases your spell damage and healing by 7% of your total Intellect.",
  "Increases your spell damage and healing by 7% of your total Intellect.",
  "Increases your spell damage and healing by 7% of your total Intellect."
),

(31842, @locale_en,
  "Reduces the mana cost of all spells by 50% for 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20138, @locale_en,
  "Increases the armor bonus of your Devotion Aura by 8%.",
  "Increases the armor bonus of your Devotion Aura by 8%.",
  "Increases the armor bonus of your Devotion Aura by 8%.",
  "Increases the armor bonus of your Devotion Aura by 8%.",
  "Increases the armor bonus of your Devotion Aura by 8%."
),

(20127, @locale_en,
  "Damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 6%.  Lasts 10  sec or 5 blocks.",
  "Damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 6%.  Lasts 10  sec or 5 blocks.",
  "Damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 6%.  Lasts 10  sec or 5 blocks.",
  "Damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 6%.  Lasts 10  sec or 5 blocks.",
  "Damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 6%.  Lasts 10  sec or 5 blocks."
),

(20189, @locale_en,
  "Increases your chance to hit with melee weapons and spells by 1%.",
  "Increases your chance to hit with melee weapons and spells by 1%.",
  "Increases your chance to hit with melee weapons and spells by 1%.",
  NULL,
  NULL
),

(20174, @locale_en,
  "Reduces the cooldown of your Blessing of Protection by 60 sec and increases the duration of your Blessing of Freedom by 2 sec.",
  "Reduces the cooldown of your Blessing of Protection by 60 sec and increases the duration of your Blessing of Freedom by 2 sec.",
  NULL,
  NULL,
  NULL
),

(20143, @locale_en,
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%.",
  "Increases your armor value from items by 2%."
),

(20217, @locale_en,
  "Places a Blessing on the friendly target, increasing total stats by 10% for 10  mins.  Players may only have one Blessing on them per Paladin at any one time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20468, @locale_en,
  "While Righteous Fury is active, all damage taken is reduced by 2% and increases the amount of threat generated by your Righteous Fury spell by 16%.",
  "While Righteous Fury is active, all damage taken is reduced by 2% and increases the amount of threat generated by your Righteous Fury spell by 16%.",
  "While Righteous Fury is active, all damage taken is reduced by 2% and increases the amount of threat generated by your Righteous Fury spell by 16%.",
  NULL,
  NULL
),

(20148, @locale_en,
  "Increases the amount of damage absorbed by your shield by 10%.",
  "Increases the amount of damage absorbed by your shield by 10%.",
  "Increases the amount of damage absorbed by your shield by 10%.",
  NULL,
  NULL
),

(20096, @locale_en,
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4.",
  "Increases your Defense skill by 4."
),

(31844, @locale_en,
  "Increases your resistance to Stun effects by an additional 5% and reduces the chance your spells will be dispelled by an additional 15%.",
  "Increases your resistance to Stun effects by an additional 5% and reduces the chance your spells will be dispelled by an additional 15%.",
  NULL,
  NULL,
  NULL
),

(20487, @locale_en,
  "Decreases the cooldown of your Hammer of Justice spell by 5 sec.",
  "Decreases the cooldown of your Hammer of Justice spell by 5 sec.",
  "Decreases the cooldown of your Hammer of Justice spell by 5 sec.",
  NULL,
  NULL
),

(20254, @locale_en,
  "Increases the effect of your Concentration Aura by an additional 5% and reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  "Increases the effect of your Concentration Aura by an additional 5% and reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  "Increases the effect of your Concentration Aura by an additional 5% and reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  NULL,
  NULL
),

(31846, @locale_en,
  "All spell damage taken is reduced by 2%.",
  "All spell damage taken is reduced by 2%.",
  NULL,
  NULL,
  NULL
),

(20911, @locale_en,
  "Places a Blessing on the friendly target, reducing damage dealt from all sources by up to 10 for 10  mins.  In addition, when the target blocks a melee attack the attacker will take 14 Holy damage.  Players may only have one Blessing on them per Paladin at any one time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20177, @locale_en,
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8  sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8  sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8  sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8  sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8  sec will generate an additional attack."
),

(31848, @locale_en,
  "Increases your total Stamina by 3%, reduces the cooldown of your Divine Shield spell by 30 sec and reduces the attack speed penalty by 50%.",
  "Increases your total Stamina by 3%, reduces the cooldown of your Divine Shield spell by 30 sec and reduces the attack speed penalty by 50%.",
  NULL,
  NULL,
  NULL
),

(20196, @locale_en,
  "Increases all damage you deal when a one-handed melee weapon is equipped by 1%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 1%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 1%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 1%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 1%."
),

(41021, @locale_en,
  "Increases damage caused by your Holy Shield by 10% and increases the number of charges of your Holy Shield by 2.",
  "Increases damage caused by your Holy Shield by 10% and increases the number of charges of your Holy Shield by 2.",
  NULL,
  NULL,
  NULL
),

(20925, @locale_en,
  "Increases chance to block by 30% for 10  sec and deals 59 Holy damage for each attack blocked while active.  Damage caused by Holy Shield causes 35% additional threat.  Each block expends a charge.  4 charges.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31850, @locale_en,
  "When you have less than 35% health, all damage taken is reduced by 6%.",
  "When you have less than 35% health, all damage taken is reduced by 6%.",
  "When you have less than 35% health, all damage taken is reduced by 6%.",
  "When you have less than 35% health, all damage taken is reduced by 6%.",
  "When you have less than 35% health, all damage taken is reduced by 6%."
),

(31858, @locale_en,
  "Increases your expertise by 1 and your total Stamina by 2%.",
  "Increases your expertise by 1 and your total Stamina by 2%.",
  "Increases your expertise by 1 and your total Stamina by 2%.",
  "Increases your expertise by 1 and your total Stamina by 2%.",
  "Increases your expertise by 1 and your total Stamina by 2%."
),

(31935, @locale_en,
  "Hurls a holy shield at the enemy, dealing 270 to 330 Holy damage, Dazing them and then jumping to additional nearby enemies.  Affects 3 total targets.  Lasts 6  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20042, @locale_en,
  "Increases the attack power bonus of your Blessing of Might by 4%.",
  "Increases the attack power bonus of your Blessing of Might by 4%.",
  "Increases the attack power bonus of your Blessing of Might by 4%.",
  "Increases the attack power bonus of your Blessing of Might by 4%.",
  "Increases the attack power bonus of your Blessing of Might by 4%."
),

(20101, @locale_en,
  "Reduces the mana cost of your Judgement and Seal spells by 3%.",
  "Reduces the mana cost of your Judgement and Seal spells by 3%.",
  "Reduces the mana cost of your Judgement and Seal spells by 3%.",
  "Reduces the mana cost of your Judgement and Seal spells by 3%.",
  "Reduces the mana cost of your Judgement and Seal spells by 3%."
),

(25956, @locale_en,
  "Decreases the cooldown of your Judgement spell by 1 sec.",
  "Decreases the cooldown of your Judgement spell by 1 sec.",
  NULL,
  NULL,
  NULL
),

(20335, @locale_en,
  "In addition to the normal effect, your Judgement of the Crusader spell will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  "In addition to the normal effect, your Judgement of the Crusader spell will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  "In addition to the normal effect, your Judgement of the Crusader spell will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  NULL,
  NULL
),

(20060, @locale_en,
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%."
),

(9452, @locale_en,
  "Gives the Paladin's damaging melee attacks a chance to reduce the target's attributes by 5% for 15  sec.",
  "Gives the Paladin's damaging melee attacks a chance to reduce the target's attributes by 5% for 15  sec.",
  "Gives the Paladin's damaging melee attacks a chance to reduce the target's attributes by 5% for 15  sec.",
  NULL,
  NULL
),

(20117, @locale_en,
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%.",
  "Increases your chance to get a critical strike with melee weapons by 1%."
),

(20375, @locale_en,
  "Gives the Paladin a chance to deal additional Holy damage equal to 70% of normal weapon damage.  Only one Seal can be active on the Paladin at any one time.  Lasts 30  sec.<br /><br />Unleashing this Seal's energy will judge an enemy, instantly causing 46.5 to 50.5 Holy damage, 93 to 101 if the target is stunned or incapacitated.",
  NULL,
  NULL,
  NULL,
  NULL
),

(26022, @locale_en,
  "Reduces the chance you'll be hit by spells by 1% and increases movement and mounted movement speed by 5%.  This does not stack with other movement speed increasing effects.",
  "Reduces the chance you'll be hit by spells by 1% and increases movement and mounted movement speed by 5%.  This does not stack with other movement speed increasing effects.",
  "Reduces the chance you'll be hit by spells by 1% and increases movement and mounted movement speed by 5%.  This does not stack with other movement speed increasing effects.",
  NULL,
  NULL
),

(9799, @locale_en,
  "All spell criticals against you cause 15% of the damage taken to the caster as well.  The damage caused by Eye for an Eye will not exceed 50% of the Paladin's total health.",
  "All spell criticals against you cause 15% of the damage taken to the caster as well.  The damage caused by Eye for an Eye will not exceed 50% of the Paladin's total health.",
  NULL,
  NULL,
  NULL
),

(20091, @locale_en,
  "Increases the damage done by your Retribution Aura by 25%.",
  "Increases the damage done by your Retribution Aura by 25%.",
  NULL,
  NULL,
  NULL
),

(31866, @locale_en,
  "Increases all damage caused against Humanoids, Demons, Undead and Elementals by 1%.",
  "Increases all damage caused against Humanoids, Demons, Undead and Elementals by 1%.",
  "Increases all damage caused against Humanoids, Demons, Undead and Elementals by 1%.",
  NULL,
  NULL
),

(20111, @locale_en,
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  NULL,
  NULL
),

(20218, @locale_en,
  "Increases Holy damage done by party members within 30 yards by 10%.  Players may only have one Aura on them per Paladin at any one time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31869, @locale_en,
  "The amount of damage caused by targets affected by Sanctity Aura is increased by 1%.",
  "The amount of damage caused by targets affected by Sanctity Aura is increased by 1%.",
  NULL,
  NULL,
  NULL
),

(20049, @locale_en,
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30  sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30  sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30  sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30  sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30  sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times."
),

(31876, @locale_en,
  "Gives your Judgement spell a 33% chance to return 80% of the mana cost of the judged seal.",
  "Gives your Judgement spell a 33% chance to return 80% of the mana cost of the judged seal.",
  "Gives your Judgement spell a 33% chance to return 80% of the mana cost of the judged seal.",
  NULL,
  NULL
),

(32043, @locale_en,
  "Increases your chance to critically hit with all spells and melee attacks by 1% and reduces the chance your Seals will be dispelled by 33%.",
  "Increases your chance to critically hit with all spells and melee attacks by 1% and reduces the chance your Seals will be dispelled by 33%.",
  "Increases your chance to critically hit with all spells and melee attacks by 1% and reduces the chance your Seals will be dispelled by 33%.",
  NULL,
  NULL
),

(20066, @locale_en,
  "Puts the enemy target in a state of meditation, incapacitating them for up to 6  sec.  Any damage caused will awaken the target.  Only works against Humanoids.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31871, @locale_en,
  "Melee and ranged critical strikes against you cause 4% less damage.",
  "Melee and ranged critical strikes against you cause 4% less damage.",
  "Melee and ranged critical strikes against you cause 4% less damage.",
  NULL,
  NULL
),

(31879, @locale_en,
  "Increases the critical strike chance of all Judgements capable of a critical hit by 3% and reduces threat caused by all actions by 6% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 3% and reduces threat caused by all actions by 6% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 3% and reduces threat caused by all actions by 6% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 3% and reduces threat caused by all actions by 6% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 3% and reduces threat caused by all actions by 6% except when under the effects of Righteous Fury."
),

(35395, @locale_en,
  "An instant strike that causes 110% weapon damage and refreshes all Judgements on the target.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- hunter¨
(19552, @locale_en,
  "While Aspect of the Hawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12  sec.",
  "While Aspect of the Hawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12  sec.",
  "While Aspect of the Hawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12  sec.",
  "While Aspect of the Hawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12  sec.",
  "While Aspect of the Hawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12  sec."
),

(19583, @locale_en,
  "Increases the Health of your pet by 2% and your total health by 1%.",
  "Increases the Health of your pet by 2% and your total health by 1%.",
  "Increases the Health of your pet by 2% and your total health by 1%.",
  "Increases the Health of your pet by 2% and your total health by 1%.",
  "Increases the Health of your pet by 2% and your total health by 1%."
),

(35029, @locale_en,
  "All damage caused by you is increased by 1% while your pet is active and the critical strike chance of your Kill Command ability is increased by 10%.",
  "All damage caused by you is increased by 1% while your pet is active and the critical strike chance of your Kill Command ability is increased by 10%.",
  NULL,
  NULL,
  NULL
),

(19549, @locale_en,
  "Increases the Dodge bonus of your Aspect of the Monkey by 2%.",
  "Increases the Dodge bonus of your Aspect of the Monkey by 2%.",
  "Increases the Dodge bonus of your Aspect of the Monkey by 2%.",
  NULL,
  NULL
),

(19609, @locale_en,
  "Increases the armor rating of your pets by 7% and your armor contribution from items by 4%.",
  "Increases the armor rating of your pets by 7% and your armor contribution from items by 4%.",
  "Increases the armor rating of your pets by 7% and your armor contribution from items by 4%.",
  NULL,
  NULL
),

(24443, @locale_en,
  "Revive Pet's casting time is reduced by 3 sec, mana cost is reduced by 20%, and increases the health your pet returns with by an additional 15%.",
  "Revive Pet's casting time is reduced by 3 sec, mana cost is reduced by 20%, and increases the health your pet returns with by an additional 15%.",
  NULL,
  NULL,
  NULL
),

(19559, @locale_en,
  "Increases the speed bonus of your Aspect of the Cheetah and Aspect of the Pack by 4%.",
  "Increases the speed bonus of your Aspect of the Cheetah and Aspect of the Pack by 4%.",
  NULL,
  NULL,
  NULL
),

(19596, @locale_en,
  "Increases the outdoor movement speed of your pets by 30%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19616, @locale_en,
  "Increases the damage done by your pets by 4%.",
  "Increases the damage done by your pets by 4%.",
  "Increases the damage done by your pets by 4%.",
  "Increases the damage done by your pets by 4%.",
  "Increases the damage done by your pets by 4%."
),

(19572, @locale_en,
  "Reduces the mana cost of your Mend Pet spell by 10% and gives the Mend Pet spell a 25% chance of cleansing 1 Curse, Disease, Magic or Poison effect from the pet each tick.",
  "Reduces the mana cost of your Mend Pet spell by 10% and gives the Mend Pet spell a 25% chance of cleansing 1 Curse, Disease, Magic or Poison effect from the pet each tick.",
  NULL,
  NULL,
  NULL
),

(19598, @locale_en,
  "Increases the critical strike chance of your pet by 2%.",
  "Increases the critical strike chance of your pet by 2%.",
  "Increases the critical strike chance of your pet by 2%.",
  "Increases the critical strike chance of your pet by 2%.",
  "Increases the critical strike chance of your pet by 2%."
),

(19578, @locale_en,
  "While your pet is active, you and your pet will regenerate 1% of total health every 10 sec.",
  "While your pet is active, you and your pet will regenerate 1% of total health every 10 sec.",
  NULL,
  NULL,
  NULL
),

(19577, @locale_en,
  "Command your pet to intimidate the target on the next successful melee attack, causing a high amount of threat and stunning the target for 3  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19590, @locale_en,
  "Increases the Focus regeneration of your pets by 50%.",
  "Increases the Focus regeneration of your pets by 50%.",
  NULL,
  NULL,
  NULL
),

(34453, @locale_en,
  "Increases your speed while mounted by 4% and your pet's chance to hit by 2%.  The mounted movement speed increase does not stack with other effects.",
  "Increases your speed while mounted by 4% and your pet's chance to hit by 2%.  The mounted movement speed increase does not stack with other effects.",
  NULL,
  NULL,
  NULL
),

(19621, @locale_en,
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8  sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8  sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8  sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8  sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8  sec after dealing a critical strike."
),

(34455, @locale_en,
  "When your pet scores a critical hit, all party members have all damage increased by 1% for 10  sec.",
  "When your pet scores a critical hit, all party members have all damage increased by 1% for 10  sec.",
  "When your pet scores a critical hit, all party members have all damage increased by 1% for 10  sec.",
  NULL,
  NULL
),

(19574, @locale_en,
  "Send your pet into a rage causing 50% additional damage for 18  sec.  While enraged, the beast does not feel pity or remorse or fear and it cannot be stopped unless killed.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34462, @locale_en,
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%.",
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%.",
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%.",
  NULL,
  NULL
),

(34466, @locale_en,
  "Increases ranged combat attack speed by 4% and your pet's melee attack speed by 4%.",
  "Increases ranged combat attack speed by 4% and your pet's melee attack speed by 4%.",
  "Increases ranged combat attack speed by 4% and your pet's melee attack speed by 4%.",
  "Increases ranged combat attack speed by 4% and your pet's melee attack speed by 4%.",
  "Increases ranged combat attack speed by 4% and your pet's melee attack speed by 4%."
),

(34692, @locale_en,
  "When your pet is under the effects of Bestial Wrath, you also go into a rage causing 10% additional damage and reducing mana costs of all spells by 20% for 18  sec.  While enraged, you do not feel pity or remorse or fear and you cannot be stopped unless killed.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19407, @locale_en,
  "Gives your Concussive Shot a 4% chance to stun the target for 3  sec.",
  "Gives your Concussive Shot a 4% chance to stun the target for 3  sec.",
  "Gives your Concussive Shot a 4% chance to stun the target for 3  sec.",
  "Gives your Concussive Shot a 4% chance to stun the target for 3  sec.",
  "Gives your Concussive Shot a 4% chance to stun the target for 3  sec."
),

(19426, @locale_en,
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%."
),

(19421, @locale_en,
  "Causes 20% of your Hunter's Mark ability's base attack power to apply to melee attack power as well.",
  "Causes 20% of your Hunter's Mark ability's base attack power to apply to melee attack power as well.",
  "Causes 20% of your Hunter's Mark ability's base attack power to apply to melee attack power as well.",
  "Causes 20% of your Hunter's Mark ability's base attack power to apply to melee attack power as well.",
  "Causes 20% of your Hunter's Mark ability's base attack power to apply to melee attack power as well."
),

(19416, @locale_en,
  "Reduces the Mana cost of your Shots and Stings by 2%.",
  "Reduces the Mana cost of your Shots and Stings by 2%.",
  "Reduces the Mana cost of your Shots and Stings by 2%.",
  "Reduces the Mana cost of your Shots and Stings by 2%.",
  "Reduces the Mana cost of your Shots and Stings by 2%."
),

(34950, @locale_en,
  "Your ranged critical hits cause your pet to generate 25 Focus.",
  "Your ranged critical hits cause your pet to generate 25 Focus.",
  NULL,
  NULL,
  NULL
),

(19454, @locale_en,
  "Reduces the cooldown of your Arcane Shot by 0.2 sec.",
  "Reduces the cooldown of your Arcane Shot by 0.2 sec.",
  "Reduces the cooldown of your Arcane Shot by 0.2 sec.",
  "Reduces the cooldown of your Arcane Shot by 0.2 sec.",
  "Reduces the cooldown of your Arcane Shot by 0.2 sec."
),

(19434, @locale_en,
  "An aimed shot that increases ranged damage by 70 and reduces healing done to that target by 50%.  Lasts 10  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34948, @locale_en,
  "Reduces the cooldown of your Rapid Fire ability by 1 min.  In addition, after killing an opponent that yields experience or honor, your next Aimed Shot, Arcane Shot or Auto Shot causes 10% additional damage.  Lasts 20  sec.",
  "Reduces the cooldown of your Rapid Fire ability by 1 min.  In addition, after killing an opponent that yields experience or honor, your next Aimed Shot, Arcane Shot or Auto Shot causes 10% additional damage.  Lasts 20  sec.",
  NULL,
  NULL,
  NULL
),

(19464, @locale_en,
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 6% and the mana drained by your Viper Sting by 6%.  In addition, reduces the chance your Stings will be dispelled by 6%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 6% and the mana drained by your Viper Sting by 6%.  In addition, reduces the chance your Stings will be dispelled by 6%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 6% and the mana drained by your Viper Sting by 6%.  In addition, reduces the chance your Stings will be dispelled by 6%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 6% and the mana drained by your Viper Sting by 6%.  In addition, reduces the chance your Stings will be dispelled by 6%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 6% and the mana drained by your Viper Sting by 6%.  In addition, reduces the chance your Stings will be dispelled by 6%."
),

(19485, @locale_en,
  "Increases your ranged weapon critical strike damage bonus by 6%.",
  "Increases your ranged weapon critical strike damage bonus by 6%.",
  "Increases your ranged weapon critical strike damage bonus by 6%.",
  "Increases your ranged weapon critical strike damage bonus by 6%.",
  "Increases your ranged weapon critical strike damage bonus by 6%."
),

(35100, @locale_en,
  "Your successful Auto Shot attacks have a 2% chance to Daze the target for 4  sec.",
  "Your successful Auto Shot attacks have a 2% chance to Daze the target for 4  sec.",
  "Your successful Auto Shot attacks have a 2% chance to Daze the target for 4  sec.",
  NULL,
  NULL
),

(19503, @locale_en,
  "A short-range shot that deals 50% weapon damage and disorients the target for 4  sec.  Any damage caused will remove the effect.  Turns off your attack when used.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19461, @locale_en,
  "Increases the damage done by your Multi-Shot and Volley spells by 4%.",
  "Increases the damage done by your Multi-Shot and Volley spells by 4%.",
  "Increases the damage done by your Multi-Shot and Volley spells by 4%.",
  NULL,
  NULL
),

(34475, @locale_en,
  "Increases your total Agility by 1% and your total Intellect by 3%.",
  "Increases your total Agility by 1% and your total Intellect by 3%.",
  NULL,
  NULL,
  NULL
),

(19507, @locale_en,
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%."
),

(34482, @locale_en,
  "Increases your ranged attack power by an amount equal to 15% of your total Intellect.",
  "Increases your ranged attack power by an amount equal to 15% of your total Intellect.",
  "Increases your ranged attack power by an amount equal to 15% of your total Intellect.",
  NULL,
  NULL
),

(19506, @locale_en,
  "Increases the attack power of party members within 45 yards by 50.  Lasts until cancelled.",
  NULL,
  NULL,
  NULL,
  NULL
),

(35104, @locale_en,
  "Increases the critical strike chance of your Multi-Shot ability by 4% and gives you a 33% chance to avoid interruption caused by damage while channeling Volley.",
  "Increases the critical strike chance of your Multi-Shot ability by 4% and gives you a 33% chance to avoid interruption caused by damage while channeling Volley.",
  "Increases the critical strike chance of your Multi-Shot ability by 4% and gives you a 33% chance to avoid interruption caused by damage while channeling Volley.",
  NULL,
  NULL
),

(34485, @locale_en,
  "Increases your ranged attack power by 2%.",
  "Increases your ranged attack power by 2%.",
  "Increases your ranged attack power by 2%.",
  "Increases your ranged attack power by 2%.",
  "Increases your ranged attack power by 2%."
),

(34490, @locale_en,
  "A shot that deals 50% weapon damage and Silences the target for 3  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(24293, @locale_en,
  "Increases all damage caused against Beasts, Giants and Dragonkin targets by 1% and increases critical damage caused against Beasts, Giants and Dragonkin targets by an additional 1%.",
  "Increases all damage caused against Beasts, Giants and Dragonkin targets by 1% and increases critical damage caused against Beasts, Giants and Dragonkin targets by an additional 1%.",
  "Increases all damage caused against Beasts, Giants and Dragonkin targets by 1% and increases critical damage caused against Beasts, Giants and Dragonkin targets by an additional 1%.",
  NULL,
  NULL
),

(19151, @locale_en,
  "Increases all damage caused against Humanoid targets by 1% and increases critical damage caused against Humanoid targets by an additional 1%.",
  "Increases all damage caused against Humanoid targets by 1% and increases critical damage caused against Humanoid targets by an additional 1%.",
  "Increases all damage caused against Humanoid targets by 1% and increases critical damage caused against Humanoid targets by an additional 1%.",
  NULL,
  NULL
),

(19498, @locale_en,
  "Increases the range of your ranged weapons by 2 yards.",
  "Increases the range of your ranged weapons by 2 yards.",
  "Increases the range of your ranged weapons by 2 yards.",
  NULL,
  NULL
),

(19159, @locale_en,
  "Increases the critical strike chance of Raptor Strike and Mongoose Bite by 10%.",
  "Increases the critical strike chance of Raptor Strike and Mongoose Bite by 10%.",
  NULL,
  NULL,
  NULL
),

(19184, @locale_en,
  "Gives your Immolation Trap, Frost Trap, Explosive Trap, and Snake Trap a 8% chance to entrap the target, preventing them from moving for 4  sec.",
  "Gives your Immolation Trap, Frost Trap, Explosive Trap, and Snake Trap a 8% chance to entrap the target, preventing them from moving for 4  sec.",
  "Gives your Immolation Trap, Frost Trap, Explosive Trap, and Snake Trap a 8% chance to entrap the target, preventing them from moving for 4  sec.",
  NULL,
  NULL
),

(19295, @locale_en,
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%."
),

(19228, @locale_en,
  "Gives your Wing Clip ability a 7% chance to immobilize the target for 5  sec.",
  "Gives your Wing Clip ability a 7% chance to immobilize the target for 5  sec.",
  "Gives your Wing Clip ability a 7% chance to immobilize the target for 5  sec.",
  NULL,
  NULL
),

(19239, @locale_en,
  "Increases the duration of Freezing and Frost Trap effects by 15%, the damage of Immolation and Explosive Trap effects by 15%, and the number of snakes summoned from Snake Traps by 15%.",
  "Increases the duration of Freezing and Frost Trap effects by 15%, the damage of Immolation and Explosive Trap effects by 15%, and the number of snakes summoned from Snake Traps by 15%.",
  NULL,
  NULL,
  NULL
),

(19255, @locale_en,
  "Increases total health by 2%.",
  "Increases total health by 2%.",
  "Increases total health by 2%.",
  "Increases total health by 2%.",
  "Increases total health by 2%."
),

(19263, @locale_en,
  "When activated, increases your Dodge and Parry chance by 25% for 10  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19376, @locale_en,
  "Decreases the chance enemies will resist trap effects by 5%.",
  "Decreases the chance enemies will resist trap effects by 5%.",
  NULL,
  NULL,
  NULL
),

(19290, @locale_en,
  "Increases hit chance by 1% and increases the chance movement impairing effects will be resisted by an additional 5%.",
  "Increases hit chance by 1% and increases the chance movement impairing effects will be resisted by an additional 5%.",
  "Increases hit chance by 1% and increases the chance movement impairing effects will be resisted by an additional 5%.",
  NULL,
  NULL
),

(19286, @locale_en,
  "Reduces the chance your Feign Death ability will be resisted by 2%.",
  "Reduces the chance your Feign Death ability will be resisted by 2%.",
  NULL,
  NULL,
  NULL
),

(34494, @locale_en,
  "Reduces all damage taken by 2% and increases attack power by 2%.",
  "Reduces all damage taken by 2% and increases attack power by 2%.",
  NULL,
  NULL,
  NULL
),

(19370, @locale_en,
  "Increases your critical strike chance with all attacks by 1%.",
  "Increases your critical strike chance with all attacks by 1%.",
  "Increases your critical strike chance with all attacks by 1%.",
  NULL,
  NULL
),

(19306, @locale_en,
  "A strike that becomes active after parrying an opponent's attack.  This attack deals 40 damage and immobilizes the target for 5  sec.  Counterattack cannot be blocked, dodged, or parried.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34491, @locale_en,
  "Reduces the mana cost of all traps and melee abilities by 20% and reduces the cooldown of all traps by 2 sec.",
  "Reduces the mana cost of all traps and melee abilities by 20% and reduces the cooldown of all traps by 2 sec.",
  "Reduces the mana cost of all traps and melee abilities by 20% and reduces the cooldown of all traps by 2 sec.",
  NULL,
  NULL
),

(19168, @locale_en,
  "Increases your Agility by 3%.",
  "Increases your Agility by 3%.",
  "Increases your Agility by 3%.",
  "Increases your Agility by 3%.",
  "Increases your Agility by 3%."
),

(34497, @locale_en,
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  NULL,
  NULL
),

(19386, @locale_en,
  "A stinging shot that puts the target to sleep for 12  sec.  Any damage will cancel the effect.  When the target wakes up, the Sting causes 294 Nature damage over 12  sec.  Only one Sting per Hunter can be active on the target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34500, @locale_en,
  "Your ranged criticals have a 33% chance to apply an Expose Weakness effect to the target. Expose Weakness increases the attack power of all attackers against that target by 25% of your Agility for 7  sec.",
  "Your ranged criticals have a 33% chance to apply an Expose Weakness effect to the target. Expose Weakness increases the attack power of all attackers against that target by 25% of your Agility for 7  sec.",
  "Your ranged criticals have a 33% chance to apply an Expose Weakness effect to the target. Expose Weakness increases the attack power of all attackers against that target by 25% of your Agility for 7  sec.",
  NULL,
  NULL
),

(34506, @locale_en,
  "Your successful ranged attacks have a 6% chance to increase your critical strike chance with all attacks by 2% for 8  sec.",
  "Your successful ranged attacks have a 6% chance to increase your critical strike chance with all attacks by 2% for 8  sec.",
  "Your successful ranged attacks have a 6% chance to increase your critical strike chance with all attacks by 2% for 8  sec.",
  "Your successful ranged attacks have a 6% chance to increase your critical strike chance with all attacks by 2% for 8  sec.",
  "Your successful ranged attacks have a 6% chance to increase your critical strike chance with all attacks by 2% for 8  sec."
),

(23989, @locale_en,
  "When activated, this ability immediately finishes the cooldown on your other Hunter abilities.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- rogue
(14162, @locale_en,
  "Increases the damage done by your Eviscerate ability by 5%.",
  "Increases the damage done by your Eviscerate ability by 5%.",
  "Increases the damage done by your Eviscerate ability by 5%.",
  NULL,
  NULL
),

(14144, @locale_en,
  "After killing an opponent that yields experience or honor, gives you a 20% increased critical strike chance on your next Sinister Strike, Hemorrhage, Backstab, Mutilate, Ambush, or Ghostly Strike.  Lasts 20  sec.",
  "After killing an opponent that yields experience or honor, gives you a 20% increased critical strike chance on your next Sinister Strike, Hemorrhage, Backstab, Mutilate, Ambush, or Ghostly Strike.  Lasts 20  sec.",
  NULL,
  NULL,
  NULL
),

(14138, @locale_en,
  "Increases your critical strike chance by 1%.",
  "Increases your critical strike chance by 1%.",
  "Increases your critical strike chance by 1%.",
  "Increases your critical strike chance by 1%.",
  "Increases your critical strike chance by 1%."
),

(14156, @locale_en,
  "Gives your melee finishing moves a 20% chance to add a combo point to your target.",
  "Gives your melee finishing moves a 20% chance to add a combo point to your target.",
  "Gives your melee finishing moves a 20% chance to add a combo point to your target.",
  NULL,
  NULL
),

(14158, @locale_en,
  "Increases all damage caused against Humanoid, Giant, Beast and Dragonkin targets by 1%.",
  "Increases all damage caused against Humanoid, Giant, Beast and Dragonkin targets by 1%.",
  NULL,
  NULL,
  NULL
),

(13733, @locale_en,
  "Increases the critical strike chance of your Backstab ability by 10%, and the critical strike chance of your Mutilate ability by 5%.",
  "Increases the critical strike chance of your Backstab ability by 10%, and the critical strike chance of your Mutilate ability by 5%.",
  "Increases the critical strike chance of your Backstab ability by 10%, and the critical strike chance of your Mutilate ability by 5%.",
  NULL,
  NULL
),

(14179, @locale_en,
  "Your finishing moves have a 0% chance per combo point to restore 25 energy.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14168, @locale_en,
  "Increases the armor reduced by your Expose Armor ability by 25%.",
  "Increases the armor reduced by your Expose Armor ability by 25%.",
  NULL,
  NULL,
  NULL
),

(14128, @locale_en,
  "Increases the critical strike damage bonus of your Sinister Strike, Gouge, Backstab, Ghostly Strike, Mutilate, Shiv, and Hemorrhage abilities by 6%.",
  "Increases the critical strike damage bonus of your Sinister Strike, Gouge, Backstab, Ghostly Strike, Mutilate, Shiv, and Hemorrhage abilities by 6%.",
  "Increases the critical strike damage bonus of your Sinister Strike, Gouge, Backstab, Ghostly Strike, Mutilate, Shiv, and Hemorrhage abilities by 6%.",
  "Increases the critical strike damage bonus of your Sinister Strike, Gouge, Backstab, Ghostly Strike, Mutilate, Shiv, and Hemorrhage abilities by 6%.",
  "Increases the critical strike damage bonus of your Sinister Strike, Gouge, Backstab, Ghostly Strike, Mutilate, Shiv, and Hemorrhage abilities by 6%."
),

(16513, @locale_en,
  "Increases the damage dealt by your poisons and Envenom ability by 4% and gives your poisons an additional 8% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 4% and gives your poisons an additional 8% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 4% and gives your poisons an additional 8% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 4% and gives your poisons an additional 8% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 4% and gives your poisons an additional 8% chance to resist dispel effects."
),

(14113, @locale_en,
  "Increases the chance to apply poisons to your target by 2%.",
  "Increases the chance to apply poisons to your target by 2%.",
  "Increases the chance to apply poisons to your target by 2%.",
  "Increases the chance to apply poisons to your target by 2%.",
  "Increases the chance to apply poisons to your target by 2%."
),

(31208, @locale_en,
  "Increases your chance to resist movement impairing effects by 5% and increases your movement speed by 8%.  This does not stack with other movement speed increasing effects.",
  "Increases your chance to resist movement impairing effects by 5% and increases your movement speed by 8%.  This does not stack with other movement speed increasing effects.",
  NULL,
  NULL,
  NULL
),

(14177, @locale_en,
  "When activated, increases the critical strike chance of your next offensive ability by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14174, @locale_en,
  "While affected by your Kidney Shot ability, the target receives an additional 3% damage from all sources.",
  "While affected by your Kidney Shot ability, the target receives an additional 3% damage from all sources.",
  "While affected by your Kidney Shot ability, the target receives an additional 3% damage from all sources.",
  NULL,
  NULL
),

(31244, @locale_en,
  "All healing effects on you are increased by 10%.  In addition, your finishing moves cost 40% less Energy when they fail to hit.",
  "All healing effects on you are increased by 10%.  In addition, your finishing moves cost 40% less Energy when they fail to hit.",
  NULL,
  NULL,
  NULL
),

(14186, @locale_en,
  "Your critical strikes from abilities that add combo points have a 20% chance to add an additional combo point.",
  "Your critical strikes from abilities that add combo points have a 20% chance to add an additional combo point.",
  "Your critical strikes from abilities that add combo points have a 20% chance to add an additional combo point.",
  "Your critical strikes from abilities that add combo points have a 20% chance to add an additional combo point.",
  "Your critical strikes from abilities that add combo points have a 20% chance to add an additional combo point."
),

(31226, @locale_en,
  "Reduces the chance your poisons will be resisted by 5% and increases your chance to resist Poison effects by an additional 15%.",
  "Reduces the chance your poisons will be resisted by 5% and increases your chance to resist Poison effects by an additional 15%.",
  NULL,
  NULL,
  NULL
),

(14983, @locale_en,
  "Increases your maximum Energy by 10.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31380, @locale_en,
  "Decreases all physical damage taken by 1%.",
  "Decreases all physical damage taken by 1%.",
  "Decreases all physical damage taken by 1%.",
  "Decreases all physical damage taken by 1%.",
  "Decreases all physical damage taken by 1%."
),

(31233, @locale_en,
  "Your finishing moves increase the damage of all your offensive abilities by 2% for 10  sec.",
  "Your finishing moves increase the damage of all your offensive abilities by 2% for 10  sec.",
  "Your finishing moves increase the damage of all your offensive abilities by 2% for 10  sec.",
  "Your finishing moves increase the damage of all your offensive abilities by 2% for 10  sec.",
  "Your finishing moves increase the damage of all your offensive abilities by 2% for 10  sec."
),

(1329, @locale_en,
  "Instantly attacks with both weapons for an additional 44 with each weapon.  Damage is increased by 50% against Poisoned targets.  Must be behind the target.  Awards 2 combo points.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13741, @locale_en,
  "Increases the effect duration of your Gouge ability by 0.5 sec.",
  "Increases the effect duration of your Gouge ability by 0.5 sec.",
  "Increases the effect duration of your Gouge ability by 0.5 sec.",
  NULL,
  NULL
),

(13732, @locale_en,
  "Reduces the Energy cost of your Sinister Strike ability by 3.",
  "Reduces the Energy cost of your Sinister Strike ability by 3.",
  NULL,
  NULL,
  NULL
),

(13712, @locale_en,
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%."
),

(14165, @locale_en,
  "Increases the duration of your Slice and Dice ability by 15%.",
  "Increases the duration of your Slice and Dice ability by 15%.",
  "Increases the duration of your Slice and Dice ability by 15%.",
  NULL,
  NULL
),

(13713, @locale_en,
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%.",
  "Increases your Parry chance by 1%."
),

(13705, @locale_en,
  "Increases your chance to hit with weapons by 1%.",
  "Increases your chance to hit with weapons by 1%.",
  "Increases your chance to hit with weapons by 1%.",
  "Increases your chance to hit with weapons by 1%.",
  "Increases your chance to hit with weapons by 1%."
),

(13742, @locale_en,
  "Reduces the cooldown of your Sprint and Evasion abilities by 45 sec.",
  "Reduces the cooldown of your Sprint and Evasion abilities by 45 sec.",
  NULL,
  NULL,
  NULL
),

(14251, @locale_en,
  "A strike that becomes active after parrying an opponent's attack.  This attack deals 150% weapon damage and disarms the target for 6  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13743, @locale_en,
  "Gives a 50% chance to remove all Movement Impairing effects when you activate your Sprint ability.",
  "Gives a 50% chance to remove all Movement Impairing effects when you activate your Sprint ability.",
  NULL,
  NULL,
  NULL
),

(13754, @locale_en,
  "Gives your Kick ability a 50% chance to silence the target for 2  sec.",
  "Gives your Kick ability a 50% chance to silence the target for 2  sec.",
  NULL,
  NULL,
  NULL
),

(13706, @locale_en,
  "Increases your chance to get a critical strike with Daggers by 1%.",
  "Increases your chance to get a critical strike with Daggers by 1%.",
  "Increases your chance to get a critical strike with Daggers by 1%.",
  "Increases your chance to get a critical strike with Daggers by 1%.",
  "Increases your chance to get a critical strike with Daggers by 1%."
),

(13715, @locale_en,
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%."
),

(13709, @locale_en,
  "Increases the damage dealt by your critical strikes with maces by 1%, and gives you a 1% chance to stun your target for 3  sec with a mace.",
  "Increases the damage dealt by your critical strikes with maces by 1%, and gives you a 1% chance to stun your target for 3  sec with a mace.",
  "Increases the damage dealt by your critical strikes with maces by 1%, and gives you a 1% chance to stun your target for 3  sec with a mace.",
  "Increases the damage dealt by your critical strikes with maces by 1%, and gives you a 1% chance to stun your target for 3  sec with a mace.",
  "Increases the damage dealt by your critical strikes with maces by 1%, and gives you a 1% chance to stun your target for 3  sec with a mace."
),

(13877, @locale_en,
  "Increases your attack speed by 20%.  In addition, attacks strike an additional nearby opponent.  Lasts 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13960, @locale_en,
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword."
),

(13707, @locale_en,
  "Increases your chance to get a critical strike with Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Fist Weapons by 1%."
),

(31124, @locale_en,
  "Gives your Sinister Strike, Backstab, Gouge and Shiv abilities a 10% chance to Daze the target for 8  sec.",
  "Gives your Sinister Strike, Backstab, Gouge and Shiv abilities a 10% chance to Daze the target for 8  sec.",
  NULL,
  NULL,
  NULL
),

(30919, @locale_en,
  "Increases your expertise by 5.",
  "Increases your expertise by 5.",
  NULL,
  NULL,
  NULL
),

(18427, @locale_en,
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 2%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 2%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 2%.",
  NULL,
  NULL
),

(31122, @locale_en,
  "Increases your total Stamina by 2% and your total Agility by 1%.",
  "Increases your total Stamina by 2% and your total Agility by 1%.",
  NULL,
  NULL,
  NULL
),

(13750, @locale_en,
  "Increases your Energy regeneration rate by 100% for 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31130, @locale_en,
  "Increases your chance to resist Stun and Fear effects by an additional 5%.",
  "Increases your chance to resist Stun and Fear effects by an additional 5%.",
  NULL,
  NULL,
  NULL
),

(35541, @locale_en,
  "Gives your successful off-hand melee attacks a 20% chance to generate 3 Energy.",
  "Gives your successful off-hand melee attacks a 20% chance to generate 3 Energy.",
  "Gives your successful off-hand melee attacks a 20% chance to generate 3 Energy.",
  "Gives your successful off-hand melee attacks a 20% chance to generate 3 Energy.",
  "Gives your successful off-hand melee attacks a 20% chance to generate 3 Energy."
),

(32601, @locale_en,
  "Your finishing moves can no longer be dodged, and the damage dealt by your Sinister Strike, Backstab, Shiv and Gouge abilities is increased by 10%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13958, @locale_en,
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode."
),

(14057, @locale_en,
  "Increases the damage dealt when striking from behind with your Backstab, Mutilate, Garrote and Ambush abilities by 4%.",
  "Increases the damage dealt when striking from behind with your Backstab, Mutilate, Garrote and Ambush abilities by 4%.",
  "Increases the damage dealt when striking from behind with your Backstab, Mutilate, Garrote and Ambush abilities by 4%.",
  "Increases the damage dealt when striking from behind with your Backstab, Mutilate, Garrote and Ambush abilities by 4%.",
  "Increases the damage dealt when striking from behind with your Backstab, Mutilate, Garrote and Ambush abilities by 4%."
),

(30892, @locale_en,
  "Reduces the chance you are critically hit by melee and ranged attacks by 1% and increases the threat reduction of your Feint ability by 10%.",
  "Reduces the chance you are critically hit by melee and ranged attacks by 1% and increases the threat reduction of your Feint ability by 10%.",
  NULL,
  NULL,
  NULL
),

(14076, @locale_en,
  "Increases the range of your Blind and Sap abilities by 2 yards and reduces the energy cost of your Blind and Sap abilities by 25%.",
  "Increases the range of your Blind and Sap abilities by 2 yards and reduces the energy cost of your Blind and Sap abilities by 25%.",
  NULL,
  NULL,
  NULL
),

(13975, @locale_en,
  "Increases your speed while stealthed by 3% and reduces the cooldown of your Stealth ability by 1 sec.",
  "Increases your speed while stealthed by 3% and reduces the cooldown of your Stealth ability by 1 sec.",
  "Increases your speed while stealthed by 3% and reduces the cooldown of your Stealth ability by 1 sec.",
  "Increases your speed while stealthed by 3% and reduces the cooldown of your Stealth ability by 1 sec.",
  "Increases your speed while stealthed by 3% and reduces the cooldown of your Stealth ability by 1 sec."
),

(13976, @locale_en,
  "Gives you a 25% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  "Gives you a 25% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  "Gives you a 25% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  NULL,
  NULL
),

(14278, @locale_en,
  "A strike that deals 125% weapon damage and increases your chance to dodge by 15% for 7  sec.  Awards 1 combo point.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14079, @locale_en,
  "Increases the critical strike chance of your Ambush ability by 15%.",
  "Increases the critical strike chance of your Ambush ability by 15%.",
  "Increases the critical strike chance of your Ambush ability by 15%.",
  NULL,
  NULL
),

(13983, @locale_en,
  "Gives you a 15% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.",
  "Gives you a 15% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.",
  "Gives you a 15% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.",
  NULL,
  NULL
),

(13981, @locale_en,
  "Reduces the cooldown of your Vanish and Blind abilities by 45 sec.",
  "Reduces the cooldown of your Vanish and Blind abilities by 45 sec.",
  NULL,
  NULL,
  NULL
),

(14171, @locale_en,
  "Causes your attacks to ignore 0 of your target's Armor and increases the damage dealt by your Rupture ability by 10%.  The amount of Armor reduced increases with your level.",
  "Causes your attacks to ignore 0 of your target's Armor and increases the damage dealt by your Rupture ability by 10%.  The amount of Armor reduced increases with your level.",
  "Causes your attacks to ignore 0 of your target's Armor and increases the damage dealt by your Rupture ability by 10%.  The amount of Armor reduced increases with your level.",
  NULL,
  NULL
),

(30894, @locale_en,
  "Increases your Stealth detection and reduces the chance you are hit by spells and ranged attacks by 2%.",
  "Increases your Stealth detection and reduces the chance you are hit by spells and ranged attacks by 2%.",
  NULL,
  NULL,
  NULL
),

(14185, @locale_en,
  "When activated, this ability immediately finishes the cooldown on your Evasion, Sprint, Vanish, Cold Blood, Shadowstep and Premeditation abilities.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14082, @locale_en,
  "Reduces the Energy cost of your Cheap Shot and Garrote abilities by 10.  Additionally, your special abilities cause 10% more damage against targets below 35% health.",
  "Reduces the Energy cost of your Cheap Shot and Garrote abilities by 10.  Additionally, your special abilities cause 10% more damage against targets below 35% health.",
  NULL,
  NULL,
  NULL
),

(16511, @locale_en,
  "An instant strike that deals 110% weapon damage and causes the target to hemorrhage, increasing any Physical damage dealt to the target by up to 13.  Lasts 10 charges or 15  sec.  Awards 1 combo point.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31221, @locale_en,
  "Attacks made while stealthed and for 6 seconds after breaking stealth cause an additional 4% damage.",
  "Attacks made while stealthed and for 6 seconds after breaking stealth cause an additional 4% damage.",
  "Attacks made while stealthed and for 6 seconds after breaking stealth cause an additional 4% damage.",
  NULL,
  NULL
),

(30902, @locale_en,
  "Increases your attack power by 2%.",
  "Increases your attack power by 2%.",
  "Increases your attack power by 2%.",
  "Increases your attack power by 2%.",
  "Increases your attack power by 2%."
),

(31211, @locale_en,
  "Increases your chance to avoid area of effect attacks by an additional 5%.",
  "Increases your chance to avoid area of effect attacks by an additional 5%.",
  "Increases your chance to avoid area of effect attacks by an additional 5%.",
  NULL,
  NULL
),

(14183, @locale_en,
  "When used, adds 2 combo points to your target.  You must add to or use those combo points within 10  sec or the combo points are lost.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31228, @locale_en,
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3  sec (modified by resilience).  This effect cannot occur more than once per minute.",
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3  sec (modified by resilience).  This effect cannot occur more than once per minute.",
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3  sec (modified by resilience).  This effect cannot occur more than once per minute.",
  NULL,
  NULL
),

(31216, @locale_en,
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 1%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 1%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 1%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 1%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 1%."
),

(36554, @locale_en,
  "Attempts to step through the shadows and reappear behind your enemy and increases movement speed by 70% for 3  sec.  The damage of your next ability is increased by 20% and the threat caused is reduced by 50%.  Lasts 10  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- priest
(14522, @locale_en,
  "Increases your chance to resist Stun, Fear, and Silence effects by an additional 3%.",
  "Increases your chance to resist Stun, Fear, and Silence effects by an additional 3%.",
  "Increases your chance to resist Stun, Fear, and Silence effects by an additional 3%.",
  "Increases your chance to resist Stun, Fear, and Silence effects by an additional 3%.",
  "Increases your chance to resist Stun, Fear, and Silence effects by an additional 3%."
),

(14524, @locale_en,
  "Increases your damage with Wands by 5%.",
  "Increases your damage with Wands by 5%.",
  "Increases your damage with Wands by 5%.",
  "Increases your damage with Wands by 5%.",
  "Increases your damage with Wands by 5%."
),

(14523, @locale_en,
  "Reduces the threat generated by your Holy and Discipline spells by 4% and reduces the chance your spells will be dispelled by 4%.",
  "Reduces the threat generated by your Holy and Discipline spells by 4% and reduces the chance your spells will be dispelled by 4%.",
  "Reduces the threat generated by your Holy and Discipline spells by 4% and reduces the chance your spells will be dispelled by 4%.",
  "Reduces the threat generated by your Holy and Discipline spells by 4% and reduces the chance your spells will be dispelled by 4%.",
  "Reduces the threat generated by your Holy and Discipline spells by 4% and reduces the chance your spells will be dispelled by 4%."
),

(14749, @locale_en,
  "Increases the effect of your Power Word: Fortitude and Prayer of Fortitude spells by 15%.",
  "Increases the effect of your Power Word: Fortitude and Prayer of Fortitude spells by 15%.",
  NULL,
  NULL,
  NULL
),

(14748, @locale_en,
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
  NULL,
  NULL
),

(14531, @locale_en,
  "Gives you a 50% chance to gain the Focused Casting effect that lasts for 6  sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time when taking damage while casting Priest spells and increases resistance to Interrupt effects by 10%.",
  "Gives you a 50% chance to gain the Focused Casting effect that lasts for 6  sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time when taking damage while casting Priest spells and increases resistance to Interrupt effects by 10%.",
  NULL,
  NULL,
  NULL
),

(33167, @locale_en,
  "Reduces the mana cost of your Dispel Magic, Cure Disease, Abolish Disease and Mass Dispel spells by 5%.",
  "Reduces the mana cost of your Dispel Magic, Cure Disease, Abolish Disease and Mass Dispel spells by 5%.",
  "Reduces the mana cost of your Dispel Magic, Cure Disease, Abolish Disease and Mass Dispel spells by 5%.",
  NULL,
  NULL
),

(14751, @locale_en,
  "When activated, reduces the mana cost of your next spell by 100% and increases its critical effect chance by 25% if it is capable of a critical effect.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14521, @locale_en,
  "Allows 10% of your mana regeneration to continue while casting.",
  "Allows 10% of your mana regeneration to continue while casting.",
  "Allows 10% of your mana regeneration to continue while casting.",
  NULL,
  NULL
),

(14747, @locale_en,
  "Increases the armor bonus of your Inner Fire spell by 10%.",
  "Increases the armor bonus of your Inner Fire spell by 10%.",
  "Increases the armor bonus of your Inner Fire spell by 10%.",
  NULL,
  NULL
),

(14520, @locale_en,
  "Reduces the mana cost of your instant cast spells by 2%.",
  "Reduces the mana cost of your instant cast spells by 2%.",
  "Reduces the mana cost of your instant cast spells by 2%.",
  "Reduces the mana cost of your instant cast spells by 2%.",
  "Reduces the mana cost of your instant cast spells by 2%."
),

(14750, @locale_en,
  "Reduces the casting time of your Mana Burn spell by 0.5 sec.",
  "Reduces the casting time of your Mana Burn spell by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(18551, @locale_en,
  "Increases your maximum mana by 2%.",
  "Increases your maximum mana by 2%.",
  "Increases your maximum mana by 2%.",
  "Increases your maximum mana by 2%.",
  "Increases your maximum mana by 2%."
),

(14752, @locale_en,
  "Holy power infuses the target, increasing their Spirit by 17 for 30  mins.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33174, @locale_en,
  "Your Divine Spirit and Prayer of Spirit spells also increase the target's spell damage and healing by an amount equal to 5% of their total Spirit.",
  "Your Divine Spirit and Prayer of Spirit spells also increase the target's spell damage and healing by an amount equal to 5% of their total Spirit.",
  NULL,
  NULL,
  NULL
),

(33186, @locale_en,
  "Your Smite, Mind Blast and Mass Dispel spells have an additional 2% chance to hit.  In addition, your Mass Dispel cast time is reduced by 0.5 sec.",
  "Your Smite, Mind Blast and Mass Dispel spells have an additional 2% chance to hit.  In addition, your Mass Dispel cast time is reduced by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(18544, @locale_en,
  "Increases your spell damage by 1% and the critical strike chance of your offensive spells by 1%.",
  "Increases your spell damage by 1% and the critical strike chance of your offensive spells by 1%.",
  "Increases your spell damage by 1% and the critical strike chance of your offensive spells by 1%.",
  "Increases your spell damage by 1% and the critical strike chance of your offensive spells by 1%.",
  "Increases your spell damage by 1% and the critical strike chance of your offensive spells by 1%."
),

(45234, @locale_en,
  "After taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 4%.  Stacks up to 3 times.  Lasts 8  sec.",
  "After taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 4%.  Stacks up to 3 times.  Lasts 8  sec.",
  "After taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 4%.  Stacks up to 3 times.  Lasts 8  sec.",
  NULL,
  NULL
),

(10060, @locale_en,
  "Infuses the target with power, increasing spell casting speed by 20% and reducing the mana cost of all spells by 20%.  Lasts 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33201, @locale_en,
  "Causes 10% of the damage absorbed by your Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  "Causes 10% of the damage absorbed by your Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  "Causes 10% of the damage absorbed by your Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  "Causes 10% of the damage absorbed by your Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  "Causes 10% of the damage absorbed by your Power Word: Shield to reflect back at the attacker.  This damage causes no threat."
),

(34908, @locale_en,
  "Increases your total Stamina, Intellect and Spirit by 1%.",
  "Increases your total Stamina, Intellect and Spirit by 1%.",
  "Increases your total Stamina, Intellect and Spirit by 1%.",
  "Increases your total Stamina, Intellect and Spirit by 1%.",
  "Increases your total Stamina, Intellect and Spirit by 1%."
),

(33206, @locale_en,
  "Instantly reduces a friendly target's threat by 5%, reduces all damage taken by 40% and increases resistance to Dispel mechanics by 65% for 8  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14913, @locale_en,
  "Gives you a 35% chance to avoid interruption caused by damage while casting any healing spell.",
  "Gives you a 35% chance to avoid interruption caused by damage while casting any healing spell.",
  NULL,
  NULL,
  NULL
),

(14908, @locale_en,
  "Increases the amount healed by your Renew spell by 5%.",
  "Increases the amount healed by your Renew spell by 5%.",
  "Increases the amount healed by your Renew spell by 5%.",
  NULL,
  NULL
),

(14889, @locale_en,
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%.",
  "Increases the critical effect chance of your Holy spells by 1%."
),

(27900, @locale_en,
  "Reduces all spell damage taken by 2%.",
  "Reduces all spell damage taken by 2%.",
  "Reduces all spell damage taken by 2%.",
  "Reduces all spell damage taken by 2%.",
  "Reduces all spell damage taken by 2%."
),

(18530, @locale_en,
  "Reduces the casting time of your Smite, Holy Fire, Heal and Greater Heal spells by 0.1 sec.",
  "Reduces the casting time of your Smite, Holy Fire, Heal and Greater Heal spells by 0.1 sec.",
  "Reduces the casting time of your Smite, Holy Fire, Heal and Greater Heal spells by 0.1 sec.",
  "Reduces the casting time of your Smite, Holy Fire, Heal and Greater Heal spells by 0.1 sec.",
  "Reduces the casting time of your Smite, Holy Fire, Heal and Greater Heal spells by 0.1 sec."
),

(15237, @locale_en,
  "Causes an explosion of holy light around the caster, causing 28 to 32 Holy damage to all enemy targets within 10 yards and healing all party members within 10 yards for 52 to 60.  These effects cause no threat.",
  NULL,
  NULL,
  NULL,
  NULL
),

(27811, @locale_en,
  "After being struck by a melee or ranged critical hit, heal 8% of the damage taken over 6  sec.",
  "After being struck by a melee or ranged critical hit, heal 8% of the damage taken over 6  sec.",
  "After being struck by a melee or ranged critical hit, heal 8% of the damage taken over 6  sec.",
  NULL,
  NULL
),

(14892, @locale_en,
  "Increases your target's armor by 8% for 15  sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Prayer of Healing, or Circle of Healing spell.",
  "Increases your target's armor by 8% for 15  sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Prayer of Healing, or Circle of Healing spell.",
  "Increases your target's armor by 8% for 15  sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Prayer of Healing, or Circle of Healing spell.",
  NULL,
  NULL
),

(27789, @locale_en,
  "Increases the range of your Smite and Holy Fire spells and the radius of your Prayer of Healing, Holy Nova and Circle of Healing spells by 10%.",
  "Increases the range of your Smite and Holy Fire spells and the radius of your Prayer of Healing, Holy Nova and Circle of Healing spells by 10%.",
  NULL,
  NULL,
  NULL
),

(14912, @locale_en,
  "Reduces the mana cost of your Lesser Heal, Heal, and Greater Heal spells by 5%.",
  "Reduces the mana cost of your Lesser Heal, Heal, and Greater Heal spells by 5%.",
  "Reduces the mana cost of your Lesser Heal, Heal, and Greater Heal spells by 5%.",
  NULL,
  NULL
),

(14909, @locale_en,
  "Increases the damage of your Smite and Holy Fire spells by 5%.",
  "Increases the damage of your Smite and Holy Fire spells by 5%.",
  NULL,
  NULL,
  NULL
),

(14911, @locale_en,
  "Reduces the mana cost of your Prayer of Healing and Prayer of Mending spell by 10%.",
  "Reduces the mana cost of your Prayer of Healing and Prayer of Mending spell by 10%.",
  NULL,
  NULL,
  NULL
),

(20711, @locale_en,
  "Increases total Spirit by 5% and upon death, the priest becomes the Spirit of Redemption for 15  sec.  The Spirit of Redemption cannot move, attack, be attacked or targeted by any spells or effects.  While in this form the priest can cast any healing spell free of cost.  When the effect ends, the priest dies.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14901, @locale_en,
  "Increases spell damage and healing by up to 5% of your total Spirit.",
  "Increases spell damage and healing by up to 5% of your total Spirit.",
  "Increases spell damage and healing by up to 5% of your total Spirit.",
  "Increases spell damage and healing by up to 5% of your total Spirit.",
  "Increases spell damage and healing by up to 5% of your total Spirit."
),

(33150, @locale_en,
  "Your spell criticals have a 25% chance to cause your next Smite spell to be instant cast, cost no mana but be incapable of a critical hit.  This effect lasts 10  sec.",
  "Your spell criticals have a 25% chance to cause your next Smite spell to be instant cast, cost no mana but be incapable of a critical hit.  This effect lasts 10  sec.",
  NULL,
  NULL,
  NULL
),

(14898, @locale_en,
  "Increases the amount healed by your healing spells by 2%.",
  "Increases the amount healed by your healing spells by 2%.",
  "Increases the amount healed by your healing spells by 2%.",
  "Increases the amount healed by your healing spells by 2%.",
  "Increases the amount healed by your healing spells by 2%."
),

(34753, @locale_en,
  "Gives you a 2% chance to enter a Clearcasting state after casting any Flash Heal, Binding Heal, or Greater Heal spell.  The Clearcasting state reduces the mana cost of your next Flash Heal, Binding Heal, or Greater Heal spell by 100%.",
  "Gives you a 2% chance to enter a Clearcasting state after casting any Flash Heal, Binding Heal, or Greater Heal spell.  The Clearcasting state reduces the mana cost of your next Flash Heal, Binding Heal, or Greater Heal spell by 100%.",
  "Gives you a 2% chance to enter a Clearcasting state after casting any Flash Heal, Binding Heal, or Greater Heal spell.  The Clearcasting state reduces the mana cost of your next Flash Heal, Binding Heal, or Greater Heal spell by 100%.",
  NULL,
  NULL
),

(724, @locale_en,
  "Creates a Holy Lightwell.  Members of your raid or party can click the Lightwell to restore 798 health over 6  sec.  Any damage taken will cancel the effect.  Lightwell lasts for 6  sec or 5 charges.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33142, @locale_en,
  "Critical hits made against you have a 20% chance to prevent you from being critically hit again for 6  sec.",
  "Critical hits made against you have a 20% chance to prevent you from being critically hit again for 6  sec.",
  "Critical hits made against you have a 20% chance to prevent you from being critically hit again for 6  sec.",
  NULL,
  NULL
),

(33158, @locale_en,
  "Your Greater Heal spell gains an additional 4% and your Flash Heal and Binding Heal gain an additional 2% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 4% and your Flash Heal and Binding Heal gain an additional 2% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 4% and your Flash Heal and Binding Heal gain an additional 2% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 4% and your Flash Heal and Binding Heal gain an additional 2% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 4% and your Flash Heal and Binding Heal gain an additional 2% of your bonus healing effects."
),

(34861, @locale_en,
  "Heals friendly target and that target's party members within 15 yards of the target for 246 to 270.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15270, @locale_en,
  "Gives you a 20% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 50% rate while casting.  Lasts 15  sec.",
  "Gives you a 20% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 50% rate while casting.  Lasts 15  sec.",
  "Gives you a 20% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 50% rate while casting.  Lasts 15  sec.",
  "Gives you a 20% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 50% rate while casting.  Lasts 15  sec.",
  "Gives you a 20% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 50% rate while casting.  Lasts 15  sec."
),

(15268, @locale_en,
  "Gives your Shadow damage spells a 2% chance to stun the target for 3  sec.",
  "Gives your Shadow damage spells a 2% chance to stun the target for 3  sec.",
  "Gives your Shadow damage spells a 2% chance to stun the target for 3  sec.",
  "Gives your Shadow damage spells a 2% chance to stun the target for 3  sec.",
  "Gives your Shadow damage spells a 2% chance to stun the target for 3  sec."
),

(15318, @locale_en,
  "Reduces the threat generated by your Shadow spells by 8%.",
  "Reduces the threat generated by your Shadow spells by 8%.",
  "Reduces the threat generated by your Shadow spells by 8%.",
  NULL,
  NULL
),

(15275, @locale_en,
  "Increases the duration of your Shadow Word: Pain spell by 3 sec.",
  "Increases the duration of your Shadow Word: Pain spell by 3 sec.",
  NULL,
  NULL,
  NULL
),

(15260, @locale_en,
  "Reduces your target's chance to resist your Shadow spells by 2%.",
  "Reduces your target's chance to resist your Shadow spells by 2%.",
  "Reduces your target's chance to resist your Shadow spells by 2%.",
  "Reduces your target's chance to resist your Shadow spells by 2%.",
  "Reduces your target's chance to resist your Shadow spells by 2%."
),

(15392, @locale_en,
  "Reduces the cooldown of your Psychic Scream spell by 2 sec.",
  "Reduces the cooldown of your Psychic Scream spell by 2 sec.",
  NULL,
  NULL,
  NULL
),

(15273, @locale_en,
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec."
),

(15407, @locale_en,
  "Assault the target's mind with Shadow energy, causing 75 Shadow damage over 3  sec and slowing their movement speed by 50%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15274, @locale_en,
  "Decreases the cooldown of your Fade ability by 3 sec.",
  "Decreases the cooldown of your Fade ability by 3 sec.",
  NULL,
  NULL,
  NULL
),

(17322, @locale_en,
  "Increases the range of your offensive Shadow spells by 10%.",
  "Increases the range of your offensive Shadow spells by 10%.",
  NULL,
  NULL,
  NULL
),

(15257, @locale_en,
  "Your Shadow damage spells have a 20% chance to cause your target to be vulnerable to Shadow damage.  This vulnerability increases the Shadow damage dealt to your target by 2% and lasts 15  sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 20% chance to cause your target to be vulnerable to Shadow damage.  This vulnerability increases the Shadow damage dealt to your target by 2% and lasts 15  sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 20% chance to cause your target to be vulnerable to Shadow damage.  This vulnerability increases the Shadow damage dealt to your target by 2% and lasts 15  sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 20% chance to cause your target to be vulnerable to Shadow damage.  This vulnerability increases the Shadow damage dealt to your target by 2% and lasts 15  sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 20% chance to cause your target to be vulnerable to Shadow damage.  This vulnerability increases the Shadow damage dealt to your target by 2% and lasts 15  sec.  Stacks up to 5 times."
),

(15487, @locale_en,
  "Silences the target, preventing them from casting spells for 5  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15286, @locale_en,
  "Afflicts your target with Shadow energy that causes all party members to be healed for 15% of any Shadow spell damage you deal for 1  min.",
  NULL,
  NULL,
  NULL,
  NULL
),

(27839, @locale_en,
  "Increases the percentage healed by Vampiric Embrace by an additional 5%.",
  "Increases the percentage healed by Vampiric Embrace by an additional 5%.",
  NULL,
  NULL,
  NULL
),

(33213, @locale_en,
  "Reduces the mana cost of your Mind Blast, Mind Control and Mind Flay spells by 5%.",
  "Reduces the mana cost of your Mind Blast, Mind Control and Mind Flay spells by 5%.",
  "Reduces the mana cost of your Mind Blast, Mind Control and Mind Flay spells by 5%.",
  NULL,
  NULL
),

(14910, @locale_en,
  "Reduces the chance you'll be critically hit by all spells by 2%.",
  "Reduces the chance you'll be critically hit by all spells by 2%.",
  NULL,
  NULL,
  NULL
),

(15259, @locale_en,
  "Increases your Shadow spell damage by 2%.",
  "Increases your Shadow spell damage by 2%.",
  "Increases your Shadow spell damage by 2%.",
  "Increases your Shadow spell damage by 2%.",
  "Increases your Shadow spell damage by 2%."
),

(15473, @locale_en,
  "Assume a Shadowform, increasing your Shadow damage by 15% and reducing Physical damage done to you by 15%.  However, you may not cast Holy spells while in this form.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33221, @locale_en,
  "Increases the critical strike chance of your Mind Blast and Shadow Word: Death spells by 3%.",
  "Increases the critical strike chance of your Mind Blast and Shadow Word: Death spells by 3%.",
  "Increases the critical strike chance of your Mind Blast and Shadow Word: Death spells by 3%.",
  "Increases the critical strike chance of your Mind Blast and Shadow Word: Death spells by 3%.",
  "Increases the critical strike chance of your Mind Blast and Shadow Word: Death spells by 3%."
),

(33191, @locale_en,
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also cause the target to take an additional 1% spell damage.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also cause the target to take an additional 1% spell damage.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also cause the target to take an additional 1% spell damage.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also cause the target to take an additional 1% spell damage.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also cause the target to take an additional 1% spell damage."
),

(34914, @locale_en,
  "Causes 450 Shadow damage over 15  sec to your target and causes all party members to gain mana equal to 5% of any Shadow spell damage you deal.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- shaman
(16039, @locale_en,
  "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by 2%."
),

(16035, @locale_en,
  "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by 1%."
),

(16043, @locale_en,
  "Increases the health of your Stoneclaw Totem by 25% and the radius of your Earthbind Totem by 10%.",
  "Increases the health of your Stoneclaw Totem by 25% and the radius of your Earthbind Totem by 10%.",
  NULL,
  NULL,
  NULL
),

(28996, @locale_en,
  "Reduces damage taken from Fire, Frost and Nature effects by 4%.",
  "Reduces damage taken from Fire, Frost and Nature effects by 4%.",
  "Reduces damage taken from Fire, Frost and Nature effects by 4%.",
  NULL,
  NULL
),

(16038, @locale_en,
  "Increases the damage done by your Fire Totems by 5%.",
  "Increases the damage done by your Fire Totems by 5%.",
  "Increases the damage done by your Fire Totems by 5%.",
  NULL,
  NULL
),

(16164, @locale_en,
  "After landing a critical strike with a Fire, Frost, or Nature damage spell, you enter a Clearcasting state.  The Clearcasting state reduces the mana cost of your next 2 damage spells by 40%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16040, @locale_en,
  "Reduces the cooldown of your Shock spells by 0.2 sec.",
  "Reduces the cooldown of your Shock spells by 0.2 sec.",
  "Reduces the cooldown of your Shock spells by 0.2 sec.",
  "Reduces the cooldown of your Shock spells by 0.2 sec.",
  "Reduces the cooldown of your Shock spells by 0.2 sec."
),

(16041, @locale_en,
  "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional 1%.",
  "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional 1%.",
  "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional 1%.",
  "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional 1%.",
  "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional 1%."
),

(16086, @locale_en,
  "Reduces the delay before your Fire Nova Totem activates by 1 sec. and decreases the threat generated by your Magma Totem by 25%.",
  "Reduces the delay before your Fire Nova Totem activates by 1 sec. and decreases the threat generated by your Magma Totem by 25%.",
  NULL,
  NULL,
  NULL
),

(29062, @locale_en,
  "Gives you a 33% chance to gain the Focused Casting effect that lasts for 6  sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time on Shaman spells when taking damage.",
  "Gives you a 33% chance to gain the Focused Casting effect that lasts for 6  sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time on Shaman spells when taking damage.",
  "Gives you a 33% chance to gain the Focused Casting effect that lasts for 6  sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time on Shaman spells when taking damage.",
  NULL,
  NULL
),

(30160, @locale_en,
  "Your offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10  sec.",
  "Your offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10  sec.",
  "Your offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10  sec.",
  NULL,
  NULL
),

(28999, @locale_en,
  "Increases the range of your Lightning Bolt and Chain Lightning spells by 3 yards.",
  "Increases the range of your Lightning Bolt and Chain Lightning spells by 3 yards.",
  NULL,
  NULL,
  NULL
),

(16089, @locale_en,
  "Increases the critical strike damage bonus of your Searing, Magma, and Fire Nova Totems and your Fire, Frost, and Nature spells by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30664, @locale_en,
  "Regenerate mana equal to 2% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 2% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 2% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 2% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 2% of your Intellect every 5 sec, even while casting."
),

(30672, @locale_en,
  "Increases your chance to hit with Fire, Frost and Nature spells by 2% and reduces the threat caused by Fire, Frost and Nature spells by 4%.",
  "Increases your chance to hit with Fire, Frost and Nature spells by 2% and reduces the threat caused by Fire, Frost and Nature spells by 4%.",
  "Increases your chance to hit with Fire, Frost and Nature spells by 2% and reduces the threat caused by Fire, Frost and Nature spells by 4%.",
  NULL,
  NULL
),

(16578, @locale_en,
  "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by 0.1 sec."
),

(16166, @locale_en,
  "When activated, this spell gives your next Fire, Frost, or Nature damage spell a 100% critical strike chance and reduces the mana cost by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30669, @locale_en,
  "Reduces the chance you will be critically hit by melee and ranged attacks by 2%.",
  "Reduces the chance you will be critically hit by melee and ranged attacks by 2%.",
  "Reduces the chance you will be critically hit by melee and ranged attacks by 2%.",
  NULL,
  NULL
),

(30675, @locale_en,
  "Gives your Lightning Bolt and Chain Lightning spells a 4% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 4% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 4% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 4% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 4% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat."
),

(30706, @locale_en,
  "Summons a Totem of Wrath with 5 health at the feet of the caster.  The totem increases the chance to hit and critically strike with spells by 3% for all party members within 20 yards.  Lasts 2  mins.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17485, @locale_en,
  "Increases your maximum mana by 1%.",
  "Increases your maximum mana by 1%.",
  "Increases your maximum mana by 1%.",
  "Increases your maximum mana by 1%.",
  "Increases your maximum mana by 1%."
),

(16253, @locale_en,
  "Increases your chance to block attacks with a shield by 1% and increases the amount blocked by 5%.",
  "Increases your chance to block attacks with a shield by 1% and increases the amount blocked by 5%.",
  "Increases your chance to block attacks with a shield by 1% and increases the amount blocked by 5%.",
  "Increases your chance to block attacks with a shield by 1% and increases the amount blocked by 5%.",
  "Increases your chance to block attacks with a shield by 1% and increases the amount blocked by 5%."
),

(16258, @locale_en,
  "Increases the amount of damage reduced by your Stoneskin Totem and Windwall Totem by 10% and reduces the cooldown of your Grounding Totem by 1 sec.",
  "Increases the amount of damage reduced by your Stoneskin Totem and Windwall Totem by 10% and reduces the cooldown of your Grounding Totem by 1 sec.",
  NULL,
  NULL,
  NULL
),

(16255, @locale_en,
  "Improves your chance to get a critical strike with your weapon attacks by 1%.",
  "Improves your chance to get a critical strike with your weapon attacks by 1%.",
  "Improves your chance to get a critical strike with your weapon attacks by 1%.",
  "Improves your chance to get a critical strike with your weapon attacks by 1%.",
  "Improves your chance to get a critical strike with your weapon attacks by 1%."
),

(16262, @locale_en,
  "Reduces the cast time of your Ghost Wolf spell by 1 sec.",
  "Reduces the cast time of your Ghost Wolf spell by 1 sec.",
  NULL,
  NULL,
  NULL
),

(16261, @locale_en,
  "Increases the damage done by your Lightning Shield orbs by 5%.",
  "Increases the damage done by your Lightning Shield orbs by 5%.",
  "Increases the damage done by your Lightning Shield orbs by 5%.",
  NULL,
  NULL
),

(16259, @locale_en,
  "Increases the effect of your Strength of Earth and Grace of Air Totems by 8%.",
  "Increases the effect of your Strength of Earth and Grace of Air Totems by 8%.",
  NULL,
  NULL,
  NULL
),

(43338, @locale_en,
  "After landing a melee critical strike, you enter a Focused state.  The Focused state reduces the mana cost of your next Shock spell by 60%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16254, @locale_en,
  "Increases your chance to dodge by an additional 1%.",
  "Increases your chance to dodge by an additional 1%.",
  "Increases your chance to dodge by an additional 1%.",
  "Increases your chance to dodge by an additional 1%.",
  "Increases your chance to dodge by an additional 1%."
),

(16256, @locale_en,
  "Increases your attack speed by 10% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 10% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 10% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 10% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 10% for your next 3 swings after dealing a critical strike."
),

(16252, @locale_en,
  "Increases your armor value from items by 2%, and reduces the duration of movement slowing effects on you by 10%.",
  "Increases your armor value from items by 2%, and reduces the duration of movement slowing effects on you by 10%.",
  "Increases your armor value from items by 2%, and reduces the duration of movement slowing effects on you by 10%.",
  "Increases your armor value from items by 2%, and reduces the duration of movement slowing effects on you by 10%.",
  "Increases your armor value from items by 2%, and reduces the duration of movement slowing effects on you by 10%."
),

(29192, @locale_en,
  "Increases the melee attack power bonus of your Windfury Totem by 15% and increases the damage caused by your Flametongue Totem by 6%.",
  "Increases the melee attack power bonus of your Windfury Totem by 15% and increases the damage caused by your Flametongue Totem by 6%.",
  NULL,
  NULL,
  NULL
),

(16268, @locale_en,
  "Gives a chance to parry enemy melee attacks and reduces the threat generated by your melee attacks by 30%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16266, @locale_en,
  "Increases the damage caused by your Rockbiter Weapon by 7%, your Windfury Weapon effect by 13% and increases the damage caused by your Flametongue Weapon and Frostbrand Weapon by 5%.",
  "Increases the damage caused by your Rockbiter Weapon by 7%, your Windfury Weapon effect by 13% and increases the damage caused by your Flametongue Weapon and Frostbrand Weapon by 5%.",
  "Increases the damage caused by your Rockbiter Weapon by 7%, your Windfury Weapon effect by 13% and increases the damage caused by your Flametongue Weapon and Frostbrand Weapon by 5%.",
  NULL,
  NULL
),

(30812, @locale_en,
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell damage and healing by an amount equal to 10% of your attack power.",
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell damage and healing by an amount equal to 10% of your attack power.",
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell damage and healing by an amount equal to 10% of your attack power.",
  NULL,
  NULL
),

(29082, @locale_en,
  "Increases the damage you deal with all weapons by 2%.",
  "Increases the damage you deal with all weapons by 2%.",
  "Increases the damage you deal with all weapons by 2%.",
  "Increases the damage you deal with all weapons by 2%.",
  "Increases the damage you deal with all weapons by 2%."
),

(30816, @locale_en,
  "Increases your chance to hit while dual wielding by an additional 2%.",
  "Increases your chance to hit while dual wielding by an additional 2%.",
  "Increases your chance to hit while dual wielding by an additional 2%.",
  NULL,
  NULL
),

(30798, @locale_en,
  "Allows one-hand and off-hand weapons to be equipped in the off-hand.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17364, @locale_en,
  "Instantly attack with both weapons.  In addition, the next 2 sources of Nature damage dealt to the target are increased by 20%.  Lasts 12  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30802, @locale_en,
  "Causes your critical hits with melee attacks to increase all party members' melee attack power by 2% if within 20 yards of the Shaman.  Lasts 10  sec.",
  "Causes your critical hits with melee attacks to increase all party members' melee attack power by 2% if within 20 yards of the Shaman.  Lasts 10  sec.",
  "Causes your critical hits with melee attacks to increase all party members' melee attack power by 2% if within 20 yards of the Shaman.  Lasts 10  sec.",
  "Causes your critical hits with melee attacks to increase all party members' melee attack power by 2% if within 20 yards of the Shaman.  Lasts 10  sec.",
  "Causes your critical hits with melee attacks to increase all party members' melee attack power by 2% if within 20 yards of the Shaman.  Lasts 10  sec."
),

(30823, @locale_en,
  "Reduces all damage taken by 30% and gives your successful melee attacks a chance to regenerate mana equal to 30% of your attack power.  Lasts 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16182, @locale_en,
  "Reduces the casting time of your Healing Wave spell by 0.1 sec.",
  "Reduces the casting time of your Healing Wave spell by 0.1 sec.",
  "Reduces the casting time of your Healing Wave spell by 0.1 sec.",
  "Reduces the casting time of your Healing Wave spell by 0.1 sec.",
  "Reduces the casting time of your Healing Wave spell by 0.1 sec."
),

(16179, @locale_en,
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%."
),

(16184, @locale_en,
  "Reduces the cooldown of your Reincarnation spell by 10 min and increases the amount of health and mana you reincarnate with by an additional 10%.",
  "Reduces the cooldown of your Reincarnation spell by 10 min and increases the amount of health and mana you reincarnate with by an additional 10%.",
  NULL,
  NULL,
  NULL
),

(16176, @locale_en,
  "Increases your target's armor value by 8% for 15  sec after getting a critical effect from one of your healing spells.",
  "Increases your target's armor value by 8% for 15  sec after getting a critical effect from one of your healing spells.",
  "Increases your target's armor value by 8% for 15  sec after getting a critical effect from one of your healing spells.",
  NULL,
  NULL
),

(16173, @locale_en,
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%."
),

(16180, @locale_en,
  "Increases your chance to hit with melee attacks and spells by 1%.",
  "Increases your chance to hit with melee attacks and spells by 1%.",
  "Increases your chance to hit with melee attacks and spells by 1%.",
  NULL,
  NULL
),

(16181, @locale_en,
  "Gives you a 14% chance to avoid interruption caused by damage while casting any Shaman healing spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting any Shaman healing spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting any Shaman healing spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting any Shaman healing spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting any Shaman healing spell."
),

(16189, @locale_en,
  "The radius of your totems that affect friendly targets is increased to 30 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29187, @locale_en,
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your spells will be dispelled by 10%.",
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your spells will be dispelled by 10%.",
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your spells will be dispelled by 10%.",
  NULL,
  NULL
),

(16187, @locale_en,
  "Increases the effect of your Mana Spring and Healing Stream Totems by 5%.",
  "Increases the effect of your Mana Spring and Healing Stream Totems by 5%.",
  "Increases the effect of your Mana Spring and Healing Stream Totems by 5%.",
  "Increases the effect of your Mana Spring and Healing Stream Totems by 5%.",
  "Increases the effect of your Mana Spring and Healing Stream Totems by 5%."
),

(16194, @locale_en,
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%."
),

(29206, @locale_en,
  "Your Healing Wave spells have a 33% chance to increase the effect of subsequent Healing Wave spells on that target by 6% for 15  sec.  This effect will stack up to 3 times.",
  "Your Healing Wave spells have a 33% chance to increase the effect of subsequent Healing Wave spells on that target by 6% for 15  sec.  This effect will stack up to 3 times.",
  "Your Healing Wave spells have a 33% chance to increase the effect of subsequent Healing Wave spells on that target by 6% for 15  sec.  This effect will stack up to 3 times.",
  NULL,
  NULL
),

(16188, @locale_en,
  "When activated, your next Nature spell with a casting time less than 10 sec. becomes an instant cast spell.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30864, @locale_en,
  "Reduces the duration of any Silence or Interrupt effects used against the Shaman by 10%. This effect does not stack with other similar effects.",
  "Reduces the duration of any Silence or Interrupt effects used against the Shaman by 10%. This effect does not stack with other similar effects.",
  "Reduces the duration of any Silence or Interrupt effects used against the Shaman by 10%. This effect does not stack with other similar effects.",
  NULL,
  NULL
),

(16178, @locale_en,
  "Increases the effectiveness of your healing spells by 2%.",
  "Increases the effectiveness of your healing spells by 2%.",
  "Increases the effectiveness of your healing spells by 2%.",
  "Increases the effectiveness of your healing spells by 2%.",
  "Increases the effectiveness of your healing spells by 2%."
),

(16190, @locale_en,
  "Summons a Mana Tide Totem with 5 health at the feet of the caster for  sec that restores 6% of total mana every 3 seconds to group members within 20 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30881, @locale_en,
  "Whenever a damaging attack is taken that reduces you below 30% health, you have a 10% chance to heal 10% of your total health and reduce your threat level on that target.  5 second cooldown.",
  "Whenever a damaging attack is taken that reduces you below 30% health, you have a 10% chance to heal 10% of your total health and reduce your threat level on that target.  5 second cooldown.",
  "Whenever a damaging attack is taken that reduces you below 30% health, you have a 10% chance to heal 10% of your total health and reduce your threat level on that target.  5 second cooldown.",
  "Whenever a damaging attack is taken that reduces you below 30% health, you have a 10% chance to heal 10% of your total health and reduce your threat level on that target.  5 second cooldown.",
  "Whenever a damaging attack is taken that reduces you below 30% health, you have a 10% chance to heal 10% of your total health and reduce your threat level on that target.  5 second cooldown."
),

(30867, @locale_en,
  "Increases your spell damage and healing by an amount equal to 10% of your Intellect.",
  "Increases your spell damage and healing by an amount equal to 10% of your Intellect.",
  "Increases your spell damage and healing by an amount equal to 10% of your Intellect.",
  NULL,
  NULL
),

(30872, @locale_en,
  "Increases the amount healed by your Chain Heal spell by 10%.",
  "Increases the amount healed by your Chain Heal spell by 10%.",
  NULL,
  NULL,
  NULL
),

(974, @locale_en,
  "Protects the target with an earthen shield, giving a 30% chance of ignoring spell interruption when damaged and causing attacks to heal the shielded target for 150.  This effect can only occur once every few seconds.  6 charges.  Lasts 10  mins.  Earth Shield can only be placed on one target at a time and only one Elemental Shield can be active on a target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- mage
(11210, @locale_en,
  "Reduces your target's resistance to all your spells by 5 and reduces the threat caused by your Arcane spells by 20%.",
  "Reduces your target's resistance to all your spells by 5 and reduces the threat caused by your Arcane spells by 20%.",
  NULL,
  NULL,
  NULL
),

(11222, @locale_en,
  "Reduces the chance that the opponent can resist your Arcane spells by 2%.",
  "Reduces the chance that the opponent can resist your Arcane spells by 2%.",
  "Reduces the chance that the opponent can resist your Arcane spells by 2%.",
  "Reduces the chance that the opponent can resist your Arcane spells by 2%.",
  "Reduces the chance that the opponent can resist your Arcane spells by 2%."
),

(11237, @locale_en,
  "Gives you a 20% chance to avoid interruption caused by damage while channeling Arcane Missiles.",
  "Gives you a 20% chance to avoid interruption caused by damage while channeling Arcane Missiles.",
  "Gives you a 20% chance to avoid interruption caused by damage while channeling Arcane Missiles.",
  "Gives you a 20% chance to avoid interruption caused by damage while channeling Arcane Missiles.",
  "Gives you a 20% chance to avoid interruption caused by damage while channeling Arcane Missiles."
),

(6057, @locale_en,
  "Increases your damage with Wands by 13%.",
  "Increases your damage with Wands by 13%.",
  NULL,
  NULL,
  NULL
),

(29441, @locale_en,
  "Increases all resistances by 2 and causes all spells you fully resist to restore 1% of your total mana.  1 sec. cooldown.",
  "Increases all resistances by 2 and causes all spells you fully resist to restore 1% of your total mana.  1 sec. cooldown.",
  "Increases all resistances by 2 and causes all spells you fully resist to restore 1% of your total mana.  1 sec. cooldown.",
  "Increases all resistances by 2 and causes all spells you fully resist to restore 1% of your total mana.  1 sec. cooldown.",
  "Increases all resistances by 2 and causes all spells you fully resist to restore 1% of your total mana.  1 sec. cooldown."
),

(11213, @locale_en,
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%."
),

(11247, @locale_en,
  "Increases the effect of your Amplify Magic and Dampen Magic spells by 25%.",
  "Increases the effect of your Amplify Magic and Dampen Magic spells by 25%.",
  NULL,
  NULL,
  NULL
),

(11242, @locale_en,
  "Increases the critical strike chance of your Arcane Explosion and Arcane Blast spells by an additional 2%.",
  "Increases the critical strike chance of your Arcane Explosion and Arcane Blast spells by an additional 2%.",
  "Increases the critical strike chance of your Arcane Explosion and Arcane Blast spells by an additional 2%.",
  NULL,
  NULL
),

(28574, @locale_en,
  "Increases your armor by an amount equal to 100% of your Intellect.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11252, @locale_en,
  "Decreases the mana lost per point of damage taken when Mana Shield is active by 10%.",
  "Decreases the mana lost per point of damage taken when Mana Shield is active by 10%.",
  NULL,
  NULL,
  NULL
),

(11255, @locale_en,
  "Gives your Counterspell a 50% chance to silence the target for 4  sec.",
  "Gives your Counterspell a 50% chance to silence the target for 4  sec.",
  NULL,
  NULL,
  NULL
),

(18462, @locale_en,
  "Allows 10% of your mana regeneration to continue while casting.",
  "Allows 10% of your mana regeneration to continue while casting.",
  "Allows 10% of your mana regeneration to continue while casting.",
  NULL,
  NULL
),

(31569, @locale_en,
  "For 4  sec after casting Blink, your chance to be hit by all attacks and spells is reduced by 13%.",
  "For 4  sec after casting Blink, your chance to be hit by all attacks and spells is reduced by 13%.",
  NULL,
  NULL,
  NULL
),

(12043, @locale_en,
  "When activated, your next Mage spell with a casting time less than 10 sec becomes an instant cast spell.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11232, @locale_en,
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%."
),

(31574, @locale_en,
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  NULL,
  NULL,
  NULL
),

(15058, @locale_en,
  "Increases your spell damage and critical strike chance by 1%.",
  "Increases your spell damage and critical strike chance by 1%.",
  "Increases your spell damage and critical strike chance by 1%.",
  NULL,
  NULL
),

(31571, @locale_en,
  "Increases the critical strike chance of any spell cast while Clearcasting by 10%.",
  "Increases the critical strike chance of any spell cast while Clearcasting by 10%.",
  "Increases the critical strike chance of any spell cast while Clearcasting by 10%.",
  NULL,
  NULL
),

(31579, @locale_en,
  "Your Arcane Missiles spell gains an additional 15% of your bonus spell damage effects, but mana cost is increased by 2%.",
  "Your Arcane Missiles spell gains an additional 15% of your bonus spell damage effects, but mana cost is increased by 2%.",
  "Your Arcane Missiles spell gains an additional 15% of your bonus spell damage effects, but mana cost is increased by 2%.",
  NULL,
  NULL
),

(12042, @locale_en,
  "When activated, your spells deal 30% more damage while costing 30% more mana to cast.  This effect lasts 15  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(35578, @locale_en,
  "Increases critical strike damage bonus of all spells by 25%.",
  "Increases critical strike damage bonus of all spells by 25%.",
  NULL,
  NULL,
  NULL
),

(31584, @locale_en,
  "Increases spell damage by up to 5% of your total Intellect.",
  "Increases spell damage by up to 5% of your total Intellect.",
  "Increases spell damage by up to 5% of your total Intellect.",
  "Increases spell damage by up to 5% of your total Intellect.",
  "Increases spell damage by up to 5% of your total Intellect."
),

(31589, @locale_en,
  "Reduces target's movement speed by 50%, increases the time between ranged attacks by 50% and increases casting time by 50%.  Lasts 15  sec.  Slow can only affect one target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11069, @locale_en,
  "Reduces the casting time of your Fireball spell by 0.1 sec.",
  "Reduces the casting time of your Fireball spell by 0.1 sec.",
  "Reduces the casting time of your Fireball spell by 0.1 sec.",
  "Reduces the casting time of your Fireball spell by 0.1 sec.",
  "Reduces the casting time of your Fireball spell by 0.1 sec."
),

(11103, @locale_en,
  "Gives your Fire spells a 2% chance to stun the target for 2  sec.",
  "Gives your Fire spells a 2% chance to stun the target for 2  sec.",
  "Gives your Fire spells a 2% chance to stun the target for 2  sec.",
  "Gives your Fire spells a 2% chance to stun the target for 2  sec.",
  "Gives your Fire spells a 2% chance to stun the target for 2  sec."
),

(11119, @locale_en,
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4  sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4  sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4  sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4  sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4  sec."
),

(11100, @locale_en,
  "Increases the range of your Fire spells by 3 yards.",
  "Increases the range of your Fire spells by 3 yards.",
  NULL,
  NULL,
  NULL
),

(11078, @locale_en,
  "Reduces the cooldown of your Fire Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Fire Blast spell by 0.5 sec.",
  "Reduces the cooldown of your Fire Blast spell by 0.5 sec.",
  NULL,
  NULL
),

(18459, @locale_en,
  "Increases the critical strike chance of your Fire Blast and Scorch spells by 2%.",
  "Increases the critical strike chance of your Fire Blast and Scorch spells by 2%.",
  NULL,
  NULL,
  NULL
),

(11108, @locale_en,
  "Increases the critical strike chance of your Flamestrike spell by 5%.",
  "Increases the critical strike chance of your Flamestrike spell by 5%.",
  "Increases the critical strike chance of your Flamestrike spell by 5%.",
  NULL,
  NULL
),

(11366, @locale_en,
  "Hurls an immense fiery boulder that causes 141 to 187 Fire damage and an additional 56 Fire damage over 12  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11083, @locale_en,
  "Gives your Fire spells a 35% chance to not lose casting time when you take damage and reduces the threat caused by your Fire spells by 5%.",
  "Gives your Fire spells a 35% chance to not lose casting time when you take damage and reduces the threat caused by your Fire spells by 5%.",
  NULL,
  NULL,
  NULL
),

(11095, @locale_en,
  "Your Scorch spells have a 33% chance to cause your target to be vulnerable to Fire damage.  This vulnerability increases the Fire damage dealt to your target by 3% and lasts 30  sec.  Stacks up to 5 times.",
  "Your Scorch spells have a 33% chance to cause your target to be vulnerable to Fire damage.  This vulnerability increases the Fire damage dealt to your target by 3% and lasts 30  sec.  Stacks up to 5 times.",
  "Your Scorch spells have a 33% chance to cause your target to be vulnerable to Fire damage.  This vulnerability increases the Fire damage dealt to your target by 3% and lasts 30  sec.  Stacks up to 5 times.",
  NULL,
  NULL
),

(11094, @locale_en,
  "Causes your Fire Ward to have a 10% chance to reflect Fire spells while active. In addition, your Molten Armor has a 50% chance to affect ranged and spell attacks.",
  "Causes your Fire Ward to have a 10% chance to reflect Fire spells while active. In addition, your Molten Armor has a 50% chance to affect ranged and spell attacks.",
  NULL,
  NULL,
  NULL
),

(29074, @locale_en,
  "Your Fire and Frost spell criticals will refund 10% of their base mana cost.",
  "Your Fire and Frost spell criticals will refund 10% of their base mana cost.",
  "Your Fire and Frost spell criticals will refund 10% of their base mana cost.",
  NULL,
  NULL
),

(31638, @locale_en,
  "Increases all spell damage caused by 1% and all spell damage taken by 1%.",
  "Increases all spell damage caused by 1% and all spell damage taken by 1%.",
  "Increases all spell damage caused by 1% and all spell damage taken by 1%.",
  NULL,
  NULL
),

(11115, @locale_en,
  "Increases the critical strike chance of your Fire spells by 2%.",
  "Increases the critical strike chance of your Fire spells by 2%.",
  "Increases the critical strike chance of your Fire spells by 2%.",
  NULL,
  NULL
),

(11113, @locale_en,
  "A wave of flame radiates outward from the caster, damaging all enemies caught within the blast for 154 to 186 Fire damage, and Dazing them for 6  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31641, @locale_en,
  "Gives you a 5% chance when hit by a melee or ranged attack to increase your movement speed by 50% and dispel all movement impairing effects.  This effect lasts 8  sec.",
  "Gives you a 5% chance when hit by a melee or ranged attack to increase your movement speed by 50% and dispel all movement impairing effects.  This effect lasts 8  sec.",
  NULL,
  NULL,
  NULL
),

(11124, @locale_en,
  "Increases the damage done by your Fire spells by 2%.",
  "Increases the damage done by your Fire spells by 2%.",
  "Increases the damage done by your Fire spells by 2%.",
  "Increases the damage done by your Fire spells by 2%.",
  "Increases the damage done by your Fire spells by 2%."
),

(34293, @locale_en,
  "Increases chance to critically hit and reduces the mana cost of all Fire spells by an additional 1%.",
  "Increases chance to critically hit and reduces the mana cost of all Fire spells by an additional 1%.",
  "Increases chance to critically hit and reduces the mana cost of all Fire spells by an additional 1%.",
  NULL,
  NULL
),

(11129, @locale_en,
  "When activated, this spell causes each of your Fire damage spell hits to increase your critical strike chance with Fire damage spells by 10%.  This effect lasts until you have caused 3 critical strikes with Fire spells.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31679, @locale_en,
  "Increases damage of all spells against targets with less than 20% health by 10%.",
  "Increases damage of all spells against targets with less than 20% health by 10%.",
  NULL,
  NULL,
  NULL
),

(31656, @locale_en,
  "Your Fireball spell gains an additional 3% of your bonus spell damage effects.",
  "Your Fireball spell gains an additional 3% of your bonus spell damage effects.",
  "Your Fireball spell gains an additional 3% of your bonus spell damage effects.",
  "Your Fireball spell gains an additional 3% of your bonus spell damage effects.",
  "Your Fireball spell gains an additional 3% of your bonus spell damage effects."
),

(31661, @locale_en,
  "Targets in a cone in front of the caster take 370 to 430 Fire damage and are Disoriented for 3  sec.  Any direct damaging attack will revive targets.  Turns off your attack when used.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11189, @locale_en,
  "Increases the armor and resistances given by your Frost Armor and Ice Armor spells by 15%.  In addition, gives your Frost Ward a 10% chance to reflect Frost spells and effects while active.",
  "Increases the armor and resistances given by your Frost Armor and Ice Armor spells by 15%.  In addition, gives your Frost Ward a 10% chance to reflect Frost spells and effects while active.",
  NULL,
  NULL,
  NULL
),

(11070, @locale_en,
  "Reduces the casting time of your Frostbolt spell by 0.1 sec.",
  "Reduces the casting time of your Frostbolt spell by 0.1 sec.",
  "Reduces the casting time of your Frostbolt spell by 0.1 sec.",
  "Reduces the casting time of your Frostbolt spell by 0.1 sec.",
  "Reduces the casting time of your Frostbolt spell by 0.1 sec."
),

(29438, @locale_en,
  "Reduces the mana cost and chance targets resist your Frost and Fire spells by 1%.",
  "Reduces the mana cost and chance targets resist your Frost and Fire spells by 1%.",
  "Reduces the mana cost and chance targets resist your Frost and Fire spells by 1%.",
  NULL,
  NULL
),

(11207, @locale_en,
  "Increases the critical strike damage bonus of your Frost spells by 20%.",
  "Increases the critical strike damage bonus of your Frost spells by 20%.",
  "Increases the critical strike damage bonus of your Frost spells by 20%.",
  "Increases the critical strike damage bonus of your Frost spells by 20%.",
  "Increases the critical strike damage bonus of your Frost spells by 20%."
),

(11071, @locale_en,
  "Gives your Chill effects a 5% chance to freeze the target for 5  sec.",
  "Gives your Chill effects a 5% chance to freeze the target for 5  sec.",
  "Gives your Chill effects a 5% chance to freeze the target for 5  sec.",
  NULL,
  NULL
),

(11165, @locale_en,
  "Reduces the cooldown of your Frost Nova spell by 2 sec.",
  "Reduces the cooldown of your Frost Nova spell by 2 sec.",
  NULL,
  NULL,
  NULL
),

(11175, @locale_en,
  "Increases the duration of your Chill effects by 1 sec and reduces the target's speed by an additional 4%.",
  "Increases the duration of your Chill effects by 1 sec and reduces the target's speed by an additional 4%.",
  "Increases the duration of your Chill effects by 1 sec and reduces the target's speed by an additional 4%.",
  NULL,
  NULL
),

(11151, @locale_en,
  "Increases the damage done by your Frost spells by 2%.",
  "Increases the damage done by your Frost spells by 2%.",
  "Increases the damage done by your Frost spells by 2%.",
  NULL,
  NULL
),

(12472, @locale_en,
  "Hastens your spellcasting, increasing spell casting speed by 20% and gives you 100% chance to avoid interruption caused by damage while casting.  Lasts 20  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11185, @locale_en,
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 30%.  Lasts 1.5  sec.",
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 30%.  Lasts 1.5  sec.",
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 30%.  Lasts 1.5  sec.",
  NULL,
  NULL
),

(16757, @locale_en,
  "Increases the range of your Frostbolt, Ice Lance and Blizzard spells and the radius of your Frost Nova and Cone of Cold spells by 10%.",
  "Increases the range of your Frostbolt, Ice Lance and Blizzard spells and the radius of your Frost Nova and Cone of Cold spells by 10%.",
  NULL,
  NULL,
  NULL
),

(11160, @locale_en,
  "Reduces the mana cost of your Frost spells by 5% and reduces the threat caused by your Frost spells by 4%.",
  "Reduces the mana cost of your Frost spells by 5% and reduces the threat caused by your Frost spells by 4%.",
  "Reduces the mana cost of your Frost spells by 5% and reduces the threat caused by your Frost spells by 4%.",
  NULL,
  NULL
),

(11170, @locale_en,
  "Increases the critical strike chance of all your spells against frozen targets by 10%.",
  "Increases the critical strike chance of all your spells against frozen targets by 10%.",
  "Increases the critical strike chance of all your spells against frozen targets by 10%.",
  "Increases the critical strike chance of all your spells against frozen targets by 10%.",
  "Increases the critical strike chance of all your spells against frozen targets by 10%."
),

(31667, @locale_en,
  "Reduces the damage taken by Frost and Fire effects by 2%.",
  "Reduces the damage taken by Frost and Fire effects by 2%.",
  "Reduces the damage taken by Frost and Fire effects by 2%.",
  NULL,
  NULL
),

(11958, @locale_en,
  "When activated, this spell finishes the cooldown on all Frost spells you recently cast.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11190, @locale_en,
  "Increases the damage dealt by your Cone of Cold spell by 15%.",
  "Increases the damage dealt by your Cone of Cold spell by 15%.",
  "Increases the damage dealt by your Cone of Cold spell by 15%.",
  NULL,
  NULL
),

(31670, @locale_en,
  "Reduces the cooldown of your Cone of Cold, Cold Snap, Ice Barrier and Ice Block spells by 10%.",
  "Reduces the cooldown of your Cone of Cold, Cold Snap, Ice Barrier and Ice Block spells by 10%.",
  NULL,
  NULL,
  NULL
),

(11180, @locale_en,
  "Gives your Frost damage spells a 20% chance to apply the Winter's Chill effect, which increases the chance a Frost spell will critically hit the target by 2% for 15  sec.  Stacks up to 5 times.",
  "Gives your Frost damage spells a 20% chance to apply the Winter's Chill effect, which increases the chance a Frost spell will critically hit the target by 2% for 15  sec.  Stacks up to 5 times.",
  "Gives your Frost damage spells a 20% chance to apply the Winter's Chill effect, which increases the chance a Frost spell will critically hit the target by 2% for 15  sec.  Stacks up to 5 times.",
  "Gives your Frost damage spells a 20% chance to apply the Winter's Chill effect, which increases the chance a Frost spell will critically hit the target by 2% for 15  sec.  Stacks up to 5 times.",
  "Gives your Frost damage spells a 20% chance to apply the Winter's Chill effect, which increases the chance a Frost spell will critically hit the target by 2% for 15  sec.  Stacks up to 5 times."
),

(11426, @locale_en,
  "Instantly shields you, absorbing 438 damage.  Lasts 1  min.  While the shield holds, spells will not be interrupted.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31674, @locale_en,
  "Increases all Frost damage you cause by 1% and reduces the chance melee and ranged attacks will hit you by 1%.",
  "Increases all Frost damage you cause by 1% and reduces the chance melee and ranged attacks will hit you by 1%.",
  "Increases all Frost damage you cause by 1% and reduces the chance melee and ranged attacks will hit you by 1%.",
  "Increases all Frost damage you cause by 1% and reduces the chance melee and ranged attacks will hit you by 1%.",
  "Increases all Frost damage you cause by 1% and reduces the chance melee and ranged attacks will hit you by 1%."
),

(31682, @locale_en,
  "Your Frostbolt spell gains an additional 2% of your bonus spell damage effects and an additional 1% chance to critically strike.",
  "Your Frostbolt spell gains an additional 2% of your bonus spell damage effects and an additional 1% chance to critically strike.",
  "Your Frostbolt spell gains an additional 2% of your bonus spell damage effects and an additional 1% chance to critically strike.",
  "Your Frostbolt spell gains an additional 2% of your bonus spell damage effects and an additional 1% chance to critically strike.",
  "Your Frostbolt spell gains an additional 2% of your bonus spell damage effects and an additional 1% chance to critically strike."
),

(31687, @locale_en,
  "Summon a Water Elemental to fight for the caster for 45  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- warlock
(18174, @locale_en,
  "Reduces the chance for enemies to resist your Affliction spells by 2%.",
  "Reduces the chance for enemies to resist your Affliction spells by 2%.",
  "Reduces the chance for enemies to resist your Affliction spells by 2%.",
  "Reduces the chance for enemies to resist your Affliction spells by 2%.",
  "Reduces the chance for enemies to resist your Affliction spells by 2%."
),

(17810, @locale_en,
  "Reduces the casting time of your Corruption spell by 0.4 sec.",
  "Reduces the casting time of your Corruption spell by 0.4 sec.",
  "Reduces the casting time of your Corruption spell by 0.4 sec.",
  "Reduces the casting time of your Corruption spell by 0.4 sec.",
  "Reduces the casting time of your Corruption spell by 0.4 sec."
),

(18179, @locale_en,
  "Increases the effect of your Curse of Weakness by 10%.",
  "Increases the effect of your Curse of Weakness by 10%.",
  NULL,
  NULL,
  NULL
),

(18213, @locale_en,
  "Returns 7% of your maximum mana if the target is killed by you while you drain its soul.  In addition, your Affliction spells generate 5% less threat.",
  "Returns 7% of your maximum mana if the target is killed by you while you drain its soul.  In addition, your Affliction spells generate 5% less threat.",
  NULL,
  NULL,
  NULL
),

(18182, @locale_en,
  "Increases the amount of Mana awarded by your Life Tap spell by 10%.",
  "Increases the amount of Mana awarded by your Life Tap spell by 10%.",
  NULL,
  NULL,
  NULL
),

(17804, @locale_en,
  "Increases the amount drained by your Drain Life spell by an additional 2% for each Affliction effect on the target, up to a maximum of 24% additional effect.",
  "Increases the amount drained by your Drain Life spell by an additional 2% for each Affliction effect on the target, up to a maximum of 24% additional effect.",
  NULL,
  NULL,
  NULL
),

(18827, @locale_en,
  "Increases the damage done by your Curse of Agony by 5%.",
  "Increases the damage done by your Curse of Agony by 5%.",
  NULL,
  NULL,
  NULL
),

(17783, @locale_en,
  "Gives you a 14% chance to avoid interruption caused by damage while channeling the Drain Life, Drain Mana, or Drain Soul spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while channeling the Drain Life, Drain Mana, or Drain Soul spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while channeling the Drain Life, Drain Mana, or Drain Soul spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while channeling the Drain Life, Drain Mana, or Drain Soul spell.",
  "Gives you a 14% chance to avoid interruption caused by damage while channeling the Drain Life, Drain Mana, or Drain Soul spell."
),

(18288, @locale_en,
  "Increases the effect of your next Curse of Doom or Curse of Agony by 50%, or your next Curse of Exhaustion by an additional 20%.  Lasts 30  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18218, @locale_en,
  "Increases the range of your Affliction spells by 10%.",
  "Increases the range of your Affliction spells by 10%.",
  NULL,
  NULL,
  NULL
),

(18094, @locale_en,
  "Gives your Corruption and Drain Life spells a 2% chance to cause you to enter a Shadow Trance state after damaging the opponent.  The Shadow Trance state reduces the casting time of your next Shadow Bolt spell by 100%.",
  "Gives your Corruption and Drain Life spells a 2% chance to cause you to enter a Shadow Trance state after damaging the opponent.  The Shadow Trance state reduces the casting time of your next Shadow Bolt spell by 100%.",
  NULL,
  NULL,
  NULL
),

(32381, @locale_en,
  "Your Corruption spell gains an additional 12% of your bonus spell damage effects.",
  "Your Corruption spell gains an additional 12% of your bonus spell damage effects.",
  "Your Corruption spell gains an additional 12% of your bonus spell damage effects.",
  NULL,
  NULL
),

(32385, @locale_en,
  "Your Corruption, Curse of Agony, Siphon Life and Seed of Corruption spells also cause the Shadow Embrace effect, which reduces physical damage caused by 1%.",
  "Your Corruption, Curse of Agony, Siphon Life and Seed of Corruption spells also cause the Shadow Embrace effect, which reduces physical damage caused by 1%.",
  "Your Corruption, Curse of Agony, Siphon Life and Seed of Corruption spells also cause the Shadow Embrace effect, which reduces physical damage caused by 1%.",
  "Your Corruption, Curse of Agony, Siphon Life and Seed of Corruption spells also cause the Shadow Embrace effect, which reduces physical damage caused by 1%.",
  "Your Corruption, Curse of Agony, Siphon Life and Seed of Corruption spells also cause the Shadow Embrace effect, which reduces physical damage caused by 1%."
),

(18265, @locale_en,
  "Transfers 15 health from the target to the caster every 3 sec.  Lasts 30  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18223, @locale_en,
  "Reduces the target's movement speed by 30% for 12  sec.  Only one Curse per Warlock can be active on any one target.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18271, @locale_en,
  "Increases the damage dealt or life drained by your Shadow spells by 2%.",
  "Increases the damage dealt or life drained by your Shadow spells by 2%.",
  "Increases the damage dealt or life drained by your Shadow spells by 2%.",
  "Increases the damage dealt or life drained by your Shadow spells by 2%.",
  "Increases the damage dealt or life drained by your Shadow spells by 2%."
),

(30060, @locale_en,
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your Affliction spells will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your Affliction spells will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your Affliction spells will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your Affliction spells will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your Affliction spells will be dispelled by an additional 6%."
),

(18220, @locale_en,
  "Drains 305 of your pet's Mana, returning 100% to you.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30054, @locale_en,
  "Reduces the casting time of your Howl of Terror spell by 0.8 sec.",
  "Reduces the casting time of your Howl of Terror spell by 0.8 sec.",
  NULL,
  NULL,
  NULL
),

(32477, @locale_en,
  "Increases the damage bonus effect of your Curse of the Elements spell by an additional 1%.",
  "Increases the damage bonus effect of your Curse of the Elements spell by an additional 1%.",
  "Increases the damage bonus effect of your Curse of the Elements spell by an additional 1%.",
  NULL,
  NULL
),

(30108, @locale_en,
  "Shadow energy slowly destroys the target, causing 660 damage over 18  sec.  In addition, if the Unstable Affliction is dispelled it will cause 990 damage to the dispeller and silence them for 5  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18692, @locale_en,
  "Increases the amount of Health restored by your Healthstone by 10%.",
  "Increases the amount of Health restored by your Healthstone by 10%.",
  NULL,
  NULL,
  NULL
),

(18694, @locale_en,
  "Increases the effect of your Imp's Firebolt, Fire Shield, and Blood Pact spells by 10%.",
  "Increases the effect of your Imp's Firebolt, Fire Shield, and Blood Pact spells by 10%.",
  "Increases the effect of your Imp's Firebolt, Fire Shield, and Blood Pact spells by 10%.",
  NULL,
  NULL
),

(18697, @locale_en,
  "Increases your total Stamina by 3% but reduces your total Spirit by 1%.",
  "Increases your total Stamina by 3% but reduces your total Spirit by 1%.",
  "Increases your total Stamina by 3% but reduces your total Spirit by 1%.",
  "Increases your total Stamina by 3% but reduces your total Spirit by 1%.",
  "Increases your total Stamina by 3% but reduces your total Spirit by 1%."
),

(18703, @locale_en,
  "Increases the amount of Health transferred by your Health Funnel spell by 10% and reduces the initial health cost by 10%.",
  "Increases the amount of Health transferred by your Health Funnel spell by 10% and reduces the initial health cost by 10%.",
  NULL,
  NULL,
  NULL
),

(18705, @locale_en,
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%.",
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%.",
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%.",
  NULL,
  NULL
),

(18731, @locale_en,
  "Increases the Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum mana by 1%.",
  "Increases the Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum mana by 1%.",
  "Increases the Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum mana by 1%.",
  NULL,
  NULL
),

(18754, @locale_en,
  "Increases the effect of your Succubus' Lash of Pain and Soothing Kiss spells by 10%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  "Increases the effect of your Succubus' Lash of Pain and Soothing Kiss spells by 10%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  "Increases the effect of your Succubus' Lash of Pain and Soothing Kiss spells by 10%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  NULL,
  NULL
),

(18708, @locale_en,
  "Your next Imp, Voidwalker, Succubus, Felhunter or Felguard Summon spell has its casting time reduced by 5.5 sec and its Mana cost reduced by 50%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18748, @locale_en,
  "Increases the Stamina of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health by 1%.",
  "Increases the Stamina of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health by 1%.",
  "Increases the Stamina of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health by 1%.",
  NULL,
  NULL
),

(30143, @locale_en,
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
  NULL,
  NULL
),

(18709, @locale_en,
  "Reduces the casting time of your Imp, Voidwalker, Succubus, Felhunter and Fel Guard Summoning spells by 2 sec and the Mana cost by 20%.",
  "Reduces the casting time of your Imp, Voidwalker, Succubus, Felhunter and Fel Guard Summoning spells by 2 sec and the Mana cost by 20%.",
  NULL,
  NULL,
  NULL
),

(18769, @locale_en,
  "Increases the damage done by your Voidwalker, Succubus, Felhunter and Felguard's melee attacks and your Imp's Firebolt by 4%.",
  "Increases the damage done by your Voidwalker, Succubus, Felhunter and Felguard's melee attacks and your Imp's Firebolt by 4%.",
  "Increases the damage done by your Voidwalker, Succubus, Felhunter and Felguard's melee attacks and your Imp's Firebolt by 4%.",
  "Increases the damage done by your Voidwalker, Succubus, Felhunter and Felguard's melee attacks and your Imp's Firebolt by 4%.",
  "Increases the damage done by your Voidwalker, Succubus, Felhunter and Felguard's melee attacks and your Imp's Firebolt by 4%."
),

(18821, @locale_en,
  "Reduces the Attack Speed and Casting Speed penalty of your Enslave Demon spell by 5% and reduces the resist chance by 5%.",
  "Reduces the Attack Speed and Casting Speed penalty of your Enslave Demon spell by 5% and reduces the resist chance by 5%.",
  NULL,
  NULL,
  NULL
),

(18788, @locale_en,
  "When activated, sacrifices your summoned demon to grant you an effect that lasts 30  mins.  The effect is canceled if any Demon is summoned.<br /><br />Imp: Increases your Fire damage by 15%.<br /><br />Voidwalker: Restores 2% of total health every 4 sec.<br /><br />Succubus: Increases your Shadow damage by 15%.<br /><br />Felhunter: Restores 3% of total mana every 4 sec.<br /><br />Felguard: Increases your Shadow damage by 10% and restores 2% of total mana every 4 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18767, @locale_en,
  "Increases the bonus Fire damage from Firestones and the Firestone effect by 15% and increases the spell critical strike rating bonus of your Spellstone by 15%.",
  "Increases the bonus Fire damage from Firestones and the Firestone effect by 15% and increases the spell critical strike rating bonus of your Spellstone by 15%.",
  NULL,
  NULL,
  NULL
),

(30326, @locale_en,
  "When you gain mana from Drain Mana or Life Tap spells, your pet gains 33% of the mana you gain.",
  "When you gain mana from Drain Mana or Life Tap spells, your pet gains 33% of the mana you gain.",
  "When you gain mana from Drain Mana or Life Tap spells, your pet gains 33% of the mana you gain.",
  NULL,
  NULL
),

(23785, @locale_en,
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Reduces threat caused by 4%.<br /><br />Voidwalker - Reduces physical damage taken by 2%.<br /><br />Succubus - Increases all damage caused by 2%.<br /><br />Felhunter - Increases all resistances by .2 per level.<br /><br />Felguard - Increases all damage caused by 1% and all resistances by .1 per level.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Reduces threat caused by 4%.<br /><br />Voidwalker - Reduces physical damage taken by 2%.<br /><br />Succubus - Increases all damage caused by 2%.<br /><br />Felhunter - Increases all resistances by .2 per level.<br /><br />Felguard - Increases all damage caused by 1% and all resistances by .1 per level.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Reduces threat caused by 4%.<br /><br />Voidwalker - Reduces physical damage taken by 2%.<br /><br />Succubus - Increases all damage caused by 2%.<br /><br />Felhunter - Increases all resistances by .2 per level.<br /><br />Felguard - Increases all damage caused by 1% and all resistances by .1 per level.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Reduces threat caused by 4%.<br /><br />Voidwalker - Reduces physical damage taken by 2%.<br /><br />Succubus - Increases all damage caused by 2%.<br /><br />Felhunter - Increases all resistances by .2 per level.<br /><br />Felguard - Increases all damage caused by 1% and all resistances by .1 per level.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Reduces threat caused by 4%.<br /><br />Voidwalker - Reduces physical damage taken by 2%.<br /><br />Succubus - Increases all damage caused by 2%.<br /><br />Felhunter - Increases all resistances by .2 per level.<br /><br />Felguard - Increases all damage caused by 1% and all resistances by .1 per level."
),

(30319, @locale_en,
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  NULL,
  NULL
),

(19028, @locale_en,
  "When active, 20% of all damage taken by the caster is taken by your Imp, Voidwalker, Succubus, Felhunter, Felguard, or enslaved demon instead.  That damage cannot be prevented.  In addition, both the demon and master will inflict 5% more damage.  Lasts as long as the demon is active and controlled.",
  NULL,
  NULL,
  NULL,
  NULL
),

(35691, @locale_en,
  "Increases your spell damage by an amount equal to 4% of the total of your active demon's Stamina plus Intellect.",
  "Increases your spell damage by an amount equal to 4% of the total of your active demon's Stamina plus Intellect.",
  "Increases your spell damage by an amount equal to 4% of the total of your active demon's Stamina plus Intellect.",
  NULL,
  NULL
),

(30242, @locale_en,
  "Increases melee and spell critical strike chance for you and your summoned demon by 1%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 1%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 1%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 1%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 1%."
),

(30146, @locale_en,
  "Summons a Felguard under the command of the Warlock.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17793, @locale_en,
  "Your Shadow Bolt critical strikes increase Shadow damage dealt to the target by 4% until 4 non-periodic damage sources are applied.  Effect lasts a maximum of 12  sec.",
  "Your Shadow Bolt critical strikes increase Shadow damage dealt to the target by 4% until 4 non-periodic damage sources are applied.  Effect lasts a maximum of 12  sec.",
  "Your Shadow Bolt critical strikes increase Shadow damage dealt to the target by 4% until 4 non-periodic damage sources are applied.  Effect lasts a maximum of 12  sec.",
  "Your Shadow Bolt critical strikes increase Shadow damage dealt to the target by 4% until 4 non-periodic damage sources are applied.  Effect lasts a maximum of 12  sec.",
  "Your Shadow Bolt critical strikes increase Shadow damage dealt to the target by 4% until 4 non-periodic damage sources are applied.  Effect lasts a maximum of 12  sec."
),

(17778, @locale_en,
  "Reduces the Mana cost of your Destruction spells by 1%.",
  "Reduces the Mana cost of your Destruction spells by 1%.",
  "Reduces the Mana cost of your Destruction spells by 1%.",
  "Reduces the Mana cost of your Destruction spells by 1%.",
  "Reduces the Mana cost of your Destruction spells by 1%."
),

(17788, @locale_en,
  "Reduces the casting time of your Shadow Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec."
),

(18119, @locale_en,
  "Gives your Destruction spells a 2% chance to daze the target for 5  sec.",
  "Gives your Destruction spells a 2% chance to daze the target for 5  sec.",
  "Gives your Destruction spells a 2% chance to daze the target for 5  sec.",
  "Gives your Destruction spells a 2% chance to daze the target for 5  sec.",
  "Gives your Destruction spells a 2% chance to daze the target for 5  sec."
),

(18126, @locale_en,
  "Reduces the casting time of your Imp's Firebolt spell by 0.25.2 sec.",
  "Reduces the casting time of your Imp's Firebolt spell by 0.25.2 sec.",
  NULL,
  NULL,
  NULL
),

(18128, @locale_en,
  "Reduces the cooldown of your Succubus' Lash of Pain spell by 3 sec.",
  "Reduces the cooldown of your Succubus' Lash of Pain spell by 3 sec.",
  NULL,
  NULL,
  NULL
),

(18130, @locale_en,
  "Increases the critical strike chance of your Destruction spells by 1%.",
  "Increases the critical strike chance of your Destruction spells by 1%.",
  "Increases the critical strike chance of your Destruction spells by 1%.",
  "Increases the critical strike chance of your Destruction spells by 1%.",
  "Increases the critical strike chance of your Destruction spells by 1%."
),

(17877, @locale_en,
  "Instantly blasts the target for 87 to 99 Shadow damage.  If the target dies within 5  sec of Shadowburn, and yields experience or honor, the caster gains a Soul Shard.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18135, @locale_en,
  "Gives you a 35% chance to resist interruption caused by damage while casting or channeling any Destruction spell.",
  "Gives you a 35% chance to resist interruption caused by damage while casting or channeling any Destruction spell.",
  NULL,
  NULL,
  NULL
),

(17917, @locale_en,
  "Increases the range of your Destruction spells by 10% and reduces threat caused by Destruction spells by 5%.",
  "Increases the range of your Destruction spells by 10% and reduces threat caused by Destruction spells by 5%.",
  NULL,
  NULL,
  NULL
),

(17927, @locale_en,
  "Increases the critical strike chance of your Searing Pain spell by 4%.",
  "Increases the critical strike chance of your Searing Pain spell by 4%.",
  "Increases the critical strike chance of your Searing Pain spell by 4%.",
  NULL,
  NULL
),

(18096, @locale_en,
  "Gives your Rain of Fire, Hellfire, and Soul Fire spells a 13% chance to stun the target for 3  sec.",
  "Gives your Rain of Fire, Hellfire, and Soul Fire spells a 13% chance to stun the target for 3  sec.",
  NULL,
  NULL,
  NULL
),

(17815, @locale_en,
  "Increases the initial damage of your Immolate spell by 5%.",
  "Increases the initial damage of your Immolate spell by 5%.",
  "Increases the initial damage of your Immolate spell by 5%.",
  "Increases the initial damage of your Immolate spell by 5%.",
  "Increases the initial damage of your Immolate spell by 5%."
),

(17959, @locale_en,
  "Increases the critical strike damage bonus of your Destruction spells by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30299, @locale_en,
  "After being hit with a Shadow or Fire spell, you have a 10% chance to become immune to Shadow and Fire spells for 4  sec.",
  "After being hit with a Shadow or Fire spell, you have a 10% chance to become immune to Shadow and Fire spells for 4  sec.",
  "After being hit with a Shadow or Fire spell, you have a 10% chance to become immune to Shadow and Fire spells for 4  sec.",
  NULL,
  NULL
),

(17954, @locale_en,
  "Increases the damage done by your Fire spells by 2% and reduces the cast time of your Incinerate spell by 2%.",
  "Increases the damage done by your Fire spells by 2% and reduces the cast time of your Incinerate spell by 2%.",
  "Increases the damage done by your Fire spells by 2% and reduces the cast time of your Incinerate spell by 2%.",
  "Increases the damage done by your Fire spells by 2% and reduces the cast time of your Incinerate spell by 2%.",
  "Increases the damage done by your Fire spells by 2% and reduces the cast time of your Incinerate spell by 2%."
),

(34935, @locale_en,
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8  sec and will not occur more than once every 8 seconds.",
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8  sec and will not occur more than once every 8 seconds.",
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8  sec and will not occur more than once every 8 seconds.",
  NULL,
  NULL
),

(17962, @locale_en,
  "Ignites a target that is already afflicted by your Immolate, dealing 240 to 306 Fire damage and consuming the Immolate spell.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30293, @locale_en,
  "Gives your Shadow Bolt, Shadowburn, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  "Gives your Shadow Bolt, Shadowburn, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  "Gives your Shadow Bolt, Shadowburn, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  NULL,
  NULL
),

(30288, @locale_en,
  "Your Shadow Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects."
),

(30283, @locale_en,
  "Shadowfury is unleashed, causing 343 to 407 Shadow damage and stunning all enemies within 8 yds for 2  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),


-- druid
(16814, @locale_en,
  "Reduces the cast time of your Wrath and Starfire spells by 0.1 sec.",
  "Reduces the cast time of your Wrath and Starfire spells by 0.1 sec.",
  "Reduces the cast time of your Wrath and Starfire spells by 0.1 sec.",
  "Reduces the cast time of your Wrath and Starfire spells by 0.1 sec.",
  "Reduces the cast time of your Wrath and Starfire spells by 0.1 sec."
),

(16689, @locale_en,
  "While active, any time an enemy strikes the caster they have a 35% chance to become afflicted by Entangling Roots (Rank 1).  Only useable outdoors.  1 charge.  Lasts 45  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17245, @locale_en,
  "Increases the chance for your Nature's Grasp to entangle an enemy by 15%.",
  "Increases the chance for your Nature's Grasp to entangle an enemy by 15%.",
  "Increases the chance for your Nature's Grasp to entangle an enemy by 15%.",
  "Increases the chance for your Nature's Grasp to entangle an enemy by 15%.",
  NULL
),

(16918, @locale_en,
  "Gives you a 40% chance to avoid interruption caused by damage while casting Entangling Roots and Cyclone.",
  "Gives you a 40% chance to avoid interruption caused by damage while casting Entangling Roots and Cyclone.",
  "Gives you a 40% chance to avoid interruption caused by damage while casting Entangling Roots and Cyclone.",
  NULL,
  NULL
),

(35363, @locale_en,
  "Increases the critical strike chance of your Wrath and Starfire spells by 2%.",
  "Increases the critical strike chance of your Wrath and Starfire spells by 2%.",
  NULL,
  NULL,
  NULL
),

(16821, @locale_en,
  "Increases the damage and critical strike chance of your Moonfire spell by 5%.",
  "Increases the damage and critical strike chance of your Moonfire spell by 5%.",
  NULL,
  NULL,
  NULL
),

(16836, @locale_en,
  "Increases damage caused by your Thorns and Entangling Roots spells by 25%.",
  "Increases damage caused by your Thorns and Entangling Roots spells by 25%.",
  "Increases damage caused by your Thorns and Entangling Roots spells by 25%.",
  NULL,
  NULL
),

(5570, @locale_en,
  "The enemy target is swarmed by insects, decreasing their chance to hit by 2% and causing 108 Nature damage over 12  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16819, @locale_en,
  "Increases the range of your Balance spells and Faerie Fire (Feral) ability by 10%.",
  "Increases the range of your Balance spells and Faerie Fire (Feral) ability by 10%.",
  NULL,
  NULL,
  NULL
),

(16909, @locale_en,
  "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%."
),

(16850, @locale_en,
  "Gives your Starfire spell a 5% chance to stun the target for 3  sec and increases the chance you'll resist spell interruption when casting your Wrath spell by 25%.",
  "Gives your Starfire spell a 5% chance to stun the target for 3  sec and increases the chance you'll resist spell interruption when casting your Wrath spell by 25%.",
  "Gives your Starfire spell a 5% chance to stun the target for 3  sec and increases the chance you'll resist spell interruption when casting your Wrath spell by 25%.",
  NULL,
  NULL
),

(33589, @locale_en,
  "Increases your spell damage and healing by 8% of your total Intellect.",
  "Increases your spell damage and healing by 8% of your total Intellect.",
  "Increases your spell damage and healing by 8% of your total Intellect.",
  NULL,
  NULL
),

(16880, @locale_en,
  "All spell criticals grace you with a blessing of nature, reducing the casting time of your next spell by 0.5 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16845, @locale_en,
  "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 3%.",
  "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 3%.",
  "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 3%.",
  NULL,
  NULL
),

(16896, @locale_en,
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%."
),

(33592, @locale_en,
  "Increases your chance to hit with all spells and reduces the chance you'll be hit by spells by 2%.",
  "Increases your chance to hit with all spells and reduces the chance you'll be hit by spells by 2%.",
  NULL,
  NULL,
  NULL
),

(33597, @locale_en,
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  NULL,
  NULL
),

(24858, @locale_en,
  "Shapeshift into Moonkin Form.  While in this form the armor contribution from items is increased by 400%, attack power is increased by 150% of your level and all party members within 30 yards have their spell critical chance increased by 5%.  Melee attacks in this form have a chance on hit to regenerate mana based on attack power.  The Moonkin can only cast Balance and Remove Curse spells while shapeshifted.<br /><br />The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33600, @locale_en,
  "Your Faerie Fire spell also increases the chance the target will be hit by melee and ranged attacks by 1%.",
  "Your Faerie Fire spell also increases the chance the target will be hit by melee and ranged attacks by 1%.",
  "Your Faerie Fire spell also increases the chance the target will be hit by melee and ranged attacks by 1%.",
  NULL,
  NULL
),

(33603, @locale_en,
  "Your Starfire spell gains an additional 4% and your Wrath gains an additional 2% of your bonus damage effects.",
  "Your Starfire spell gains an additional 4% and your Wrath gains an additional 2% of your bonus damage effects.",
  "Your Starfire spell gains an additional 4% and your Wrath gains an additional 2% of your bonus damage effects.",
  "Your Starfire spell gains an additional 4% and your Wrath gains an additional 2% of your bonus damage effects.",
  "Your Starfire spell gains an additional 4% and your Wrath gains an additional 2% of your bonus damage effects."
),

(33831, @locale_en,
  "Summons 3 treants to attack enemy targets for 30  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16934, @locale_en,
  "Reduces the cost of your Maul, Swipe, Claw, Rake and Mangle abilities by 1 Rage or Energy.",
  "Reduces the cost of your Maul, Swipe, Claw, Rake and Mangle abilities by 1 Rage or Energy.",
  "Reduces the cost of your Maul, Swipe, Claw, Rake and Mangle abilities by 1 Rage or Energy.",
  "Reduces the cost of your Maul, Swipe, Claw, Rake and Mangle abilities by 1 Rage or Energy.",
  "Reduces the cost of your Maul, Swipe, Claw, Rake and Mangle abilities by 1 Rage or Energy."
),

(16858, @locale_en,
  "Increases the attack power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%.",
  "Increases the attack power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%.",
  "Increases the attack power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%.",
  "Increases the attack power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%.",
  "Increases the attack power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%."
),

(16947, @locale_en,
  "Increases threat caused in Bear and Dire Bear Form by 5% and reduces the chance enemies have to detect you while Prowling.",
  "Increases threat caused in Bear and Dire Bear Form by 5% and reduces the chance enemies have to detect you while Prowling.",
  "Increases threat caused in Bear and Dire Bear Form by 5% and reduces the chance enemies have to detect you while Prowling.",
  NULL,
  NULL
),

(16940, @locale_en,
  "Increases the stun duration of your Bash and Pounce abilities by 0.5 sec.",
  "Increases the stun duration of your Bash and Pounce abilities by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(16929, @locale_en,
  "Increases your Armor contribution from items by 4%.",
  "Increases your Armor contribution from items by 4%.",
  "Increases your Armor contribution from items by 4%.",
  NULL,
  NULL
),

(17002, @locale_en,
  "Increases your movement speed by 15% while outdoors in Cat Form and increases your chance to dodge while in Cat Form, Bear Form and Dire Bear Form by 2%.",
  "Increases your movement speed by 15% while outdoors in Cat Form and increases your chance to dodge while in Cat Form, Bear Form and Dire Bear Form by 2%.",
  NULL,
  NULL,
  NULL
),

(16979, @locale_en,
  "Causes you to charge an enemy, immobilizing and interrupting any spell being cast for 4  sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16942, @locale_en,
  "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 2%.",
  "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 2%.",
  "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 2%.",
  NULL,
  NULL
),

(16966, @locale_en,
  "Reduces the energy cost of your Shred ability by 9 and the rage cost of your Lacerate ability by 1.",
  "Reduces the energy cost of your Shred ability by 9 and the rage cost of your Lacerate ability by 1.",
  NULL,
  NULL,
  NULL
),

(16972, @locale_en,
  "Increases your melee attack power in Cat, Bear, Dire Bear and Moonkin Forms by 50% of your level.",
  "Increases your melee attack power in Cat, Bear, Dire Bear and Moonkin Forms by 50% of your level.",
  "Increases your melee attack power in Cat, Bear, Dire Bear and Moonkin Forms by 50% of your level.",
  NULL,
  NULL
),

(37116, @locale_en,
  "Gives you a 50% chance to gain an additional 5 Rage anytime you get a critical strike while in Bear and Dire Bear Form and your critical strikes from Cat Form abilities that add combo points  have a 50% chance to add an additional combo point.",
  "Gives you a 50% chance to gain an additional 5 Rage anytime you get a critical strike while in Bear and Dire Bear Form and your critical strikes from Cat Form abilities that add combo points  have a 50% chance to add an additional combo point.",
  NULL,
  NULL,
  NULL
),

(16998, @locale_en,
  "Increases the damage caused by your Claw, Rake, and Mangle (Cat) abilities by 10%.",
  "Increases the damage caused by your Claw, Rake, and Mangle (Cat) abilities by 10%.",
  NULL,
  NULL,
  NULL
),

(16857, @locale_en,
  "Decrease the armor of the target by 175 for 40  sec.  While affected, the target cannot stealth or turn invisible.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33872, @locale_en,
  "Increases your healing spells by up to 50% of your Agility, and increases healing done to you by 10% while in Cat form.",
  "Increases your healing spells by up to 50% of your Agility, and increases healing done to you by 10% while in Cat form.",
  NULL,
  NULL,
  NULL
),

(17003, @locale_en,
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your attack power is increased by 2%."
),

(33853, @locale_en,
  "Increases all attributes by 1% and reduces the chance you'll be critically hit by melee attacks by 1%.",
  "Increases all attributes by 1% and reduces the chance you'll be critically hit by melee attacks by 1%.",
  "Increases all attributes by 1% and reduces the chance you'll be critically hit by melee attacks by 1%.",
  NULL,
  NULL
),

(33851, @locale_en,
  "Increases your chance to resist Stun and Fear mechanics by 5%.",
  "Increases your chance to resist Stun and Fear mechanics by 5%.",
  "Increases your chance to resist Stun and Fear mechanics by 5%.",
  NULL,
  NULL
),

(17007, @locale_en,
  "While in Cat, Bear or Dire Bear Form, the Leader of the Pack increases ranged and melee critical chance of all party members within 45 yards by 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34297, @locale_en,
  "Your Leader of the Pack ability also causes affected targets to have a 100% chance to heal themselves for 2% of their total health when they critically hit with a melee or ranged attack.  The healing effect cannot occur more than once every 6 sec.",
  "Your Leader of the Pack ability also causes affected targets to have a 100% chance to heal themselves for 2% of their total health when they critically hit with a melee or ranged attack.  The healing effect cannot occur more than once every 6 sec.",
  NULL,
  NULL,
  NULL
),

(33859, @locale_en,
  "While in Cat Form, Bear Form, or Dire Bear Form, increases your damage from melee critical strikes by 2% and your chance to avoid area effect attacks by 3%.",
  "While in Cat Form, Bear Form, or Dire Bear Form, increases your damage from melee critical strikes by 2% and your chance to avoid area effect attacks by 3%.",
  "While in Cat Form, Bear Form, or Dire Bear Form, increases your damage from melee critical strikes by 2% and your chance to avoid area effect attacks by 3%.",
  "While in Cat Form, Bear Form, or Dire Bear Form, increases your damage from melee critical strikes by 2% and your chance to avoid area effect attacks by 3%.",
  "While in Cat Form, Bear Form, or Dire Bear Form, increases your damage from melee critical strikes by 2% and your chance to avoid area effect attacks by 3%."
),

(33917, @locale_en,
  "Mangle the target, inflicting damage and causing the target to take additional damage from bleed effects for 12  sec.  This ability can be used in Cat Form or Dire Bear Form.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17050, @locale_en,
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%.",
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%.",
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%.",
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%.",
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%."
),

(17056, @locale_en,
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form."
),

(17069, @locale_en,
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%."
),

(17063, @locale_en,
  "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.",
  "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells."
),

(16833, @locale_en,
  "Reduces the mana cost of all shapeshifting by 10%.",
  "Reduces the mana cost of all shapeshifting by 10%.",
  "Reduces the mana cost of all shapeshifting by 10%.",
  NULL,
  NULL
),

(17106, @locale_en,
  "Allows 10% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  "Allows 10% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  "Allows 10% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  NULL,
  NULL
),

(17118, @locale_en,
  "Reduces the threat generated by your spells by 4% and reduces the chance your spells will be dispelled by 6%.",
  "Reduces the threat generated by your spells by 4% and reduces the chance your spells will be dispelled by 6%.",
  "Reduces the threat generated by your spells by 4% and reduces the chance your spells will be dispelled by 6%.",
  "Reduces the threat generated by your spells by 4% and reduces the chance your spells will be dispelled by 6%.",
  "Reduces the threat generated by your spells by 4% and reduces the chance your spells will be dispelled by 6%."
),

(16864, @locale_en,
  "Imbues the Druid with natural energy.  Each of the Druid's melee attacks has a chance of causing the caster to enter a Clearcasting state.  The Clearcasting state reduces the Mana, Rage or Energy cost of your next damage or healing spell or offensive ability by 100%.  Lasts 30  mins.",
  NULL,
  NULL,
  NULL,
  NULL
),

(24968, @locale_en,
  "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%."
),

(17111, @locale_en,
  "Increases the effect of your Rejuvenation spell by 5%.",
  "Increases the effect of your Rejuvenation spell by 5%.",
  "Increases the effect of your Rejuvenation spell by 5%.",
  NULL,
  NULL
),

(17116, @locale_en,
  "When activated, your next Nature spell becomes an instant cast spell.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17104, @locale_en,
  "Increases the effect of all healing spells by 2%.",
  "Increases the effect of all healing spells by 2%.",
  "Increases the effect of all healing spells by 2%.",
  "Increases the effect of all healing spells by 2%.",
  "Increases the effect of all healing spells by 2%."
),

(17123, @locale_en,
  "Reduces threat caused by Tranquility by 50%.",
  "Reduces threat caused by Tranquility by 50%.",
  NULL,
  NULL,
  NULL
),

(33879, @locale_en,
  "Your Healing Touch spell gains an additional 10% of your bonus healing effects.",
  "Your Healing Touch spell gains an additional 10% of your bonus healing effects.",
  NULL,
  NULL,
  NULL
),

(17074, @locale_en,
  "Increases the critical effect chance of your Regrowth spell by 10%.",
  "Increases the critical effect chance of your Regrowth spell by 10%.",
  "Increases the critical effect chance of your Regrowth spell by 10%.",
  "Increases the critical effect chance of your Regrowth spell by 10%.",
  "Increases the critical effect chance of your Regrowth spell by 10%."
),

(34151, @locale_en,
  "Increases your total Spirit by 5%.",
  "Increases your total Spirit by 5%.",
  "Increases your total Spirit by 5%.",
  NULL,
  NULL
),

(18562, @locale_en,
  "Consumes a Rejuvenation or Regrowth effect on a friendly target to instantly heal them an amount equal to 12 sec. of Rejuvenation or 18 sec. of Regrowth.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33881, @locale_en,
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8  sec.",
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8  sec.",
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8  sec.",
  NULL,
  NULL
),

(33886, @locale_en,
  "The bonus healing effects of your healing over time spells is increased by 4%.",
  "The bonus healing effects of your healing over time spells is increased by 4%.",
  "The bonus healing effects of your healing over time spells is increased by 4%.",
  "The bonus healing effects of your healing over time spells is increased by 4%.",
  "The bonus healing effects of your healing over time spells is increased by 4%."
),

(33891, @locale_en,
  "Shapeshift into the Tree of Life.  While in this form you increase healing received by 25% of your total Spirit for all party members within 45 yards, your movement speed is reduced by 20%, and you can only cast Swiftmend, Innervate, Nature's Swiftness, Rebirth, Barkskin, poison removing and healing over time spells, but the mana cost of these spells is reduced by 20%.<br /><br />The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.",
  NULL,
  NULL,
  NULL,
  NULL
);

/************ ARROW DEPENDENCIES *************/
INSERT INTO `dependency`(`tree_id`, `tier_pos`, `talent_pos`, `alignment`, `justify`, `combined`, `range`, `dependency`) VALUES
(@warrior_tree_1, 3, 3, "vertical", NULL, 0, 0, 16493),
(@warrior_tree_1, 5, 2, "vertical", NULL, 0, 2, 12294),
(@warrior_tree_1, 7, 2, "vertical", NULL, 0, 1, 35446),
(@warrior_tree_2, 4, 3, "vertical", NULL, 0, 2, 12319),
(@warrior_tree_2, 5, 2, "vertical", NULL, 0, 2, 23881),
(@warrior_tree_2, 7, 2, "vertical", NULL, 0, 2, 29801),
(@warrior_tree_3, 2, 2, "vertical", NULL, 1, 1, 12945),
(@warrior_tree_3, 5, 2, "vertical", NULL, 0, 2, 23922),

(@paladin_tree_1, 4, 2, "vertical", NULL, 0, 1, 20216),
(@paladin_tree_1, 5, 2, "vertical", NULL, 0, 2, 20473),
(@paladin_tree_2, 1, 3, "vertical", NULL, 0, 2, 20148),
(@paladin_tree_2, 5, 2, "vertical", NULL, 0, 2, 20925),
(@paladin_tree_2, 7, 2, "vertical", NULL, 0, 2, 31935),
(@paladin_tree_2, 7, 2, "horizontal", "left", 0, 1, 41021),
(@paladin_tree_3, 3, 2, "vertical", NULL, 0, 3, 20049),
(@paladin_tree_3, 5, 3, "horizontal", "right", 0, 1, 31869),
(@paladin_tree_3, 7, 2, "vertical", NULL, 0, 1, 31879),

(@hunter_tree_1, 4, 3, "vertical", NULL, 0, 2, 19621),
(@hunter_tree_1, 5, 2, "vertical", NULL, 0, 2, 19574),
(@hunter_tree_1, 7, 2, "vertical", NULL, 0, 2, 34692),
(@hunter_tree_2, 3, 3, "vertical", NULL, 0, 1, 19485),
(@hunter_tree_2, 5, 2, "vertical", NULL, 0, 2, 19506),
(@hunter_tree_2, 5, 3, "vertical", NULL, 0, 2, 35104),
(@hunter_tree_2, 8, 2, "vertical", NULL, 0, 1, 34490),
(@hunter_tree_3, 3, 3, "vertical", NULL, 0, 2, 19306),
(@hunter_tree_3, 5, 2, "vertical", NULL, 0, 2, 19386),
(@hunter_tree_3, 6, 3, "vertical", NULL, 0, 1, 34500),
(@hunter_tree_3, 8, 2, "vertical", NULL, 0, 1, 23989),

(@rogue_tree_1, 1, 3, "vertical", NULL, 0, 2, 14128),
(@rogue_tree_1, 5, 2, "vertical", NULL, 0, 1, 14186),
(@rogue_tree_1, 7, 2, "vertical", NULL, 0, 2, 1329),
(@rogue_tree_2, 1, 3, "vertical", NULL, 0, 2, 13715),
(@rogue_tree_2, 2, 2, "vertical", NULL, 0, 1, 14251),
(@rogue_tree_2, 5, 2, "vertical", NULL, 0, 1, 30919),
(@rogue_tree_2, 7, 2, "vertical", NULL, 0, 2, 32601),
(@rogue_tree_3, 4, 4, "vertical", NULL, 1, 1, 16511),
(@rogue_tree_3, 4, 3, "plain", "right", 0, 1, 16511),
(@rogue_tree_3, 5, 2, "vertical", NULL, 0, 2, 14183),
(@rogue_tree_3, 7, 2, "vertical", NULL, 0, 1, 31216),

(@priest_tree_1, 3, 3, "vertical", NULL, 0, 2, 14752),
(@priest_tree_1, 5, 3, "horizontal", "right", 0, 1, 33174),
(@priest_tree_1, 5, 2, "vertical", NULL, 0, 2, 10060),
(@priest_tree_2, 2, 3, "vertical", NULL, 0, 2, 14909),
(@priest_tree_2, 5, 2, "vertical", NULL, 0, 2, 724),
(@priest_tree_3, 3, 1, "vertical", NULL, 0, 2, 15487),
(@priest_tree_3, 5, 2, "horizontal", "right", 0, 1, 27839),
(@priest_tree_3, 5, 2, "vertical", NULL, 0, 2, 15473),
(@priest_tree_3, 7, 2, "vertical", NULL, 0, 2, 34914),

(@shaman_tree_1, 3, 3, "vertical", NULL, 0, 3, 16578),
(@shaman_tree_1, 5, 2, "vertical", NULL, 0, 2, 16166),
(@shaman_tree_1, 8, 2, "vertical", NULL, 0, 1, 30706),
(@shaman_tree_2, 2, 2, "vertical", NULL, 0, 2, 16256),
(@shaman_tree_2, 5, 2, "vertical", NULL, 0, 2, 30798),
(@shaman_tree_2, 5, 3, "vertical", NULL, 0, 1, 17364),
(@shaman_tree_3, 4, 2, "vertical", NULL, 0, 3, 16190),
(@shaman_tree_3, 8, 2, "vertical", NULL, 0, 1, 974),

(@mage_tree_1, 2, 3, "vertical", NULL, 0, 4, 31571),
(@mage_tree_1, 5, 2, "vertical", NULL, 0, 1, 15058),
(@mage_tree_1, 6, 2, "vertical", NULL, 0, 1, 12042),
(@mage_tree_2, 3, 3, "vertical", NULL, 0, 2, 11113),
(@mage_tree_2, 5, 2, "vertical", NULL, 0, 2, 11129),
(@mage_tree_2, 7, 2, "vertical", NULL, 0, 2, 31661),
(@mage_tree_3, 2, 3, "vertical", NULL, 0, 2, 11170),
(@mage_tree_3, 5, 2, "vertical", NULL, 0, 2, 11426),

(@warlock_tree_1, 3, 3, "vertical", NULL, 0, 2, 18223),
(@warlock_tree_1, 5, 2, "vertical", NULL, 0, 1, 18271),
(@warlock_tree_1, 7, 2, "vertical", NULL, 0, 2, 30108),
(@warlock_tree_2, 3, 2, "vertical", NULL, 0, 1, 18709),
(@warlock_tree_2, 4, 3, "vertical", NULL, 0, 2, 23785),
(@warlock_tree_2, 5, 2, "vertical", NULL, 1, 2, 19028),
(@warlock_tree_3, 3, 3, "vertical", NULL, 0, 2, 17959),
(@warlock_tree_3, 4, 1, "vertical", NULL, 0, 1, 18096),
(@warlock_tree_3, 5, 2, "vertical", NULL, 0, 2, 17962),
(@warlock_tree_3, 8, 2, "vertical", NULL, 0, 1, 30283),

(@druid_tree_1, 2, 2, "vertical", NULL, 0, 2, 16909),
(@druid_tree_1, 5, 2, "vertical", NULL, 1, 1, 16896),
(@druid_tree_2, 3, 3, "vertical", NULL, 1, 1, 37116),
(@druid_tree_2, 4, 2, "vertical", NULL, 0, 2, 17003),
(@druid_tree_2, 7, 2, "vertical", NULL, 0, 2, 33917),
(@druid_tree_2, 7, 2, "horizontal", "right", 0, 1, 34297),
(@druid_tree_3, 3, 1, "vertical", NULL, 0, 2, 17116),
(@druid_tree_3, 4, 3, "vertical", NULL, 0, 2, 17074),
(@druid_tree_3, 5, 2, "vertical", NULL, 0, 2, 18562),
(@druid_tree_3, 8, 2, "vertical", NULL, 0, 1, 33891);
