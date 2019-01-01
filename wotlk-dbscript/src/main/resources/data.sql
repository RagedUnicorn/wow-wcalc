/**
* @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
* @copyright Copyright (c) 2017
*
* Data based on wotlk patch 3.3.5
*/

/************ DEFINING VARIABLES ************/
-- set locale english
SET @locale_en := "en";

-- class id's
SET @warrior_id     := 1;
SET @paladin_id     := 2;
SET @hunter_id      := 3;
SET @rogue_id       := 4;
SET @priest_id      := 5;
SET @deathknight_id := 6;
SET @shaman_id      := 7;
SET @mage_id        := 8;
SET @warlock_id     := 9;
SET @druid_id       := 10;

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

SET @deathknight_tree_1 := 16;
SET @deathknight_tree_2 := 17;
SET @deathknight_tree_3 := 18;

SET @shaman_tree_1      := 19;
SET @shaman_tree_2      := 20;
SET @shaman_tree_3      := 21;

SET @mage_tree_1        := 22;
SET @mage_tree_2        := 23;
SET @mage_tree_3        := 24;

SET @warlock_tree_1     := 25;
SET @warlock_tree_2     := 26;
SET @warlock_tree_3     := 27;

SET @druid_tree_1       := 28;
SET @druid_tree_2       := 29;
SET @druid_tree_3       := 30;

-- iterators
SET @tree     := 1;
SET @tree_id  := 0;

INSERT INTO `expansion`(`expansion`, `expansion_short`) VALUES
("Wrath of the Lich King", "wotlk");

INSERT INTO `class`(`id`, `class_name`) VALUES
(@warrior_id, "warrior"),
(@paladin_id, "paladin"),
(@hunter_id, "hunter"),
(@rogue_id, "rogue"),
(@priest_id, "priest"),
(@deathknight_id, "deathknight"),
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
-- deathknight
(@deathknight_tree_1, @deathknight_id, "blood", @tree + 0),
(@deathknight_tree_2, @deathknight_id, "frost", @tree + 1),
(@deathknight_tree_3, @deathknight_id, "unholy", @tree + 2),
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
(12286, @tree_id + 1, "Improved Rend", "ability_gouge", 0, 2, 2, NULL),
(12285, @tree_id + 1, "Improved Charge", "ability_warrior_charge", 1, 0, 2, NULL),
(12300, @tree_id + 1, "Iron Will", "spell_magic_magearmor", 1, 1, 3, NULL),
(12295, @tree_id + 1, "Tactical Mastery", "spell_nature_enchantarmor", 1, 2, 3, NULL),
(12290, @tree_id + 1, "Improved Overpower", "inv_sword_05", 2, 0, 2, NULL),
(12296, @tree_id + 1, "Anger Management", "spell_holy_blessingofstamina", 2, 1, 1, NULL),
(16493, @tree_id + 1, "Impale", "ability_searingarrow", 2, 2, 2, NULL),
(12834, @tree_id + 1, "Deep Wounds", "ability_backstab", 2, 3, 3, 16493),
(12163, @tree_id + 1, "Two-Handed Weapon Specialization", "inv_axe_09", 3, 1, 3, NULL),
(56636, @tree_id + 1, "Taste for Blood", "ability_rogue_hungerforblood", 3, 2, 3, NULL),
(12700, @tree_id + 1, "Poleaxe Specialization", "inv_axe_06", 4, 0, 5, NULL),
(12328, @tree_id + 1, "Sweeping Strikes", "ability_rogue_slicedice", 4, 1, 1, NULL),
(12284, @tree_id + 1, "Mace Specialization", "inv_mace_01", 4, 2, 5, NULL),
(12281, @tree_id + 1, "Sword Specialization", "inv_sword_27", 4, 3, 5, NULL),
(20504, @tree_id + 1, "Weapon Mastery", "ability_warrior_weaponmastery", 5, 0, 2, NULL),
(12289, @tree_id + 1, "Improved Hamstring", "ability_shockwave", 5, 2, 3, NULL),
(46854, @tree_id + 1, "Trauma", "ability_warrior_bloodnova", 5, 3, 2, NULL),
(29834, @tree_id + 1, "Second Wind", "ability_hunter_harass", 6, 0, 2, NULL),
(12294, @tree_id + 1, "Mortal Strike", "ability_warrior_savageblow", 6, 1, 1, 12328),
(46865, @tree_id + 1, "Strength of Arms", "ability_warrior_offensivestance", 6, 2, 2, NULL),
(12862, @tree_id + 1, "Improved Slam", "ability_warrior_decisivestrike", 6, 3, 2, NULL),
(64976, @tree_id + 1, "Juggernaut", "ability_warrior_bullrush", 7, 0, 1, NULL),
(35446, @tree_id + 1, "Improved Mortal Strike", "ability_warrior_savageblow", 7, 1, 3, 12294),
(46859, @tree_id + 1, "Unrelenting Assault", "ability_warrior_unrelentingassault", 7, 2, 2, NULL),
(29723, @tree_id + 1, "Sudden Death", "ability_warrior_improveddisciplines", 8, 0, 3, NULL),
(29623, @tree_id + 1, "Endless Rage", "ability_warrior_endlessrage", 8, 1, 1, NULL),
(29836, @tree_id + 1, "Blood Frenzy", "ability_warrior_bloodfrenzy", 8, 2, 2, NULL),
(46867, @tree_id + 1, "Wrecking Crew", "ability_warrior_trauma", 9, 1, 5, NULL),
(46924, @tree_id + 1, "Bladestorm", "ability_warrior_bladestorm", 10, 1, 1, NULL),
-- fury
(61216, @tree_id + 2, "Armored to the Teeth", "inv_shoulder_22", 0, 0, 3, NULL),
(12321, @tree_id + 2, "Booming Voice", "spell_nature_purge", 0, 1, 2, NULL),
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
(29590, @tree_id + 2, "Precision", "ability_marksmanship", 4, 0, 3, NULL),
(12292, @tree_id + 2, "Death Wish", "spell_shadow_deathpact", 4, 1, 1, NULL),
(29888, @tree_id + 2, "Improved Intercept", "ability_rogue_sprint", 4, 2, 2, NULL),
(20500, @tree_id + 2, "Improved Berserker Rage", "spell_nature_ancestralguardian", 5, 0, 2, NULL),
(12319, @tree_id + 2, "Flurry", "ability_ghoulfrenzy", 5, 2, 5, NULL),
(46908, @tree_id + 2, "Intensify Rage", "ability_warrior_endlessrage", 6, 0, 3, NULL),
(23881, @tree_id + 2, "Bloodthirst", "spell_nature_bloodlust", 6, 1, 1, 12292),
(29721, @tree_id + 2, "Improved Whirlwind", "ability_whirlwind", 6, 3, 2, NULL),
(46910, @tree_id + 2, "Furious Attacks", "ability_warrior_furiousresolve", 7, 0, 2, NULL),
(29759, @tree_id + 2, "Improved Berserker Stance", "ability_racial_avatar", 7, 3, 5, NULL),
(60970, @tree_id + 2, "Heroic Fury", "ability_heroicleap", 8, 0, 1, NULL),
(29801, @tree_id + 2, "Rampage", "ability_warrior_rampage", 8, 1, 1, 23881),
(46913, @tree_id + 2, "Bloodsurge", "ability_warrior_bloodsurge", 8, 2, 3, 23881),
(56927, @tree_id + 2, "Unending Fury", "ability_warrior_intensifyrage", 9, 1, 5, NULL),
(46917, @tree_id + 2, "Titan's Grip", "ability_warrior_titansgrip", 10, 1, 1, NULL),
-- protection
(12301, @tree_id + 3, "Improved Bloodrage", "ability_racial_bloodrage", 0, 0, 2, NULL),
(12298, @tree_id + 3, "Shield Specialization", "inv_shield_06", 0, 1, 5, NULL),
(12287, @tree_id + 3, "Improved Thunder Clap", "ability_thunderclap", 0, 2, 3, NULL),
(50685, @tree_id + 3, "Incite", "ability_warrior_incite", 1, 1, 3, NULL),
(12297, @tree_id + 3, "Anticipation", "spell_nature_mirrorimage", 1, 2, 5, NULL),
(12975, @tree_id + 3, "Last Stand", "spell_holy_ashestoashes", 2, 0, 1, NULL),
(12797, @tree_id + 3, "Improved Revenge", "ability_warrior_revenge", 2, 1, 2, NULL),
(29598, @tree_id + 3, "Shield Mastery", "ability_warrior_shieldmastery", 2, 2, 2, NULL),
(12299, @tree_id + 3, "Toughness", "spell_holy_devotion", 2, 3, 5, NULL),
(59088, @tree_id + 3, "Improved Spell Reflection", "ability_warrior_shieldreflection", 3, 0, 2, NULL),
(12313, @tree_id + 3, "Improved Disarm", "ability_warrior_disarm", 3, 1, 2, NULL),
(12308, @tree_id + 3, "Puncture", "ability_warrior_sunder", 3, 2, 3, NULL),
(12312, @tree_id + 3, "Improved Disciplines", "ability_warrior_shieldwall", 4, 0, 2, NULL),
(12809, @tree_id + 3, "Concussion Blow", "ability_thunderbolt", 4, 1, 1, NULL),
(12311, @tree_id + 3, "Gag Order", "ability_warrior_shieldbash", 4, 2, 2, NULL),
(16538, @tree_id + 3, "One-Handed Weapon Specialization", "inv_sword_20", 5, 2, 5, NULL),
(29593, @tree_id + 3, "Improved Defensive Stance", "ability_warrior_defensivestance", 6, 0, 2, NULL),
(50720, @tree_id + 3, "Vigilance", "ability_warrior_vigilance", 6, 1, 1, 12809),
(29787, @tree_id + 3, "Focused Rage", "ability_warrior_focusedrage", 6, 2, 3, NULL),
(29140, @tree_id + 3, "Vitality", "inv_helmet_21", 7, 1, 3, NULL),
(46945, @tree_id + 3, "Safeguard", "ability_warrior_safeguard", 7, 2, 2, NULL),
(57499, @tree_id + 3, "Warbringer", "ability_warrior_warbringer", 8, 0, 1, NULL),
(20243, @tree_id + 3, "Devastate", "inv_sword_11", 8, 1, 1, NULL),
(47294, @tree_id + 3, "Critical Block", "ability_warrior_criticalblock", 8, 2, 3, NULL),
(46951, @tree_id + 3, "Sword and Board", "ability_warrior_swordandboard", 9, 1, 3, 20243),
(58872, @tree_id + 3, "Damage Shield", "inv_shield_31", 9, 2, 2, NULL),
(46968, @tree_id + 3, "Shockwave", "ability_warrior_shockwave", 10, 1, 1, NULL),
-- holy
(20205, @tree_id + 4, "Spiritual Focus", "spell_arcane_blink", 0, 1, 5, NULL),
(20224, @tree_id + 4, "Seals of the Pure", "ability_thunderbolt", 0, 2, 5, NULL),
(20237, @tree_id + 4, "Healing Light", "spell_holy_holybolt", 1, 0, 3, NULL),
(20257, @tree_id + 4, "Divine Intellect", "spell_nature_sleep", 1, 1, 5, NULL),
(9453, @tree_id + 4, "Unyielding Faith", "spell_holy_unyieldingfaith", 1, 2, 2, NULL),
(31821, @tree_id + 4, "Aura Mastery", "spell_holy_auramastery", 2, 0, 1, NULL),
(20210, @tree_id + 4, "Illumination", "spell_holy_greaterheal", 2, 1, 5, NULL),
(20234, @tree_id + 4, "Improved Lay on Hands", "spell_holy_layonhands", 2, 2, 2, NULL),
(20254, @tree_id + 4, "Improved Concentration Aura", "spell_holy_mindsooth", 3, 0, 3, NULL),
(20244, @tree_id + 4, "Improved Blessing of Wisdom", "spell_holy_sealofwisdom", 3, 2, 2, NULL),
(53660, @tree_id + 4, "Blessed Hands", "ability_paladin_blessedhands", 3, 3, 2, NULL),
(31822, @tree_id + 4, "Pure of Heart", "spell_holy_pureofheart", 4, 0, 2, NULL),
(20216, @tree_id + 4, "Divine Favor", "spell_holy_heal", 4, 1, 1, 20210),
(20359, @tree_id + 4, "Sanctified Light", "spell_holy_healingaura", 4, 2, 3, NULL),
(31825, @tree_id + 4, "Purifying Power", "spell_holy_purifyingpower", 5, 0, 2, NULL),
(5923, @tree_id + 4, "Holy Power", "spell_holy_power", 5, 2, 5, NULL),
(31833, @tree_id + 4, "Light's Grace", "spell_holy_lightsgrace", 6, 0, 3, NULL),
(20473, @tree_id + 4, "Holy Shock", "spell_holy_searinglight", 6, 1, 1, 20216),
(31828, @tree_id + 4, "Blessed Life", "spell_holy_blessedlife", 6, 2, 3, NULL),
(53551, @tree_id + 4, "Sacred Cleansing", "ability_paladin_sacredcleansing", 7, 0, 3, NULL),
(31837, @tree_id + 4, "Holy Guidance", "spell_holy_holyguidance", 7, 2, 5, NULL),
(31842, @tree_id + 4, "Divine Illumination", "spell_holy_divineillumination", 8, 0, 1, NULL),
(53671, @tree_id + 4, "Judgements of the Pure", "ability_paladin_judgementofthepure", 8, 2, 5, NULL),
(53569, @tree_id + 4, "Infusion of Light", "ability_paladin_infusionoflight", 9, 1, 2, 20473),
(53556, @tree_id + 4, "Enlightened Judgements", "ability_paladin_enlightenedjudgements", 9, 2, 2, NULL),
(53563, @tree_id + 4, "Beacon of Light", "ability_paladin_beaconoflight", 10, 1, 1, NULL),
-- protection
(63646, @tree_id + 5, "Divinity", "spell_holy_blindingheal", 0, 1, 5, NULL),
(20262, @tree_id + 5, "Divine Strength", "ability_golemthunderclap", 0, 2, 5, NULL),
(31844, @tree_id + 5, "Stoicism", "spell_holy_stoicism", 1, 0, 3, NULL),
(20174, @tree_id + 5, "Guardian's Favor", "spell_holy_sealofprotection", 1, 1, 2, NULL),
(20096, @tree_id + 5, "Anticipation", "spell_magic_lesserinvisibilty", 1, 2, 5, NULL),
(64205, @tree_id + 5, "Divine Sacrifice", "spell_holy_powerwordbarrier", 2, 0, 1, NULL),
(20468, @tree_id + 5, "Improved Righteous Fury", "spell_holy_sealoffury", 2, 1, 3, NULL),
(20143, @tree_id + 5, "Toughness", "spell_holy_devotion", 2, 2, 5, NULL),
(53527, @tree_id + 5, "Divine Guardian", "spell_holy_powerwordbarrier", 3, 0, 2, NULL),
(20487, @tree_id + 5, "Improved Hammer of Justice", "spell_holy_sealofmight", 3, 1, 2, NULL),
(20138, @tree_id + 5, "Improved Devotion Aura", "spell_holy_devotionaura", 3, 2, 3, NULL),
(20911, @tree_id + 5, "Blessing of Sanctuary", "spell_nature_lightningshield", 4, 1, 1, NULL),
(20177, @tree_id + 5, "Reckoning", "spell_holy_blessingofstrength", 4, 2, 5, NULL),
(31848, @tree_id + 5, "Sacred Duty", "spell_holy_divineintervention", 5, 0, 2, NULL),
(20196, @tree_id + 5, "One-Handed Weapon Specialization", "inv_sword_20", 5, 2, 3, NULL),
(31785, @tree_id + 5, "Spiritual Attunement", "spell_holy_revivechampion", 6, 0, 2, NULL),
(20925, @tree_id + 5, "Holy Shield", "spell_holy_blessingofprotection", 6, 1, 1, 20911),
(31850, @tree_id + 5, "Ardent Defender", "spell_holy_ardentdefender", 6, 2, 3, NULL),
(20127, @tree_id + 5, "Redoubt", "ability_defend", 7, 0, 3, NULL),
(31858, @tree_id + 5, "Combat Expertise", "spell_holy_weaponmastery", 7, 2, 3, NULL),
(53590, @tree_id + 5, "Touched by the Light", "ability_paladin_touchedbylight", 8, 0, 3, NULL),
(31935, @tree_id + 5, "Avenger's Shield", "spell_holy_avengersshield", 8, 1, 1, 20925),
(53583, @tree_id + 5, "Guarded by the Light", "ability_paladin_gaurdedbythelight", 8, 2, 2, NULL),
(53709, @tree_id + 5, "Shield of the Templar", "ability_paladin_shieldofthetemplar", 9, 1, 3, 31935),
(53695, @tree_id + 5, "Judgements of the Just", "ability_paladin_judgementsofthejust", 9, 2, 2, NULL),
(53595, @tree_id + 5, "Hammer of the Righteous", "ability_paladin_hammeroftherighteous", 10, 1, 1, NULL),
-- retribution
(20060, @tree_id + 6, "Deflection", "ability_parry", 0, 1, 5, NULL),
(20101, @tree_id + 6, "Benediction", "spell_frost_windwalkon", 0, 2, 5, NULL),
(25956, @tree_id + 6, "Improved Judgements", "spell_holy_righteousfury", 1, 0, 2, NULL),
(20335, @tree_id + 6, "Heart of the Crusader", "spell_holy_holysmite", 1, 1, 3, NULL),
(20042, @tree_id + 6, "Improved Blessing of Might", "spell_holy_fistofjustice", 1, 2, 2, NULL),
(9452, @tree_id + 6, "Vindication", "spell_holy_vindication", 2, 0, 2, NULL),
(20117, @tree_id + 6, "Conviction", "spell_holy_retributionaura", 2, 1, 5, NULL),
(20375, @tree_id + 6, "Seal of Command", "ability_warrior_innerrage", 2, 2, 1, NULL),
(26022, @tree_id + 6, "Pursuit of Justice", "spell_holy_persuitofjustice", 2, 3, 2, NULL),
(9799, @tree_id + 6, "Eye for an Eye", "spell_holy_eyeforaneye", 3, 0, 2, NULL),
(32043, @tree_id + 6, "Sanctity of Battle", "spell_holy_holysmite", 3, 2, 3, NULL),
(31866, @tree_id + 6, "Crusade", "spell_holy_crusade", 3, 3, 3, NULL),
(20111, @tree_id + 6, "Two-Handed Weapon Specialization", "inv_hammer_04", 4, 0, 3, NULL),
(31869, @tree_id + 6, "Sanctified Retribution", "spell_holy_mindvision", 4, 2, 1, NULL),
(20049, @tree_id + 6, "Vengeance", "ability_racial_avatar", 5, 1, 3, 20117),
(31871, @tree_id + 6, "Divine Purpose", "spell_holy_divinepurpose", 5, 2, 2, NULL),
(53486, @tree_id + 6, "The Art of War", "ability_paladin_artofwar", 6, 0, 2, NULL),
(20066, @tree_id + 6, "Repentance", "spell_holy_prayerofhealing", 6, 1, 1, NULL),
(31876, @tree_id + 6, "Judgements of the Wise", "ability_paladin_judgementofthewise", 6, 2, 3, NULL),
(31879, @tree_id + 6, "Fanaticism", "spell_holy_fanaticism", 7, 1, 3, 20066),
(53375, @tree_id + 6, "Sanctified Wrath", "ability_paladin_sanctifiedwrath", 7, 2, 2, NULL),
(53379, @tree_id + 6, "Swift Retribution", "ability_paladin_swiftretribution", 8, 0, 3, NULL),
(35395, @tree_id + 6, "Crusader Strike", "spell_holy_crusaderstrike", 8, 1, 1, NULL),
(53501, @tree_id + 6, "Sheath of Light", "ability_paladin_sheathoflight", 8, 2, 3, NULL),
(53380, @tree_id + 6, "Righteous Vengeance", "ability_paladin_righteousvengeance", 9, 1, 3, NULL),
(53385, @tree_id + 6, "Divine Storm", "ability_paladin_divinestorm", 10, 1, 1, NULL),
-- beastmastery
(19552, @tree_id + 7, "Improved Aspect of the Hawk", "spell_nature_ravenform", 0, 1, 5, NULL),
(19583, @tree_id + 7, "Endurance Training", "spell_nature_reincarnation", 0, 2, 5, NULL),
(35029, @tree_id + 7, "Focused Fire", "ability_hunter_silenthunter", 1, 0, 2, NULL),
(19549, @tree_id + 7, "Improved Aspect of the Monkey", "ability_hunter_aspectofthemonkey", 1, 1, 3, NULL),
(19609, @tree_id + 7, "Thick Hide", "inv_misc_pelt_bear_03", 1, 2, 3, NULL),
(24443, @tree_id + 7, "Improved Revive Pet", "ability_hunter_beastsoothe", 1, 3, 2, NULL),
(19559, @tree_id + 7, "Pathfinding", "ability_mount_jungletiger", 2, 0, 2, NULL),
(53265, @tree_id + 7, "Aspect Mastery", "ability_hunter_aspectmastery", 2, 1, 1, NULL),
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
(53252, @tree_id + 7, "Invigoration", "ability_hunter_invigeration", 7, 0, 2, NULL),
(34466, @tree_id + 7, "Serpent's Swiftness", "ability_hunter_serpentswiftness", 7, 2, 5, NULL),
(53262, @tree_id + 7, "Longevity", "ability_hunter_longevity", 8, 0, 3, NULL),
(34692, @tree_id + 7, "The Beast Within", "ability_hunter_beastwithin", 8, 1, 1, 19574),
(53256, @tree_id + 7, "Cobra Strikes", "ability_hunter_cobrastrikes", 8, 2, 3, NULL),
(56314, @tree_id + 7, "Kindred Spirits", "ability_hunter_separationanxiety", 9, 1, 5, NULL),
(53270, @tree_id + 7, "Beast Mastery", "ability_hunter_beastmastery", 10, 1, 1, NULL),
-- marksmanship
(19407, @tree_id + 8, "Improved Concussive Shot", "spell_frost_stun", 0, 0, 2, NULL),
(53620, @tree_id + 8, "Focused Aim", "ability_hunter_focusedaim", 0, 1, 3, NULL),
(19426, @tree_id + 8, "Lethal Shots", "ability_searingarrow", 0, 2, 5, NULL),
(34482, @tree_id + 8, "Careful Aim", "ability_hunter_zenarchery", 1, 0, 3, NULL),
(19421, @tree_id + 8, "Improved Hunter's Mark", "ability_hunter_snipershot", 1, 1, 3, NULL),
(19485, @tree_id + 8, "Mortal Shots", "ability_piercedamage", 1, 2, 5, NULL),
(34950, @tree_id + 8, "Go for the Throat", "ability_hunter_goforthethroat", 2, 0, 2, NULL),
(19454, @tree_id + 8, "Improved Arcane Shot", "ability_impalingbolt", 2, 1, 3, NULL),
(19434, @tree_id + 8, "Aimed Shot", "inv_spear_07", 2, 2, 1, 19485),
(34948, @tree_id + 8, "Rapid Killing", "ability_hunter_rapidkilling", 2, 3, 2, NULL),
(19464, @tree_id + 8, "Improved Stings", "ability_hunter_quickshot", 3, 1, 3, NULL),
(19416, @tree_id + 8, "Efficiency", "spell_frost_wizardmark", 3, 2, 5, NULL),
(35100, @tree_id + 8, "Concussive Barrage", "spell_arcane_starfire", 4, 0, 2, NULL),
(23989, @tree_id + 8, "Readiness", "ability_hunter_readiness", 4, 1, 1, NULL),
(19461, @tree_id + 8, "Barrage", "ability_upgrademoonglaive", 4, 2, 3, NULL),
(34475, @tree_id + 8, "Combat Experience", "ability_hunter_combatexperience", 5, 0, 2, NULL),
(19507, @tree_id + 8, "Ranged Weapon Specialization", "inv_weapon_rifle_06", 5, 3, 3, NULL),
(53234, @tree_id + 8, "Piercing Shots", "ability_hunter_piercingshots", 6, 0, 3, NULL),
(19506, @tree_id + 8, "Trueshot Aura", "ability_trueshot", 6, 1, 1, 23989),
(35104, @tree_id + 8, "Improved Barrage", "ability_upgrademoonglaive", 6, 2, 3, 19461),
(34485, @tree_id + 8, "Master Marksman", "ability_hunter_mastermarksman", 7, 1, 5, NULL),
(53228, @tree_id + 8, "Rapid Recuperation", "ability_hunter_rapidregeneration", 7, 2, 2, NULL),
(53215, @tree_id + 8, "Wild Quiver", "ability_hunter_wildquiver", 8, 0, 3, NULL),
(34490, @tree_id + 8, "Silencing Shot", "ability_theblackarrow", 8, 1, 1, 34485),
(53221, @tree_id + 8, "Improved Steady Shot", "ability_hunter_improvedsteadyshot", 8, 2, 3, NULL),
(53241, @tree_id + 8, "Marked for Death", "ability_hunter_assassinate", 9, 1, 5, NULL),
(53209, @tree_id + 8, "Chimera Shot", "ability_hunter_chimerashot2", 10, 1, 1, NULL),
-- survival
(52783, @tree_id + 9, "Improved Tracking", "ability_hunter_improvedtracking", 0, 0, 5, NULL),
(19498, @tree_id + 9, "Hawk Eye", "ability_townwatch", 0, 1, 3, NULL),
(19159, @tree_id + 9, "Savage Strikes", "ability_racial_bloodrage", 0, 2, 2, NULL),
(19290, @tree_id + 9, "Surefooted", "ability_kick", 1, 0, 3, NULL),
(19184, @tree_id + 9, "Entrapment", "spell_nature_stranglevines", 1, 1, 3, NULL),
(19376, @tree_id + 9, "Trap Mastery", "ability_ensnare", 1, 2, 3, NULL),
(34494, @tree_id + 9, "Survival Instincts", "ability_hunter_survivalinstincts", 1, 3, 2, NULL),
(19255, @tree_id + 9, "Survivalist", "spell_shadow_twilight", 2, 0, 5, NULL),
(19503, @tree_id + 9, "Scatter Shot", "ability_golemstormbolt", 2, 1, 1, NULL),
(19295, @tree_id + 9, "Deflection", "ability_parry", 2, 2, 3, NULL),
(19286, @tree_id + 9, "Survival Tactics", "ability_rogue_feigndeath", 2, 3, 2, NULL),
(56333, @tree_id + 9, "T.N.T.", "inv_misc_bomb_05", 3, 1, 3, NULL),
(56342, @tree_id + 9, "Lock and Load", "ability_hunter_lockandload", 3, 3, 3, NULL),
(56339, @tree_id + 9, "Hunter vs. Wild", "ability_hunter_huntervswild", 4, 0, 3, 19255),
(19370, @tree_id + 9, "Killer Instinct", "spell_holy_blessingofstamina", 4, 1, 3, NULL),
(19306, @tree_id + 9, "Counterattack", "ability_warrior_challange", 4, 2, 1, 19295),
(19168, @tree_id + 9, "Lightning Reflexes", "spell_nature_invisibilty", 5, 0, 5, NULL),
(34491, @tree_id + 9, "Resourcefulness", "ability_hunter_resourcefulness", 5, 2, 3, NULL),
(34500, @tree_id + 9, "Expose Weakness", "ability_rogue_findweakness", 6, 0, 3, 19168),
(19386, @tree_id + 9, "Wyvern Sting", "inv_spear_02", 6, 1, 1, 19370),
(34497, @tree_id + 9, "Thrill of the Hunt", "ability_hunter_thrillofthehunt", 6, 2, 3, NULL),
(34506, @tree_id + 9, "Master Tactician", "ability_hunter_mastertactitian", 7, 0, 5, NULL),
(53295, @tree_id + 9, "Noxious Stings", "ability_hunter_potentvenom", 7, 1, 3, 19386),
(53298, @tree_id + 9, "Point of No Escape", "ability_hunter_pointofnoescape", 8, 0, 2, NULL),
(3674, @tree_id + 9, "Black Arrow", "spell_shadow_painspike", 8, 1, 1, NULL),
(53302, @tree_id + 9, "Sniper Training", "ability_hunter_longshots", 8, 3, 3, NULL),
(53290, @tree_id + 9, "Hunting Party", "ability_hunter_huntingparty", 9, 2, 3, 34497),
(53301, @tree_id + 9, "Explosive Shot", "ability_hunter_explosiveshot", 10, 1, 1, 3674),
-- assassination
(14162, @tree_id + 10, "Improved Eviscerate", "ability_rogue_eviscerate", 0, 0, 3, NULL),
(14144, @tree_id + 10, "Remorseless Attacks", "ability_fiegndead", 0, 1, 2, NULL),
(14138, @tree_id + 10, "Malice", "ability_racial_bloodrage", 0, 2, 5, NULL),
(14156, @tree_id + 10, "Ruthlessness", "ability_druid_disembowel", 1, 0, 3, NULL),
(51632, @tree_id + 10, "Blood Spatter", "ability_rogue_bloodsplatter", 1, 1, 2, NULL),
(13733, @tree_id + 10, "Puncturing Wounds", "ability_backstab", 1, 3, 3, NULL),
(14983, @tree_id + 10, "Vigor", "spell_nature_earthbindtotem", 2, 0, 1, NULL),
(14168, @tree_id + 10, "Improved Expose Armor", "ability_warrior_riposte", 2, 1, 2, NULL),
(14128, @tree_id + 10, "Lethality", "ability_criticalstrike", 2, 2, 5, 14138),
(16513, @tree_id + 10, "Vile Poisons", "ability_rogue_feigndeath", 3, 1, 3, NULL),
(14113, @tree_id + 10, "Improved Poisons", "ability_poisons", 3, 2, 5, NULL),
(31208, @tree_id + 10, "Fleet Footed", "ability_rogue_fleetfooted", 4, 0, 2, NULL),
(14177, @tree_id + 10, "Cold Blood", "spell_ice_lament", 4, 1, 1, NULL),
(14174, @tree_id + 10, "Improved Kidney Shot", "ability_rogue_kidneyshot", 4, 2, 3, NULL),
(31244, @tree_id + 10, "Quick Recovery", "ability_rogue_quickrecovery", 4, 3, 2, NULL),
(14186, @tree_id + 10, "Seal Fate", "spell_shadow_chilltouch", 5, 1, 5, 14177),
(14158, @tree_id + 10, "Murder", "spell_shadow_deathscream", 5, 2, 2, NULL),
(51625, @tree_id + 10, "Deadly Brew", "ability_rogue_deadlybrew", 6, 0, 2, NULL),
(58426, @tree_id + 10, "Overkill", "ability_hunter_rapidkilling", 6, 1, 1, NULL),
(31380, @tree_id + 10, "Deadened Nerves", "ability_rogue_deadenednerves", 6, 2, 3, NULL),
(51634, @tree_id + 10, "Focused Attacks", "ability_rogue_focusedattacks", 7, 0, 3, NULL),
(31234, @tree_id + 10, "Find Weakness", "ability_rogue_findweakness", 7, 2, 3, NULL),
(31226, @tree_id + 10, "Master Poisoner", "ability_creature_poison_06", 8, 0, 3, NULL),
(1329, @tree_id + 10, "Mutilate", "ability_rogue_shadowstrikes", 8, 1, 1, 58426),
(51627, @tree_id + 10, "Turn the Tables", "ability_rogue_turnthetables", 8, 2, 3, NULL),
(51664, @tree_id + 10, "Cut to the Chase", "ability_rogue_cuttothechase", 9, 1, 5, NULL),
(51662, @tree_id + 10, "Hunger For Blood", "ability_rogue_hungerforblood", 10, 1, 1, NULL),
-- combat
(13741, @tree_id + 11, "Improved Gouge", "ability_gouge", 0, 0, 3, NULL),
(13732, @tree_id + 11, "Improved Sinister Strike", "spell_shadow_ritualofsacrifice", 0, 1, 2, NULL),
(13715, @tree_id + 11, "Dual Wield Specialization", "ability_dualwield", 0, 2, 5, NULL),
(14165, @tree_id + 11, "Improved Slice and Dice", "ability_rogue_slicedice", 1, 0, 2, NULL),
(13713, @tree_id + 11, "Deflection", "ability_parry", 1, 1, 3, NULL),
(13705, @tree_id + 11, "Precision", "ability_marksmanship", 1, 3, 5, NULL),
(13742, @tree_id + 11, "Endurance", "spell_shadow_shadowward", 2, 0, 2, NULL),
(14251, @tree_id + 11, "Riposte", "ability_warrior_challange", 2, 1, 1, 13713),
(13706, @tree_id + 11, "Close Quarters Combat", "inv_weapon_shortblade_05", 2, 2, 5, 13715),
(13754, @tree_id + 11, "Improved Kick", "ability_kick", 3, 0, 2, NULL),
(13743, @tree_id + 11, "Improved Sprint", "ability_rogue_sprint", 3, 1, 2, NULL),
(13712, @tree_id + 11, "Lightning Reflexes", "spell_nature_invisibilty", 3, 2, 3, NULL),
(18427, @tree_id + 11, "Aggression", "ability_racial_avatar", 3, 3, 5, NULL),
(13709, @tree_id + 11, "Mace Specialization", "inv_mace_01", 4, 0, 5, NULL),
(13877, @tree_id + 11, "Blade Flurry", "ability_warrior_punishingblow", 4, 1, 1, NULL),
(13960, @tree_id + 11, "Hack and Slash", "inv_sword_27", 4, 2, 5, NULL),
(30919, @tree_id + 11, "Weapon Expertise", "spell_holy_blessingofstrength", 5, 1, 2, 13877),
(31124, @tree_id + 11, "Blade Twisting", "ability_rogue_bladetwisting", 5, 2, 2, NULL),
(31122, @tree_id + 11, "Vitality", "ability_warrior_revenge", 6, 0, 3, NULL),
(13750, @tree_id + 11, "Adrenaline Rush", "spell_shadow_shadowworddominate", 6, 1, 1, NULL),
(31130, @tree_id + 11, "Nerves of Steel", "ability_rogue_nervesofsteel", 6, 2, 2, NULL),
(5952, @tree_id + 11, "Throwing Specialization", "ability_rogue_throwingspecialization", 7, 0, 2, NULL),
(35541, @tree_id + 11, "Combat Potency", "inv_weapon_shortblade_38", 7, 2, 5, NULL),
(51672, @tree_id + 11, "Unfair Advantage", "ability_rogue_unfairadvantage", 8, 0, 2, NULL),
(32601, @tree_id + 11, "Surprise Attacks", "ability_rogue_surpriseattack", 8, 1, 1, 13750),
(51682, @tree_id + 11, "Savage Combat", "ability_creature_disease_03", 8, 2, 2, NULL),
(51685, @tree_id + 11, "Prey on the Weak", "ability_rogue_preyontheweak", 9, 1, 5, NULL),
(51690, @tree_id + 11, "Killing Spree", "ability_rogue_murderspree", 10, 1, 1, NULL),
-- subtlety
(14179, @tree_id + 12, "Relentless Strikes", "ability_warrior_decisivestrike", 0, 0, 5, NULL),
(13958, @tree_id + 12, "Master of Deception", "spell_shadow_charm", 0, 1, 3, NULL),
(14057, @tree_id + 12, "Opportunity", "ability_warrior_warcry", 0, 2, 2, NULL),
(30892, @tree_id + 12, "Sleight of Hand", "ability_rogue_feint", 1, 0, 2, NULL),
(14076, @tree_id + 12, "Dirty Tricks", "ability_sap", 1, 1, 2, NULL),
(13975, @tree_id + 12, "Camouflage", "ability_stealth", 1, 2, 3, NULL),
(13981, @tree_id + 12, "Elusiveness", "spell_magic_lesserinvisibilty", 2, 0, 2, NULL),
(14278, @tree_id + 12, "Ghostly Strike", "spell_shadow_curse", 2, 1, 1, NULL),
(14171, @tree_id + 12, "Serrated Blades", "inv_sword_17", 2, 2, 3, NULL),
(13983, @tree_id + 12, "Setup", "spell_nature_mirrorimage", 3, 0, 3, NULL),
(13976, @tree_id + 12, "Initiative", "spell_shadow_fumble", 3, 1, 3, NULL),
(14079, @tree_id + 12, "Improved Ambush", "ability_rogue_ambush", 3, 2, 2, NULL),
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
(51692, @tree_id + 12, "Waylay", "ability_rogue_waylay", 7, 2, 2, NULL),
(51698, @tree_id + 12, "Honor Among Thieves", "ability_rogue_honoramongstthieves", 8, 0, 3, NULL),
(36554, @tree_id + 12, "Shadowstep", "ability_rogue_shadowstep", 8, 1, 1, NULL),
(58414, @tree_id + 12, "Filthy Tricks", "ability_rogue_wrongfullyaccused", 8, 2, 2, NULL),
(51708, @tree_id + 12, "Slaughter from the Shadows", "ability_rogue_slaughterfromtheshadows", 9, 1, 5, NULL),
(51713, @tree_id + 12, "Shadow Dance", "ability_rogue_shadowdance", 10, 1, 1, NULL),
-- discipline
(14522, @tree_id + 13, "Unbreakable Will", "spell_magic_magearmor", 0, 1, 5, NULL),
(47586, @tree_id + 13, "Twin Disciplines", "spell_holy_sealofvengeance", 0, 2, 5, NULL),
(14523, @tree_id + 13, "Silent Resolve", "spell_nature_manaregentotem", 1, 0, 3, NULL),
(14747, @tree_id + 13, "Improved Inner Fire", "spell_holy_innerfire", 1, 1, 3, NULL),
(14749, @tree_id + 13, "Improved Power Word: Fortitude", "spell_holy_wordfortitude", 1, 2, 2, NULL),
(14531, @tree_id + 13, "Martyrdom", "spell_nature_tranquility", 1, 3, 2, NULL),
(14521, @tree_id + 13, "Meditation", "spell_nature_sleep", 2, 0, 3, NULL),
(14751, @tree_id + 13, "Inner Focus", "spell_frost_windwalkon", 2, 1, 1, NULL),
(14748, @tree_id + 13, "Improved Power Word: Shield", "spell_holy_powerwordshield", 2, 2, 3, NULL),
(33167, @tree_id + 13, "Absolution", "spell_holy_absolution", 3, 0, 3, NULL),
(14520, @tree_id + 13, "Mental Agility", "ability_hibernation", 3, 1, 3, NULL),
(14750, @tree_id + 13, "Improved Mana Burn", "spell_shadow_manaburn", 3, 3, 2, NULL),
(33201, @tree_id + 13, "Reflective Shield", "spell_holy_powerwordshield", 4, 0, 2, NULL),
(18551, @tree_id + 13, "Mental Strength", "spell_nature_enchantarmor", 4, 1, 5, NULL),
(63574, @tree_id + 13, "Soul Warding", "spell_holy_pureofheart", 4, 2, 1, 14748),
(33186, @tree_id + 13, "Focused Power", "spell_shadow_focusedpower", 5, 0, 2, NULL),
(34908, @tree_id + 13, "Enlightenment", "spell_arcane_mindmastery", 5, 2, 3, NULL),
(45234, @tree_id + 13, "Focused Will", "spell_arcane_focusedpower", 6, 0, 3, NULL),
(10060, @tree_id + 13, "Power Infusion", "spell_holy_powerinfusion", 6, 1, 1, 18551),
(63504, @tree_id + 13, "Improved Flash Heal", "spell_holy_chastise", 6, 2, 3, NULL),
(57470, @tree_id + 13, "Renewed Hope", "spell_holy_holyprotection", 7, 0, 2, NULL),
(47535, @tree_id + 13, "Rapture", "spell_holy_rapture", 7, 1, 3, NULL),
(47507, @tree_id + 13, "Aspiration", "spell_holy_aspiration", 7, 2, 2, NULL),
(47509, @tree_id + 13, "Divine Aegis", "spell_holy_devineaegis", 8, 0, 3, NULL),
(33206, @tree_id + 13, "Pain Suppression", "spell_holy_painsupression", 8, 1, 1, NULL),
(47516, @tree_id + 13, "Grace", "spell_holy_hopeandgrace", 8, 2, 2, NULL),
(52795, @tree_id + 13, "Borrowed Time", "spell_holy_borrowedtime", 9, 1, 5, NULL),
(47540, @tree_id + 13, "Penance", "spell_holy_penance", 10, 1, 1, NULL),
-- holy
(14913, @tree_id + 14, "Healing Focus", "spell_holy_healingfocus", 0, 0, 2, NULL),
(14908, @tree_id + 14, "Improved Renew", "spell_holy_renew", 0, 1, 3, NULL),
(14889, @tree_id + 14, "Holy Specialization", "spell_holy_sealofsalvation", 0, 2, 5, NULL),
(27900, @tree_id + 14, "Spell Warding", "spell_holy_spellwarding", 1, 1, 5, NULL),
(18530, @tree_id + 14, "Divine Fury", "spell_holy_sealofwrath", 1, 2, 5, NULL),
(19236, @tree_id + 14, "Desperate Prayer", "spell_holy_restoration", 2, 0, 1, NULL),
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
(64127, @tree_id + 14, "Body and Soul", "spell_holy_symbolofhope", 7, 0, 2, NULL),
(33158, @tree_id + 14, "Empowered Healing", "spell_holy_greaterheal", 7, 1, 5, NULL),
(63730, @tree_id + 14, "Serendipity", "spell_holy_serendipity", 7, 2, 3, NULL),
(63534, @tree_id + 14, "Empowered Renew", "ability_paladin_infusionoflight", 8, 0, 3, NULL),
(34861, @tree_id + 14, "Circle of Healing", "spell_holy_circleofrenewal", 8, 1, 1, NULL),
(47558, @tree_id + 14, "Test of Faith", "spell_holy_testoffaith", 8, 2, 3, NULL),
(47562, @tree_id + 14, "Divine Providence", "spell_holy_divineprovidence", 9, 1, 5, NULL),
(47788, @tree_id + 14, "Guardian Spirit", "spell_holy_guardianspirit", 10, 1, 1, NULL),
-- shadow
(15270, @tree_id + 15, "Spirit Tap", "spell_shadow_requiem", 0, 0, 3, NULL),
(15337, @tree_id + 15, "Improved Spirit Tap", "spell_shadow_requiem", 0, 1, 2, NULL),
(15259, @tree_id + 15, "Darkness", "spell_shadow_twilight", 0, 2, 5, NULL),
(15318, @tree_id + 15, "Shadow Affinity", "spell_shadow_shadowward", 1, 0, 3, NULL),
(15275, @tree_id + 15, "Improved Shadow Word: Pain", "spell_shadow_shadowwordpain", 1, 1, 2, NULL),
(15260, @tree_id + 15, "Shadow Focus", "spell_shadow_burningspirit", 1, 2, 3, NULL),
(15392, @tree_id + 15, "Improved Psychic Scream", "spell_shadow_psychicscream", 2, 0, 2, NULL),
(15273, @tree_id + 15, "Improved Mind Blast", "spell_shadow_unholyfrenzy", 2, 1, 5, NULL),
(15407, @tree_id + 15, "Mind Flay", "spell_shadow_siphonmana", 2, 2, 1, NULL),
(15274, @tree_id + 15, "Veiled Shadows", "spell_magic_lesserinvisibilty", 3, 1, 2, NULL),
(17322, @tree_id + 15, "Shadow Reach", "spell_shadow_chilltouch", 3, 2, 2, NULL),
(15257, @tree_id + 15, "Shadow Weaving", "spell_shadow_blackplague", 3, 3, 3, NULL),
(15487, @tree_id + 15, "Silence", "spell_shadow_impphaseshift", 4, 0, 1, 15392),
(15286, @tree_id + 15, "Vampiric Embrace", "spell_shadow_unsummonbuilding", 4, 1, 1, NULL),
(27839, @tree_id + 15, "Improved Vampiric Embrace", "spell_shadow_improvedvampiricembrace", 4, 2, 2, NULL),
(33213, @tree_id + 15, "Focused Mind", "spell_nature_focusedmind", 4, 3, 3, NULL),
(14910, @tree_id + 15, "Mind Melt", "spell_shadow_skull", 5, 0, 2, NULL),
(63625, @tree_id + 15, "Improved Devouring Plague", "spell_shadow_devouringplague.", 5, 2, 3, NULL),
(15473, @tree_id + 15, "Shadowform", "spell_shadow_shadowform", 6, 1, 1, 15286),
(33221, @tree_id + 15, "Shadow Power", "spell_shadow_shadowpower", 6, 2, 5, NULL),
(47569, @tree_id + 15, "Improved Shadowform", "spell_shadow_summonvoidwalker", 7, 0, 2, 15473),
(33191, @tree_id + 15, "Misery", "spell_shadow_misery", 7, 2, 3, NULL),
(64044, @tree_id + 15, "Psychic Horror", "spell_shadow_psychichorrors", 8, 0, 1, NULL),
(34914, @tree_id + 15, "Vampiric Touch", "spell_holy_stoicism", 8, 1, 1, 15473),
(47580, @tree_id + 15, "Pain and Suffering", "spell_shadow_painandsuffering", 8, 2, 3, NULL),
(47573, @tree_id + 15, "Twisted Faith", "spell_shadow_mindtwisting", 9, 2, 5, NULL),
(47585, @tree_id + 15, "Dispersion", "spell_shadow_dispersion", 10, 1, 1, 34914),
-- blood
(48979, @tree_id + 16, "Butchery", "inv_axe_68", 0, 0, 2, NULL),
(48997, @tree_id + 16, "Subversion", "spell_deathknight_subversion", 0, 1, 3, NULL),
(49182, @tree_id + 16, "Blade Barrier", "ability_upgrademoonglaive", 0, 2, 5, NULL),
(48978, @tree_id + 16, "Bladed Armor", "inv_shoulder_36", 1, 0, 5, NULL),
(49004, @tree_id + 16, "Scent of Blood", "ability_rogue_bloodyeye", 1, 1, 3, NULL),
(55107, @tree_id + 16, "Two-Handed Weapon Specialization", "inv_sword_68", 1, 2, 2, NULL),
(48982, @tree_id + 16, "Rune Tap", "spell_deathknight_runetap", 2, 0, 1, NULL),
(48987, @tree_id + 16, "Dark Conviction", "spell_deathknight_darkconviction", 2, 1, 5, NULL),
(49467, @tree_id + 16, "Death Rune Mastery", "inv_sword_62", 2, 2, 3, NULL),
(48985, @tree_id + 16, "Improved Rune Tap", "spell_deathknight_runetap", 3, 0, 3, 48982),
(49145, @tree_id + 16, "Spell Deflection", "spell_deathknight_spelldeflection", 3, 2, 3, NULL),
(49015, @tree_id + 16, "Vendetta", "spell_deathknight_vendetta", 3, 3, 3, NULL),
(48977, @tree_id + 16, "Bloody Strikes", "spell_deathknight_deathstrike", 4, 0, 3, NULL),
(49006, @tree_id + 16, "Veteran of the Third War", "spell_misc_warsongfocus", 4, 2, 3, NULL),
(49005, @tree_id + 16, "Mark of Blood", "ability_hunter_rapidkilling", 4, 3, 1, NULL),
(48988, @tree_id + 16, "Bloody Vengeance", "ability_backstab", 5, 1, 3, 48987),
(53137, @tree_id + 16, "Abomination's Might", "ability_warrior_intensifyrage", 5, 2, 2, NULL),
(49027, @tree_id + 16, "Bloodworms", "spell_shadow_soulleech", 6, 0, 3, NULL),
(49016, @tree_id + 16, "Hysteria", "spell_deathknight_bladedarmor", 6, 1, 1, NULL),
(50365, @tree_id + 16, "Improved Blood Presence", "spell_deathknight_bloodpresence", 6, 2, 2, NULL),
(62905, @tree_id + 16, "Improved Death Strike", "spell_deathknight_butcher2", 7, 0, 2, NULL),
(49018, @tree_id + 16, "Sudden Doom", "spell_shadow_painspike", 7, 1, 3, NULL),
(55233, @tree_id + 16, "Vampiric Blood", "spell_shadow_lifedrain", 7, 2, 1, NULL),
(49189, @tree_id + 16, "Will of the Necropolis", "ability_creature_cursed_02", 8, 0, 3, NULL),
(55050, @tree_id + 16, "Heart Strike", "inv_weapon_shortblade_40", 8, 1, 1, NULL),
(49023, @tree_id + 16, "Might of Mograine", "spell_deathknight_classicon", 8, 2, 3, NULL),
(61154, @tree_id + 16, "Blood Gorged", "spell_nature_reincarnation", 9, 1, 5, NULL),
(49028, @tree_id + 16, "Dancing Rune Weapon", "inv_sword_07", 10, 1, 1, NULL),
-- frost
(49175, @tree_id + 17, "Improved Icy Touch", "spell_deathknight_icetouch", 0, 0, 3, NULL),
(49455, @tree_id + 17, "Runic Power Mastery", "spell_arcane_arcane01", 0, 1, 2, NULL),
(49042, @tree_id + 17, "Toughness", "spell_holy_devotion", 0, 2, 5, NULL),
(55061, @tree_id + 17, "Icy Reach", "spell_frost_manarecharge", 1, 1, 2, NULL),
(49140, @tree_id + 17, "Black Ice", "spell_shadow_darkritual", 1, 2, 5, NULL),
(49226, @tree_id + 17, "Nerves of Cold Steel", "ability_dualwield", 1, 3, 3, NULL),
(50880, @tree_id + 17, "Icy Talons", "spell_deathknight_icytalons", 2, 0, 5, 49175),
(49039, @tree_id + 17, "Lichborne", "spell_shadow_raisedead", 2, 1, 1, NULL),
(51468, @tree_id + 17, "Annihilation", "inv_weapon_hand_18", 2, 2, 3, NULL),
(51123, @tree_id + 17, "Killing Machine", "inv_sword_122", 3, 1, 5, NULL),
(49149, @tree_id + 17, "Chill of the Grave", "spell_frost_frostshock", 3, 2, 2, NULL),
(49137, @tree_id + 17, "Endless Winter", "spell_shadow_twilight", 3, 3, 2, NULL),
(49186, @tree_id + 17, "Frigid Dreadplate", "inv_chest_mail_04", 4, 1, 3, NULL),
(49471, @tree_id + 17, "Glacier Rot", "spell_nature_removedisease", 4, 2, 3, NULL),
(49796, @tree_id + 17, "Deathchill", "spell_shadow_soulleech_2", 4, 3, 1, NULL),
(55610, @tree_id + 17, "Improved Icy Talons", "spell_deathknight_icytalons", 5, 0, 1, 50880),
(49024, @tree_id + 17, "Merciless Combat", "inv_sword_112", 5, 1, 2, NULL),
(49188, @tree_id + 17, "Rime", "spell_frost_freezingbreath", 5, 2, 3, NULL),
(50040, @tree_id + 17, "Chilblains", "spell_frost_wisp", 6, 0, 3, NULL),
(49203, @tree_id + 17, "Hungering Cold", "inv_staff_15", 6, 1, 1, NULL),
(50384, @tree_id + 17, "Improved Frost Presence", "spell_deathknight_frostpresence", 6, 2, 2, NULL),
(65661, @tree_id + 17, "Threat of Thassarian", "ability_dualwieldspecialization", 7, 0, 3, NULL),
(54639, @tree_id + 17, "Blood of the North", "inv_weapon_shortblade_79", 7, 1, 3, NULL),
(51271, @tree_id + 17, "Unbreakable Armor", "inv_armor_helm_plate_naxxramas_raidwarrior_c_01", 7, 2, 1, NULL),
(49200, @tree_id + 17, "Acclimation", "spell_fire_elementaldevastation", 8, 0, 3, NULL),
(49143, @tree_id + 17, "Frost Strike", "spell_deathknight_empowerruneblade2", 8, 1, 1, NULL),
-- Note: original name is inv-sword_53 - renamed to match naming of other icons
(50187, @tree_id + 17, "Guile of Gorefiend", "inv_sword_53", 8, 2, 3, NULL),
(49202, @tree_id + 17, "Tundra Stalker", "spell_nature_tranquility", 9, 1, 5, NULL),
(49184, @tree_id + 17, "Howling Blast", "spell_frost_arcticwinds", 10, 1, 1, NULL),
-- unholy
(51745, @tree_id + 18, "Vicious Strikes", "spell_deathknight_plaguestrike", 0, 0, 2, NULL),
(48962, @tree_id + 18, "Virulence", "spell_shadow_burningspirit", 0, 1, 3, NULL),
(55129, @tree_id + 18, "Anticipation", "spell_nature_mirrorimage", 0, 2, 5, NULL),
(49036, @tree_id + 18, "Epidemic", "spell_shadow_shadowwordpain", 1, 0, 2, NULL),
(48963, @tree_id + 18, "Morbidity", "spell_shadow_deathanddecay", 1, 1, 3, NULL),
(49588, @tree_id + 18, "Unholy Command", "spell_deathknight_strangulate", 1, 2, 2, NULL),
(48965, @tree_id + 18, "Ravenous Dead", "spell_deathknight_gnaw_ghoul", 1, 3, 3, NULL),
(49013, @tree_id + 18, "Outbreak", "spell_shadow_plaguecloud", 2, 0, 3, NULL),
(51459, @tree_id + 18, "Necrosis", "inv_weapon_shortblade_60", 2, 1, 5, NULL),
(49158, @tree_id + 18, "Corpse Explosion", "ability_creature_disease_02", 2, 2, 1, NULL),
(49146, @tree_id + 18, "On a Pale Horse", "spell_deathknight_summondeathcharger", 3, 1, 2, NULL),
(49219, @tree_id + 18, "Blood-Caked Blade", "ability_criticalstrike", 3, 2, 3, NULL),
(55620, @tree_id + 18, "Night of the Dead", "spell_deathknight_armyofthedead", 3, 3, 2, NULL),
(49194, @tree_id + 18, "Unholy Blight", "spell_shadow_contagion", 4, 0, 1, NULL),
(49220, @tree_id + 18, "Impurity", "spell_shadow_shadowandflame", 4, 1, 5, NULL),
(49223, @tree_id + 18, "Dirge", "spell_shadow_shadesofdarkness", 4, 2, 2, NULL),
(55666, @tree_id + 18, "Desecration", "spell_shadow_shadowfiend", 5, 0, 2, NULL),
(49224, @tree_id + 18, "Magic Suppression", "spell_shadow_antimagicshell", 5, 1, 3, NULL),
(49208, @tree_id + 18, "Reaping", "spell_shadow_shadetruesight", 5, 2, 3, NULL),
(52143, @tree_id + 18, "Master of Ghouls", "spell_shadow_animatedead", 5, 3, 1, 55620),
(66799, @tree_id + 18, "Desolation", "spell_shadow_unholyfrenzy", 6, 0, 5, NULL),
(51052, @tree_id + 18, "Anti-Magic Zone", "spell_deathknight_antimagiczone", 6, 1, 1, 49224),
(50391, @tree_id + 18, "Improved Unholy Presence", "spell_deathknight_unholypresence", 6, 2, 2, NULL),
(63560, @tree_id + 18, "Ghoul Frenzy", "ability_ghoulfrenzy", 6, 3, 1, 52143),
(49032, @tree_id + 18, "Crypt Fever", "spell_nature_nullifydisease", 7, 1, 3, NULL),
(49222, @tree_id + 18, "Bone Shield", "inv_chest_leather_13", 7, 2, 1, NULL),
(49217, @tree_id + 18, "Wandering Plague", "spell_shadow_callofbone", 8, 0, 3, NULL),
(51099, @tree_id + 18, "Ebon Plaguebringer", "ability_creature_cursed_03", 8, 1, 3, 49032),
(55090, @tree_id + 18, "Scourge Strike", "spell_deathknight_scourgestrike", 8, 2, 1, NULL),
(50117, @tree_id + 18, "Rage of Rivendare", "inv_weapon_halberd14", 9, 1, 5, NULL),
(49206, @tree_id + 18, "Summon Gargoyle", "ability_hunter_pet_bat", 10, 1, 1, NULL),
-- elemental
(16039, @tree_id + 19, "Convection", "spell_nature_wispsplode", 0, 1, 5, NULL),
(16035, @tree_id + 19, "Concussion", "spell_fire_fireball", 0, 2, 5, NULL),
(16038, @tree_id + 19, "Call of Flame", "spell_fire_immolation", 1, 0, 3, NULL),
(28996, @tree_id + 19, "Elemental Warding", "spell_nature_spiritarmor", 1, 1, 3, NULL),
(30160, @tree_id + 19, "Elemental Devastation", "spell_fire_elementaldevastation", 1, 2, 3, NULL),
(16040, @tree_id + 19, "Reverberation", "spell_frost_frostward", 2, 0, 5, NULL),
(16164, @tree_id + 19, "Elemental Focus", "spell_shadow_manaburn", 2, 1, 1, NULL),
(16089, @tree_id + 19, "Elemental Fury", "spell_fire_volcano", 2, 2, 5, NULL),
(16086, @tree_id + 19, "Improved Fire Nova", "spell_fire_sealoffire", 3, 0, 2, NULL),
(29062, @tree_id + 19, "Eye of the Storm", "spell_shadow_soulleech_2", 3, 3, 3, NULL),
(28999, @tree_id + 19, "Elemental Reach", "spell_nature_stormreach", 4, 0, 2, NULL),
(16041, @tree_id + 19, "Call of Thunder", "spell_nature_callstorm", 4, 1, 1, 16164),
(30664, @tree_id + 19, "Unrelenting Storm", "spell_nature_unrelentingstorm", 4, 3, 3, NULL),
(30672, @tree_id + 19, "Elemental Precision", "spell_nature_elementalprecision_1", 5, 0, 3, NULL),
(16578, @tree_id + 19, "Lightning Mastery", "spell_lightning_lightningbolt01", 5, 2, 5, 16089),
(16166, @tree_id + 19, "Elemental Mastery", "spell_nature_wispheal", 6, 1, 1, 16041),
(51483, @tree_id + 19, "Storm, Earth and Fire", "spell_shaman_stormearthfire", 6, 2, 3, NULL),
(63370, @tree_id + 19, "Booming Echoes", "spell_fire_blueflamering", 7, 0, 2, NULL),
(51466, @tree_id + 19, "Elemental Oath", "spell_shaman_elementaloath", 7, 1, 2, 16166),
(30675, @tree_id + 19, "Lightning Overload", "spell_nature_lightningoverload", 7, 2, 3, NULL),
(51474, @tree_id + 19, "Astral Shift", "spell_shaman_astralshift", 8, 0, 3, NULL),
(30706, @tree_id + 19, "Totem of Wrath", "spell_fire_totemofwrath", 8, 1, 1, NULL),
(51480, @tree_id + 19, "Lava Flows", "spell_shaman_lavaflow", 8, 2, 3, NULL),
(62097, @tree_id + 19, "Shamanism", "spell_unused2", 9, 1, 5, NULL),
(51490, @tree_id + 19, "Thunderstorm", "spell_shaman_thunderstorm", 10, 1, 1, NULL),
-- enhancement
(16259, @tree_id + 20, "Enhancing Totems", "spell_nature_earthbindtotem", 0, 0, 3, NULL),
(16043, @tree_id + 20, "Earth's Grasp", "spell_nature_stoneclawtotem", 0, 1, 2, NULL),
(17485, @tree_id + 20, "Ancestral Knowledge", "spell_shadow_grimward", 0, 2, 5, NULL),
(16258, @tree_id + 20, "Guardian Totems", "spell_nature_stoneskintotem", 1, 0, 2, NULL),
(16255, @tree_id + 20, "Thundering Strikes", "ability_thunderbolt", 1, 1, 5, NULL),
(16262, @tree_id + 20, "Improved Ghost Wolf", "spell_nature_spiritwolf", 1, 2, 2, NULL),
(16261, @tree_id + 20, "Improved Shields", "spell_nature_lightningshield", 1, 3, 3, NULL),
(16266, @tree_id + 20, "Elemental Weapons", "spell_fire_flametounge", 2, 0, 3, NULL),
(43338, @tree_id + 20, "Shamanistic Focus", "spell_nature_elementalabsorption", 2, 2, 1, NULL),
(16254, @tree_id + 20, "Anticipation", "spell_nature_mirrorimage", 2, 3, 3, NULL),
(16256, @tree_id + 20, "Flurry", "ability_ghoulfrenzy", 3, 1, 5, 16255),
(16252, @tree_id + 20, "Toughness", "spell_holy_devotion", 3, 2, 5, NULL),
(29192, @tree_id + 20, "Improved Windfury Totem", "spell_nature_windfury", 4, 0, 2, NULL),
(16268, @tree_id + 20, "Spirit Weapons", "ability_parry", 4, 1, 1, NULL),
(51883, @tree_id + 20, "Mental Dexterity", "spell_nature_bloodlust", 4, 2, 3, NULL),
(30802, @tree_id + 20, "Unleashed Rage", "spell_nature_unleashedrage", 5, 0, 3, NULL),
(29082, @tree_id + 20, "Weapon Mastery", "ability_hunter_swiftstrike", 5, 2, 3, NULL),
(63373, @tree_id + 20, "Frozen Power", "spell_fire_bluecano", 5, 3, 2, NULL),
(30816, @tree_id + 20, "Dual Wield Specialization", "ability_dualwieldspecialization", 6, 0, 3, NULL),
(30798, @tree_id + 20, "Dual Wield", "ability_dualwield", 6, 1, 1, 16268),
(17364, @tree_id + 20, "Stormstrike", "ability_shaman_stormstrike", 6, 2, 1, NULL),
(51525, @tree_id + 20, "Static Shock", "spell_shaman_staticshock", 7, 0, 3, NULL),
(60103, @tree_id + 20, "Lava Lash", "ability_shaman_lavalash", 7, 1, 1, 30798),
(51521, @tree_id + 20, "Improved Stormstrike", "spell_shaman_improvedstormstrike", 7, 2, 2, 17364),
(30812, @tree_id + 20, "Mental Quickness", "spell_nature_mentalquickness", 8, 0, 3, NULL),
(30823, @tree_id + 20, "Shamanistic Rage", "spell_nature_shamanrage", 8, 1, 1, NULL),
(51523, @tree_id + 20, "Earthen Power", "spell_nature_earthelemental_totem", 8, 2, 2, NULL),
(51528, @tree_id + 20, "Maelstrom Weapon", "spell_shaman_maelstromweapon", 9, 1, 5, NULL),
(51533, @tree_id + 20, "Feral Spirit", "spell_shaman_feralspirit", 10, 1, 1, NULL),
-- restoration
(16182, @tree_id + 21, "Improved Healing Wave", "spell_nature_magicimmunity", 0, 1, 5, NULL),
(16173, @tree_id + 21, "Totemic Focus", "spell_nature_moonglow", 0, 2, 5, NULL),
(16184, @tree_id + 21, "Improved Reincarnation", "spell_nature_reincarnation", 1, 0, 2, NULL),
(29187, @tree_id + 21, "Healing Grace", "spell_nature_healingtouch", 1, 1, 3, NULL),
(16179, @tree_id + 21, "Tidal Focus", "spell_frost_manarecharge", 1, 2, 5, NULL),
(16180, @tree_id + 21, "Improved Water Shield", "ability_shaman_watershield", 2, 0, 3, NULL),
(16181, @tree_id + 21, "Healing Focus", "spell_nature_healingwavelesser", 2, 1, 3, NULL),
(55198, @tree_id + 21, "Tidal Force", "spell_frost_frostbolt", 2, 2, 1, NULL),
(16176, @tree_id + 21, "Ancestral Healing", "spell_nature_undyingstrength", 2, 3, 3, NULL),
(16187, @tree_id + 21, "Restorative Totems", "spell_nature_manaregentotem", 3, 1, 3, NULL),
(16194, @tree_id + 21, "Tidal Mastery", "spell_nature_tranquility", 3, 2, 5, NULL),
(29206, @tree_id + 21, "Healing Way", "spell_nature_healingway", 4, 0, 3, NULL),
(16188, @tree_id + 21, "Nature's Swiftness", "spell_nature_ravenform", 4, 2, 1, NULL),
(30864, @tree_id + 21, "Focused Mind", "spell_nature_focusedmind", 4, 3, 3, NULL),
(16178, @tree_id + 21, "Purification", "spell_frost_wizardmark", 5, 2, 5, NULL),
(30881, @tree_id + 21, "Nature's Guardian", "spell_nature_natureguardian", 6, 0, 5, NULL),
(16190, @tree_id + 21, "Mana Tide Totem", "spell_frost_summonwaterelemental", 6, 1, 1, 16187),
(51886, @tree_id + 21, "Cleanse Spirit", "ability_shaman_cleansespirit", 6, 2, 1, 16178),
(51554, @tree_id + 21, "Blessing of the Eternals", "spell_shaman_blessingofeternals", 7, 0, 2, NULL),
(30872, @tree_id + 21, "Improved Chain Heal", "spell_nature_healingwavegreater", 7, 1, 2, NULL),
(30867, @tree_id + 21, "Nature's Blessing", "spell_nature_natureblessing", 7, 2, 3, NULL),
(51556, @tree_id + 21, "Ancestral Awakening", "spell_shaman_ancestralawakening", 8, 0, 3, NULL),
(974, @tree_id + 21, "Earth Shield", "spell_nature_skinofearth", 8, 1, 1, NULL),
(51560, @tree_id + 21, "Improved Earth Shield", "spell_nature_skinofearth", 8, 2, 2, NULL),
(51562, @tree_id + 21, "Tidal Waves", "spell_shaman_tidalwaves", 9, 1, 5, NULL),
(61295, @tree_id + 21, "Riptide", "spell_nature_riptide", 10, 1, 1, NULL),
-- arcane
(11222, @tree_id + 22, "Arcane Focus", "spell_holy_devotion", 0, 1, 3, NULL),
(11210, @tree_id + 22, "Arcane Subtlety", "spell_holy_dispelmagic", 0, 0, 2, NULL),
(11237, @tree_id + 22, "Arcane Stability", "spell_nature_starfall", 0, 2, 5, NULL),
(28574, @tree_id + 22, "Arcane Fortitude", "spell_arcane_arcaneresilience", 1, 0, 3, NULL),
(29441, @tree_id + 22, "Magic Absorption", "spell_nature_astralrecalgroup", 1, 1, 2, NULL),
(11213, @tree_id + 22, "Arcane Concentration", "spell_shadow_manaburn", 1, 2, 5, NULL),
(11247, @tree_id + 22, "Magic Attunement", "spell_nature_abolishmagic", 2, 0, 2, NULL),
(11242, @tree_id + 22, "Spell Impact", "spell_nature_wispsplode", 2, 1, 3, NULL),
(44397, @tree_id + 22, "Student of the Mind", "ability_mage_studentofthemind", 2, 2, 3, NULL),
(54646, @tree_id + 22, "Focus Magic", "spell_arcane_studentofmagic", 2, 3, 1, NULL),
(11252, @tree_id + 22, "Arcane Shielding", "spell_shadow_detectlesserinvisibility", 3, 0, 2, NULL),
(11255, @tree_id + 22, "Improved Counterspell", "spell_frost_iceshock", 3, 1, 2, NULL),
(18462, @tree_id + 22, "Arcane Meditation", "spell_shadow_siphonmana", 3, 2, 3, NULL),
(29447, @tree_id + 22, "Torment the Weak", "ability_mage_tormentoftheweak", 3, 3, 3, NULL),
(31569, @tree_id + 22, "Improved Blink", "spell_arcane_blink", 4, 0, 2, NULL),
(12043, @tree_id + 22, "Presence of Mind", "spell_nature_enchantarmor", 4, 1, 1, NULL),
(11232, @tree_id + 22, "Arcane Mind", "spell_shadow_charm", 4, 3, 5, NULL),
(31574, @tree_id + 22, "Prismatic Cloak", "spell_arcane_prismaticcloak", 5, 0, 3, NULL),
(15058, @tree_id + 22, "Arcane Instability", "spell_shadow_teleport", 5, 1, 3, 12043),
(31571, @tree_id + 22, "Arcane Potency", "spell_arcane_arcanepotency", 5, 2, 2, 12043),
(31579, @tree_id + 22, "Arcane Empowerment", "spell_nature_starfall", 6, 0, 3, NULL),
(12042, @tree_id + 22, "Arcane Power", "spell_nature_lightning", 6, 1, 1, 15058),
(44394, @tree_id + 22, "Incanter's Absorption", "ability_mage_incantersabsorbtion", 6, 2, 3, NULL),
(44378, @tree_id + 22, "Arcane Flows", "ability_mage_potentspirit", 7, 1, 2, NULL),
(31584, @tree_id + 22, "Mind Mastery", "spell_arcane_mindmastery", 7, 2, 5, NULL),
(31589, @tree_id + 22, "Slow", "spell_nature_slow", 8, 1, 1, NULL),
(44404, @tree_id + 22, "Missile Barrage", "ability_mage_missilebarrage", 8, 2, 5, NULL),
(44400, @tree_id + 22, "Netherwind Presence", "ability_mage_netherwindpresence", 9, 1, 3, NULL),
(35578, @tree_id + 22, "Spell Power", "spell_arcane_arcanetorrent", 9, 2, 2, NULL),
(44425, @tree_id + 22, "Arcane Barrage", "ability_mage_arcanebarrage", 10, 1, 1, NULL),
-- fire
(11078, @tree_id + 23, "Improved Fire Blast", "spell_fire_fireball", 0, 0, 2, NULL),
(18459, @tree_id + 23, "Incineration", "spell_fire_flameshock", 0, 1, 3, NULL),
(11069, @tree_id + 23, "Improved Fireball", "spell_fire_flamebolt", 0, 2, 5, NULL),
(11119, @tree_id + 23, "Ignite", "spell_fire_incinerate", 1, 0, 5, NULL),
(54747, @tree_id + 23, "Burning Determination", "spell_fire_totemofwrath", 1, 1, 2, NULL),
(11108, @tree_id + 23, "World in Flames", "ability_mage_worldinflames", 1, 2, 3, NULL),
(11100, @tree_id + 23, "Flame Throwing", "spell_fire_flare", 2, 0, 2, NULL),
(11103, @tree_id + 23, "Impact", "spell_fire_meteorstorm", 2, 1, 3, NULL),
(11366, @tree_id + 23, "Pyroblast", "spell_fire_fireball02", 2, 2, 1, NULL),
(11083, @tree_id + 23, "Burning Soul", "spell_fire_fire", 2, 3, 2, NULL),
(11095, @tree_id + 23, "Improved Scorch", "spell_fire_soulburn", 3, 0, 3, NULL),
(11094, @tree_id + 23, "Molten Shields", "spell_fire_firearmor", 3, 1, 2, NULL),
(29074, @tree_id + 23, "Master of Elements", "spell_fire_masterofelements", 3, 3, 3, NULL),
(31638, @tree_id + 23, "Playing with Fire", "spell_fire_playingwithfire", 4, 0, 3, NULL),
(11115, @tree_id + 23, "Critical Mass", "spell_nature_wispheal", 4, 1, 3, NULL),
(11113, @tree_id + 23, "Blast Wave", "spell_holy_excorcism_02", 4, 2, 1, 11366),
(31641, @tree_id + 23, "Blazing Speed", "spell_fire_burningspeed", 5, 0, 2, NULL),
(11124, @tree_id + 23, "Fire Power", "spell_fire_immolation", 5, 2, 5, NULL),
(34293, @tree_id + 23, "Pyromaniac", "spell_fire_burnout", 6, 0, 3, NULL),
(11129, @tree_id + 23, "Combustion", "spell_fire_sealoffire", 6, 1, 1, 11115),
(31679, @tree_id + 23, "Molten Fury", "spell_fire_moltenblood", 6, 2, 2, NULL),
(64353, @tree_id + 23, "Fiery Payback", "ability_mage_fierypayback", 7, 0, 2, NULL),
(31656, @tree_id + 23, "Empowered Fire", "spell_fire_flamebolt", 7, 2, 3, NULL),
(44442, @tree_id + 23, "Firestarter", "ability_mage_firestarter", 8, 0, 2, NULL),
(31661, @tree_id + 23, "Dragon's Breath", "inv_misc_head_dragon_01", 8, 1, 1, 11129),
(44445, @tree_id + 23, "Hot Streak", "ability_mage_hotstreak", 8, 2, 3, NULL),
(44449, @tree_id + 23, "Burnout", "ability_mage_burnout", 9, 1, 5, NULL),
(44457, @tree_id + 23, "Living Bomb", "ability_mage_livingbomb", 10, 1, 1, NULL),
-- frost
(11071, @tree_id + 24, "Frostbite", "spell_frost_frostarmor", 0, 0, 3, NULL),
(11070, @tree_id + 24, "Improved Frostbolt", "spell_frost_frostbolt02", 0, 1, 5, NULL),
(31670, @tree_id + 24, "Ice Floes", "spell_frost_icefloes", 0, 2, 3, NULL),
(11207, @tree_id + 24, "Ice Shards", "spell_frost_iceshard", 1, 0, 3, NULL),
(11189, @tree_id + 24, "Frost Warding", "spell_frost_frostward", 1, 1, 2, NULL),
(29438, @tree_id + 24, "Precision", "spell_ice_magicdamage", 1, 2, 3, NULL),
(11175, @tree_id + 24, "Permafrost", "spell_frost_wisp", 1, 3, 3, NULL),
(11151, @tree_id + 24, "Piercing Ice", "spell_frost_frostbolt", 2, 0, 3, NULL),
(12472, @tree_id + 24, "Icy Veins", "spell_frost_coldhearted", 2, 1, 1, NULL),
(11185, @tree_id + 24, "Improved Blizzard", "spell_frost_icestorm", 2, 2, 3, NULL),
(16757, @tree_id + 24, "Arctic Reach", "spell_shadow_darkritual", 3, 0, 2, NULL),
(11160, @tree_id + 24, "Frost Channeling", "spell_frost_stun", 3, 1, 3, NULL),
(11170, @tree_id + 24, "Shatter", "spell_frost_frostshock", 3, 2, 3, NULL),
(11958, @tree_id + 24, "Cold Snap", "spell_frost_wizardmark", 4, 1, 1, NULL),
(11190, @tree_id + 24, "Improved Cone of Cold", "spell_frost_glacier", 4, 2, 3, NULL),
(31667, @tree_id + 24, "Frozen Core", "spell_frost_frozencore", 4, 3, 3, NULL),
(55091, @tree_id + 24, "Cold as Ice", "ability_mage_coldasice", 5, 0, 2, 11958),
(11180, @tree_id + 24, "Winter's Chill", "spell_frost_chillingblast", 5, 2, 3, NULL),
(44745, @tree_id + 24, "Shattered Barrier", "ability_mage_shattershield", 6, 0, 2, 11426),
(11426, @tree_id + 24, "Ice Barrier", "spell_ice_lament", 6, 1, 1, 11958),
(31674, @tree_id + 24, "Arctic Winds", "spell_frost_arcticwinds", 6, 2, 5, NULL),
(31682, @tree_id + 24, "Empowered Frostbolt", "spell_frost_frostbolt02", 7, 1, 2, NULL),
(44543, @tree_id + 24, "Fingers of Frost", "ability_mage_wintersgrasp", 7, 2, 2, NULL),
(44546, @tree_id + 24, "Brain Freeze", "ability_mage_brainfreeze", 8, 0, 3, NULL),
(31687, @tree_id + 24, "Summon Water Elemental", "spell_frost_summonwaterelemental_2", 8, 1, 1, NULL),
(44557, @tree_id + 24, "Enduring Winter", "spell_frost_summonwaterelemental_2", 8, 2, 3, 31687),
(44566, @tree_id + 24, "Chilled to the Bone", "ability_mage_chilledtothebone", 9, 1, 5, NULL),
(44572, @tree_id + 24, "Deep Freeze", "ability_mage_deepfreeze", 10, 1, 1, NULL),
-- affliction
(18827, @tree_id + 25, "Improved Curse of Agony", "spell_shadow_curseofsargeras", 0, 0, 2, NULL),
(18174, @tree_id + 25, "Suppression", "spell_shadow_unsummonbuilding", 0, 1, 3, NULL),
(17810, @tree_id + 25, "Improved Corruption", "spell_shadow_abominationexplosion", 0, 2, 5, NULL),
(18179, @tree_id + 25, "Improved Curse of Weakness", "spell_shadow_curseofmannoroth", 1, 0, 2, NULL),
(18213, @tree_id + 25, "Improved Drain Soul", "spell_shadow_haunting", 1, 1, 2, NULL),
(18182, @tree_id + 25, "Improved Life Tap", "spell_shadow_burningspirit", 1, 2, 2, NULL),
(17804, @tree_id + 25, "Soul Siphon", "spell_shadow_lifedrain02", 1, 3, 2, NULL),
(53754, @tree_id + 25, "Improved Fear", "spell_shadow_possession", 2, 0, 2, NULL),
(17783, @tree_id + 25, "Fel Concentration", "spell_shadow_fingerofdeath", 2, 1, 3, NULL),
(18288, @tree_id + 25, "Amplify Curse", "spell_shadow_contagion", 2, 2, 1, NULL),
(18218, @tree_id + 25, "Grim Reach", "spell_shadow_callofbone", 3, 0, 2, NULL),
(18094, @tree_id + 25, "Nightfall", "spell_shadow_twilight", 3, 1, 2, NULL),
(32381, @tree_id + 25, "Empowered Corruption", "spell_shadow_abominationexplosion", 3, 3, 3, NULL),
(32385, @tree_id + 25, "Shadow Embrace", "spell_shadow_shadowembrace", 4, 0, 5, NULL),
(63108, @tree_id + 25, "Siphon Life", "spell_shadow_requiem", 4, 1, 1, NULL),
(18223, @tree_id + 25, "Curse of Exhaustion", "spell_shadow_grimward", 4, 2, 1, 18288),
(54037, @tree_id + 25, "Improved Felhunter", "spell_shadow_summonfelhunter", 5, 0, 2, NULL),
(18271, @tree_id + 25, "Shadow Mastery", "spell_shadow_shadetruesight", 5, 1, 5, 63108),
(47195, @tree_id + 25, "Eradication", "ability_warlock_eradication", 6, 0, 3, NULL),
(30060, @tree_id + 25, "Contagion", "spell_shadow_painfulafflictions", 6, 1, 5, NULL),
(18220, @tree_id + 25, "Dark Pact", "spell_shadow_darkritual", 6, 2, 1, NULL),
(30054, @tree_id + 25, "Improved Howl of Terror", "spell_shadow_deathscream", 7, 0, 2, NULL),
(32477, @tree_id + 25, "Malediction", "spell_shadow_curseofachimonde", 7, 2, 3, NULL),
(47198, @tree_id + 25, "Death's Embrace", "spell_shadow_deathsembrace", 8, 0, 3, NULL),
(30108, @tree_id + 25, "Unstable Affliction", "spell_shadow_unstableaffliction_3", 8, 1, 1, 30060),
(58435, @tree_id + 25, "Pandemic", "spell_shadow_unstableaffliction_2", 8, 2, 1, 30108),
(47201, @tree_id + 25, "Everlasting Affliction", "ability_warlock_everlastingaffliction", 9, 1, 5, NULL),
(48181, @tree_id + 25, "Haunt", "ability_warlock_haunt", 10, 1, 1, NULL),
-- demonology
(18692, @tree_id + 26, "Improved Healthstone", "inv_stone_04", 0, 0, 2, NULL),
(18694, @tree_id + 26, "Improved Imp", "spell_shadow_summonimp", 0, 1, 3, NULL),
(18697, @tree_id + 26, "Demonic Embrace", "spell_shadow_metamorphosis", 0, 2, 3, NULL),
(47230, @tree_id + 26, "Fel Synergy", "spell_shadow_felmending", 0, 3, 2, NULL),
(18703, @tree_id + 26, "Improved Health Funnel", "spell_shadow_lifedrain", 1, 0, 2, NULL),
(18705, @tree_id + 26, "Demonic Brutality", "spell_shadow_summonvoidwalker", 1, 1, 3, NULL),
(18731, @tree_id + 26, "Fel Vitality", "spell_holy_magicalsentry", 1, 2, 3, NULL),
(18754, @tree_id + 26, "Improved Succubus", "spell_shadow_summonsuccubus", 2, 0, 3, NULL),
(19028, @tree_id + 26, "Soul Link", "spell_shadow_gathershadows", 2, 1, 1, NULL),
(18708, @tree_id + 26, "Fel Domination", "spell_nature_removecurse", 2, 2, 1, NULL),
(30143, @tree_id + 26, "Demonic Aegis", "spell_shadow_ragingscream", 2, 3, 3, NULL),
(18769, @tree_id + 26, "Unholy Power", "spell_shadow_shadowworddominate", 3, 1, 5, 19028),
(18709, @tree_id + 26, "Master Summoner", "spell_shadow_impphaseshift", 3, 2, 2, 18708),
(30326, @tree_id + 26, "Mana Feed", "spell_shadow_manafeed", 4, 0, 1, 18769),
(18767, @tree_id + 26, "Master Conjuror", "inv_ammo_firetar", 4, 2, 2, NULL),
(23785, @tree_id + 26, "Master Demonologist", "spell_shadow_shadowpact", 5, 1, 5, 18769),
(47245, @tree_id + 26, "Molten Core", "ability_warlock_moltencore", 5, 2, 3, NULL),
(30319, @tree_id + 26, "Demonic Resilience", "spell_shadow_demonicfortitude", 6, 0, 3, NULL),
(47193, @tree_id + 26, "Demonic Empowerment", "ability_warlock_demonicempowerment", 6, 1, 1, 23785),
(35691, @tree_id + 26, "Demonic Knowledge", "spell_shadow_improvedvampiricembrace", 6, 2, 3, NULL),
(30242, @tree_id + 26, "Demonic Tactics", "spell_shadow_demonictactics", 7, 1, 5, NULL),
(63156, @tree_id + 26, "Decimation", "spell_fire_fireball02", 7, 2, 2, NULL),
(54347, @tree_id + 26, "Improved Demonic Tactics", "ability_warlock_improveddemonictactics", 8, 0, 3, 30242),
(30146, @tree_id + 26, "Summon Felguard", "spell_shadow_summonfelguard", 8, 1, 1, NULL),
(63117, @tree_id + 26, "Nemesis", "spell_shadow_demonicempathy", 8, 2, 3, NULL),
(47236, @tree_id + 26, "Demonic Pact", "spell_shadow_demonicpact", 9, 1, 5, NULL),
(59672, @tree_id + 26, "Metamorphosis", "spell_shadow_demonform", 10, 1, 1, NULL),
-- destruction
(17793, @tree_id + 27, "Improved Shadow Bolt", "spell_shadow_shadowbolt", 0, 1, 5, NULL),
(17788, @tree_id + 27, "Bane", "spell_shadow_deathpact", 0, 2, 5, NULL),
(18119, @tree_id + 27, "Aftermath", "spell_fire_fire", 1, 0, 2, NULL),
(63349, @tree_id + 27, "Molten Skin", "ability_mage_moltenarmor", 1, 1, 3, NULL),
(17778, @tree_id + 27, "Cataclysm", "spell_fire_windsofwoe", 1, 2, 3, NULL),
(18126, @tree_id + 27, "Demonic Power", "spell_fire_firebolt", 2, 0, 2, NULL),
(17877, @tree_id + 27, "Shadowburn", "spell_shadow_scourgebuild", 2, 1, 1, NULL),
(17959, @tree_id + 27, "Ruin", "spell_shadow_shadowwordpain", 2, 2, 5, NULL),
(18135, @tree_id + 27, "Intensity", "spell_fire_lavaspawn", 3, 0, 2, NULL),
(17917, @tree_id + 27, "Destructive Reach", "spell_shadow_corpseexplode", 3, 1, 2, NULL),
(17927, @tree_id + 27, "Improved Searing Pain", "spell_fire_soulburn", 3, 3, 3, NULL),
(34935, @tree_id + 27, "Backlash", "spell_fire_playingwithfire", 4, 0, 3, 18135),
(17815, @tree_id + 27, "Improved Immolate", "spell_fire_immolation", 4, 1, 3, NULL),
(18130, @tree_id + 27, "Devastation", "spell_fire_flameshock", 4, 2, 1, 17959),
(30299, @tree_id + 27, "Nether Protection", "spell_shadow_netherprotection", 5, 0, 3, NULL),
(17954, @tree_id + 27, "Emberstorm", "spell_fire_selfdestruct", 5, 2, 5, NULL),
(17962, @tree_id + 27, "Conflagrate", "spell_fire_fireball", 6, 1, 1, 17815),
(30293, @tree_id + 27, "Soul Leech", "spell_shadow_soulleech_3", 6, 2, 3, NULL),
(18096, @tree_id + 27, "Pyroclasm", "spell_fire_volcano", 6, 3, 3, NULL),
(30288, @tree_id + 27, "Shadow and Flame", "spell_shadow_shadowandflame", 7, 1, 5, NULL),
(54117, @tree_id + 27, "Improved Soul Leech", "ability_warlock_improvedsoulleech", 7, 2, 2, 30293),
(47258, @tree_id + 27, "Backdraft", "ability_warlock_backdraft", 8, 0, 3, 17962),
(30283, @tree_id + 27, "Shadowfury", "spell_shadow_shadowfury", 8, 1, 1, NULL),
(47220, @tree_id + 27, "Empowered Imp", "ability_warlock_empoweredimp", 8, 2, 3, NULL),
(47266, @tree_id + 27, "Fire and Brimstone", "ability_warlock_fireandbrimstone", 9, 1, 5, NULL),
(50796, @tree_id + 27, "Chaos Bolt", "ability_warlock_chaosbolt", 10, 1, 1, NULL),
-- balance
(16814, @tree_id + 28, "Starlight Wrath", "spell_nature_abolishmagic", 0, 1, 5, NULL),
(57810, @tree_id + 28, "Genesis", "spell_arcane_arcane03", 0, 2, 5, NULL),
(16845, @tree_id + 28, "Moonglow", "spell_nature_sentinal", 1, 0, 3, NULL),
(35363, @tree_id + 28, "Nature's Majesty", "inv_staff_01", 1, 1, 2, NULL),
(16821, @tree_id + 28, "Improved Moonfire", "spell_nature_starfall", 1, 3, 2, NULL),
(16836, @tree_id + 28, "Brambles", "spell_nature_thorns", 2, 0, 3, NULL),
(16880, @tree_id + 28, "Nature's Grace", "spell_nature_naturesblessing", 2, 1, 3, 35363),
(57865, @tree_id + 28, "Nature's Splendor", "spell_nature_natureguardian", 2, 2, 1, 35363),
(16819, @tree_id + 28, "Nature's Reach", "spell_nature_naturetouchgrow", 2, 3, 2, NULL),
(16909, @tree_id + 28, "Vengeance", "spell_nature_purge", 3, 1, 5, NULL),
(16850, @tree_id + 28, "Celestial Focus", "spell_arcane_starfire", 3, 2, 3, NULL),
(33589, @tree_id + 28, "Lunar Guidance", "ability_druid_lunarguidance", 4, 0, 3, NULL),
(5570, @tree_id + 28, "Insect Swarm", "spell_nature_insectswarm", 4, 1, 1, NULL),
(57849, @tree_id + 28, "Improved Insect Swarm", "spell_nature_insectswarm", 4, 2, 3, NULL),
(33597, @tree_id + 28, "Dreamstate", "ability_druid_dreamstate", 5, 0, 3, NULL),
(16896, @tree_id + 28, "Moonfury", "spell_nature_moonglow", 5, 1, 3, NULL),
(33592, @tree_id + 28, "Balance of Power", "ability_druid_balanceofpower", 5, 2, 2, NULL),
(24858, @tree_id + 28, "Moonkin Form", "spell_nature_forceofnature", 6, 1, 1, NULL),
(48384, @tree_id + 28, "Improved Moonkin Form", "ability_druid_improvedmoonkinform", 6, 2, 3, 24858),
(33600, @tree_id + 28, "Improved Faerie Fire", "spell_nature_faeriefire", 6, 3, 3, NULL),
(48389, @tree_id + 28, "Owlkin Frenzy", "ability_druid_owlkinfrenzy", 7, 0, 3, 24858),
(33603, @tree_id + 28, "Wrath of Cenarius", "ability_druid_twilightswrath", 7, 2, 5, NULL),
(48516, @tree_id + 28, "Eclipse", "ability_druid_eclipse", 8, 0, 3, NULL),
(50516, @tree_id + 28, "Typhoon", "ability_druid_typhoon", 8, 1, 1, 24858),
(33831, @tree_id + 28, "Force of Nature", "ability_druid_forceofnature", 8, 2, 1, NULL),
(48488, @tree_id + 28, "Gale Winds", "ability_druid_galewinds", 8, 3, 2, NULL),
(48506, @tree_id + 28, "Earth and Moon", "ability_druid_earthandsky", 9, 1, 3, NULL),
(48505, @tree_id + 28, "Starfall", "ability_druid_starfall", 10, 1, 1, NULL),
-- feralcombat
(16934, @tree_id + 29, "Ferocity", "ability_hunter_pet_hyena", 0, 1, 5, NULL),
(16858, @tree_id + 29, "Feral Aggression", "ability_druid_demoralizingroar", 0, 2, 5, NULL),
(16947, @tree_id + 29, "Feral Instinct", "ability_ambush", 1, 0, 3, NULL),
(16998, @tree_id + 29, "Savage Fury", "ability_druid_ravage", 1, 1, 2, NULL),
(16929, @tree_id + 29, "Thick Hide", "inv_misc_pelt_bear_03", 1, 2, 3, NULL),
(17002, @tree_id + 29, "Feral Swiftness", "spell_nature_spiritwolf", 2, 0, 2, NULL),
(61336, @tree_id + 29, "Survival Instincts", "ability_druid_tigersroar", 2, 1, 1, NULL),
(16942, @tree_id + 29, "Sharpened Claws", "inv_misc_monsterclaw_04", 2, 2, 3, NULL),
(16966, @tree_id + 29, "Shredding Attacks", "spell_shadow_vampiricaura", 3, 0, 2, NULL),
(16972, @tree_id + 29, "Predatory Strikes", "ability_hunter_pet_cat", 3, 1, 3, NULL),
(37116, @tree_id + 29, "Primal Fury", "ability_racial_cannibalize", 3, 2, 2, 16942),
(48409, @tree_id + 29, "Primal Precision", "ability_druid_primalprecision", 3, 3, 2, 16942),
(16940, @tree_id + 29, "Brutal Impact", "ability_druid_bash", 4, 0, 2, NULL),
(49377, @tree_id + 29, "Feral Charge", "ability_hunter_pet_bear", 4, 2, 1, NULL),
(33872, @tree_id + 29, "Nurturing Instinct", "ability_druid_healinginstincts", 4, 3, 2, NULL),
(57878, @tree_id + 29, "Natural Reaction", "ability_bullrush", 5, 0, 3, NULL),
(17003, @tree_id + 29, "Heart of the Wild", "spell_holy_blessingofagility", 5, 1, 5, 16972),
(33853, @tree_id + 29, "Survival of the Fittest", "ability_druid_enrage", 5, 2, 3, NULL),
(17007, @tree_id + 29, "Leader of the Pack", "spell_nature_unyeildingstamina", 6, 1, 1, NULL),
(34297, @tree_id + 29, "Improved Leader of the Pack", "spell_nature_unyeildingstamina", 6, 2, 2, 17007),
(33851, @tree_id + 29, "Primal Tenacity", "ability_druid_primaltenacity", 6, 3, 3, NULL),
(57873, @tree_id + 29, "Protector of the Pack", "ability_druid_challangingroar", 7, 0, 3, 17007),
(33859, @tree_id + 29, "Predatory Instincts", "ability_druid_predatoryinstincts", 7, 2, 3, NULL),
(48483, @tree_id + 29, "Infected Wounds", "ability_druid_infectedwound", 7, 3, 3, NULL),
(48492, @tree_id + 29, "King of the Jungle", "ability_druid_kingofthejungle", 8, 0, 3, NULL),
(33917, @tree_id + 29, "Mangle", "ability_druid_mangle2", 8, 1, 1, 17007),
(48532, @tree_id + 29, "Improved Mangle", "ability_druid_mangle2", 8, 2, 3, 33917),
(48432, @tree_id + 29, "Rend and Tear", "ability_druid_primalagression", 9, 1, 5, NULL),
(63503, @tree_id + 29, "Primal Gore", "ability_druid_rake", 9, 2, 1, 48432),
(50334, @tree_id + 29, "Berserk", "ability_druid_berserk", 10, 1, 1, NULL),
-- restoration
(17050, @tree_id + 30, "Improved Mark of the Wild", "spell_nature_regeneration", 0, 0, 2, NULL),
(17063, @tree_id + 30, "Nature's Focus", "spell_nature_healingwavegreater", 0, 1, 3, NULL),
(17056, @tree_id + 30, "Furor", "spell_holy_blessingofstamina", 0, 2, 5, NULL),
(17069, @tree_id + 30, "Naturalist", "spell_nature_healingtouch", 1, 0, 5, NULL),
(17118, @tree_id + 30, "Subtlety", "ability_eyeoftheowl", 1, 1, 3, NULL),
(16833, @tree_id + 30, "Natural Shapeshifter", "spell_nature_wispsplode", 1, 2, 3, NULL),
(17106, @tree_id + 30, "Intensity", "spell_frost_windwalkon", 2, 0, 3, NULL),
(16864, @tree_id + 30, "Omen of Clarity", "spell_nature_crystalball", 2, 1, 1, NULL),
(48411, @tree_id + 30, "Master Shapeshifter", "ability_druid_mastershapeshifter", 2, 2, 2, 16833),
(24968, @tree_id + 30, "Tranquil Spirit", "spell_holy_elunesgrace", 3, 1, 5, NULL),
(17111, @tree_id + 30, "Improved Rejuvenation", "spell_nature_rejuvenation", 3, 2, 3, NULL),
(17116, @tree_id + 30, "Nature's Swiftness", "spell_nature_ravenform", 4, 0, 1, 17106),
(17104, @tree_id + 30, "Gift of Nature", "spell_nature_protectionformnature", 4, 1, 5, NULL),
(17123, @tree_id + 30, "Improved Tranquility", "spell_nature_tranquility", 4, 3, 2, NULL),
(33879, @tree_id + 30, "Empowered Touch", "ability_druid_empoweredtouch", 5, 0, 2, NULL),
(17074, @tree_id + 30, "Nature's Bounty", "spell_nature_resistnature", 5, 2, 5, 17111),
(34151, @tree_id + 30, "Living Spirit", "spell_nature_giftofthewaterspirit", 6, 0, 3, NULL),
(18562, @tree_id + 30, "Swiftmend", "inv_relics_idolofrejuvenation", 6, 1, 1, 17104),
(33881, @tree_id + 30, "Natural Perfection", "ability_druid_naturalperfection", 6, 2, 3, NULL),
(33886, @tree_id + 30, "Empowered Rejuvenation", "ability_druid_empoweredrejuvination", 7, 1, 5, NULL),
(48496, @tree_id + 30, "Living Seed", "ability_druid_giftoftheearthmother", 7, 2, 3, NULL),
(48539, @tree_id + 30, "Revitalize", "ability_druid_replenish", 8, 0, 3, NULL),
(65139, @tree_id + 30, "Tree of Life", "ability_druid_treeoflife", 8, 1, 1, 33886),
(48535, @tree_id + 30, "Improved Tree of Life", "ability_druid_improvedtreeform", 8, 2, 3, 65139),
(63410, @tree_id + 30, "Improved Barkskin", "spell_nature_stoneclawtotem", 9, 0, 2, NULL),
(51179, @tree_id + 30, "Gift of the Earthmother", "ability_druid_manatree", 9, 2, 5, NULL),
(48438, @tree_id + 30, "Wild Growth", "ability_druid_flourish", 10, 1, 1, 65139);

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
  "Increases the bleed damage done by your Rend ability by 10%.",
  "Increases the bleed damage done by your Rend ability by 10%.",
  NULL,
  NULL,
  NULL
),

(12285, @locale_en,
  "Increases the amount of rage generated by your Charge ability by 5.",
  "Increases the amount of rage generated by your Charge ability by 5.",
  NULL,
  NULL,
  NULL
),

(12300, @locale_en,
  "Reduces the duration of all Stun and Charm effects used against you by 7%.",
  "Reduces the duration of all Stun and Charm effects used against you by 7%.",
  "Reduces the duration of all Stun and Charm effects used against you by 7%.",
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

(12290, @locale_en,
  "Increases the critical strike chance of your Overpower ability by 25%.",
  "Increases the critical strike chance of your Overpower ability by 25%.",
  NULL,
  NULL,
  NULL
),

(12296, @locale_en,
  "Generates 1 rage per 3 seconds.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16493, @locale_en,
  "Increases the critical strike damage bonus of your abilities by 10%.",
  "Increases the critical strike damage bonus of your abilities by 10%.",
  NULL,
  NULL,
  NULL
),

(12834, @locale_en,
  "Your critical strikes cause the opponent to bleed, dealing 16% of your melee weapon's average damage over 6 sec.",
  "Your critical strikes cause the opponent to bleed, dealing 16% of your melee weapon's average damage over 6 sec.",
  "Your critical strikes cause the opponent to bleed, dealing 16% of your melee weapon's average damage over 6 sec.",
  NULL,
  NULL
),

(12163, @locale_en,
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  NULL,
  NULL
),

(56636, @locale_en,
  "Whenever your Rend ability causes damage, you have a 33% chance of allowing the use of your Overpower ability for 9 sec.  1 charge.  This effect will not occur more than once every 6 sec.",
  "Whenever your Rend ability causes damage, you have a 33% chance of allowing the use of your Overpower ability for 9 sec.  1 charge.  This effect will not occur more than once every 6 sec.",
  "Whenever your Rend ability causes damage, you have a 33% chance of allowing the use of your Overpower ability for 9 sec.  1 charge.  This effect will not occur more than once every 6 sec.",
  NULL,
  NULL
),

(12700, @locale_en,
  "Increases your chance to get a critical strike and the critical damage caused with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike and the critical damage caused with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike and the critical damage caused with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike and the critical damage caused with Axes and Polearms by 1%.",
  "Increases your chance to get a critical strike and the critical damage caused with Axes and Polearms by 1%."
),

(12328, @locale_en,
  "Your next 5 melee attacks strike an additional nearby opponent.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12284, @locale_en,
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor."
),

(12281, @locale_en,
  "Gives you a 2% chance to get an extra attack on the same target after hitting your target with your Sword.  This effect cannot occur more than once every 6 seconds.",
  "Gives you a 2% chance to get an extra attack on the same target after hitting your target with your Sword.  This effect cannot occur more than once every 6 seconds.",
  "Gives you a 2% chance to get an extra attack on the same target after hitting your target with your Sword.  This effect cannot occur more than once every 6 seconds.",
  "Gives you a 2% chance to get an extra attack on the same target after hitting your target with your Sword.  This effect cannot occur more than once every 6 seconds.",
  "Gives you a 2% chance to get an extra attack on the same target after hitting your target with your Sword.  This effect cannot occur more than once every 6 seconds."
),

(20504, @locale_en,
  "Reduces the chance for your attacks to be dodged by 1% and reduces the duration of all Disarm effects used against you by 25%.  This does not stack with other Disarm duration reducing effects.",
  "Reduces the chance for your attacks to be dodged by 1% and reduces the duration of all Disarm effects used against you by 25%.  This does not stack with other Disarm duration reducing effects.",
  NULL,
  NULL,
  NULL
),

(12289, @locale_en,
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5 sec.",
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5 sec.",
  "Gives your Hamstring ability a 5% chance to immobilize the target for 5 sec.",
  NULL,
  NULL
),

(46854, @locale_en,
  "Your melee critical strikes increase the effectiveness of Bleed effects on the target by 15% for 1 min.",
  "Your melee critical strikes increase the effectiveness of Bleed effects on the target by 15% for 1 min.",
  NULL,
  NULL,
  NULL
),

(29834, @locale_en,
  "Whenever you are struck by a Stun or Immobilize effect you will generate 10 rage and 5% of your total health over 10 sec.",
  "Whenever you are struck by a Stun or Immobilize effect you will generate 10 rage and 5% of your total health over 10 sec.",
  NULL,
  NULL,
  NULL
),

(12294, @locale_en,
  "A vicious strike that deals weapon damage plus 85 and wounds the target, reducing the effectiveness of any healing by 50% for 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(46865, @locale_en,
  "Increases your total Strength and Stamina by 2% and your Expertise by 2.",
  "Increases your total Strength and Stamina by 2% and your Expertise by 2.",
  NULL,
  NULL,
  NULL
),

(12862, @locale_en,
  "Decreases the swing time of your Slam ability by 0.5 sec.",
  "Decreases the swing time of your Slam ability by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(64976, @locale_en,
  "Your Charge ability is now usable while in combat, but the cooldown on Charge is increased by 5 sec. Following a Charge, your next Slam or Mortal Strike has an additional 25% chance to critically hit if used within 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(35446, @locale_en,
  "Increases the damage caused by your Mortal Strike ability by 3% and reduces the cooldown by 0.33 to 0.333 sec.",
  "Increases the damage caused by your Mortal Strike ability by 3% and reduces the cooldown by 0.33 to 0.333 sec.",
  "Increases the damage caused by your Mortal Strike ability by 3% and reduces the cooldown by 0.33 to 0.333 sec.",
  NULL,
  NULL
),

(46859, @locale_en,
  "Reduces the cooldown of your Overpower and Revenge abilities by 2 secs and increases the damage done by both abilities by 10%.  In addition, if you strike a player with Overpower while they are casting, their magical damage and healing will be reduced by 25% for 6 sec.",
  "Reduces the cooldown of your Overpower and Revenge abilities by 2 secs and increases the damage done by both abilities by 10%.  In addition, if you strike a player with Overpower while they are casting, their magical damage and healing will be reduced by 25% for 6 sec.",
  NULL,
  NULL,
  NULL
),

(29723, @locale_en,
  "Your melee hits have a 3% chance of allowing the use of Execute regardless of the target's health state.  In addition, you keep at least 3 rage after using Execute.",
  "Your melee hits have a 3% chance of allowing the use of Execute regardless of the target's health state.  In addition, you keep at least 3 rage after using Execute.",
  "Your melee hits have a 3% chance of allowing the use of Execute regardless of the target's health state.  In addition, you keep at least 3 rage after using Execute.",
  NULL,
  NULL
),

(29623, @locale_en,
  "You generate 25% more rage from damage dealt.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29836, @locale_en,
  "Increases your melee attack speed by 5%.  In addition your Rend and Deep Wounds abilities also increase all physical damage caused to that target by 2%.",
  "Increases your melee attack speed by 5%.  In addition your Rend and Deep Wounds abilities also increase all physical damage caused to that target by 2%.",
  NULL,
  NULL,
  NULL
),

(46867, @locale_en,
  "Your melee critical hits Enrage you, increasing all damage caused by 2% for 12 sec.  This effect does not stack with Enrage.",
  "Your melee critical hits Enrage you, increasing all damage caused by 2% for 12 sec.  This effect does not stack with Enrage.",
  "Your melee critical hits Enrage you, increasing all damage caused by 2% for 12 sec.  This effect does not stack with Enrage.",
  "Your melee critical hits Enrage you, increasing all damage caused by 2% for 12 sec.  This effect does not stack with Enrage.",
  "Your melee critical hits Enrage you, increasing all damage caused by 2% for 12 sec.  This effect does not stack with Enrage."
),

(46924, @locale_en,
  "Instantly Whirlwind up to 4 nearby targets and for the next 6 sec you will perform a whirlwind attack every 1 sec.  While under the effects of Bladestorm, you can move but cannot perform any other abilities but you do not feel pity or remorse or fear and you cannot be stopped unless killed.",
  NULL,
  NULL,
  NULL,
  NULL
),

(61216, @locale_en,
  "Increases your attack power by 1 for every 108 armor value you have.",
  "Increases your attack power by 1 for every 108 armor value you have.",
  "Increases your attack power by 1 for every 108 armor value you have.",
  NULL,
  NULL
),

(12321, @locale_en,
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 25%.",
  "Increases the area of effect and duration of your Battle Shout, Demoralizing Shout and Commanding Shout by 25%.",
  NULL,
  NULL,
  NULL
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
  "Causes all enemies within 10 yards to be Dazed, reducing movement speed by 50% for 6 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16487, @locale_en,
  "Regenerates 2% of your total Health over 6 sec after being the victim of a critical strike.",
  "Regenerates 2% of your total Health over 6 sec after being the victim of a critical strike.",
  "Regenerates 2% of your total Health over 6 sec after being the victim of a critical strike.",
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
  "Gives you a 30% chance to receive a 2% damage bonus for 12 sec after being the victim of a damaging attack.  This effect does not stack with Wrecking Crew.",
  "Gives you a 30% chance to receive a 2% damage bonus for 12 sec after being the victim of a damaging attack.  This effect does not stack with Wrecking Crew.",
  "Gives you a 30% chance to receive a 2% damage bonus for 12 sec after being the victim of a damaging attack.  This effect does not stack with Wrecking Crew.",
  "Gives you a 30% chance to receive a 2% damage bonus for 12 sec after being the victim of a damaging attack.  This effect does not stack with Wrecking Crew.",
  "Gives you a 30% chance to receive a 2% damage bonus for 12 sec after being the victim of a damaging attack.  This effect does not stack with Wrecking Crew."
),

(29590, @locale_en,
  "Increases your chance to hit with melee weapons by 1%.",
  "Increases your chance to hit with melee weapons by 1%.",
  "Increases your chance to hit with melee weapons by 1%.",
  NULL,
  NULL
),

(12292, @locale_en,
  "When activated you become enraged, increasing your physical damage by 20% but increasing all damage taken by 5%.  Lasts 30 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29888, @locale_en,
  "Reduces the cooldown of your Intercept ability by 5 sec.",
  "Reduces the cooldown of your Intercept ability by 5 sec.",
  NULL,
  NULL,
  NULL
),

(20500, @locale_en,
  "The Berserker Rage ability will generate 10 rage when used.",
  "The Berserker Rage ability will generate 10 rage when used.",
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

(46908, @locale_en,
  "Reduces the cooldown of your Bloodrage, Berserker Rage, Recklessness and Death Wish abilities by 11%.",
  "Reduces the cooldown of your Bloodrage, Berserker Rage, Recklessness and Death Wish abilities by 11%.",
  "Reduces the cooldown of your Bloodrage, Berserker Rage, Recklessness and Death Wish abilities by 11%.",
  NULL,
  NULL
),

(23881, @locale_en,
  "Instantly attack the target causing AP*50/100 damage.  In addition, the next 3 successful melee attacks will restore 1% of max health.  This effect lasts 8 sec.  Damage is based on your attack power.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29721, @locale_en,
  "Increases the damage of your Whirlwind ability by 10%.",
  "Increases the damage of your Whirlwind ability by 10%.",
  NULL,
  NULL,
  NULL
),

(46910, @locale_en,
  "Your normal melee attacks have a chance to reduce all healing done to the target by 25% for 10 sec.  This can stack up to 2 times.",
  "Your normal melee attacks have a chance to reduce all healing done to the target by 25% for 10 sec.  This can stack up to 2 times.",
  NULL,
  NULL,
  NULL
),

(29759, @locale_en,
  "Increases Strength by 4% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases Strength by 4% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases Strength by 4% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases Strength by 4% and reduces threat caused by 2% while in Berserker Stance.",
  "Increases Strength by 4% and reduces threat caused by 2% while in Berserker Stance."
),

(60970, @locale_en,
  "Removes any Immobilization effects and refreshes the cooldown of your Intercept ability.",
  NULL,
  NULL,
  NULL,
  NULL
),

(29801, @locale_en,
  "Increases ranged and melee critical hit chance of all party and raid members within 100 yds by 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(46913, @locale_en,
  "Your Heroic Strike, Bloodthirst, and Whirlwind hits have a 7% chance of making your next Slam instant for 5 sec.",
  "Your Heroic Strike, Bloodthirst, and Whirlwind hits have a 7% chance of making your next Slam instant for 5 sec.",
  "Your Heroic Strike, Bloodthirst, and Whirlwind hits have a 7% chance of making your next Slam instant for 5 sec.",
  NULL,
  NULL
),

(56927, @locale_en,
  "Increases the damage done by your Slam, Whirlwind and Bloodthirst abilities by 2%.",
  "Increases the damage done by your Slam, Whirlwind and Bloodthirst abilities by 2%.",
  "Increases the damage done by your Slam, Whirlwind and Bloodthirst abilities by 2%.",
  "Increases the damage done by your Slam, Whirlwind and Bloodthirst abilities by 2%.",
  "Increases the damage done by your Slam, Whirlwind and Bloodthirst abilities by 2%."
),

(46917, @locale_en,
  "Allows you to equip two-handed axes, maces and swords in one hand.  While you have a two-handed weapon equipped in one hand, your physical damage done is reduced by 10%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12301, @locale_en,
  "Increases the rage generated by your Bloodrage ability by 25%.",
  "Increases the rage generated by your Bloodrage ability by 25%.",
  NULL,
  NULL,
  NULL
),

(12298, @locale_en,
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 5 rage when a block, dodge, or parry occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 5 rage when a block, dodge, or parry occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 5 rage when a block, dodge, or parry occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 5 rage when a block, dodge, or parry occurs.",
  "Increases your chance to block attacks with a shield by 1% and has a 20% chance to generate 5 rage when a block, dodge, or parry occurs."
),

(12287, @locale_en,
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 10% and the slowing effect by an additional 4%.",
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 10% and the slowing effect by an additional 4%.",
  "Reduces the cost of your Thunder Clap ability by 1 rage point and increases the damage by 10% and the slowing effect by an additional 4%.",
  NULL,
  NULL
),

(50685, @locale_en,
  "Increases the critical strike chance of your Heroic Strike, Thunder Clap and Cleave abilities by 5%.",
  "Increases the critical strike chance of your Heroic Strike, Thunder Clap and Cleave abilities by 5%.",
  "Increases the critical strike chance of your Heroic Strike, Thunder Clap and Cleave abilities by 5%.",
  NULL,
  NULL
),

(12297, @locale_en,
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%."
),

(12975, @locale_en,
  "When activated, this ability temporarily grants you 30% of your maximum health for 20 sec.  After the effect expires, the health is lost.",
  NULL,
  NULL,
  NULL,
  NULL
),

(12797, @locale_en,
  "Increases damage of your Revenge ability by 30% and causes Revenge to strike an additional target for 50% damage.",
  "Increases damage of your Revenge ability by 30% and causes Revenge to strike an additional target for 50% damage.",
  NULL,
  NULL,
  NULL
),

(29598, @locale_en,
  "Increases your block value by 15% and reduces the cooldown of your Shield Block ability by 10 sec.",
  "Increases your block value by 15% and reduces the cooldown of your Shield Block ability by 10 sec.",
  NULL,
  NULL,
  NULL
),

(12299, @locale_en,
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%."
),

(59088, @locale_en,
  "Reduces the chance you'll be hit by spells by 2% and when the ability is used it will reflect the first spell cast against the 2 closest party members within 20 yards.",
  "Reduces the chance you'll be hit by spells by 2% and when the ability is used it will reflect the first spell cast against the 2 closest party members within 20 yards.",
  NULL,
  NULL,
  NULL
),

(12313, @locale_en,
  "Reduces the cooldown of your Disarm ability by 10 sec and causes the target to take an additional 5% damage while disarmed.",
  "Reduces the cooldown of your Disarm ability by 10 sec and causes the target to take an additional 5% damage while disarmed.",
  NULL,
  NULL,
  NULL
),

(12308, @locale_en,
  "Reduces the rage cost of your Sunder Armor and Devastate abilities by 1.",
  "Reduces the rage cost of your Sunder Armor and Devastate abilities by 1.",
  "Reduces the rage cost of your Sunder Armor and Devastate abilities by 1.",
  NULL,
  NULL
),

(12312, @locale_en,
  "Reduces the cooldown of your Shield Wall, Retaliation and Recklessness abilities by 30 secs.",
  "Reduces the cooldown of your Shield Wall, Retaliation and Recklessness abilities by 30 secs.",
  NULL,
  NULL,
  NULL
),

(12809, @locale_en,
  "Stuns the opponent for 5 sec and deals 38/100*AP damage (based on attack power).",
  NULL,
  NULL,
  NULL,
  NULL
),

(12311, @locale_en,
  "Gives your Shield Bash and Heroic Throw abilities a 50% chance to silence the target for 3 sec and increases the damage of your Shield Slam ability by 5%.",
  "Gives your Shield Bash and Heroic Throw abilities a 50% chance to silence the target for 3 sec and increases the damage of your Shield Slam ability by 5%.",
  NULL,
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
  "While in Defensive Stance all spell damage is reduced by 3% and when you Block, Parry or Dodge an attack you have a 50% chance to become Enraged, increasing Physical damage caused by 5% for 12 sec.",
  "While in Defensive Stance all spell damage is reduced by 3% and when you Block, Parry or Dodge an attack you have a 50% chance to become Enraged, increasing Physical damage caused by 5% for 12 sec.",
  NULL,
  NULL,
  NULL
),

(50720, @locale_en,
  "Focus your protective gaze on a group or raid target, reducing their damage taken by 3% and transfers <!--sp63326:0-->10<!--sp63326-->% of the threat they cause to you.  In addition, each time they are hit by an attack your Taunt cooldown is refreshed.  Lasts 30 min.  This effect can only be on one target at a time.",
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
  "Increases your total Strength by 2%, Stamina by 3% and your Expertise by 2.",
  "Increases your total Strength by 2%, Stamina by 3% and your Expertise by 2.",
  "Increases your total Strength by 2%, Stamina by 3% and your Expertise by 2.",
  NULL,
  NULL
),

(46945, @locale_en,
  "Reduces damage taken by the target of your Intervene ability by 15% for 6 sec.",
  "Reduces damage taken by the target of your Intervene ability by 15% for 6 sec.",
  NULL,
  NULL,
  NULL
),

(57499, @locale_en,
  "Your Charge, Intercept and Intervene abilities are now usable while in combat and in any stance.  In addition, your Intervene ability will remove all movement impairing effects.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20243, @locale_en,
  "Sunder the target's armor causing the Sunder Armor effect.  In addition, causes 120% of weapon damage plus 58 for each application of Sunder Armor on the target.  The Sunder Armor effect can stack up to 5 times.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47294, @locale_en,
  "Your successful blocks have a 20% chance to block double the normal amount and increases your chance to critically hit with your Shield Slam ability by an additional 5%.",
  "Your successful blocks have a 20% chance to block double the normal amount and increases your chance to critically hit with your Shield Slam ability by an additional 5%.",
  "Your successful blocks have a 20% chance to block double the normal amount and increases your chance to critically hit with your Shield Slam ability by an additional 5%.",
  NULL,
  NULL
),

(46951, @locale_en,
  "Increases the critical strike chance of your Devastate ability by 5% and when your Devastate or Revenge ability deals damage it has a 10% chance of refreshing the cooldown of your Shield Slam ability and reducing its cost by 100% for 5 sec.",
  "Increases the critical strike chance of your Devastate ability by 5% and when your Devastate or Revenge ability deals damage it has a 10% chance of refreshing the cooldown of your Shield Slam ability and reducing its cost by 100% for 5 sec.",
  "Increases the critical strike chance of your Devastate ability by 5% and when your Devastate or Revenge ability deals damage it has a 10% chance of refreshing the cooldown of your Shield Slam ability and reducing its cost by 100% for 5 sec.",
  NULL,
  NULL
),

(58872, @locale_en,
  "Whenever you take damage from or block a melee attack you cause damage equal to 10% of your block value.",
  "Whenever you take damage from or block a melee attack you cause damage equal to 10% of your block value.",
  NULL,
  NULL,
  NULL
),

(46968, @locale_en,
  "Sends a wave of force in front of the warrior, causing 75/100*AP damage (based on attack power) and stunning all enemy targets within 10 yards in a frontal cone for 4 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- paladin
(20205, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Flash of Light and Holy Light by 14%.",
  "Reduces the pushback suffered from damaging attacks while casting Flash of Light and Holy Light by 14%.",
  "Reduces the pushback suffered from damaging attacks while casting Flash of Light and Holy Light by 14%.",
  "Reduces the pushback suffered from damaging attacks while casting Flash of Light and Holy Light by 14%.",
  "Reduces the pushback suffered from damaging attacks while casting Flash of Light and Holy Light by 14%."
),

(20224, @locale_en,
  "Increases the damage done by your Seal of Righteousness, Seal of Vengeance and Seal of Corruption and their Judgement effects by 3%.",
  "Increases the damage done by your Seal of Righteousness, Seal of Vengeance and Seal of Corruption and their Judgement effects by 3%.",
  "Increases the damage done by your Seal of Righteousness, Seal of Vengeance and Seal of Corruption and their Judgement effects by 3%.",
  "Increases the damage done by your Seal of Righteousness, Seal of Vengeance and Seal of Corruption and their Judgement effects by 3%.",
  "Increases the damage done by your Seal of Righteousness, Seal of Vengeance and Seal of Corruption and their Judgement effects by 3%."
),

(20237, @locale_en,
  "Increases the amount healed by your Holy Light, Flash of Light and the effectiveness of Holy Shock spells by 4%.",
  "Increases the amount healed by your Holy Light, Flash of Light and the effectiveness of Holy Shock spells by 4%.",
  "Increases the amount healed by your Holy Light, Flash of Light and the effectiveness of Holy Shock spells by 4%.",
  NULL,
  NULL
),

(20257, @locale_en,
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%.",
  "Increases your total Intellect by 2%."
),

(9453, @locale_en,
  "Reduces the duration of all Fear and Disorient effects by 15%.",
  "Reduces the duration of all Fear and Disorient effects by 15%.",
  NULL,
  NULL,
  NULL
),

(31821, @locale_en,
  "Causes your Concentration Aura to make all affected targets immune to Silence and Interrupt effects and improve the effect of all other auras by 100%.  Lasts 6 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20210, @locale_en,
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell you have a 20% chance to gain mana equal to 30% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell you have a 20% chance to gain mana equal to 30% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell you have a 20% chance to gain mana equal to 30% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell you have a 20% chance to gain mana equal to 30% of the base cost of the spell.",
  "After getting a critical effect from your Flash of Light, Holy Light, or Holy Shock heal spell you have a 20% chance to gain mana equal to 30% of the base cost of the spell."
),

(20234, @locale_en,
  "Grants the target of your Lay on Hands spell 10% reduced physical damage taken for 15 sec.  In addition, the cooldown for your Lay on Hands spell is reduced by 2 min.",
  "Grants the target of your Lay on Hands spell 10% reduced physical damage taken for 15 sec.  In addition, the cooldown for your Lay on Hands spell is reduced by 2 min.",
  NULL,
  NULL,
  NULL
),

(20254, @locale_en,
  "Increases the effect of your Concentration Aura by an additional 5% and while any Aura is active reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  "Increases the effect of your Concentration Aura by an additional 5% and while any Aura is active reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  "Increases the effect of your Concentration Aura by an additional 5% and while any Aura is active reduces the duration of any Silence or Interrupt effect used against an affected group member by 10%.  The duration reduction does not stack with any other effects.",
  NULL,
  NULL
),

(20244, @locale_en,
  "Increases the effect of your Blessing of Wisdom spell by 10%.",
  "Increases the effect of your Blessing of Wisdom spell by 10%.",
  NULL,
  NULL,
  NULL
),

(53660, @locale_en,
  "Reduces the mana cost of Hand of Freedom, Hand of Sacrifice and Hand of Salvation by 15%, increases the effectiveness of Hand of Salvation by 50% and the effectiveness of Hand of Sacrifice by an additional 5%.",
  "Reduces the mana cost of Hand of Freedom, Hand of Sacrifice and Hand of Salvation by 15%, increases the effectiveness of Hand of Salvation by 50% and the effectiveness of Hand of Sacrifice by an additional 5%.",
  NULL,
  NULL,
  NULL
),

(31822, @locale_en,
  "Reduces the duration of Curse, Disease and Poison effects by 15%.",
  "Reduces the duration of Curse, Disease and Poison effects by 15%.",
  NULL,
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
  "Increases the critical effect chance of your Holy Light and Holy Shock spells by 2%.",
  "Increases the critical effect chance of your Holy Light and Holy Shock spells by 2%.",
  "Increases the critical effect chance of your Holy Light and Holy Shock spells by 2%.",
  NULL,
  NULL
),

(31825, @locale_en,
  "Reduces the mana cost of your Cleanse, Purify and Consecration spells by 5% and reduces the cooldown of your Exorcism and Holy Wrath spells by 17%.",
  "Reduces the mana cost of your Cleanse, Purify and Consecration spells by 5% and reduces the cooldown of your Exorcism and Holy Wrath spells by 17%.",
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
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15 sec.",
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15 sec.",
  "Gives your Holy Light spell a 33% chance to reduce the cast time of your next Holy Light spell by 0.5 sec.  This effect lasts 15 sec.",
  NULL,
  NULL
),

(20473, @locale_en,
  "Blasts the target with Holy energy, causing 314 to 340 Holy damage to an enemy, or 481 to 519 healing to an ally.",
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

(53551, @locale_en,
  "Your Cleanse spell has a 10% chance to increase the target's resistance to Disease, Magic and Poison by 30% for 10 sec.",
  "Your Cleanse spell has a 10% chance to increase the target's resistance to Disease, Magic and Poison by 30% for 10 sec.",
  "Your Cleanse spell has a 10% chance to increase the target's resistance to Disease, Magic and Poison by 30% for 10 sec.",
  NULL,
  NULL
),

(31837, @locale_en,
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect."
),

(31842, @locale_en,
  "Reduces the mana cost of all spells by 50% for 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53671, @locale_en,
  "Increases the damage done by your Seal and Judgement spells by 5%, and your Judgement spells increase your casting and melee haste by 3% for 1 min.",
  "Increases the damage done by your Seal and Judgement spells by 5%, and your Judgement spells increase your casting and melee haste by 3% for 1 min.",
  "Increases the damage done by your Seal and Judgement spells by 5%, and your Judgement spells increase your casting and melee haste by 3% for 1 min.",
  "Increases the damage done by your Seal and Judgement spells by 5%, and your Judgement spells increase your casting and melee haste by 3% for 1 min.",
  "Increases the damage done by your Seal and Judgement spells by 5%, and your Judgement spells increase your casting and melee haste by 3% for 1 min."
),

(53569, @locale_en,
  "Your Holy Shock critical hits reduce the cast time of your next Flash of Light by 0.75 sec or increase the critical chance of your next Holy Light by 10%.  In addition, causes your Flash of Light to heal targets with Sacred Shield for an additional 50% over 12 sec.",
  "Your Holy Shock critical hits reduce the cast time of your next Flash of Light by 0.75 sec or increase the critical chance of your next Holy Light by 10%.  In addition, causes your Flash of Light to heal targets with Sacred Shield for an additional 50% over 12 sec.",
  NULL,
  NULL,
  NULL
),

(53556, @locale_en,
  "Increases the range of your Judgement of Light and Judgement of Wisdom spells by 15 yards and increases your chance to hit by 2%.",
  "Increases the range of your Judgement of Light and Judgement of Wisdom spells by 15 yards and increases your chance to hit by 2%.",
  NULL,
  NULL,
  NULL
),

(53563, @locale_en,
  "The target becomes a Beacon of Light to all members of your party or raid within a 60 yard radius.  Any heals you cast on party or raid members will also heal the Beacon for 100% of the amount healed.  Only one target can be the Beacon of Light at a time. Lasts 1 min.",
  NULL,
  NULL,
  NULL,
  NULL
),

(63646, @locale_en,
  "Increases all healing done by you and all healing effects on you by 1%.",
  "Increases all healing done by you and all healing effects on you by 1%.",
  "Increases all healing done by you and all healing effects on you by 1%.",
  "Increases all healing done by you and all healing effects on you by 1%.",
  "Increases all healing done by you and all healing effects on you by 1%."
),

(20262, @locale_en,
  "Increases your total Strength by 3%.",
  "Increases your total Strength by 3%.",
  "Increases your total Strength by 3%.",
  "Increases your total Strength by 3%.",
  "Increases your total Strength by 3%."
),

(31844, @locale_en,
  "Reduces the duration of all Stun effects by an additional 10% and reduces the chance your helpful spells and damage over time effects will be dispelled by an additional 10%.",
  "Reduces the duration of all Stun effects by an additional 10% and reduces the chance your helpful spells and damage over time effects will be dispelled by an additional 10%.",
  "Reduces the duration of all Stun effects by an additional 10% and reduces the chance your helpful spells and damage over time effects will be dispelled by an additional 10%.",
  NULL,
  NULL
),

(20174, @locale_en,
  "Reduces the cooldown of your Hand of Protection by 60 sec and increases the duration of your Hand of Freedom by 2 sec.",
  "Reduces the cooldown of your Hand of Protection by 60 sec and increases the duration of your Hand of Freedom by 2 sec.",
  NULL,
  NULL,
  NULL
),

(20096, @locale_en,
  "Increases your chance to dodge by 1%.",
  "Increases your chance to dodge by 1%.",
  "Increases your chance to dodge by 1%.",
  "Increases your chance to dodge by 1%.",
  "Increases your chance to dodge by 1%."
),

(64205, @locale_en,
  "30% of all damage taken by party members within 30 yards is redirected to the Paladin (up to a maximum of 40% of the Paladin's health times the number of party members).  Damage which reduces the Paladin below 20% health will break the effect.  Lasts 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20468, @locale_en,
  "While Righteous Fury is active, all damage taken is reduced by 2%.",
  "While Righteous Fury is active, all damage taken is reduced by 2%.",
  "While Righteous Fury is active, all damage taken is reduced by 2%.",
  NULL,
  NULL
),

(20143, @locale_en,
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%."
),

(53527, @locale_en,
  "When Divine Sacrifice is activated, your party and raid members within 30 yards take 10% reduced damage for 6 sec.  In addition, increases the duration of your Sacred Shield by 50% and the amount absorbed by 10%.",
  "When Divine Sacrifice is activated, your party and raid members within 30 yards take 10% reduced damage for 6 sec.  In addition, increases the duration of your Sacred Shield by 50% and the amount absorbed by 10%.",
  NULL,
  NULL,
  NULL
),

(20487, @locale_en,
  "Decreases the cooldown of your Hammer of Justice spell by 10 sec.",
  "Decreases the cooldown of your Hammer of Justice spell by 10 sec.",
  NULL,
  NULL,
  NULL
),

(20138, @locale_en,
  "Increases the armor bonus of your Devotion Aura by 17% and increases the amount healed on any target affected by any of your Auras by 2%.",
  "Increases the armor bonus of your Devotion Aura by 17% and increases the amount healed on any target affected by any of your Auras by 2%.",
  "Increases the armor bonus of your Devotion Aura by 17% and increases the amount healed on any target affected by any of your Auras by 2%.",
  NULL,
  NULL
),

(20911, @locale_en,
  "Places a Blessing on the friendly target, reducing damage taken from all sources by 3% for 10 min and increasing strength and stamina by 10%.  In addition, when the target blocks, parries, or dodges a melee attack the target will gain 2% of maximum displayed mana.  Players may only have one Blessing on them per Paladin at any one time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20177, @locale_en,
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8 sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8 sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8 sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8 sec will generate an additional attack.",
  "Gives you a 2% chance after being hit by any damaging attack that the next 4 weapon swings within 8 sec will generate an additional attack."
),

(31848, @locale_en,
  "Increases your total Stamina by 2%, reduces the cooldown of your Divine Shield and Divine Protection spells by 30 sec.",
  "Increases your total Stamina by 2%, reduces the cooldown of your Divine Shield and Divine Protection spells by 30 sec.",
  NULL,
  NULL,
  NULL
),

(20196, @locale_en,
  "Increases all damage you deal when a one-handed melee weapon is equipped by 4%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 4%.",
  "Increases all damage you deal when a one-handed melee weapon is equipped by 4%.",
  NULL,
  NULL
),

(31785, @locale_en,
  "A passive ability that gives the Paladin mana when healed by other friendly targets' spells.  The amount of mana gained is equal to 5% of the amount healed.",
  "A passive ability that gives the Paladin mana when healed by other friendly targets' spells.  The amount of mana gained is equal to 5% of the amount healed.",
  NULL,
  NULL,
  NULL
),

(20925, @locale_en,
  "Increases chance to block by 30% for 10 sec and deals 79 Holy damage for each attack blocked while active.  Each block expends a charge.  8 charges.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31850, @locale_en,
  "Damage that takes you below 35% health is reduced by 7%.  In addition, attacks which would otherwise kill you cause you to be healed by up to 10% of your maximum health (amount healed based on defense).  This healing effect cannot occur more often than once every 2 min.",
  "Damage that takes you below 35% health is reduced by 7%.  In addition, attacks which would otherwise kill you cause you to be healed by up to 10% of your maximum health (amount healed based on defense).  This healing effect cannot occur more often than once every 2 min.",
  "Damage that takes you below 35% health is reduced by 7%.  In addition, attacks which would otherwise kill you cause you to be healed by up to 10% of your maximum health (amount healed based on defense).  This healing effect cannot occur more often than once every 2 min.",
  NULL,
  NULL
),

(20127, @locale_en,
  "Increases your block value by 10% and damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 10%.  Lasts 10 sec or 5 blocks.",
  "Increases your block value by 10% and damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 10%.  Lasts 10 sec or 5 blocks.",
  "Increases your block value by 10% and damaging melee and ranged attacks against you have a 10% chance to increase your chance to block by 10%.  Lasts 10 sec or 5 blocks.",
  NULL,
  NULL
),

(31858, @locale_en,
  "Increases your expertise by 2, total Stamina and chance to critically hit by 2%.",
  "Increases your expertise by 2, total Stamina and chance to critically hit by 2%.",
  "Increases your expertise by 2, total Stamina and chance to critically hit by 2%.",
  NULL,
  NULL
),

(53590, @locale_en,
  "Increases your spell power by an amount equal to 20% of your Strength and increases the amount healed by your critical heals by 10%.",
  "Increases your spell power by an amount equal to 20% of your Strength and increases the amount healed by your critical heals by 10%.",
  "Increases your spell power by an amount equal to 20% of your Strength and increases the amount healed by your critical heals by 10%.",
  NULL,
  NULL
),

(31935, @locale_en,
  "Hurls a holy shield at the enemy, dealing 440+0.07*HolP+0.07*AP to 536+0.07*HolP+0.07*AP Holy damage, Dazing them and then jumping to additional nearby enemies.  Affects 3 total targets.  Lasts 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53583, @locale_en,
  "Reduces spell damage taken by 3% and gives a 50% chance to refresh the duration of your Divine Plea when you hit an enemy.  In addition, your Divine Plea spell is 50% less likely to be dispelled.",
  "Reduces spell damage taken by 3% and gives a 50% chance to refresh the duration of your Divine Plea when you hit an enemy.  In addition, your Divine Plea spell is 50% less likely to be dispelled.",
  NULL,
  NULL,
  NULL
),

(53709, @locale_en,
  "Reduces all damage taken by 1% and grants your Avenger's Shield a 33% chance to silence your targets for 3 sec.",
  "Reduces all damage taken by 1% and grants your Avenger's Shield a 33% chance to silence your targets for 3 sec.",
  "Reduces all damage taken by 1% and grants your Avenger's Shield a 33% chance to silence your targets for 3 sec.",
  NULL,
  NULL
),

(53695, @locale_en,
  "Reduces the cooldown of your Hammer of Justice by 5 sec, increases the duration of your Seal of Justice effect by 0.5 sec and your Judgement spells also reduce the melee attack speed of the target by 10%.",
  "Reduces the cooldown of your Hammer of Justice by 5 sec, increases the duration of your Seal of Justice effect by 0.5 sec and your Judgement spells also reduce the melee attack speed of the target by 10%.",
  NULL,
  NULL,
  NULL
),

(53595, @locale_en,
  "Hammer the current target and up to 2 additional nearby targets, causing 4 times your main hand damage per second as Holy damage.",
  NULL,
  NULL,
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

(20101, @locale_en,
  "Reduces the mana cost of all instant cast spells by 2%.",
  "Reduces the mana cost of all instant cast spells by 2%.",
  "Reduces the mana cost of all instant cast spells by 2%.",
  "Reduces the mana cost of all instant cast spells by 2%.",
  "Reduces the mana cost of all instant cast spells by 2%."
),

(25956, @locale_en,
  "Decreases the cooldown of your Judgement spells by 1 sec.",
  "Decreases the cooldown of your Judgement spells by 1 sec.",
  NULL,
  NULL,
  NULL
),

(20335, @locale_en,
  "In addition to the normal effect, your Judgement spells will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  "In addition to the normal effect, your Judgement spells will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  "In addition to the normal effect, your Judgement spells will also increase the critical strike chance of all attacks made against that target by an additional 1%.",
  NULL,
  NULL
),

(20042, @locale_en,
  "Increases the attack power bonus of your Blessing of Might by 12%.",
  "Increases the attack power bonus of your Blessing of Might by 12%.",
  NULL,
  NULL,
  NULL
),

(9452, @locale_en,
  "Gives the Paladin's damaging attacks a chance to reduce the target's attack power by 23 for 10 sec.",
  "Gives the Paladin's damaging attacks a chance to reduce the target's attack power by 23 for 10 sec.",
  NULL,
  NULL,
  NULL
),

(20117, @locale_en,
  "Increases your chance to get a critical strike with all spells and attacks by 1%.",
  "Increases your chance to get a critical strike with all spells and attacks by 1%.",
  "Increases your chance to get a critical strike with all spells and attacks by 1%.",
  "Increases your chance to get a critical strike with all spells and attacks by 1%.",
  "Increases your chance to get a critical strike with all spells and attacks by 1%."
),

(20375, @locale_en,
  "All melee attacks deal 0.36*mw to 0.36*MW additional Holy damage.  When used with attacks or abilities that strike a single target, this additional Holy damage will strike up to 2 additional targets.  Lasts 30 min.<br /><br />Unleashing this Seal's energy will judge an enemy, instantly causing 0.19*mw+0.08*AP+0.13*HolP to 0.19*MW+0.08*AP+0.13*HolP Holy damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(26022, @locale_en,
  "Reduces the duration of all Disarm effects by 25% and increases movement and mounted movement speed by 8%.  This does not stack with other movement speed increasing effects.",
  "Reduces the duration of all Disarm effects by 25% and increases movement and mounted movement speed by 8%.  This does not stack with other movement speed increasing effects.",
  NULL,
  NULL,
  NULL
),

(9799, @locale_en,
  "All criticals against you cause 5% of the damage taken to the attacker as well.  The damage caused by Eye for an Eye will not exceed 50% of the Paladin's total health.",
  "All criticals against you cause 5% of the damage taken to the attacker as well.  The damage caused by Eye for an Eye will not exceed 50% of the Paladin's total health.",
  NULL,
  NULL,
  NULL
),

(32043, @locale_en,
  "Increases your chance to critically hit with all spells and attacks by 1% and increases the damage caused by Exorcism and Crusader Strike by 5%.",
  "Increases your chance to critically hit with all spells and attacks by 1% and increases the damage caused by Exorcism and Crusader Strike by 5%.",
  "Increases your chance to critically hit with all spells and attacks by 1% and increases the damage caused by Exorcism and Crusader Strike by 5%.",
  NULL,
  NULL
),

(31866, @locale_en,
  "Increases all damage caused by 1% and all damage caused against Humanoids, Demons, Undead and Elementals by an additional 1%.",
  "Increases all damage caused by 1% and all damage caused against Humanoids, Demons, Undead and Elementals by an additional 1%.",
  "Increases all damage caused by 1% and all damage caused against Humanoids, Demons, Undead and Elementals by an additional 1%.",
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

(31869, @locale_en,
  "Increases the damage caused by Retribution Aura by 50% and all damage caused by friendly targets affected by any of your Auras is increased by 3%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(20049, @locale_en,
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to Physical and Holy damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  NULL,
  NULL
),

(31871, @locale_en,
  "Reduces your chance to be hit by spells and ranged attacks by 2% and gives your Hand of Freedom spell a 50% chance to remove any Stun effects on the target.",
  "Reduces your chance to be hit by spells and ranged attacks by 2% and gives your Hand of Freedom spell a 50% chance to remove any Stun effects on the target.",
  NULL,
  NULL,
  NULL
),

(53486, @locale_en,
  "Increases the damage of your Judgement, Crusader Strike and Divine Storm abilities by 5% and when your melee attacks critically hit the cast time of your next Flash of Light or Exorcism is reduced by 0.75 sec.",
  "Increases the damage of your Judgement, Crusader Strike and Divine Storm abilities by 5% and when your melee attacks critically hit the cast time of your next Flash of Light or Exorcism is reduced by 0.75 sec.",
  NULL,
  NULL,
  NULL
),

(20066, @locale_en,
  "Puts the enemy target in a state of meditation, incapacitating them for up to 1 min, and removing the effect of Righteous Vengeance.  Any damage caused will awaken the target.  Usable against Demons, Dragonkin, Giants, Humanoids and Undead.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31876, @locale_en,
  "Your damaging Judgement spells have a 33% chance to grant the Replenishment effect to up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec, and to immediately grant you 25% of your base mana.",
  "Your damaging Judgement spells have a 33% chance to grant the Replenishment effect to up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec, and to immediately grant you 25% of your base mana.",
  "Your damaging Judgement spells have a 33% chance to grant the Replenishment effect to up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec, and to immediately grant you 25% of your base mana.",
  NULL,
  NULL
),

(31879, @locale_en,
  "Increases the critical strike chance of all Judgements capable of a critical hit by 6% and reduces threat caused by all actions by 10% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 6% and reduces threat caused by all actions by 10% except when under the effects of Righteous Fury.",
  "Increases the critical strike chance of all Judgements capable of a critical hit by 6% and reduces threat caused by all actions by 10% except when under the effects of Righteous Fury.",
  NULL,
  NULL
),

(53375, @locale_en,
  "Increases the critical strike chance of Hammer of Wrath by 25%, reduces the cooldown of Avenging Wrath by 30 secs and while affected by Avenging Wrath 25% of all damage caused bypasses damage reduction effects.",
  "Increases the critical strike chance of Hammer of Wrath by 25%, reduces the cooldown of Avenging Wrath by 30 secs and while affected by Avenging Wrath 25% of all damage caused bypasses damage reduction effects.",
  NULL,
  NULL,
  NULL
),

(53379, @locale_en,
  "Your auras also increase casting, ranged and melee attack speeds by 1%.",
  "Your auras also increase casting, ranged and melee attack speeds by 1%.",
  "Your auras also increase casting, ranged and melee attack speeds by 1%.",
  NULL,
  NULL
),

(35395, @locale_en,
  "An instant strike that causes 75% weapon damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53501, @locale_en,
  "Increases your spell power by an amount equal to 10% of your attack power and your critical healing spells heal the target for 20% of the healed amount over 12 seconds.",
  "Increases your spell power by an amount equal to 10% of your attack power and your critical healing spells heal the target for 20% of the healed amount over 12 seconds.",
  "Increases your spell power by an amount equal to 10% of your attack power and your critical healing spells heal the target for 20% of the healed amount over 12 seconds.",
  NULL,
  NULL
),

(53380, @locale_en,
  "When your Judgement, Crusader Strike and Divine Storm spells deal a critical strike, your target will take 10% additional damage over 8 sec.",
  "When your Judgement, Crusader Strike and Divine Storm spells deal a critical strike, your target will take 10% additional damage over 8 sec.",
  "When your Judgement, Crusader Strike and Divine Storm spells deal a critical strike, your target will take 10% additional damage over 8 sec.",
  NULL,
  NULL
),

(53385, @locale_en,
  "An instant weapon attack that causes 110% of weapon damage to up to 4 enemies within 8 yards.  The Divine Storm heals up to 3 party or raid members totaling 25% of the damage caused.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- hunter
(19552, @locale_en,
  "While Aspect of the Hawk or Dragonhawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12 sec.",
  "While Aspect of the Hawk or Dragonhawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12 sec.",
  "While Aspect of the Hawk or Dragonhawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12 sec.",
  "While Aspect of the Hawk or Dragonhawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12 sec.",
  "While Aspect of the Hawk or Dragonhawk is active, all normal ranged attacks have a 10% chance of increasing ranged attack speed by 3% for 12 sec."
),

(19583, @locale_en,
  "Increases the health of your pet by 2% and your total health by 1%.",
  "Increases the health of your pet by 2% and your total health by 1%.",
  "Increases the health of your pet by 2% and your total health by 1%.",
  "Increases the health of your pet by 2% and your total health by 1%.",
  "Increases the health of your pet by 2% and your total health by 1%."
),

(35029, @locale_en,
  "All damage caused by you is increased by 1% while your pet is active and the critical strike chance of your pet's special abilities is increased by 10% while Kill Command is active.",
  "All damage caused by you is increased by 1% while your pet is active and the critical strike chance of your pet's special abilities is increased by 10% while Kill Command is active.",
  NULL,
  NULL,
  NULL
),

(19549, @locale_en,
  "Increases the Dodge bonus of your Aspect of the Monkey and Aspect of the Dragonhawk by 2%.",
  "Increases the Dodge bonus of your Aspect of the Monkey and Aspect of the Dragonhawk by 2%.",
  "Increases the Dodge bonus of your Aspect of the Monkey and Aspect of the Dragonhawk by 2%.",
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
  "Increases the speed bonus of your Aspect of the Cheetah and Aspect of the Pack by 4%, and increases your speed while mounted by 5%. The mounted movement speed increase does not stack with other effects.",
  "Increases the speed bonus of your Aspect of the Cheetah and Aspect of the Pack by 4%, and increases your speed while mounted by 5%. The mounted movement speed increase does not stack with other effects.",
  NULL,
  NULL,
  NULL
),

(53265, @locale_en,
  "Aspect of the Viper - Reduces the damage penalty by 10%.<br /><br />Aspect of the Monkey - Reduces the damage done to you while active by 5%.<br /><br />Aspect of the Hawk - Increases the attack power bonus by 30%.<br /><br />Aspect of the Dragonhawk - Combines the bonuses from Aspect of the Monkey and Hawk.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19616, @locale_en,
  "Increases the damage done by your pets by 3%.",
  "Increases the damage done by your pets by 3%.",
  "Increases the damage done by your pets by 3%.",
  "Increases the damage done by your pets by 3%.",
  "Increases the damage done by your pets by 3%."
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
  "While your pet is active, you and your pet will regenerate 1% of total health every 10 sec., and increases healing done to you and your pet by 5%.",
  "While your pet is active, you and your pet will regenerate 1% of total health every 10 sec., and increases healing done to you and your pet by 5%.",
  NULL,
  NULL,
  NULL
),

(19577, @locale_en,
  "Command your pet to intimidate the target, causing a high amount of threat and stunning the target for 3 sec. Lasts 15 sec.",
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
  "Increases your pet's attack power by 5%, and increases the duration of your Master's Call effect by 3 sec.",
  "Increases your pet's attack power by 5%, and increases the duration of your Master's Call effect by 3 sec.",
  NULL,
  NULL,
  NULL
),

(19621, @locale_en,
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8 sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8 sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8 sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8 sec after dealing a critical strike.",
  "Gives your pet a 20% chance to gain a 30% attack speed increase for 8 sec after dealing a critical strike."
),

(34455, @locale_en,
  "All party and raid members have all damage increased by 1% within 100 yards of your pet. In addition, increases the damage dealt by Arcane Shot and Steady Shot by 3%.",
  "All party and raid members have all damage increased by 1% within 100 yards of your pet. In addition, increases the damage dealt by Arcane Shot and Steady Shot by 3%.",
  "All party and raid members have all damage increased by 1% within 100 yards of your pet. In addition, increases the damage dealt by Arcane Shot and Steady Shot by 3%.",
  NULL,
  NULL
),

(19574, @locale_en,
  "Send your pet into a rage causing 50% additional damage for 10 sec.  While enraged, the beast does not feel pity or remorse or fear and it cannot be stopped unless killed.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34462, @locale_en,
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%. In addition, reduces the cooldown of your Kill Command ability by 10 sec.",
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%. In addition, reduces the cooldown of your Kill Command ability by 10 sec.",
  "Increases your chance to dodge by 1% and your pet's chance to dodge by an additional 3%. In addition, reduces the cooldown of your Kill Command ability by 10 sec.",
  NULL,
  NULL
),

(53252, @locale_en,
  "When your pet scores a critical hit with a special ability, you have a 50% chance to instantly regenerate 1% mana.",
  "When your pet scores a critical hit with a special ability, you have a 50% chance to instantly regenerate 1% mana.",
  NULL,
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

(53262, @locale_en,
  "Reduces the cooldown of your Bestial Wrath, Intimidation and Pet Special Abilities by 10%.",
  "Reduces the cooldown of your Bestial Wrath, Intimidation and Pet Special Abilities by 10%.",
  "Reduces the cooldown of your Bestial Wrath, Intimidation and Pet Special Abilities by 10%.",
  NULL,
  NULL
),

(34692, @locale_en,
  "Increases all damage you deal by 10% and while your pet is under the effects of Bestial Wrath, you also go into a rage causing 10% additional damage and reducing mana costs of all spells by 50% for 10 sec.  While enraged, you do not feel pity or remorse or fear and you cannot be stopped unless killed.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53256, @locale_en,
  "You have a 20% chance when you critically hit with Arcane Shot, Steady Shot or Kill Shot to cause your pet's next 2 special attacks to critically hit.",
  "You have a 20% chance when you critically hit with Arcane Shot, Steady Shot or Kill Shot to cause your pet's next 2 special attacks to critically hit.",
  "You have a 20% chance when you critically hit with Arcane Shot, Steady Shot or Kill Shot to cause your pet's next 2 special attacks to critically hit.",
  NULL,
  NULL
),

(56314, @locale_en,
  "Increases your pet's damage by 4% and you and your pet's movement speed by 2% while your pet is active. This does not stack with other movement speed increasing effects.",
  "Increases your pet's damage by 4% and you and your pet's movement speed by 2% while your pet is active. This does not stack with other movement speed increasing effects.",
  "Increases your pet's damage by 4% and you and your pet's movement speed by 2% while your pet is active. This does not stack with other movement speed increasing effects.",
  "Increases your pet's damage by 4% and you and your pet's movement speed by 2% while your pet is active. This does not stack with other movement speed increasing effects.",
  "Increases your pet's damage by 4% and you and your pet's movement speed by 2% while your pet is active. This does not stack with other movement speed increasing effects."
),

(53270, @locale_en,
  "You master the art of Beast training, teaching you the ability to tame Exotic pets and increasing your total amount of Pet Skill Points by 4.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19407, @locale_en,
  "Increases the duration of your Concussive Shot's daze effect by 1 sec.",
  "Increases the duration of your Concussive Shot's daze effect by 1 sec.",
  NULL,
  NULL,
  NULL
),

(53620, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Steady Shot by 23%, and increases your chance to hit by 1%.",
  "Reduces the pushback suffered from damaging attacks while casting Steady Shot by 23%, and increases your chance to hit by 1%.",
  "Reduces the pushback suffered from damaging attacks while casting Steady Shot by 23%, and increases your chance to hit by 1%.",
  NULL,
  NULL
),

(19426, @locale_en,
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%.",
  "Increases your critical strike chance with ranged weapons by 1%."
),

(34482, @locale_en,
  "Increases your ranged attack power by an amount equal to 33% of your total Intellect.",
  "Increases your ranged attack power by an amount equal to 33% of your total Intellect.",
  "Increases your ranged attack power by an amount equal to 33% of your total Intellect.",
  NULL,
  NULL
),

(19421, @locale_en,
  "Increases the bonus attack power granted by your Hunter's Mark ability by 10%, and reduces the mana cost of your Hunter's Mark ability by 33%.",
  "Increases the bonus attack power granted by your Hunter's Mark ability by 10%, and reduces the mana cost of your Hunter's Mark ability by 33%.",
  "Increases the bonus attack power granted by your Hunter's Mark ability by 10%, and reduces the mana cost of your Hunter's Mark ability by 33%.",
  NULL,
  NULL
),

(19485, @locale_en,
  "Increases the critical strike damage bonus of your ranged abilities by 6%.",
  "Increases the critical strike damage bonus of your ranged abilities by 6%.",
  "Increases the critical strike damage bonus of your ranged abilities by 6%.",
  "Increases the critical strike damage bonus of your ranged abilities by 6%.",
  "Increases the critical strike damage bonus of your ranged abilities by 6%."
),

(34950, @locale_en,
  "Your ranged critical hits cause your pet to generate 25 Focus.",
  "Your ranged critical hits cause your pet to generate 25 Focus.",
  NULL,
  NULL,
  NULL
),

(19454, @locale_en,
  "Increases the damage done by your Arcane Shot by 5%.",
  "Increases the damage done by your Arcane Shot by 5%.",
  "Increases the damage done by your Arcane Shot by 5%.",
  NULL,
  NULL
),

(19434, @locale_en,
  "An aimed shot that increases ranged damage by 5 and reduces healing done to that target by 50%.  Lasts 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34948, @locale_en,
  "Reduces the cooldown of your Rapid Fire ability by 1 min.  In addition, after killing an opponent that yields experience or honor, your next Aimed Shot, Arcane Shot or Chimera Shot causes 10% additional damage.  Lasts 20 sec.",
  "Reduces the cooldown of your Rapid Fire ability by 1 min.  In addition, after killing an opponent that yields experience or honor, your next Aimed Shot, Arcane Shot or Chimera Shot causes 10% additional damage.  Lasts 20 sec.",
  NULL,
  NULL,
  NULL
),

(19464, @locale_en,
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 10% and the mana drained by your Viper Sting by 10%.  In addition, reduces the chance your Sting damage over time effects will be dispelled by 10%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 10% and the mana drained by your Viper Sting by 10%.  In addition, reduces the chance your Sting damage over time effects will be dispelled by 10%.",
  "Increases the damage done by your Serpent Sting and Wyvern Sting by 10% and the mana drained by your Viper Sting by 10%.  In addition, reduces the chance your Sting damage over time effects will be dispelled by 10%.",
  NULL,
  NULL
),

(19416, @locale_en,
  "Reduces the Mana cost of your Shots and Stings by 3%.",
  "Reduces the Mana cost of your Shots and Stings by 3%.",
  "Reduces the Mana cost of your Shots and Stings by 3%.",
  "Reduces the Mana cost of your Shots and Stings by 3%.",
  "Reduces the Mana cost of your Shots and Stings by 3%."
),

(35100, @locale_en,
  "Your successful Chimera Shot and Multi-Shot attacks have a 50% chance to Daze the target for 4 sec.",
  "Your successful Chimera Shot and Multi-Shot attacks have a 50% chance to Daze the target for 4 sec.",
  NULL,
  NULL,
  NULL
),

(23989, @locale_en,
  "When activated, this ability immediately finishes the cooldown on your other Hunter abilities except Bestial Wrath.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19461, @locale_en,
  "Increases the damage done by your Multi-Shot, Aimed Shot, and Volley spells by 4%.",
  "Increases the damage done by your Multi-Shot, Aimed Shot, and Volley spells by 4%.",
  "Increases the damage done by your Multi-Shot, Aimed Shot, and Volley spells by 4%.",
  NULL,
  NULL
),

(34475, @locale_en,
  "Increases your total Agility and Intellect by 2%.",
  "Increases your total Agility and Intellect by 2%.",
  NULL,
  NULL,
  NULL
),

(19507, @locale_en,
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%.",
  "Increases the damage you deal with ranged weapons by 1%.",
  NULL,
  NULL
),

(53234, @locale_en,
  "Your critical Aimed, Steady and Chimera Shots cause the target to bleed for 10% of the damage dealt over 8 sec.",
  "Your critical Aimed, Steady and Chimera Shots cause the target to bleed for 10% of the damage dealt over 8 sec.",
  "Your critical Aimed, Steady and Chimera Shots cause the target to bleed for 10% of the damage dealt over 8 sec.",
  NULL,
  NULL
),

(19506, @locale_en,
  "Increases the attack power of party and raid members within 100 yards by 10%.  Lasts until cancelled.",
  NULL,
  NULL,
  NULL,
  NULL
),

(35104, @locale_en,
  "Increases the critical strike chance of your Multi-Shot and Aimed Shot abilities by 4% and reduces the pushback suffered from damaging attacks while channeling Volley by 33%.",
  "Increases the critical strike chance of your Multi-Shot and Aimed Shot abilities by 4% and reduces the pushback suffered from damaging attacks while channeling Volley by 33%.",
  "Increases the critical strike chance of your Multi-Shot and Aimed Shot abilities by 4% and reduces the pushback suffered from damaging attacks while channeling Volley by 33%.",
  NULL,
  NULL
),

(34485, @locale_en,
  "Increases your critical strike chance by 1%, and reduces the Mana cost of your Steady Shot, Aimed Shot, and Chimera Shot by 5%.",
  "Increases your critical strike chance by 1%, and reduces the Mana cost of your Steady Shot, Aimed Shot, and Chimera Shot by 5%.",
  "Increases your critical strike chance by 1%, and reduces the Mana cost of your Steady Shot, Aimed Shot, and Chimera Shot by 5%.",
  "Increases your critical strike chance by 1%, and reduces the Mana cost of your Steady Shot, Aimed Shot, and Chimera Shot by 5%.",
  "Increases your critical strike chance by 1%, and reduces the Mana cost of your Steady Shot, Aimed Shot, and Chimera Shot by 5%."
),

(53228, @locale_en,
  "You gain 2% of your mana every 3 sec while under the effect of Rapid Fire, and you gain 1% of your mana every 2 sec for 6 sec when you gain Rapid Killing.",
  "You gain 2% of your mana every 3 sec while under the effect of Rapid Fire, and you gain 1% of your mana every 2 sec for 6 sec when you gain Rapid Killing.",
  NULL,
  NULL,
  NULL
),

(53215, @locale_en,
  "You have a 4% chance to shoot an additional shot when doing damage with your auto shot, dealing 80% weapon nature damage. Wild Quiver consumes no ammo.",
  "You have a 4% chance to shoot an additional shot when doing damage with your auto shot, dealing 80% weapon nature damage. Wild Quiver consumes no ammo.",
  "You have a 4% chance to shoot an additional shot when doing damage with your auto shot, dealing 80% weapon nature damage. Wild Quiver consumes no ammo.",
  NULL,
  NULL
),

(34490, @locale_en,
  "A shot that deals 50% weapon damage and Silences the target for 3 sec.  Non-player victim spellcasting is also interrupted for 3 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53221, @locale_en,
  "Your Steady Shot hits have a 5% chance to increase the damage done by your next Aimed Shot, Arcane Shot or Chimera Shot by 15%, and reduce the mana cost of your next Aimed Shot, Arcane Shot or Chimera Shot by 20%.",
  "Your Steady Shot hits have a 5% chance to increase the damage done by your next Aimed Shot, Arcane Shot or Chimera Shot by 15%, and reduce the mana cost of your next Aimed Shot, Arcane Shot or Chimera Shot by 20%.",
  "Your Steady Shot hits have a 5% chance to increase the damage done by your next Aimed Shot, Arcane Shot or Chimera Shot by 15%, and reduce the mana cost of your next Aimed Shot, Arcane Shot or Chimera Shot by 20%.",
  NULL,
  NULL
),

(53241, @locale_en,
  "Increases your damage done by your shots and the damage done by your pet's special abilities by 1% on marked targets, and increases the critical strike damage bonus of your Aimed Shot, Arcane Shot, Steady Shot, Kill Shot and Chimera Shot by 2%.",
  "Increases your damage done by your shots and the damage done by your pet's special abilities by 1% on marked targets, and increases the critical strike damage bonus of your Aimed Shot, Arcane Shot, Steady Shot, Kill Shot and Chimera Shot by 2%.",
  "Increases your damage done by your shots and the damage done by your pet's special abilities by 1% on marked targets, and increases the critical strike damage bonus of your Aimed Shot, Arcane Shot, Steady Shot, Kill Shot and Chimera Shot by 2%.",
  "Increases your damage done by your shots and the damage done by your pet's special abilities by 1% on marked targets, and increases the critical strike damage bonus of your Aimed Shot, Arcane Shot, Steady Shot, Kill Shot and Chimera Shot by 2%.",
  "Increases your damage done by your shots and the damage done by your pet's special abilities by 1% on marked targets, and increases the critical strike damage bonus of your Aimed Shot, Arcane Shot, Steady Shot, Kill Shot and Chimera Shot by 2%."
),

(53209, @locale_en,
  "You deal 125% weapon damage, refreshing the current Sting on your target and triggering an effect:<br /><br />Serpent Sting - Instantly deals 40% of the damage done by your Serpent Sting.<br /><br />Viper Sting - Instantly restores mana to you equal to 60% of the total amount drained by your Viper Sting.<br /><br />Scorpid Sting - Attempts to Disarm the target for 10 sec. This effect cannot occur more than once per 1 minute.",
  NULL,
  NULL,
  NULL,
  NULL
),

(52783, @locale_en,
  "While tracking Beasts, Demons, Dragonkin, Elementals, Giants, Humanoids and Undead, all damage done to those types by the Hunter is increased by 1%.",
  "While tracking Beasts, Demons, Dragonkin, Elementals, Giants, Humanoids and Undead, all damage done to those types by the Hunter is increased by 1%.",
  "While tracking Beasts, Demons, Dragonkin, Elementals, Giants, Humanoids and Undead, all damage done to those types by the Hunter is increased by 1%.",
  "While tracking Beasts, Demons, Dragonkin, Elementals, Giants, Humanoids and Undead, all damage done to those types by the Hunter is increased by 1%.",
  "While tracking Beasts, Demons, Dragonkin, Elementals, Giants, Humanoids and Undead, all damage done to those types by the Hunter is increased by 1%."
),

(19498, @locale_en,
  "Increases the range of your ranged weapons by 2 yards.",
  "Increases the range of your ranged weapons by 2 yards.",
  "Increases the range of your ranged weapons by 2 yards.",
  NULL,
  NULL
),

(19159, @locale_en,
  "Increases the critical strike chance of Raptor Strike, Mongoose Bite and Counterattack by 10%.",
  "Increases the critical strike chance of Raptor Strike, Mongoose Bite and Counterattack by 10%.",
  NULL,
  NULL,
  NULL
),

(19290, @locale_en,
  "Reduces the duration of movement impairing effects by 10%.",
  "Reduces the duration of movement impairing effects by 10%.",
  "Reduces the duration of movement impairing effects by 10%.",
  NULL,
  NULL
),

(19184, @locale_en,
  "When your Frost Trap or Snake Trap are triggered you entrap all afflicted targets, preventing them from moving for 2 sec.",
  "When your Frost Trap or Snake Trap are triggered you entrap all afflicted targets, preventing them from moving for 2 sec.",
  "When your Frost Trap or Snake Trap are triggered you entrap all afflicted targets, preventing them from moving for 2 sec.",
  NULL,
  NULL
),

(19376, @locale_en,
  "Frost Trap and Freezing Trap - Increases the duration by 10%.<br /><br />Immolation Trap, Explosive Trap and Black Arrow - Increases the periodic damage done by 10%.<br /><br />Snake Trap - Increases the number of snakes summoned by 2.",
  "Frost Trap and Freezing Trap - Increases the duration by 10%.<br /><br />Immolation Trap, Explosive Trap and Black Arrow - Increases the periodic damage done by 10%.<br /><br />Snake Trap - Increases the number of snakes summoned by 2.",
  "Frost Trap and Freezing Trap - Increases the duration by 10%.<br /><br />Immolation Trap, Explosive Trap and Black Arrow - Increases the periodic damage done by 10%.<br /><br />Snake Trap - Increases the number of snakes summoned by 2.",
  NULL,
  NULL
),

(34494, @locale_en,
  "Reduces all damage taken by 2% and increases the critical strike chance of your Arcane Shot, Steady Shot, and Explosive Shot by 2%.",
  "Reduces all damage taken by 2% and increases the critical strike chance of your Arcane Shot, Steady Shot, and Explosive Shot by 2%.",
  NULL,
  NULL,
  NULL
),

(19255, @locale_en,
  "Increases your Stamina by 2%.",
  "Increases your Stamina by 2%.",
  "Increases your Stamina by 2%.",
  "Increases your Stamina by 2%.",
  "Increases your Stamina by 2%."
),

(19503, @locale_en,
  "A short-range shot that deals 50% weapon damage and disorients the target for 4 sec.  Any damage caused will remove the effect.  Turns off your attack when used.",
  NULL,
  NULL,
  NULL,
  NULL
),

(19295, @locale_en,
  "Increases your chance to parry by 1%, and reduces the duration of all Disarm effects used against you by 16%.  This does not stack with other Disarm duration reducing effects.",
  "Increases your chance to parry by 1%, and reduces the duration of all Disarm effects used against you by 16%.  This does not stack with other Disarm duration reducing effects.",
  "Increases your chance to parry by 1%, and reduces the duration of all Disarm effects used against you by 16%.  This does not stack with other Disarm duration reducing effects.",
  NULL,
  NULL
),

(19286, @locale_en,
  "Reduces the chance your Feign Death ability and all trap spells will be resisted by 2%, and reduces the cooldown of your Disengage ability by 2 sec.",
  "Reduces the chance your Feign Death ability and all trap spells will be resisted by 2%, and reduces the cooldown of your Disengage ability by 2 sec.",
  NULL,
  NULL,
  NULL
),

(56333, @locale_en,
  "Increases the damage done by your Explosive Shot,  Explosive Trap, Black Arrow and Immolation Trap by 2%.",
  "Increases the damage done by your Explosive Shot,  Explosive Trap, Black Arrow and Immolation Trap by 2%.",
  "Increases the damage done by your Explosive Shot,  Explosive Trap, Black Arrow and Immolation Trap by 2%.",
  NULL,
  NULL
),

(56342, @locale_en,
  "You have a 33% chance when you trap a target with Freezing Trap, Freezing Arrow or Frost Trap and a 2% chance when you deal periodic damage with your Immolation Trap, Explosive Trap or Black Arrow to cause your next 2 Arcane Shot or Explosive Shot spells to trigger no cooldown, cost no mana and consume no ammo. This effect has a 22 sec cooldown.",
  "You have a 33% chance when you trap a target with Freezing Trap, Freezing Arrow or Frost Trap and a 2% chance when you deal periodic damage with your Immolation Trap, Explosive Trap or Black Arrow to cause your next 2 Arcane Shot or Explosive Shot spells to trigger no cooldown, cost no mana and consume no ammo. This effect has a 22 sec cooldown.",
  "You have a 33% chance when you trap a target with Freezing Trap, Freezing Arrow or Frost Trap and a 2% chance when you deal periodic damage with your Immolation Trap, Explosive Trap or Black Arrow to cause your next 2 Arcane Shot or Explosive Shot spells to trigger no cooldown, cost no mana and consume no ammo. This effect has a 22 sec cooldown.",
  NULL,
  NULL
),

(56339, @locale_en,
  "Increases you and your pet's attack power and ranged attack power equal to 10% of your total Stamina.",
  "Increases you and your pet's attack power and ranged attack power equal to 10% of your total Stamina.",
  "Increases you and your pet's attack power and ranged attack power equal to 10% of your total Stamina.",
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
  "A strike that becomes active after parrying an opponent's attack.  This attack deals AP*0.2+48 damage and immobilizes the target for 5 sec.  Counterattack cannot be blocked, dodged, or parried.",
  NULL,
  NULL,
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

(34491, @locale_en,
  "Reduces the mana cost of all traps, melee abilities and Black Arrow by 20% and reduces the cooldown of all traps and Black Arrow by 2 sec.",
  "Reduces the mana cost of all traps, melee abilities and Black Arrow by 20% and reduces the cooldown of all traps and Black Arrow by 2 sec.",
  "Reduces the mana cost of all traps, melee abilities and Black Arrow by 20% and reduces the cooldown of all traps and Black Arrow by 2 sec.",
  NULL,
  NULL
),

(34500, @locale_en,
  "Your ranged criticals have a 33% chance to grant you Expose Weakness. Expose Weakness increases your attack power by 25% of your Agility for 7 sec.",
  "Your ranged criticals have a 33% chance to grant you Expose Weakness. Expose Weakness increases your attack power by 25% of your Agility for 7 sec.",
  "Your ranged criticals have a 33% chance to grant you Expose Weakness. Expose Weakness increases your attack power by 25% of your Agility for 7 sec.",
  NULL,
  NULL
),

(19386, @locale_en,
  "A stinging shot that puts the target to sleep for 30 sec.  Any damage will cancel the effect.  When the target wakes up, the Sting causes 300 Nature damage over 6 sec.  Only one Sting per Hunter can be active on the target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34497, @locale_en,
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  "Gives you a 33% chance to regain 40% of the mana cost of any shot when it critically hits.",
  NULL,
  NULL
),

(34506, @locale_en,
  "Your successful ranged attacks have a 10% chance to increase your critical strike chance with all attacks by 2% for 8 sec.",
  "Your successful ranged attacks have a 10% chance to increase your critical strike chance with all attacks by 2% for 8 sec.",
  "Your successful ranged attacks have a 10% chance to increase your critical strike chance with all attacks by 2% for 8 sec.",
  "Your successful ranged attacks have a 10% chance to increase your critical strike chance with all attacks by 2% for 8 sec.",
  "Your successful ranged attacks have a 10% chance to increase your critical strike chance with all attacks by 2% for 8 sec."
),

(53295, @locale_en,
  "If Wyvern Sting is dispelled, the dispeller is also afflicted by Wyvern Sting lasting 16% of the duration remaining, and increases all damage done by you on targets afflicted by your Serpent Sting by 1%.",
  "If Wyvern Sting is dispelled, the dispeller is also afflicted by Wyvern Sting lasting 16% of the duration remaining, and increases all damage done by you on targets afflicted by your Serpent Sting by 1%.",
  "If Wyvern Sting is dispelled, the dispeller is also afflicted by Wyvern Sting lasting 16% of the duration remaining, and increases all damage done by you on targets afflicted by your Serpent Sting by 1%.",
  NULL,
  NULL
),

(53298, @locale_en,
  "Increases the critical strike chance of all of your attacks on targets affected by your Frost Trap, Freezing Trap and Freezing Arrow by 3%.",
  "Increases the critical strike chance of all of your attacks on targets affected by your Frost Trap, Freezing Trap and Freezing Arrow by 3%.",
  NULL,
  NULL,
  NULL
),

(3674, @locale_en,
  "Fires a Black Arrow at the target, increasing all damage done by you to the target by 6% and dealing RAP*0.1+157*5 Shadow damage over 15 sec. Black Arrow shares a cooldown with Trap spells.",
  NULL,
  NULL,
  NULL,
  NULL
),

(53302, @locale_en,
  "Increases the critical strike chance of your Kill Shot ability by 5%, and while standing still for 6 sec, you gain Sniper Training increasing the damage done by your Steady Shot, Aimed Shot, Black Arrow and Explosive Shot by 2% for 15 sec.",
  "Increases the critical strike chance of your Kill Shot ability by 5%, and while standing still for 6 sec, you gain Sniper Training increasing the damage done by your Steady Shot, Aimed Shot, Black Arrow and Explosive Shot by 2% for 15 sec.",
  "Increases the critical strike chance of your Kill Shot ability by 5%, and while standing still for 6 sec, you gain Sniper Training increasing the damage done by your Steady Shot, Aimed Shot, Black Arrow and Explosive Shot by 2% for 15 sec.",
  NULL,
  NULL
),

(53290, @locale_en,
  "Increases your total Agility by an additional 1%, and your Arcane Shot, Explosive Shot and Steady Shot critical strikes have a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of the maximum mana per 5 sec. Lasts for 15 sec.",
  "Increases your total Agility by an additional 1%, and your Arcane Shot, Explosive Shot and Steady Shot critical strikes have a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of the maximum mana per 5 sec. Lasts for 15 sec.",
  "Increases your total Agility by an additional 1%, and your Arcane Shot, Explosive Shot and Steady Shot critical strikes have a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of the maximum mana per 5 sec. Lasts for 15 sec.",
  NULL,
  NULL
),

(53301, @locale_en,
  "You fire an explosive charge into the enemy target, dealing RAP*0.14+144-RAP*0.14+172 Fire damage. The charge will blast the target every second for an additional 2 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- rogue
(14162, @locale_en,
  "Increases the damage done by your Eviscerate ability by 7%.",
  "Increases the damage done by your Eviscerate ability by 7%.",
  "Increases the damage done by your Eviscerate ability by 7%.",
  NULL,
  NULL
),

(14144, @locale_en,
  "After killing an opponent that yields experience or honor, gives you a 20% increased critical strike chance on your next Sinister Strike, Hemorrhage, Backstab, Mutilate, Ambush, or Ghostly Strike.  Lasts 20 sec.",
  "After killing an opponent that yields experience or honor, gives you a 20% increased critical strike chance on your next Sinister Strike, Hemorrhage, Backstab, Mutilate, Ambush, or Ghostly Strike.  Lasts 20 sec.",
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

(51632, @locale_en,
  "Increases the damage caused by your Garrote and Rupture abilities by 15%.",
  "Increases the damage caused by your Garrote and Rupture abilities by 15%.",
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

(14983, @locale_en,
  "Increases your maximum Energy by 10.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14168, @locale_en,
  "Reduces the energy cost of your Expose Armor ability by 5.",
  "Reduces the energy cost of your Expose Armor ability by 5.",
  NULL,
  NULL,
  NULL
),

(14128, @locale_en,
  "Increases the critical strike damage bonus of all combo point-generating abilities that do not require stealth by 6%.",
  "Increases the critical strike damage bonus of all combo point-generating abilities that do not require stealth by 6%.",
  "Increases the critical strike damage bonus of all combo point-generating abilities that do not require stealth by 6%.",
  "Increases the critical strike damage bonus of all combo point-generating abilities that do not require stealth by 6%.",
  "Increases the critical strike damage bonus of all combo point-generating abilities that do not require stealth by 6%."
),

(16513, @locale_en,
  "Increases the damage dealt by your poisons and Envenom ability by 7% and gives your damage over time poisons an additional 10% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 7% and gives your damage over time poisons an additional 10% chance to resist dispel effects.",
  "Increases the damage dealt by your poisons and Envenom ability by 7% and gives your damage over time poisons an additional 10% chance to resist dispel effects.",
  NULL,
  NULL
),

(14113, @locale_en,
  "Increases the chance to apply Deadly Poison to your target by 4% and the frequency of applying Instant Poison to your target by 10%.",
  "Increases the chance to apply Deadly Poison to your target by 4% and the frequency of applying Instant Poison to your target by 10%.",
  "Increases the chance to apply Deadly Poison to your target by 4% and the frequency of applying Instant Poison to your target by 10%.",
  "Increases the chance to apply Deadly Poison to your target by 4% and the frequency of applying Instant Poison to your target by 10%.",
  "Increases the chance to apply Deadly Poison to your target by 4% and the frequency of applying Instant Poison to your target by 10%."
),

(31208, @locale_en,
  "Reduces the duration of all movement impairing effects by 15% and increases your movement speed by 8%.  This does not stack with other movement speed increasing effects.",
  "Reduces the duration of all movement impairing effects by 15% and increases your movement speed by 8%.  This does not stack with other movement speed increasing effects.",
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
  "All healing effects on you are increased by 10%.  In addition, your finishing moves refund 40% of their Energy cost when they fail to hit.",
  "All healing effects on you are increased by 10%.  In addition, your finishing moves refund 40% of their Energy cost when they fail to hit.",
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

(14158, @locale_en,
  "Increases all damage caused by 2%.",
  "Increases all damage caused by 2%.",
  NULL,
  NULL,
  NULL
),

(51625, @locale_en,
  "When you apply Instant, Wound or Mind-Numbing poison to a target, you have a 50% chance to apply Crippling poison.",
  "When you apply Instant, Wound or Mind-Numbing poison to a target, you have a 50% chance to apply Crippling poison.",
  NULL,
  NULL,
  NULL
),

(58426, @locale_en,
  "While stealthed, and for 20 seconds after breaking stealth, you regenerate 30% additional energy.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31380, @locale_en,
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  NULL,
  NULL
),

(51634, @locale_en,
  "Your melee critical strikes have a 33% chance to give you 2 energy.",
  "Your melee critical strikes have a 33% chance to give you 2 energy.",
  "Your melee critical strikes have a 33% chance to give you 2 energy.",
  NULL,
  NULL
),

(31234, @locale_en,
  "Offensive ability damage increased by 2%.",
  "Offensive ability damage increased by 2%.",
  "Offensive ability damage increased by 2%.",
  NULL,
  NULL
),

(31226, @locale_en,
  "Increases the critical hit chance of all attacks made against any target you have poisoned by 1%, reduces the duration of all Poison effects applied to you by 17%, and gives Envenom a 33% chance not to consume Deadly Poison.",
  "Increases the critical hit chance of all attacks made against any target you have poisoned by 1%, reduces the duration of all Poison effects applied to you by 17%, and gives Envenom a 33% chance not to consume Deadly Poison.",
  "Increases the critical hit chance of all attacks made against any target you have poisoned by 1%, reduces the duration of all Poison effects applied to you by 17%, and gives Envenom a 33% chance not to consume Deadly Poison.",
  NULL,
  NULL
),

(1329, @locale_en,
  "Instantly attacks with both weapons for 100% weapon damage plus an additional 44 with each weapon.  Damage is increased by 20% against Poisoned targets.  Awards 2 combo points.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51627, @locale_en,
  "Whenever anyone in your party or raid blocks, dodges, or parries an attack your chance to critically hit with all combo moves is increased by 2% for 8 sec.",
  "Whenever anyone in your party or raid blocks, dodges, or parries an attack your chance to critically hit with all combo moves is increased by 2% for 8 sec.",
  "Whenever anyone in your party or raid blocks, dodges, or parries an attack your chance to critically hit with all combo moves is increased by 2% for 8 sec.",
  NULL,
  NULL
),

(51664, @locale_en,
  "Your Eviscerate and Envenom abilities have a 20% chance to refresh your Slice and Dice duration to its 5 combo point maximum.",
  "Your Eviscerate and Envenom abilities have a 20% chance to refresh your Slice and Dice duration to its 5 combo point maximum.",
  "Your Eviscerate and Envenom abilities have a 20% chance to refresh your Slice and Dice duration to its 5 combo point maximum.",
  "Your Eviscerate and Envenom abilities have a 20% chance to refresh your Slice and Dice duration to its 5 combo point maximum.",
  "Your Eviscerate and Envenom abilities have a 20% chance to refresh your Slice and Dice duration to its 5 combo point maximum."
),

(51662, @locale_en,
  "Enrages you, increasing all damage caused by 5%.  Requires a bleed effect to be active on the target.  Lasts 1 min.",
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

(13715, @locale_en,
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%.",
  "Increases the damage done by your offhand weapon by 10%."
),

(14165, @locale_en,
  "Increases the duration of your Slice and Dice ability by 25%.",
  "Increases the duration of your Slice and Dice ability by 25%.",
  NULL,
  NULL,
  NULL
),

(13713, @locale_en,
  "Increases your Parry chance by 2%.",
  "Increases your Parry chance by 2%.",
  "Increases your Parry chance by 2%.",
  NULL,
  NULL
),

(13705, @locale_en,
  "Increases your chance to hit with weapon and poison attacks by 1%.",
  "Increases your chance to hit with weapon and poison attacks by 1%.",
  "Increases your chance to hit with weapon and poison attacks by 1%.",
  "Increases your chance to hit with weapon and poison attacks by 1%.",
  "Increases your chance to hit with weapon and poison attacks by 1%."
),

(13742, @locale_en,
  "Reduces the cooldown of your Sprint and Evasion abilities by 30 sec and increases your total Stamina by 2%.",
  "Reduces the cooldown of your Sprint and Evasion abilities by 30 sec and increases your total Stamina by 2%.",
  NULL,
  NULL,
  NULL
),

(14251, @locale_en,
  "A strike that becomes active after parrying an opponent's attack.  This attack deals 150% weapon damage and slows their melee attack speed by 20% for 30 sec.  Awards 1 combo point.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13706, @locale_en,
  "Increases your chance to get a critical strike with Daggers and Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Daggers and Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Daggers and Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Daggers and Fist Weapons by 1%.",
  "Increases your chance to get a critical strike with Daggers and Fist Weapons by 1%."
),

(13754, @locale_en,
  "Gives your Kick ability a 50% chance to silence the target for 2 sec.",
  "Gives your Kick ability a 50% chance to silence the target for 2 sec.",
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

(13712, @locale_en,
  "Increases your Dodge chance by 2% and gives you 4% melee haste.",
  "Increases your Dodge chance by 2% and gives you 4% melee haste.",
  "Increases your Dodge chance by 2% and gives you 4% melee haste.",
  NULL,
  NULL
),

(18427, @locale_en,
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 3%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 3%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 3%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 3%.",
  "Increases the damage of your Sinister Strike, Backstab, and Eviscerate abilities by 3%."
),

(13709, @locale_en,
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor.",
  "Your attacks with maces ignore up to 3% of your opponent's armor."
),

(13877, @locale_en,
  "Increases your attack speed by 20%.  In addition, attacks strike an additional nearby opponent.  Lasts 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(13960, @locale_en,
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword or Axe.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword or Axe.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword or Axe.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword or Axe.",
  "Gives you a 1% chance to get an extra attack on the same target after hitting your target with your Sword or Axe."
),

(30919, @locale_en,
  "Increases your expertise by 5.",
  "Increases your expertise by 5.",
  NULL,
  NULL,
  NULL
),

(31124, @locale_en,
  "Increases the damage dealt by Sinister Strike and Backstab by 5%, and your damaging melee attacks have a 10% chance to Daze the target for 4 sec.",
  "Increases the damage dealt by Sinister Strike and Backstab by 5%, and your damaging melee attacks have a 10% chance to Daze the target for 4 sec.",
  NULL,
  NULL,
  NULL
),

(31122, @locale_en,
  "Increases your Energy regeneration rate by 8%.",
  "Increases your Energy regeneration rate by 8%.",
  "Increases your Energy regeneration rate by 8%.",
  NULL,
  NULL
),

(13750, @locale_en,
  "Increases your Energy regeneration rate by 100% for 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31130, @locale_en,
  "Reduces damage taken while affected by Stun and Fear effects by 15%.",
  "Reduces damage taken while affected by Stun and Fear effects by 15%.",
  NULL,
  NULL,
  NULL
),

(5952, @locale_en,
  "Increases the range of Throw and Deadly Throw by 2 yards and gives your Deadly Throw a 50% chance to interrupt the target for 3 sec.",
  "Increases the range of Throw and Deadly Throw by 2 yards and gives your Deadly Throw a 50% chance to interrupt the target for 3 sec.",
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

(51672, @locale_en,
  "Whenever you dodge an attack you gain an Unfair Advantage, striking back for 50% of your main hand weapon's damage.  This cannot occur more than once per second.",
  "Whenever you dodge an attack you gain an Unfair Advantage, striking back for 50% of your main hand weapon's damage.  This cannot occur more than once per second.",
  NULL,
  NULL,
  NULL
),

(32601, @locale_en,
  "Your finishing moves can no longer be dodged, and the damage dealt by your Sinister Strike, Backstab, Shiv, Hemorrhage and Gouge abilities is increased by 10%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51682, @locale_en,
  "Increases your total attack power by 2% and all physical damage caused to enemies you have poisoned is increased by 2%.",
  "Increases your total attack power by 2% and all physical damage caused to enemies you have poisoned is increased by 2%.",
  NULL,
  NULL,
  NULL
),

(51685, @locale_en,
  "Your critical strike damage is increased by 4% when the target has less health than you (as a percentage of total health).",
  "Your critical strike damage is increased by 4% when the target has less health than you (as a percentage of total health).",
  "Your critical strike damage is increased by 4% when the target has less health than you (as a percentage of total health).",
  "Your critical strike damage is increased by 4% when the target has less health than you (as a percentage of total health).",
  "Your critical strike damage is increased by 4% when the target has less health than you (as a percentage of total health)."
),

(51690, @locale_en,
  "Step through the shadows from enemy to enemy within 10 yards, attacking an enemy every .5 secs with both weapons until 5 assaults are made, and increasing all damage done by 20% for the duration.  Can hit the same target multiple times.  Cannot hit invisible or stealthed targets.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14179, @locale_en,
  "Your finishing moves have a 4% chance per combo point to restore 25 energy.",
  "Your finishing moves have a 4% chance per combo point to restore 25 energy.",
  "Your finishing moves have a 4% chance per combo point to restore 25 energy.",
  "Your finishing moves have a 4% chance per combo point to restore 25 energy.",
  "Your finishing moves have a 4% chance per combo point to restore 25 energy."
),

(13958, @locale_en,
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  "Reduces the chance enemies have to detect you while in Stealth mode.",
  NULL,
  NULL
),

(14057, @locale_en,
  "Increases the damage dealt with your Backstab, Mutilate, Garrote and Ambush abilities by 10%.",
  "Increases the damage dealt with your Backstab, Mutilate, Garrote and Ambush abilities by 10%.",
  NULL,
  NULL,
  NULL
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
  "Increases your speed while stealthed by 5% and reduces the cooldown of your Stealth ability by 2 sec.",
  "Increases your speed while stealthed by 5% and reduces the cooldown of your Stealth ability by 2 sec.",
  "Increases your speed while stealthed by 5% and reduces the cooldown of your Stealth ability by 2 sec.",
  NULL,
  NULL
),

(13981, @locale_en,
  "Reduces the cooldown of your Vanish and Blind abilities by 30 sec and your Cloak of Shadows ability by 15 sec.",
  "Reduces the cooldown of your Vanish and Blind abilities by 30 sec and your Cloak of Shadows ability by 15 sec.",
  NULL,
  NULL,
  NULL
),

(14278, @locale_en,
  "A strike that deals 125% weapon damage (180% if a dagger is equipped) and increases your chance to dodge by 15% for 7 sec.  Awards 1 combo point.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14171, @locale_en,
  "Causes your attacks to ignore up to 3% of your target's Armor and increases the damage dealt by your Rupture ability by 10%.",
  "Causes your attacks to ignore up to 3% of your target's Armor and increases the damage dealt by your Rupture ability by 10%.",
  "Causes your attacks to ignore up to 3% of your target's Armor and increases the damage dealt by your Rupture ability by 10%.",
  NULL,
  NULL
),

(13983, @locale_en,
  "Gives you a 33% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.  This cannot happen more than once per second.",
  "Gives you a 33% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.  This cannot happen more than once per second.",
  "Gives you a 33% chance to add a combo point to your target after dodging their attack or fully resisting one of their spells.  This cannot happen more than once per second.",
  NULL,
  NULL
),

(13976, @locale_en,
  "Gives you a 33% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  "Gives you a 33% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  "Gives you a 33% chance to add an additional combo point to your target when using your Ambush, Garrote, or Cheap Shot ability.",
  NULL,
  NULL
),

(14079, @locale_en,
  "Increases the critical strike chance of your Ambush ability by 25%.",
  "Increases the critical strike chance of your Ambush ability by 25%.",
  NULL,
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
  "When activated, this ability immediately finishes the cooldown on your Evasion, Sprint, Vanish, Cold Blood and Shadowstep abilities.",
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
  "An instant strike that deals 110% weapon damage (160% if a dagger is equipped) and causes the target to hemorrhage, increasing any Physical damage dealt to the target by up to <!--sp56807:0-->13<!--sp56807-->.  Lasts 10 charges or 15 sec.  Awards 1 combo point.",
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
  "Reduces the damage taken by area of effect attacks by 10%.",
  "Reduces the damage taken by area of effect attacks by 10%.",
  "Reduces the damage taken by area of effect attacks by 10%.",
  NULL,
  NULL
),

(14183, @locale_en,
  "When used, adds 2 combo points to your target.  You must add to or use those combo points within 20 sec or the combo points are lost.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31228, @locale_en,
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3 sec (modified by resilience).  This effect cannot occur more than once per minute.",
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3 sec (modified by resilience).  This effect cannot occur more than once per minute.",
  "You have a 33% chance that an attack which would otherwise kill you will instead reduce you to 10% of your maximum health. In addition, all damage taken will be reduced by up to 90% for 3 sec (modified by resilience).  This effect cannot occur more than once per minute.",
  NULL,
  NULL
),

(31216, @locale_en,
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 2%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 2%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 2%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 2%.",
  "Increases your total Agility by 3% and increases the percentage damage bonus of Backstab and Hemorrhage by an additional 2%."
),

(51692, @locale_en,
  "Your Ambush and Backstab hits have a 50% chance to unbalance a target, increasing the time between their melee and ranged attacks by 20%, and reducing movement speed by 50% for 8 sec.",
  "Your Ambush and Backstab hits have a 50% chance to unbalance a target, increasing the time between their melee and ranged attacks by 20%, and reducing movement speed by 50% for 8 sec.",
  NULL,
  NULL,
  NULL
),

(51698, @locale_en,
  "When anyone in your group critically hits with a damage or healing spell or ability, you have a 33% chance to gain a combo point on your current target.  This effect cannot occur more than once every second.",
  "When anyone in your group critically hits with a damage or healing spell or ability, you have a 33% chance to gain a combo point on your current target.  This effect cannot occur more than once every second.",
  "When anyone in your group critically hits with a damage or healing spell or ability, you have a 33% chance to gain a combo point on your current target.  This effect cannot occur more than once every second.",
  NULL,
  NULL
),

(36554, @locale_en,
  "Attempts to step through the shadows and reappear behind your enemy and increases movement speed by 70% for 3 sec.  The damage of your next ability is increased by 20% and the threat caused is reduced by 50%.  Lasts 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(58414, @locale_en,
  "Reduces the cooldown by 5 sec and energy cost by 5 of your Tricks of the Trade, Distract and Shadowstep abilities and reduces the cooldown of Preparation by 1.5 min.",
  "Reduces the cooldown by 5 sec and energy cost by 5 of your Tricks of the Trade, Distract and Shadowstep abilities and reduces the cooldown of Preparation by 1.5 min.",
  NULL,
  NULL,
  NULL
),

(51708, @locale_en,
  "Reduces the energy cost of your Backstab and Ambush abilities by 4 and the energy cost of your Hemorrhage by 1, and increases all damage done by 1%.",
  "Reduces the energy cost of your Backstab and Ambush abilities by 4 and the energy cost of your Hemorrhage by 1, and increases all damage done by 1%.",
  "Reduces the energy cost of your Backstab and Ambush abilities by 4 and the energy cost of your Hemorrhage by 1, and increases all damage done by 1%.",
  "Reduces the energy cost of your Backstab and Ambush abilities by 4 and the energy cost of your Hemorrhage by 1, and increases all damage done by 1%.",
  "Reduces the energy cost of your Backstab and Ambush abilities by 4 and the energy cost of your Hemorrhage by 1, and increases all damage done by 1%."
),

(51713, @locale_en,
  "Enter the Shadow Dance for 6 sec, allowing the use of Sap, Garrote, Ambush, Cheap Shot, Premeditation, Pickpocket and Disarm Trap regardless of being stealthed.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- priest

(14522, @locale_en,
  "Reduces the duration of Stun, Fear, and Silence effects done to you by an additional 6%.",
  "Reduces the duration of Stun, Fear, and Silence effects done to you by an additional 6%.",
  "Reduces the duration of Stun, Fear, and Silence effects done to you by an additional 6%.",
  "Reduces the duration of Stun, Fear, and Silence effects done to you by an additional 6%.",
  "Reduces the duration of Stun, Fear, and Silence effects done to you by an additional 6%."
),

(47586, @locale_en,
  "Increases the damage and healing done by your instant spells by 1%.",
  "Increases the damage and healing done by your instant spells by 1%.",
  "Increases the damage and healing done by your instant spells by 1%.",
  "Increases the damage and healing done by your instant spells by 1%.",
  "Increases the damage and healing done by your instant spells by 1%."
),

(14523, @locale_en,
  "Reduces the threat generated by your Holy and Discipline spells by 7% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  "Reduces the threat generated by your Holy and Discipline spells by 7% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  "Reduces the threat generated by your Holy and Discipline spells by 7% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  NULL,
  NULL
),

(14747, @locale_en,
  "Increases the effect of your Inner Fire spell by 15%, and increases the total number of charges by 4.",
  "Increases the effect of your Inner Fire spell by 15%, and increases the total number of charges by 4.",
  "Increases the effect of your Inner Fire spell by 15%, and increases the total number of charges by 4.",
  NULL,
  NULL
),

(14749, @locale_en,
  "Increases the effect of your Power Word: Fortitude and Prayer of Fortitude spells by 15%, and increases your total Stamina by 2%.",
  "Increases the effect of your Power Word: Fortitude and Prayer of Fortitude spells by 15%, and increases your total Stamina by 2%.",
  NULL,
  NULL,
  NULL
),

(14531, @locale_en,
  "Gives you a 50% chance to gain the Focused Casting effect that lasts for 6 sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect reduces the pushback suffered from damaging attacks while casting Priest spells and decreases the duration of Interrupt effects by 10%.",
  "Gives you a 50% chance to gain the Focused Casting effect that lasts for 6 sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect reduces the pushback suffered from damaging attacks while casting Priest spells and decreases the duration of Interrupt effects by 10%.",
  NULL,
  NULL,
  NULL
),

(14521, @locale_en,
  "Allows 17% of your mana regeneration to continue while casting.",
  "Allows 17% of your mana regeneration to continue while casting.",
  "Allows 17% of your mana regeneration to continue while casting.",
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

(14748, @locale_en,
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
  "Increases the damage absorbed by your Power Word: Shield by 5%.",
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

(14520, @locale_en,
  "Reduces the mana cost of your instant cast spells by 4%.",
  "Reduces the mana cost of your instant cast spells by 4%.",
  "Reduces the mana cost of your instant cast spells by 4%.",
  NULL,
  NULL
),

(14750, @locale_en,
  "Reduces the casting time of your Mana Burn spell by 0.5 sec.",
  "Reduces the casting time of your Mana Burn spell by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(33201, @locale_en,
  "Causes 22% of the damage you absorb with Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  "Causes 22% of the damage you absorb with Power Word: Shield to reflect back at the attacker.  This damage causes no threat.",
  NULL,
  NULL,
  NULL
),

(18551, @locale_en,
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%.",
  "Increases your total Intellect by 3%."
),

(63574, @locale_en,
  "Reduces the cooldown of your Power Word: Shield ability by 4 sec, and reduces the mana cost of your Power Word: Shield by 15%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33186, @locale_en,
  "Increases damage and healing done by your spells by 2%. In addition, your Mass Dispel cast time is reduced by 0.5 sec.",
  "Increases damage and healing done by your spells by 2%. In addition, your Mass Dispel cast time is reduced by 0.5 sec.",
  NULL,
  NULL,
  NULL
),

(34908, @locale_en,
  "Increases your total Spirit by 2% and increases your spell haste by 2%.",
  "Increases your total Spirit by 2% and increases your spell haste by 2%.",
  "Increases your total Spirit by 2% and increases your spell haste by 2%.",
  NULL,
  NULL
),

(45234, @locale_en,
  "Increases your spell critical effect chance by 1%, and after taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 3%.  Stacks up to 3 times.  Lasts 8 sec.",
  "Increases your spell critical effect chance by 1%, and after taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 3%.  Stacks up to 3 times.  Lasts 8 sec.",
  "Increases your spell critical effect chance by 1%, and after taking a critical hit you gain the Focused Will effect, reducing all damage taken by 2% and increasing healing effects on you by 3%.  Stacks up to 3 times.  Lasts 8 sec.",
  NULL,
  NULL
),

(10060, @locale_en,
  "Infuses the target with power, increasing spell casting speed by 20% and reducing the mana cost of all spells by 20%.  Lasts 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(63504, @locale_en,
  "Reduces the mana cost of your Flash Heal by 5%, and increases the critical effect chance of your Flash Heal by 4% on friendly targets at or below 50% health.",
  "Reduces the mana cost of your Flash Heal by 5%, and increases the critical effect chance of your Flash Heal by 4% on friendly targets at or below 50% health.",
  "Reduces the mana cost of your Flash Heal by 5%, and increases the critical effect chance of your Flash Heal by 4% on friendly targets at or below 50% health.",
  NULL,
  NULL
),

(57470, @locale_en,
  "Increases the critical effect chance of your Flash Heal, Greater Heal and Penance (Heal) spells by 2% on targets afflicted by the Weakened Soul effect, and you have a 50% chance to reduce all damage taken by 3% for 1 min to all friendly party and raid targets when you cast Power Word: Shield. This effect has a 15 sec cooldown.",
  "Increases the critical effect chance of your Flash Heal, Greater Heal and Penance (Heal) spells by 2% on targets afflicted by the Weakened Soul effect, and you have a 50% chance to reduce all damage taken by 3% for 1 min to all friendly party and raid targets when you cast Power Word: Shield. This effect has a 15 sec cooldown.",
  NULL,
  NULL,
  NULL
),

(47535, @locale_en,
  "When your Power Word: Shield is completely absorbed or dispelled you are instantly energized with 1.5% of your total mana, and you have a 33% chance to energize your shielded target with 2% total mana, 8 rage, 16 energy or 32 runic power. This effect can only occur once every 12 sec.",
  "When your Power Word: Shield is completely absorbed or dispelled you are instantly energized with 1.5% of your total mana, and you have a 33% chance to energize your shielded target with 2% total mana, 8 rage, 16 energy or 32 runic power. This effect can only occur once every 12 sec.",
  "When your Power Word: Shield is completely absorbed or dispelled you are instantly energized with 1.5% of your total mana, and you have a 33% chance to energize your shielded target with 2% total mana, 8 rage, 16 energy or 32 runic power. This effect can only occur once every 12 sec.",
  NULL,
  NULL
),

(47507, @locale_en,
  "Reduces the cooldown of your Inner Focus, Power Infusion, Pain Suppression and Penance spells by 10%.",
  "Reduces the cooldown of your Inner Focus, Power Infusion, Pain Suppression and Penance spells by 10%.",
  NULL,
  NULL,
  NULL
),

(47509, @locale_en,
  "Critical heals create a protective shield on the target, absorbing 10% of the amount healed. Lasts 12 sec.",
  "Critical heals create a protective shield on the target, absorbing 10% of the amount healed. Lasts 12 sec.",
  "Critical heals create a protective shield on the target, absorbing 10% of the amount healed. Lasts 12 sec.",
  NULL,
  NULL
),

(33206, @locale_en,
  "Instantly reduces a friendly target's threat by 5%, reduces all damage taken by 40% and increases resistance to Dispel mechanics by 65% for 8 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47516, @locale_en,
  "Your Flash Heal, Greater Heal, and Penance spells have a 50% chance to bless the target with Grace, increasing all healing received from the Priest by 3%. This effect will stack up to 3 times. Effect lasts 15 sec. Grace can only be active on one target at a time.",
  "Your Flash Heal, Greater Heal, and Penance spells have a 50% chance to bless the target with Grace, increasing all healing received from the Priest by 3%. This effect will stack up to 3 times. Effect lasts 15 sec. Grace can only be active on one target at a time.",
  NULL,
  NULL,
  NULL
),

(52795, @locale_en,
  "Grants 5% spell haste for your next spell after casting Power Word: Shield, and increases the amount absorbed by your Power Word: Shield equal to 8% of your spell power.",
  "Grants 5% spell haste for your next spell after casting Power Word: Shield, and increases the amount absorbed by your Power Word: Shield equal to 8% of your spell power.",
  "Grants 5% spell haste for your next spell after casting Power Word: Shield, and increases the amount absorbed by your Power Word: Shield equal to 8% of your spell power.",
  "Grants 5% spell haste for your next spell after casting Power Word: Shield, and increases the amount absorbed by your Power Word: Shield equal to 8% of your spell power.",
  "Grants 5% spell haste for your next spell after casting Power Word: Shield, and increases the amount absorbed by your Power Word: Shield equal to 8% of your spell power."
),

(47540, @locale_en,
  "Launches a volley of holy light at the target, causing 240 Holy damage to an enemy, or 670 to 756 healing to an ally instantly and every 1 sec for 2 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14913, @locale_en,
  "Reduces the pushback suffered from damaging attacks  while casting any healing spell by 35%.",
  "Reduces the pushback suffered from damaging attacks  while casting any healing spell by 35%.",
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

(19236, @locale_en,
  "Instantly heals the caster for 263 to 325.",
  NULL,
  NULL,
  NULL,
  NULL
),

(27811, @locale_en,
  "After being struck by a melee or ranged critical hit, Blessed Recovery heals you for 5% of the damage taken over 6 sec.  Additional critical hits taken during the effect increase the healing received.",
  "After being struck by a melee or ranged critical hit, Blessed Recovery heals you for 5% of the damage taken over 6 sec.  Additional critical hits taken during the effect increase the healing received.",
  "After being struck by a melee or ranged critical hit, Blessed Recovery heals you for 5% of the damage taken over 6 sec.  Additional critical hits taken during the effect increase the healing received.",
  NULL,
  NULL
),

(14892, @locale_en,
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Penance, Prayer of Mending, Prayer of Healing, or Circle of Healing spell.",
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Penance, Prayer of Mending, Prayer of Healing, or Circle of Healing spell.",
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from your Flash Heal, Heal, Greater Heal, Binding Heal, Penance, Prayer of Mending, Prayer of Healing, or Circle of Healing spell.",
  NULL,
  NULL
),

(27789, @locale_en,
  "Increases the range of your Smite and Holy Fire spells and the radius of your Prayer of Healing, Holy Nova, Divine Hymn and Circle of Healing spells by 10%.",
  "Increases the range of your Smite and Holy Fire spells and the radius of your Prayer of Healing, Holy Nova, Divine Hymn and Circle of Healing spells by 10%.",
  NULL,
  NULL,
  NULL
),

(14912, @locale_en,
  "Reduces the mana cost of your Lesser Heal, Heal, Greater Heal, Divine Hymn and Penance spells by 5%.",
  "Reduces the mana cost of your Lesser Heal, Heal, Greater Heal, Divine Hymn and Penance spells by 5%.",
  "Reduces the mana cost of your Lesser Heal, Heal, Greater Heal, Divine Hymn and Penance spells by 5%.",
  NULL,
  NULL
),

(14909, @locale_en,
  "Increases the damage of your Smite, Holy Fire, Holy Nova and Penance spells by 5%.",
  "Increases the damage of your Smite, Holy Fire, Holy Nova and Penance spells by 5%.",
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
  "Increases total Spirit by 5% and upon death, the priest becomes the Spirit of Redemption for 15 sec.  The Spirit of Redemption cannot move, attack, be attacked or targeted by any spells or effects.  While in this form the priest can cast any healing spell free of cost.  When the effect ends, the priest dies.",
  NULL,
  NULL,
  NULL,
  NULL
),

(14901, @locale_en,
  "Increases spell power by 5% of your total Spirit.",
  "Increases spell power by 5% of your total Spirit.",
  "Increases spell power by 5% of your total Spirit.",
  "Increases spell power by 5% of your total Spirit.",
  "Increases spell power by 5% of your total Spirit."
),

(33150, @locale_en,
  "Your spell criticals have a 25% chance to cause your next Smite or Flash Heal spell to be instant cast, cost no mana but be incapable of a critical hit.  This effect lasts 10 sec.",
  "Your spell criticals have a 25% chance to cause your next Smite or Flash Heal spell to be instant cast, cost no mana but be incapable of a critical hit.  This effect lasts 10 sec.",
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
  "Your mana regeneration from spirit is increased by 16% for 8 sec after you critically heal with Flash Heal, Greater Heal, Binding Heal or Empowered Renew.",
  "Your mana regeneration from spirit is increased by 16% for 8 sec after you critically heal with Flash Heal, Greater Heal, Binding Heal or Empowered Renew.",
  "Your mana regeneration from spirit is increased by 16% for 8 sec after you critically heal with Flash Heal, Greater Heal, Binding Heal or Empowered Renew.",
  NULL,
  NULL
),

(724, @locale_en,
  "Creates a Holy Lightwell.  Friendly players can click the Lightwell to restore 267*3*<!--sp55673:0-->1<!--sp55673--> health over 6 sec.  Attacks done to you equal to 30% of your total health will cancel the effect. Lightwell lasts for 3 min or 10 charges.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33142, @locale_en,
  "Increases the effectiveness of your healing spells by 1%, and critical hits made against you have a 20% chance to prevent you from being critically hit again for 6 sec.",
  "Increases the effectiveness of your healing spells by 1%, and critical hits made against you have a 20% chance to prevent you from being critically hit again for 6 sec.",
  "Increases the effectiveness of your healing spells by 1%, and critical hits made against you have a 20% chance to prevent you from being critically hit again for 6 sec.",
  NULL,
  NULL
),

(64127, @locale_en,
  "When you cast Power Word: Shield, you increase the target's movement speed by 30% for 4 sec, and you have a 50% chance when you cast Abolish Disease on yourself to also cleanse 1 poison effect in addition to diseases.",
  "When you cast Power Word: Shield, you increase the target's movement speed by 30% for 4 sec, and you have a 50% chance when you cast Abolish Disease on yourself to also cleanse 1 poison effect in addition to diseases.",
  NULL,
  NULL,
  NULL
),

(33158, @locale_en,
  "Your Greater Heal spell gains an additional 8% and your Flash Heal and Binding Heal gain an additional 4% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 8% and your Flash Heal and Binding Heal gain an additional 4% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 8% and your Flash Heal and Binding Heal gain an additional 4% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 8% and your Flash Heal and Binding Heal gain an additional 4% of your bonus healing effects.",
  "Your Greater Heal spell gains an additional 8% and your Flash Heal and Binding Heal gain an additional 4% of your bonus healing effects."
),

(63730, @locale_en,
  "When you heal with Binding Heal or Flash Heal, the cast time of your next Greater Heal or Prayer of Healing spell is reduced by 4%. Stacks up to 3 times. Lasts 20 sec.",
  "When you heal with Binding Heal or Flash Heal, the cast time of your next Greater Heal or Prayer of Healing spell is reduced by 4%. Stacks up to 3 times. Lasts 20 sec.",
  "When you heal with Binding Heal or Flash Heal, the cast time of your next Greater Heal or Prayer of Healing spell is reduced by 4%. Stacks up to 3 times. Lasts 20 sec.",
  NULL,
  NULL
),

(63534, @locale_en,
  "Your Renew spell gains an additional 5% of your bonus healing effects, and your Renew will instantly heal the target for 5% of the total periodic effect.",
  "Your Renew spell gains an additional 5% of your bonus healing effects, and your Renew will instantly heal the target for 5% of the total periodic effect.",
  "Your Renew spell gains an additional 5% of your bonus healing effects, and your Renew will instantly heal the target for 5% of the total periodic effect.",
  NULL,
  NULL
),

(34861, @locale_en,
  "Heals up to <!--sp55675:0-->5<!--sp55675--> friendly party or raid members within 15 yards of the target for 343 to 379.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47558, @locale_en,
  "Increases healing by 4% on friendly targets at or below 50% health.",
  "Increases healing by 4% on friendly targets at or below 50% health.",
  "Increases healing by 4% on friendly targets at or below 50% health.",
  NULL,
  NULL
),

(47562, @locale_en,
  "Increases the amount healed by Circle of Healing, Binding Heal, Holy Nova, Prayer of Healing, Divine Hymn and Prayer of Mending by 2%, and reduces the cooldown of your Prayer of Mending by 6%.",
  "Increases the amount healed by Circle of Healing, Binding Heal, Holy Nova, Prayer of Healing, Divine Hymn and Prayer of Mending by 2%, and reduces the cooldown of your Prayer of Mending by 6%.",
  "Increases the amount healed by Circle of Healing, Binding Heal, Holy Nova, Prayer of Healing, Divine Hymn and Prayer of Mending by 2%, and reduces the cooldown of your Prayer of Mending by 6%.",
  "Increases the amount healed by Circle of Healing, Binding Heal, Holy Nova, Prayer of Healing, Divine Hymn and Prayer of Mending by 2%, and reduces the cooldown of your Prayer of Mending by 6%.",
  "Increases the amount healed by Circle of Healing, Binding Heal, Holy Nova, Prayer of Healing, Divine Hymn and Prayer of Mending by 2%, and reduces the cooldown of your Prayer of Mending by 6%."
),

(47788, @locale_en,
  "Calls upon a guardian spirit to watch over the friendly target. The spirit increases the healing received by the target by 40%, and also prevents the target from dying by sacrificing itself.  This sacrifice terminates the effect but heals the target of 50% of their maximum health. Lasts 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15270, @locale_en,
  "Gives you a 33% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 83% rate while casting.  Lasts 15 sec.",
  "Gives you a 33% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 83% rate while casting.  Lasts 15 sec.",
  "Gives you a 33% chance to gain a 100% bonus to your Spirit after killing a target that yields experience or honor.  For the duration, your mana will regenerate at a 83% rate while casting.  Lasts 15 sec.",
  NULL,
  NULL
),

(15337, @locale_en,
  "Your Mind Blast and Shadow Word: Death critical strikes have a 100% chance and your Mind Flay critical strikes have a 50% chance to increase your total Spirit by 5%. For the duration, your mana will regenerate at a 17% rate while casting. Lasts 8 sec.",
  "Your Mind Blast and Shadow Word: Death critical strikes have a 100% chance and your Mind Flay critical strikes have a 50% chance to increase your total Spirit by 5%. For the duration, your mana will regenerate at a 17% rate while casting. Lasts 8 sec.",
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

(15318, @locale_en,
  "Reduces the threat generated by your Shadow spells by 8%, and you receive 5% of your base mana when your Shadow Word: Pain or Vampiric Touch spells are dispelled.",
  "Reduces the threat generated by your Shadow spells by 8%, and you receive 5% of your base mana when your Shadow Word: Pain or Vampiric Touch spells are dispelled.",
  "Reduces the threat generated by your Shadow spells by 8%, and you receive 5% of your base mana when your Shadow Word: Pain or Vampiric Touch spells are dispelled.",
  NULL,
  NULL
),

(15275, @locale_en,
  "Increases the damage of your Shadow Word: Pain spell by 3%.",
  "Increases the damage of your Shadow Word: Pain spell by 3%.",
  NULL,
  NULL,
  NULL
),

(15260, @locale_en,
  "Increases your chance to hit with your Shadow spells by 1%, and reduces the mana cost of your Shadow spells by 2%.",
  "Increases your chance to hit with your Shadow spells by 1%, and reduces the mana cost of your Shadow spells by 2%.",
  "Increases your chance to hit with your Shadow spells by 1%, and reduces the mana cost of your Shadow spells by 2%.",
  NULL,
  NULL
),

(15392, @locale_en,
  "Reduces the cooldown of your Psychic Scream spell by 2 sec.",
  "Reduces the cooldown of your Psychic Scream spell by 2 sec.",
  NULL,
  NULL,
  NULL
),

(15273, @locale_en,
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec., and while in Shadowform your Mind Blast also has a 20% chance to reduce all healing done to the target by 20% for 10 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec., and while in Shadowform your Mind Blast also has a 20% chance to reduce all healing done to the target by 20% for 10 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec., and while in Shadowform your Mind Blast also has a 20% chance to reduce all healing done to the target by 20% for 10 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec., and while in Shadowform your Mind Blast also has a 20% chance to reduce all healing done to the target by 20% for 10 sec.",
  "Reduces the cooldown of your Mind Blast spell by 0.5 sec., and while in Shadowform your Mind Blast also has a 20% chance to reduce all healing done to the target by 20% for 10 sec."
),

(15407, @locale_en,
  "Assault the target's mind with Shadow energy, causing 45 Shadow damage over 3 sec and slowing their movement speed by 50%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15274, @locale_en,
  "Decreases the cooldown of your Fade ability by 3 sec, and reduces the cooldown of your Shadowfiend ability by 1 minute.",
  "Decreases the cooldown of your Fade ability by 3 sec, and reduces the cooldown of your Shadowfiend ability by 1 minute.",
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
  "Your Shadow damage spells have a 33% chance to increase the Shadow damage you deal by 2% for 15 sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 33% chance to increase the Shadow damage you deal by 2% for 15 sec.  Stacks up to 5 times.",
  "Your Shadow damage spells have a 33% chance to increase the Shadow damage you deal by 2% for 15 sec.  Stacks up to 5 times.",
  NULL,
  NULL
),

(15487, @locale_en,
  "Silences the target, preventing them from casting spells for 5 sec.  Non-player victim spellcasting is also interrupted for 3 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(15286, @locale_en,
  "Fills you with the embrace of Shadow energy, causing you to be healed for 15% and other party members to be healed for 3% of any single-target Shadow spell damage you deal for 30 min.",
  NULL,
  NULL,
  NULL,
  NULL
),

(27839, @locale_en,
  "Increases the healing received from Vampiric Embrace by 33%.",
  "Increases the healing received from Vampiric Embrace by 33%.",
  NULL,
  NULL,
  NULL
),

(33213, @locale_en,
  "Reduces the mana cost of your Mind Blast, Mind Control, Mind Flay and Mind Sear spells by 5%.",
  "Reduces the mana cost of your Mind Blast, Mind Control, Mind Flay and Mind Sear spells by 5%.",
  "Reduces the mana cost of your Mind Blast, Mind Control, Mind Flay and Mind Sear spells by 5%.",
  NULL,
  NULL
),

(14910, @locale_en,
  "Increases the critical strike chance of your Mind Blast, Mind Flay and Mind Sear spells by 2%, and increases the periodic critical strike chance of your Vampiric Touch, Devouring Plague and Shadow Word: Pain spells by 3%.",
  "Increases the critical strike chance of your Mind Blast, Mind Flay and Mind Sear spells by 2%, and increases the periodic critical strike chance of your Vampiric Touch, Devouring Plague and Shadow Word: Pain spells by 3%.",
  NULL,
  NULL,
  NULL
),

(63625, @locale_en,
  "Increases the periodic damage done by your Devouring Plague by 5%, and when you cast Devouring Plague you instantly deal damage equal to 10% of its total periodic effect.",
  "Increases the periodic damage done by your Devouring Plague by 5%, and when you cast Devouring Plague you instantly deal damage equal to 10% of its total periodic effect.",
  "Increases the periodic damage done by your Devouring Plague by 5%, and when you cast Devouring Plague you instantly deal damage equal to 10% of its total periodic effect.",
  NULL,
  NULL
),

(15473, @locale_en,
  "Assume a Shadowform, increasing your Shadow damage by 15%, reducing all damage done to you by 15% and threat generated by 30%.  However, you may not cast Holy spells while in this form except Cure Disease and Abolish Disease.  Grants the periodic damage from your Shadow Word: Pain, Devouring Plague, and Vampiric Touch spells the ability to critically hit for 100% increased damage and grants Devouring Plague and Vampiric Touch the ability to benefit from haste.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33221, @locale_en,
  "Increases the critical strike damage bonus of your Mind Blast, Mind Flay, and Shadow Word: Death spells by 20%.",
  "Increases the critical strike damage bonus of your Mind Blast, Mind Flay, and Shadow Word: Death spells by 20%.",
  "Increases the critical strike damage bonus of your Mind Blast, Mind Flay, and Shadow Word: Death spells by 20%.",
  "Increases the critical strike damage bonus of your Mind Blast, Mind Flay, and Shadow Word: Death spells by 20%.",
  "Increases the critical strike damage bonus of your Mind Blast, Mind Flay, and Shadow Word: Death spells by 20%."
),

(47569, @locale_en,
  "Your Fade ability now has a 50% chance to remove all movement impairing effects when used while in Shadowform, and reduces casting or channeling time lost when damaged by 35% when casting any Shadow spell while in Shadowform.",
  "Your Fade ability now has a 50% chance to remove all movement impairing effects when used while in Shadowform, and reduces casting or channeling time lost when damaged by 35% when casting any Shadow spell while in Shadowform.",
  NULL,
  NULL,
  NULL
),

(33191, @locale_en,
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also increase the chance for harmful spells to hit by 1% lasting 24 sec, and increases the benefit from spell power gained by your Mind Blast, Mind Flay and Mind Sear spells by 5%.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also increase the chance for harmful spells to hit by 1% lasting 24 sec, and increases the benefit from spell power gained by your Mind Blast, Mind Flay and Mind Sear spells by 5%.",
  "Your Shadow Word: Pain, Mind Flay and Vampiric Touch spells also increase the chance for harmful spells to hit by 1% lasting 24 sec, and increases the benefit from spell power gained by your Mind Blast, Mind Flay and Mind Sear spells by 5%.",
  NULL,
  NULL
),

(64044, @locale_en,
  "You terrify the target, causing them to tremble in horror for 3 sec and drop their main hand and ranged weapons for 10 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34914, @locale_en,
  "Causes 450 Shadow damage over 15 sec to your target and causes up to 10 party or raid members to gain 1% of their maximum mana per 5 sec when you deal damage from Mind Blast. In addition, if the Vampiric Touch is dispelled it will cause 720 damage to the afflicted target.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47580, @locale_en,
  "Your Mind Flay has a 33% chance to refresh the duration of your Shadow Word: Pain on the target, and reduces the damage you take from your own Shadow Word: Death by 10%.",
  "Your Mind Flay has a 33% chance to refresh the duration of your Shadow Word: Pain on the target, and reduces the damage you take from your own Shadow Word: Death by 10%.",
  "Your Mind Flay has a 33% chance to refresh the duration of your Shadow Word: Pain on the target, and reduces the damage you take from your own Shadow Word: Death by 10%.",
  NULL,
  NULL
),

(47573, @locale_en,
  "Increases your spell power by 4% of your total Spirit, and your damage done by your Mind Flay and Mind Blast is increased by 2% if your target is afflicted by your Shadow Word: Pain.",
  "Increases your spell power by 4% of your total Spirit, and your damage done by your Mind Flay and Mind Blast is increased by 2% if your target is afflicted by your Shadow Word: Pain.",
  "Increases your spell power by 4% of your total Spirit, and your damage done by your Mind Flay and Mind Blast is increased by 2% if your target is afflicted by your Shadow Word: Pain.",
  "Increases your spell power by 4% of your total Spirit, and your damage done by your Mind Flay and Mind Blast is increased by 2% if your target is afflicted by your Shadow Word: Pain.",
  "Increases your spell power by 4% of your total Spirit, and your damage done by your Mind Flay and Mind Blast is increased by 2% if your target is afflicted by your Shadow Word: Pain."
),

(47585, @locale_en,
  "You disperse into pure Shadow energy, reducing all damage taken by 90%.  You are unable to attack or cast spells, but you regenerate 6% mana every 1 sec for 6 sec. Dispersion can be cast while stunned, feared or silenced and clears all snare and movement impairing effects when cast, and makes you immune to them while dispersed.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- deathknight
(48979, @locale_en,
  "Whenever you kill an enemy that grants experience or honor, you generate up to 10 runic power.  In addition, you generate 1 runic power per 5 sec while in combat.",
  "Whenever you kill an enemy that grants experience or honor, you generate up to 10 runic power.  In addition, you generate 1 runic power per 5 sec while in combat.",
  NULL,
  NULL,
  NULL
),

(48997, @locale_en,
  "Increases the critical strike chance of Blood Strike, Scourge Strike, Heart Strike and Obliterate by 3%, and reduces threat generated while in Blood or Unholy Presence by 8%.",
  "Increases the critical strike chance of Blood Strike, Scourge Strike, Heart Strike and Obliterate by 3%, and reduces threat generated while in Blood or Unholy Presence by 8%.",
  "Increases the critical strike chance of Blood Strike, Scourge Strike, Heart Strike and Obliterate by 3%, and reduces threat generated while in Blood or Unholy Presence by 8%.",
  NULL,
  NULL
),

(49182, @locale_en,
  "Whenever your Blood Runes are on cooldown, you gain the Blade Barrier effect, which decreases damage taken by 1% for the next 10 sec.",
  "Whenever your Blood Runes are on cooldown, you gain the Blade Barrier effect, which decreases damage taken by 1% for the next 10 sec.",
  "Whenever your Blood Runes are on cooldown, you gain the Blade Barrier effect, which decreases damage taken by 1% for the next 10 sec.",
  "Whenever your Blood Runes are on cooldown, you gain the Blade Barrier effect, which decreases damage taken by 1% for the next 10 sec.",
  "Whenever your Blood Runes are on cooldown, you gain the Blade Barrier effect, which decreases damage taken by 1% for the next 10 sec."
),

(48978, @locale_en,
  "Increases your attack power by 1 for every 180 armor value you have.",
  "Increases your attack power by 1 for every 180 armor value you have.",
  "Increases your attack power by 1 for every 180 armor value you have.",
  "Increases your attack power by 1 for every 180 armor value you have.",
  "Increases your attack power by 1 for every 180 armor value you have."
),

(49004, @locale_en,
  "You have a 15% chance after dodging, parrying or taking  direct damage to gain the Scent of Blood effect, causing your next melee hit to generate 10 runic power.",
  "You have a 15% chance after dodging, parrying or taking  direct damage to gain the Scent of Blood effect, causing your next melee hit to generate 10 runic power.",
  "You have a 15% chance after dodging, parrying or taking  direct damage to gain the Scent of Blood effect, causing your next melee hit to generate 10 runic power.",
  NULL,
  NULL
),

(55107, @locale_en,
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  "Increases the damage you deal with two-handed melee weapons by 2%.",
  NULL,
  NULL,
  NULL
),

(48982, @locale_en,
  "Converts 1 Blood Rune into 10% of your maximum health.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48987, @locale_en,
  "Increases your chance to critically hit with weapons, spells and abilities by 1%.",
  "Increases your chance to critically hit with weapons, spells and abilities by 1%.",
  "Increases your chance to critically hit with weapons, spells and abilities by 1%.",
  "Increases your chance to critically hit with weapons, spells and abilities by 1%.",
  "Increases your chance to critically hit with weapons, spells and abilities by 1%."
),

(49467, @locale_en,
  "Whenever you hit with Death Strike or Obliterate there is a 33% chance that the Frost and Unholy Runes will become Death Runes when they activate.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Whenever you hit with Death Strike or Obliterate there is a 33% chance that the Frost and Unholy Runes will become Death Runes when they activate.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Whenever you hit with Death Strike or Obliterate there is a 33% chance that the Frost and Unholy Runes will become Death Runes when they activate.  Death Runes count as a Blood, Frost or Unholy Rune.",
  NULL,
  NULL
),

(48985, @locale_en,
  "Increases the health provided by Rune Tap by 33% and lowers its cooldown by 10 sec.",
  "Increases the health provided by Rune Tap by 33% and lowers its cooldown by 10 sec.",
  "Increases the health provided by Rune Tap by 33% and lowers its cooldown by 10 sec.",
  NULL,
  NULL
),

(49145, @locale_en,
  "You have a chance equal to your Parry chance of taking 15% less damage from a direct damage spell.",
  "You have a chance equal to your Parry chance of taking 15% less damage from a direct damage spell.",
  "You have a chance equal to your Parry chance of taking 15% less damage from a direct damage spell.",
  NULL,
  NULL
),

(49015, @locale_en,
  "Heals you for up to 2% of your maximum health whenever you kill a target that yields experience or honor.",
  "Heals you for up to 2% of your maximum health whenever you kill a target that yields experience or honor.",
  "Heals you for up to 2% of your maximum health whenever you kill a target that yields experience or honor.",
  NULL,
  NULL
),

(48977, @locale_en,
  "Increases the damage of Blood Strike by 5% and Heart Strike by 15%, and increases the damage of Blood Boil by 10%.",
  "Increases the damage of Blood Strike by 5% and Heart Strike by 15%, and increases the damage of Blood Boil by 10%.",
  "Increases the damage of Blood Strike by 5% and Heart Strike by 15%, and increases the damage of Blood Boil by 10%.",
  NULL,
  NULL
),

(49006, @locale_en,
  "Increases your total Strength by 2%, your Stamina by 1%, and your expertise by 2.",
  "Increases your total Strength by 2%, your Stamina by 1%, and your expertise by 2.",
  "Increases your total Strength by 2%, your Stamina by 1%, and your expertise by 2.",
  NULL,
  NULL
),

(49005, @locale_en,
  "Place a Mark of Blood on an enemy.  Whenever the marked enemy deals damage to a target, that target is healed for 4% of its maximum health.  Lasts for 20 sec or up to 20 hits.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48988, @locale_en,
  "Gives you a 1% bonus to physical damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to physical damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  "Gives you a 1% bonus to physical damage you deal for 30 sec after dealing a critical strike from a weapon swing, spell, or ability.  This effect stacks up to 3 times.",
  NULL,
  NULL
),

(53137, @locale_en,
  "Increases the attack power by 5% of party and raid members within 100 yards.  Also increases your total Strength by 1%.",
  "Increases the attack power by 5% of party and raid members within 100 yards.  Also increases your total Strength by 1%.",
  NULL,
  NULL,
  NULL
),

(49027, @locale_en,
  "Your weapon hits have a 3% chance to cause the target to spawn 2-4 Bloodworms.  Bloodworms attack your enemies, healing you as they do damage for 20 sec or until killed.",
  "Your weapon hits have a 3% chance to cause the target to spawn 2-4 Bloodworms.  Bloodworms attack your enemies, healing you as they do damage for 20 sec or until killed.",
  "Your weapon hits have a 3% chance to cause the target to spawn 2-4 Bloodworms.  Bloodworms attack your enemies, healing you as they do damage for 20 sec or until killed.",
  NULL,
  NULL
),

(49016, @locale_en,
  "Induces a friendly unit into a killing frenzy for 30 sec.  The target is Enraged, which increases their physical damage by 20%, but causes them to lose health equal to 1% of their maximum health every second.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50365, @locale_en,
  "While in Frost Presence or Unholy Presence, you retain 2% healing from Blood Presence, and healing done to you is increased by 5% in Blood Presence.",
  "While in Frost Presence or Unholy Presence, you retain 2% healing from Blood Presence, and healing done to you is increased by 5% in Blood Presence.",
  NULL,
  NULL,
  NULL
),

(62905, @locale_en,
  "Increases the damage of your Death Strike by 15%, increases its critical strike chance by 3%, and increases the healing granted by 25%.",
  "Increases the damage of your Death Strike by 15%, increases its critical strike chance by 3%, and increases the healing granted by 25%.",
  NULL,
  NULL,
  NULL
),

(49018, @locale_en,
  "Your Blood Strikes and Heart Strikes have a 5% chance to launch a free Death Coil at your target.",
  "Your Blood Strikes and Heart Strikes have a 5% chance to launch a free Death Coil at your target.",
  "Your Blood Strikes and Heart Strikes have a 5% chance to launch a free Death Coil at your target.",
  NULL,
  NULL
),

(55233, @locale_en,
  "Temporarily grants the Death Knight 15% of maximum health and increases the amount of health generated through spells and effects by 35% for 10 sec.  After the effect expires, the health is lost.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49189, @locale_en,
  "Damage that would take you below 35% health or taken while you are at 35% health is reduced by 5%.",
  "Damage that would take you below 35% health or taken while you are at 35% health is reduced by 5%.",
  "Damage that would take you below 35% health or taken while you are at 35% health is reduced by 5%.",
  NULL,
  NULL
),

(55050, @locale_en,
  "Instantly strike the target and his nearest ally, causing 50% weapon damage plus 125 on the primary target, and 25% weapon damage plus 63 on the secondary target.  Each target takes 10% additional damage for each of your diseases active on that target<!--sp58616:0-->.<!--sp58616-->",
  NULL,
  NULL,
  NULL,
  NULL
),

(49023, @locale_en,
  "Increases the critical strike damage bonus of your Blood Boil, Blood Strike, Death Strike, and Heart Strike abilities by 15%.",
  "Increases the critical strike damage bonus of your Blood Boil, Blood Strike, Death Strike, and Heart Strike abilities by 15%.",
  "Increases the critical strike damage bonus of your Blood Boil, Blood Strike, Death Strike, and Heart Strike abilities by 15%.",
  NULL,
  NULL
),

(61154, @locale_en,
  "When you are above 75% health, you deal 2% more damage.  In addition, your attacks ignore up to 2% of your opponent's armor at all times.",
  "When you are above 75% health, you deal 2% more damage.  In addition, your attacks ignore up to 2% of your opponent's armor at all times.",
  "When you are above 75% health, you deal 2% more damage.  In addition, your attacks ignore up to 2% of your opponent's armor at all times.",
  "When you are above 75% health, you deal 2% more damage.  In addition, your attacks ignore up to 2% of your opponent's armor at all times.",
  "When you are above 75% health, you deal 2% more damage.  In addition, your attacks ignore up to 2% of your opponent's armor at all times."
),

(49028, @locale_en,
  "Summons a second rune weapon that fights on its own for 12 sec, doing the same attacks as the Death Knight but for 50% reduced damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49175, @locale_en,
  "Your Icy Touch does an additional 5% damage and your Frost Fever reduces melee and ranged attack speed by an additional 2%.",
  "Your Icy Touch does an additional 5% damage and your Frost Fever reduces melee and ranged attack speed by an additional 2%.",
  "Your Icy Touch does an additional 5% damage and your Frost Fever reduces melee and ranged attack speed by an additional 2%.",
  NULL,
  NULL
),

(49455, @locale_en,
  "Increases your maximum Runic Power by 15.",
  "Increases your maximum Runic Power by 15.",
  NULL,
  NULL,
  NULL
),

(49042, @locale_en,
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%.",
  "Increases your armor value from items by 2% and reduces the duration of all movement slowing effects by 6%."
),

(55061, @locale_en,
  "Increases the range of your Icy Touch,  Chains of Ice and Howling Blast by 5 yards.",
  "Increases the range of your Icy Touch,  Chains of Ice and Howling Blast by 5 yards.",
  NULL,
  NULL,
  NULL
),

(49140, @locale_en,
  "Increases your Frost and Shadow damage by 2%.",
  "Increases your Frost and Shadow damage by 2%.",
  "Increases your Frost and Shadow damage by 2%.",
  "Increases your Frost and Shadow damage by 2%.",
  "Increases your Frost and Shadow damage by 2%."
),

(49226, @locale_en,
  "Increases your chance to hit with one-handed melee weapons by 1% and increases the damage done by your offhand weapon by 8%.",
  "Increases your chance to hit with one-handed melee weapons by 1% and increases the damage done by your offhand weapon by 8%.",
  "Increases your chance to hit with one-handed melee weapons by 1% and increases the damage done by your offhand weapon by 8%.",
  NULL,
  NULL
),

(50880, @locale_en,
  "You leech heat from victims of your Frost Fever, so that when their melee attack speed is reduced, yours increases by 4% for the next 20 sec.",
  "You leech heat from victims of your Frost Fever, so that when their melee attack speed is reduced, yours increases by 4% for the next 20 sec.",
  "You leech heat from victims of your Frost Fever, so that when their melee attack speed is reduced, yours increases by 4% for the next 20 sec.",
  "You leech heat from victims of your Frost Fever, so that when their melee attack speed is reduced, yours increases by 4% for the next 20 sec.",
  "You leech heat from victims of your Frost Fever, so that when their melee attack speed is reduced, yours increases by 4% for the next 20 sec."
),

(49039, @locale_en,
  "Draw upon unholy energy to become undead for 10 sec.  While undead, you are immune to Charm, Fear and Sleep effects.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51468, @locale_en,
  "Increases the critical strike chance of your melee special abilities by 1%.  In addition, there is a 33% chance that your Obliterate will do its damage without consuming diseases.",
  "Increases the critical strike chance of your melee special abilities by 1%.  In addition, there is a 33% chance that your Obliterate will do its damage without consuming diseases.",
  "Increases the critical strike chance of your melee special abilities by 1%.  In addition, there is a 33% chance that your Obliterate will do its damage without consuming diseases.",
  NULL,
  NULL
),

(51123, @locale_en,
  "Your melee attacks have a chance to make your next Icy Touch, Howling Blast or Frost Strike a critical strike.",
  "Your melee attacks have a chance to make your next Icy Touch, Howling Blast or Frost Strike a critical strike.",
  "Your melee attacks have a chance to make your next Icy Touch, Howling Blast or Frost Strike a critical strike.",
  "Your melee attacks have a chance to make your next Icy Touch, Howling Blast or Frost Strike a critical strike.",
  "Your melee attacks have a chance to make your next Icy Touch, Howling Blast or Frost Strike a critical strike."
),

(49149, @locale_en,
  "Your Chains of Ice, Howling Blast, Icy Touch and Obliterate generate 2.5 additional runic power.",
  "Your Chains of Ice, Howling Blast, Icy Touch and Obliterate generate 2.5 additional runic power.",
  NULL,
  NULL,
  NULL
),

(49137, @locale_en,
  "Your strength is increased by 2% and the cost of your Mind Freeze is reduced to 10 runic power.",
  "Your strength is increased by 2% and the cost of your Mind Freeze is reduced to 10 runic power.",
  NULL,
  NULL,
  NULL
),

(49186, @locale_en,
  "Reduces the chance melee attacks will hit you by 1%.",
  "Reduces the chance melee attacks will hit you by 1%.",
  "Reduces the chance melee attacks will hit you by 1%.",
  NULL,
  NULL
),

(49471, @locale_en,
  "Diseased enemies take 7% more damage from your Icy Touch, Howling Blast and Frost Strike.",
  "Diseased enemies take 7% more damage from your Icy Touch, Howling Blast and Frost Strike.",
  "Diseased enemies take 7% more damage from your Icy Touch, Howling Blast and Frost Strike.",
  NULL,
  NULL
),

(49796, @locale_en,
  "When activated, makes your next Icy Touch, Howling Blast, Frost Strike or Obliterate a critical hit if used within 30 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(55610, @locale_en,
  "Increases the melee haste of all party and raid members within 100 yds by 20% and your haste by an additional 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49024, @locale_en,
  "Your Icy Touch, Howling Blast, Obliterate and Frost Strike do an additional 6% damage when striking targets with less than 35% health.",
  "Your Icy Touch, Howling Blast, Obliterate and Frost Strike do an additional 6% damage when striking targets with less than 35% health.",
  NULL,
  NULL,
  NULL
),

(49188, @locale_en,
  "Increases the critical strike chance of your Icy Touch and Obliterate by 5% and casting Obliterate has a 5% chance to reset the cooldown on Howling Blast and cause your next Howling Blast to consume no runes.",
  "Increases the critical strike chance of your Icy Touch and Obliterate by 5% and casting Obliterate has a 5% chance to reset the cooldown on Howling Blast and cause your next Howling Blast to consume no runes.",
  "Increases the critical strike chance of your Icy Touch and Obliterate by 5% and casting Obliterate has a 5% chance to reset the cooldown on Howling Blast and cause your next Howling Blast to consume no runes.",
  NULL,
  NULL
),

(50040, @locale_en,
  "Victims of your Frost Fever disease are Chilled, reducing movement speed by 15% for 10 sec.",
  "Victims of your Frost Fever disease are Chilled, reducing movement speed by 15% for 10 sec.",
  "Victims of your Frost Fever disease are Chilled, reducing movement speed by 15% for 10 sec.",
  NULL,
  NULL
),

(49203, @locale_en,
  "Purges the earth around the Death Knight of all heat.  Enemies within 10 yards are trapped in ice, preventing them from performing any action for 10 sec and infecting them with Frost Fever.  Enemies are considered Frozen, but any damage other than diseases will break the ice.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50384, @locale_en,
  "While in Blood Presence or Unholy Presence, you retain 4% stamina from Frost Presence, and damage done to you is decreased by an additional 1% in Frost Presence.",
  "While in Blood Presence or Unholy Presence, you retain 4% stamina from Frost Presence, and damage done to you is decreased by an additional 1% in Frost Presence.",
  NULL,
  NULL,
  NULL
),

(65661, @locale_en,
  "When dual-wielding, your Death Strikes, Obliterates, Plague Strikes, Rune Strikes, Blood Strikes and Frost Strikes have a 30% chance to also deal damage with your offhand weapon.",
  "When dual-wielding, your Death Strikes, Obliterates, Plague Strikes, Rune Strikes, Blood Strikes and Frost Strikes have a 30% chance to also deal damage with your offhand weapon.",
  "When dual-wielding, your Death Strikes, Obliterates, Plague Strikes, Rune Strikes, Blood Strikes and Frost Strikes have a 30% chance to also deal damage with your offhand weapon.",
  NULL,
  NULL
),

(54639, @locale_en,
  "Increases Blood Strike and Frost Strike damage by 3%.  In addition, whenever you hit with Blood Strike or Pestilence there is a 30% chance that the Blood Rune will become a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Increases Blood Strike and Frost Strike damage by 3%.  In addition, whenever you hit with Blood Strike or Pestilence there is a 30% chance that the Blood Rune will become a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Increases Blood Strike and Frost Strike damage by 3%.  In addition, whenever you hit with Blood Strike or Pestilence there is a 30% chance that the Blood Rune will become a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  NULL,
  NULL
),

(51271, @locale_en,
  "Reinforces your armor with a thick coat of ice, increasing your armor by 25% and increasing your Strength by 20% for 20 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49200, @locale_en,
  "When you are hit by a spell, you have a 10% chance to boost your resistance to that type of magic for 18 sec.  Stacks up to 3 times.",
  "When you are hit by a spell, you have a 10% chance to boost your resistance to that type of magic for 18 sec.  Stacks up to 3 times.",
  "When you are hit by a spell, you have a 10% chance to boost your resistance to that type of magic for 18 sec.  Stacks up to 3 times.",
  NULL,
  NULL
),

(49143, @locale_en,
  "Instantly strike the enemy, causing 55% weapon damage plus 48 as Frost damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50187, @locale_en,
  "Increases the critical strike damage bonus of your Blood Strike, Frost Strike, Howling Blast and Obliterate abilities by 15%, and increases the duration of your Icebound Fortitude by 2 secs.",
  "Increases the critical strike damage bonus of your Blood Strike, Frost Strike, Howling Blast and Obliterate abilities by 15%, and increases the duration of your Icebound Fortitude by 2 secs.",
  "Increases the critical strike damage bonus of your Blood Strike, Frost Strike, Howling Blast and Obliterate abilities by 15%, and increases the duration of your Icebound Fortitude by 2 secs.",
  NULL,
  NULL
),

(49202, @locale_en,
  "Your spells and abilities deal 3% more damage to targets infected with Frost Fever.  Also increases your expertise by 1.",
  "Your spells and abilities deal 3% more damage to targets infected with Frost Fever.  Also increases your expertise by 1.",
  "Your spells and abilities deal 3% more damage to targets infected with Frost Fever.  Also increases your expertise by 1.",
  "Your spells and abilities deal 3% more damage to targets infected with Frost Fever.  Also increases your expertise by 1.",
  "Your spells and abilities deal 3% more damage to targets infected with Frost Fever.  Also increases your expertise by 1."
),

(49184, @locale_en,
  "Blast the target with a frigid wind dealing 198 to 214 Frost damage to all enemies within 10 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51745, @locale_en,
  "Increases the critical strike chance by 3% and critical strike damage bonus by 15% of your Plague Strike and Scourge Strike.",
  "Increases the critical strike chance by 3% and critical strike damage bonus by 15% of your Plague Strike and Scourge Strike.",
  NULL,
  NULL,
  NULL
),

(48962, @locale_en,
  "Increases your chance to hit with your spells by 1% and reduces the chance that your damage over time diseases can be cured by 10%.",
  "Increases your chance to hit with your spells by 1% and reduces the chance that your damage over time diseases can be cured by 10%.",
  "Increases your chance to hit with your spells by 1% and reduces the chance that your damage over time diseases can be cured by 10%.",
  NULL,
  NULL
),

(55129, @locale_en,
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%.",
  "Increases your Dodge chance by 1%."
),

(49036, @locale_en,
  "Increases the duration of Blood Plague and Frost Fever by 3 sec.",
  "Increases the duration of Blood Plague and Frost Fever by 3 sec.",
  NULL,
  NULL,
  NULL
),

(48963, @locale_en,
  "Increases the damage and healing of Death Coil by 5% and reduces the cooldown on Death and Decay by 5 sec.",
  "Increases the damage and healing of Death Coil by 5% and reduces the cooldown on Death and Decay by 5 sec.",
  "Increases the damage and healing of Death Coil by 5% and reduces the cooldown on Death and Decay by 5 sec.",
  NULL,
  NULL
),

(49588, @locale_en,
  "Reduces the cooldown of your Death Grip ability by 5 sec.",
  "Reduces the cooldown of your Death Grip ability by 5 sec.",
  NULL,
  NULL,
  NULL
),

(48965, @locale_en,
  "Increases your total Strength by 1% and the contribution your Ghouls get from your Strength and Stamina by 20%.",
  "Increases your total Strength by 1% and the contribution your Ghouls get from your Strength and Stamina by 20%.",
  "Increases your total Strength by 1% and the contribution your Ghouls get from your Strength and Stamina by 20%.",
  NULL,
  NULL
),

(49013, @locale_en,
  "Increases the damage of Plague Strike by 10% and Scourge Strike by 7%.",
  "Increases the damage of Plague Strike by 10% and Scourge Strike by 7%.",
  "Increases the damage of Plague Strike by 10% and Scourge Strike by 7%.",
  NULL,
  NULL
),

(51459, @locale_en,
  "Your auto attacks deal an additional 4% Shadow damage.",
  "Your auto attacks deal an additional 4% Shadow damage.",
  "Your auto attacks deal an additional 4% Shadow damage.",
  "Your auto attacks deal an additional 4% Shadow damage.",
  "Your auto attacks deal an additional 4% Shadow damage."
),

(49158, @locale_en,
  "Cause a corpse to explode for 166 Shadow damage to all enemies within 10 yards.  Will use a nearby corpse if the target is not a corpse.  Does not affect mechanical or elemental corpses.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49146, @locale_en,
  "You become as hard to stop as death itself.  The duration of all Stun and Fear effects used against you is reduced by 10%, and your mounted speed is increased by 10%.  This does not stack with other movement speed increasing effects.",
  "You become as hard to stop as death itself.  The duration of all Stun and Fear effects used against you is reduced by 10%, and your mounted speed is increased by 10%.  This does not stack with other movement speed increasing effects.",
  NULL,
  NULL,
  NULL
),

(49219, @locale_en,
  "Your auto attacks have a 10% chance to cause a Blood-Caked Strike, which hits for 25% weapon damage plus 12.5% for each of your diseases on the target.",
  "Your auto attacks have a 10% chance to cause a Blood-Caked Strike, which hits for 25% weapon damage plus 12.5% for each of your diseases on the target.",
  "Your auto attacks have a 10% chance to cause a Blood-Caked Strike, which hits for 25% weapon damage plus 12.5% for each of your diseases on the target.",
  NULL,
  NULL
),

(55620, @locale_en,
  "Reduces the cooldown on Raise Dead by 45 sec and the cooldown on Army of the Dead by 2 min.  Also reduces the damage your pet takes from creature area of effect attacks by 45%.",
  "Reduces the cooldown on Raise Dead by 45 sec and the cooldown on Army of the Dead by 2 min.  Also reduces the damage your pet takes from creature area of effect attacks by 45%.",
  NULL,
  NULL,
  NULL
),

(49194, @locale_en,
  "Causes the victims of your Death Coil to be surrounded by a vile swarm of unholy insects, taking 10% of the damage done by the Death Coil over 10 sec, and preventing any diseases on the victim from being dispelled.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49220, @locale_en,
  "The attack power bonus of your spells is increased by 4%.",
  "The attack power bonus of your spells is increased by 4%.",
  "The attack power bonus of your spells is increased by 4%.",
  "The attack power bonus of your spells is increased by 4%.",
  "The attack power bonus of your spells is increased by 4%."
),

(49223, @locale_en,
  "Your Death Strike, Plague Strike and Scourge Strike generate 2.5 additional runic power.",
  "Your Death Strike, Plague Strike and Scourge Strike generate 2.5 additional runic power.",
  NULL,
  NULL,
  NULL
),

(55666, @locale_en,
  "Your Plague Strikes and Scourge Strikes cause the Desecrated Ground effect.  Targets in the area are slowed by 25% by the grasping arms of the dead while standing on the unholy ground.  Lasts 20 sec.",
  "Your Plague Strikes and Scourge Strikes cause the Desecrated Ground effect.  Targets in the area are slowed by 25% by the grasping arms of the dead while standing on the unholy ground.  Lasts 20 sec.",
  NULL,
  NULL,
  NULL
),

(49224, @locale_en,
  "You take 2% less damage from all magic.  In addition, your Anti-Magic Shell absorbs an additional 8% of spell damage.",
  "You take 2% less damage from all magic.  In addition, your Anti-Magic Shell absorbs an additional 8% of spell damage.",
  "You take 2% less damage from all magic.  In addition, your Anti-Magic Shell absorbs an additional 8% of spell damage.",
  NULL,
  NULL
),

(49208, @locale_en,
  "Whenever you hit with Blood Strike or Pestilence there is a 33% chance that the Blood Rune becomes a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Whenever you hit with Blood Strike or Pestilence there is a 33% chance that the Blood Rune becomes a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  "Whenever you hit with Blood Strike or Pestilence there is a 33% chance that the Blood Rune becomes a Death Rune when it activates.  Death Runes count as a Blood, Frost or Unholy Rune.",
  NULL,
  NULL
),

(52143, @locale_en,
  "Reduces the cooldown on Raise Dead by 60 sec, and the Ghoul summoned by your Raise Dead spell is considered a pet under your control.  Unlike normal Death Knight Ghouls, your pet does not have a limited duration.",
  NULL,
  NULL,
  NULL,
  NULL
),

(66799, @locale_en,
  "Your Blood Strikes cause you to deal 1% additional damage with all attacks for the next 20 sec.",
  "Your Blood Strikes cause you to deal 1% additional damage with all attacks for the next 20 sec.",
  "Your Blood Strikes cause you to deal 1% additional damage with all attacks for the next 20 sec.",
  "Your Blood Strikes cause you to deal 1% additional damage with all attacks for the next 20 sec.",
  "Your Blood Strikes cause you to deal 1% additional damage with all attacks for the next 20 sec."
),

(51052, @locale_en,
  "Places a large, stationary Anti-Magic Zone that reduces spell damage done to party or raid members inside it by 75%.  The Anti-Magic Zone lasts for 10 sec or until it absorbs 10000+2*AP spell damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50391, @locale_en,
  "While in Blood Presence or Frost Presence, you retain 8% increased movement speed from Unholy Presence, and your runes finish their cooldowns 5% faster in Unholy Presence.",
  "While in Blood Presence or Frost Presence, you retain 8% increased movement speed from Unholy Presence, and your runes finish their cooldowns 5% faster in Unholy Presence.",
  NULL,
  NULL,
  NULL
),

(63560, @locale_en,
  "Grants your pet 25% haste for 30 sec and  heals it for 60% of its health over the duration.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49032, @locale_en,
  "Your diseases also cause Crypt Fever, which increases disease damage taken by the target by 10%.",
  "Your diseases also cause Crypt Fever, which increases disease damage taken by the target by 10%.",
  "Your diseases also cause Crypt Fever, which increases disease damage taken by the target by 10%.",
  NULL,
  NULL
),

(49222, @locale_en,
  "The Death Knight is surrounded by 3 whirling bones.  While at least 1 bone remains, &lt;he/she&gt; takes 20% less damage from all sources and deals 2% more damage with all attacks, spells and abilities.  Each damaging attack that lands consumes 1 bone.  Lasts 5 min.",
  NULL,
  NULL,
  NULL,
  NULL
),

(49217, @locale_en,
  "When your diseases damage an enemy, there is a chance equal to your melee critical strike chance that they will cause 33% additional damage to the target and all enemies within 8 yards.  Ignores any target under the effect of a spell that is cancelled by taking damage.",
  "When your diseases damage an enemy, there is a chance equal to your melee critical strike chance that they will cause 33% additional damage to the target and all enemies within 8 yards.  Ignores any target under the effect of a spell that is cancelled by taking damage.",
  "When your diseases damage an enemy, there is a chance equal to your melee critical strike chance that they will cause 33% additional damage to the target and all enemies within 8 yards.  Ignores any target under the effect of a spell that is cancelled by taking damage.",
  NULL,
  NULL
),

(51099, @locale_en,
  "Your Crypt Fever morphs into Ebon Plague, which increases magic damage taken by 4% in addition to increasing disease damage taken.  Improves your critical strike chance with weapons and spells by 1% at all times.",
  "Your Crypt Fever morphs into Ebon Plague, which increases magic damage taken by 4% in addition to increasing disease damage taken.  Improves your critical strike chance with weapons and spells by 1% at all times.",
  "Your Crypt Fever morphs into Ebon Plague, which increases magic damage taken by 4% in addition to increasing disease damage taken.  Improves your critical strike chance with weapons and spells by 1% at all times.",
  NULL,
  NULL
),

(55090, @locale_en,
  "An unholy strike that deals 70% of weapon damage as Physical damage plus 238.  In addition, for each of your diseases on your target, you deal an additional 12% of the Physical damage done as Shadow damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50117, @locale_en,
  "Your spells and abilities deal 2% more damage to targets infected with Blood Plague.  Also increases your expertise by 1.",
  "Your spells and abilities deal 2% more damage to targets infected with Blood Plague.  Also increases your expertise by 1.",
  "Your spells and abilities deal 2% more damage to targets infected with Blood Plague.  Also increases your expertise by 1.",
  "Your spells and abilities deal 2% more damage to targets infected with Blood Plague.  Also increases your expertise by 1.",
  "Your spells and abilities deal 2% more damage to targets infected with Blood Plague.  Also increases your expertise by 1."
),

(49206, @locale_en,
  "A Gargoyle flies into the area and bombards the target with Nature damage modified by the Death Knight's attack power.  Persists for 30 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- shaman
(16039, @locale_en,
  "Reduces the mana cost of your Shock, Lightning Bolt, Chain Lightning, Lava Burst, and Wind Shear spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt, Chain Lightning, Lava Burst, and Wind Shear spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt, Chain Lightning, Lava Burst, and Wind Shear spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt, Chain Lightning, Lava Burst, and Wind Shear spells by 2%.",
  "Reduces the mana cost of your Shock, Lightning Bolt, Chain Lightning, Lava Burst, and Wind Shear spells by 2%."
),

(16035, @locale_en,
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Thunderstorm, Lava Burst and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Thunderstorm, Lava Burst and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Thunderstorm, Lava Burst and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Thunderstorm, Lava Burst and Shock spells by 1%.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Thunderstorm, Lava Burst and Shock spells by 1%."
),

(16038, @locale_en,
  "Increases the damage done by your Fire Totems and Fire Nova by 5%, and damage done by your Lava Burst spell by 2%.",
  "Increases the damage done by your Fire Totems and Fire Nova by 5%, and damage done by your Lava Burst spell by 2%.",
  "Increases the damage done by your Fire Totems and Fire Nova by 5%, and damage done by your Lava Burst spell by 2%.",
  NULL,
  NULL
),

(28996, @locale_en,
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  NULL,
  NULL
),

(30160, @locale_en,
  "Your non-periodic offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10 sec.",
  "Your non-periodic offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10 sec.",
  "Your non-periodic offensive spell crits will increase your chance to get a critical strike with melee attacks by 3% for 10 sec.",
  NULL,
  NULL
),

(16040, @locale_en,
  "Reduces the cooldown of your Shock spells and Wind Shear by 0.2 sec.",
  "Reduces the cooldown of your Shock spells and Wind Shear by 0.2 sec.",
  "Reduces the cooldown of your Shock spells and Wind Shear by 0.2 sec.",
  "Reduces the cooldown of your Shock spells and Wind Shear by 0.2 sec.",
  "Reduces the cooldown of your Shock spells and Wind Shear by 0.2 sec."
),

(16164, @locale_en,
  "After landing a non-periodic critical strike with a Fire, Frost, or Nature damage spell, you enter a Clearcasting state.  The Clearcasting state reduces the mana cost of your next 2 damage or healing spells by 40%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16089, @locale_en,
  "Increases the critical strike damage bonus of your Searing and Magma Totems and your Fire, Frost, and Nature spells by 20%.",
  "Increases the critical strike damage bonus of your Searing and Magma Totems and your Fire, Frost, and Nature spells by 20%.",
  "Increases the critical strike damage bonus of your Searing and Magma Totems and your Fire, Frost, and Nature spells by 20%.",
  "Increases the critical strike damage bonus of your Searing and Magma Totems and your Fire, Frost, and Nature spells by 20%.",
  "Increases the critical strike damage bonus of your Searing and Magma Totems and your Fire, Frost, and Nature spells by 20%."
),

(16086, @locale_en,
  "Increases the damage done by your Fire Nova by 10% and reduces the cooldown by 2 sec.",
  "Increases the damage done by your Fire Nova by 10% and reduces the cooldown by 2 sec.",
  NULL,
  NULL,
  NULL
),

(29062, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Lightning Bolt, Chain Lightning, Lava Burst and Hex spells by 23%.",
  "Reduces the pushback suffered from damaging attacks while casting Lightning Bolt, Chain Lightning, Lava Burst and Hex spells by 23%.",
  "Reduces the pushback suffered from damaging attacks while casting Lightning Bolt, Chain Lightning, Lava Burst and Hex spells by 23%.",
  NULL,
  NULL
),

(28999, @locale_en,
  "Increases the range of your Lightning Bolt, Chain Lightning, Fire Nova, and Lava Burst spells by 3 yards, increases the radius of your Thunderstorm spell by 10%, and increases the range of your Flame Shock by 7 yards.",
  "Increases the range of your Lightning Bolt, Chain Lightning, Fire Nova, and Lava Burst spells by 3 yards, increases the radius of your Thunderstorm spell by 10%, and increases the range of your Flame Shock by 7 yards.",
  NULL,
  NULL,
  NULL
),

(16041, @locale_en,
  "Increases the critical strike chance of your Lightning Bolt, Chain Lightning and Thunderstorm spells by an additional 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30664, @locale_en,
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  "Regenerate mana equal to 4% of your Intellect every 5 sec, even while casting.",
  NULL,
  NULL
),

(30672, @locale_en,
  "Increases your chance to hit with Fire, Frost and Nature spells by 1% and reduces the threat caused by Fire, Frost and Nature spells by 10%.",
  "Increases your chance to hit with Fire, Frost and Nature spells by 1% and reduces the threat caused by Fire, Frost and Nature spells by 10%.",
  "Increases your chance to hit with Fire, Frost and Nature spells by 1% and reduces the threat caused by Fire, Frost and Nature spells by 10%.",
  NULL,
  NULL
),

(16578, @locale_en,
  "Reduces the cast time of your Lightning Bolt, Chain Lightning, and Lava Burst spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt, Chain Lightning, and Lava Burst spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt, Chain Lightning, and Lava Burst spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt, Chain Lightning, and Lava Burst spells by 0.1 sec.",
  "Reduces the cast time of your Lightning Bolt, Chain Lightning, and Lava Burst spells by 0.1 sec."
),

(16166, @locale_en,
  "When activated, your next Lightning Bolt, Chain Lightning or Lava Burst spell becomes an instant cast spell. In addition, you gain 15% spell haste for 15 sec. Elemental Mastery shares a cooldown with Nature's Swiftness.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51483, @locale_en,
  "Reduces the cooldown of your Chain Lightning spell by .75 sec, your Earthbind Totem also has a 33% chance to root targets for 5 sec when cast and the periodic damage done by your Flame Shock is increased by 20%.",
  "Reduces the cooldown of your Chain Lightning spell by .75 sec, your Earthbind Totem also has a 33% chance to root targets for 5 sec when cast and the periodic damage done by your Flame Shock is increased by 20%.",
  "Reduces the cooldown of your Chain Lightning spell by .75 sec, your Earthbind Totem also has a 33% chance to root targets for 5 sec when cast and the periodic damage done by your Flame Shock is increased by 20%.",
  NULL,
  NULL
),

(63370, @locale_en,
  "Reduces the cooldown of your Flame Shock and Frost Shock spells by an additional 1 sec., and increases the direct damage done by your Flame Shock and Frost Shock spells by an additional 10%.",
  "Reduces the cooldown of your Flame Shock and Frost Shock spells by an additional 1 sec., and increases the direct damage done by your Flame Shock and Frost Shock spells by an additional 10%.",
  NULL,
  NULL,
  NULL
),

(51466, @locale_en,
  "While Clearcasting from Elemental Focus is active, you deal 5% more spell damage. In addition, party and raid members within 100 yards receive a 3% bonus to their spell critical strike chance.",
  "While Clearcasting from Elemental Focus is active, you deal 5% more spell damage. In addition, party and raid members within 100 yards receive a 3% bonus to their spell critical strike chance.",
  NULL,
  NULL,
  NULL
),

(30675, @locale_en,
  "Gives your Lightning Bolt and Chain Lightning spells a 11% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 11% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  "Gives your Lightning Bolt and Chain Lightning spells a 11% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
  NULL,
  NULL
),

(51474, @locale_en,
  "When stunned, feared or silenced you  shift into the Astral Plane reducing all damage taken by 10% for the duration of the stun, fear or silence effect.",
  "When stunned, feared or silenced you  shift into the Astral Plane reducing all damage taken by 10% for the duration of the stun, fear or silence effect.",
  "When stunned, feared or silenced you  shift into the Astral Plane reducing all damage taken by 10% for the duration of the stun, fear or silence effect.",
  NULL,
  NULL
),

(30706, @locale_en,
  "Summons a Totem of Wrath with 5 health at the feet of the caster.  The totem increases spell power by 100 for all party and raid members, and increases the critical strike chance of all attacks by 3% against all enemies within 40 yards.  Lasts 5 min.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51480, @locale_en,
  "Increases the critical strike damage bonus of your Lava Burst spell by an additional 6%, and when your Flame Shock is dispelled your spell casting speed is increased by 10% for 6 sec.",
  "Increases the critical strike damage bonus of your Lava Burst spell by an additional 6%, and when your Flame Shock is dispelled your spell casting speed is increased by 10% for 6 sec.",
  "Increases the critical strike damage bonus of your Lava Burst spell by an additional 6%, and when your Flame Shock is dispelled your spell casting speed is increased by 10% for 6 sec.",
  NULL,
  NULL
),

(62097, @locale_en,
  "Your Lightning Bolt and Chain Lightning spells gain an additional 4% and your Lava Burst gains an additional 5% of your bonus damage effects.",
  "Your Lightning Bolt and Chain Lightning spells gain an additional 4% and your Lava Burst gains an additional 5% of your bonus damage effects.",
  "Your Lightning Bolt and Chain Lightning spells gain an additional 4% and your Lava Burst gains an additional 5% of your bonus damage effects.",
  "Your Lightning Bolt and Chain Lightning spells gain an additional 4% and your Lava Burst gains an additional 5% of your bonus damage effects.",
  "Your Lightning Bolt and Chain Lightning spells gain an additional 4% and your Lava Burst gains an additional 5% of your bonus damage effects."
),

(51490, @locale_en,
  "You call down a bolt of lightning, energizing you and damaging nearby enemies within 10 yards. Restores 8% mana to you and deals 551 to 629 Nature damage to all nearby enemies, knocking them back 20 yards. This spell is usable while stunned.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16259, @locale_en,
  "Increases the effect of your Strength of Earth and Flametongue Totems by 5%.",
  "Increases the effect of your Strength of Earth and Flametongue Totems by 5%.",
  "Increases the effect of your Strength of Earth and Flametongue Totems by 5%.",
  NULL,
  NULL
),

(16043, @locale_en,
  "Increases the health of your Stoneclaw Totem by 25% and the radius of your Earthbind Totem by 10%, and reduces the cooldown of both totems by 15%.",
  "Increases the health of your Stoneclaw Totem by 25% and the radius of your Earthbind Totem by 10%, and reduces the cooldown of both totems by 15%.",
  NULL,
  NULL,
  NULL
),

(17485, @locale_en,
  "Increases your Intellect by 2%.",
  "Increases your Intellect by 2%.",
  "Increases your Intellect by 2%.",
  "Increases your Intellect by 2%.",
  "Increases your Intellect by 2%."
),

(16258, @locale_en,
  "Increases the amount of armor increased by your Stoneskin Totem by 10% and reduces the cooldown of your Grounding Totem by 1 sec.",
  "Increases the amount of armor increased by your Stoneskin Totem by 10% and reduces the cooldown of your Grounding Totem by 1 sec.",
  NULL,
  NULL,
  NULL
),

(16255, @locale_en,
  "Improves your chance to get a critical strike with all spells and attacks by 1%.",
  "Improves your chance to get a critical strike with all spells and attacks by 1%.",
  "Improves your chance to get a critical strike with all spells and attacks by 1%.",
  "Improves your chance to get a critical strike with all spells and attacks by 1%.",
  "Improves your chance to get a critical strike with all spells and attacks by 1%."
),

(16262, @locale_en,
  "Reduces the cast time of your Ghost Wolf spell by 1 sec.",
  "Reduces the cast time of your Ghost Wolf spell by 1 sec.",
  NULL,
  NULL,
  NULL
),

(16261, @locale_en,
  "Increases the damage done by your Lightning Shield orbs by 5%, increases the amount of mana gained from your Water Shield orbs by 5% and increases the amount of healing done by your Earth Shield orbs by 5%.",
  "Increases the damage done by your Lightning Shield orbs by 5%, increases the amount of mana gained from your Water Shield orbs by 5% and increases the amount of healing done by your Earth Shield orbs by 5%.",
  "Increases the damage done by your Lightning Shield orbs by 5%, increases the amount of mana gained from your Water Shield orbs by 5% and increases the amount of healing done by your Earth Shield orbs by 5%.",
  NULL,
  NULL
),

(16266, @locale_en,
  "Increases the damage caused by your Windfury Weapon effect by 13%  increases the spell damage on your Flametongue Weapon by 10% and increases the bonus healing on your Earthliving Weapon by 10%.",
  "Increases the damage caused by your Windfury Weapon effect by 13%  increases the spell damage on your Flametongue Weapon by 10% and increases the bonus healing on your Earthliving Weapon by 10%.",
  "Increases the damage caused by your Windfury Weapon effect by 13%  increases the spell damage on your Flametongue Weapon by 10% and increases the bonus healing on your Earthliving Weapon by 10%.",
  NULL,
  NULL
),

(43338, @locale_en,
  "Reduces the mana cost of your Shock spells by 45%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16254, @locale_en,
  "Increases your chance to dodge by an additional 1%, and reduces the duration of all Disarm effects used against you by 16%. This does not stack with other Disarm duration reducing effects.",
  "Increases your chance to dodge by an additional 1%, and reduces the duration of all Disarm effects used against you by 16%. This does not stack with other Disarm duration reducing effects.",
  "Increases your chance to dodge by an additional 1%, and reduces the duration of all Disarm effects used against you by 16%. This does not stack with other Disarm duration reducing effects.",
  NULL,
  NULL
),

(16256, @locale_en,
  "Increases your attack speed by 6% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 6% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 6% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 6% for your next 3 swings after dealing a critical strike.",
  "Increases your attack speed by 6% for your next 3 swings after dealing a critical strike."
),

(16252, @locale_en,
  "Increases your Stamina by 2%, and reduces the duration of movement slowing effects on you by 6%.",
  "Increases your Stamina by 2%, and reduces the duration of movement slowing effects on you by 6%.",
  "Increases your Stamina by 2%, and reduces the duration of movement slowing effects on you by 6%.",
  "Increases your Stamina by 2%, and reduces the duration of movement slowing effects on you by 6%.",
  "Increases your Stamina by 2%, and reduces the duration of movement slowing effects on you by 6%."
),

(29192, @locale_en,
  "Increases the melee haste granted by your Windfury totem by 2%.",
  "Increases the melee haste granted by your Windfury totem by 2%.",
  NULL,
  NULL,
  NULL
),

(16268, @locale_en,
  "Gives a chance to parry enemy melee attacks and reduces all threat generated by 30%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51883, @locale_en,
  "Increases your Attack Power by 33% of your Intellect.",
  "Increases your Attack Power by 33% of your Intellect.",
  "Increases your Attack Power by 33% of your Intellect.",
  NULL,
  NULL
),

(30802, @locale_en,
  "Increases your expertise by 3, and increases all party and raid members' attack power by 4% while within 100 yards of the Shaman.",
  "Increases your expertise by 3, and increases all party and raid members' attack power by 4% while within 100 yards of the Shaman.",
  "Increases your expertise by 3, and increases all party and raid members' attack power by 4% while within 100 yards of the Shaman.",
  NULL,
  NULL
),

(29082, @locale_en,
  "Increases the damage you deal with all weapons by 4%.",
  "Increases the damage you deal with all weapons by 4%.",
  "Increases the damage you deal with all weapons by 4%.",
  NULL,
  NULL
),

(63373, @locale_en,
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Lava Lash and Shock spells by 5% on targets afflicted by your Frostbrand Attack effect, and your Frost Shock has a 50% chance to root the target in ice for 5 sec. when used on targets at or further than 15 yards from you.",
  "Increases the damage done by your Lightning Bolt, Chain Lightning, Lava Lash and Shock spells by 5% on targets afflicted by your Frostbrand Attack effect, and your Frost Shock has a 50% chance to root the target in ice for 5 sec. when used on targets at or further than 15 yards from you.",
  NULL,
  NULL,
  NULL
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
  "Instantly attack with both weapons.  In addition, the next 4 sources of Nature damage dealt to the target from the Shaman are increased by 20%. Lasts 12 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51525, @locale_en,
  "You have a 2% chance to hit your target with a Lightning Shield orb charge when you deal damage with melee attacks and abilities, and your Lightning Shield gains 2 additional charges.",
  "You have a 2% chance to hit your target with a Lightning Shield orb charge when you deal damage with melee attacks and abilities, and your Lightning Shield gains 2 additional charges.",
  "You have a 2% chance to hit your target with a Lightning Shield orb charge when you deal damage with melee attacks and abilities, and your Lightning Shield gains 2 additional charges.",
  NULL,
  NULL
),

(60103, @locale_en,
  "You charge your off-hand weapon with lava, instantly dealing 100% off-hand Weapon damage. Damage is increased by 25% if your off-hand weapon is enchanted with Flametongue.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51521, @locale_en,
  "When you Stormstrike, you have a 50% chance to immediately grant you 20% of your base mana.",
  "When you Stormstrike, you have a 50% chance to immediately grant you 20% of your base mana.",
  NULL,
  NULL,
  NULL
),

(30812, @locale_en,
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell power by an amount equal to 10% of your attack power.",
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell power by an amount equal to 10% of your attack power.",
  "Reduces the mana cost of your instant cast Shaman spells by 2% and increases your spell power by an amount equal to 10% of your attack power.",
  NULL,
  NULL
),

(30823, @locale_en,
  "Reduces all damage taken by 30% and gives your successful melee attacks a chance to regenerate mana equal to 15% of your attack power. This spell is usable while stunned. Lasts 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51523, @locale_en,
  "Your Earthbind Totem's pulses have a 50% chance to also remove all snare effects from you and nearby friendly targets, and your Earth Shock reduces enemy attack speed by an additional 5%.",
  "Your Earthbind Totem's pulses have a 50% chance to also remove all snare effects from you and nearby friendly targets, and your Earth Shock reduces enemy attack speed by an additional 5%.",
  NULL,
  NULL,
  NULL
),

(51528, @locale_en,
  "When you deal damage with a melee weapon, you have a chance to reduce the cast time of your next Lightning Bolt, Chain Lightning, Lesser Healing Wave, Healing Wave, Chain Heal, or Hex spell by 20%. Stacks up to 5 times. Lasts 30 sec.",
  "When you deal damage with a melee weapon, you have a chance to reduce the cast time of your next Lightning Bolt, Chain Lightning, Lesser Healing Wave, Healing Wave, Chain Heal, or Hex spell by 20%. Stacks up to 5 times. Lasts 30 sec.",
  "When you deal damage with a melee weapon, you have a chance to reduce the cast time of your next Lightning Bolt, Chain Lightning, Lesser Healing Wave, Healing Wave, Chain Heal, or Hex spell by 20%. Stacks up to 5 times. Lasts 30 sec.",
  "When you deal damage with a melee weapon, you have a chance to reduce the cast time of your next Lightning Bolt, Chain Lightning, Lesser Healing Wave, Healing Wave, Chain Heal, or Hex spell by 20%. Stacks up to 5 times. Lasts 30 sec.",
  "When you deal damage with a melee weapon, you have a chance to reduce the cast time of your next Lightning Bolt, Chain Lightning, Lesser Healing Wave, Healing Wave, Chain Heal, or Hex spell by 20%. Stacks up to 5 times. Lasts 30 sec."
),

(51533, @locale_en,
  "Summons two Spirit Wolves under the command of the Shaman, lasting 45 sec.",
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

(16173, @locale_en,
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%.",
  "Reduces the mana cost of your totems by 5%."
),

(16184, @locale_en,
  "Reduces the cooldown of your Reincarnation spell by 7 min and increases the amount of health and mana recovered when reincarnating by an additional 10%.",
  "Reduces the cooldown of your Reincarnation spell by 7 min and increases the amount of health and mana recovered when reincarnating by an additional 10%.",
  NULL,
  NULL,
  NULL
),

(29187, @locale_en,
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  "Reduces the threat generated by your healing spells by 5% and reduces the chance your helpful spells and damage over time effects will be dispelled by 10%.",
  NULL,
  NULL
),

(16179, @locale_en,
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%.",
  "Reduces the mana cost of your healing spells by 1%."
),

(16180, @locale_en,
  "You have a 33% chance to instantly gain mana as if you consumed a Water Shield Orb when you gain a critical effect from your Healing Wave or Riptide spells, a 20% chance when you gain a critical effect from your Lesser Healing Wave spell, and a 10% chance when you gain a critical effect from your Chain Heal spell.",
  "You have a 33% chance to instantly gain mana as if you consumed a Water Shield Orb when you gain a critical effect from your Healing Wave or Riptide spells, a 20% chance when you gain a critical effect from your Lesser Healing Wave spell, and a 10% chance when you gain a critical effect from your Chain Heal spell.",
  "You have a 33% chance to instantly gain mana as if you consumed a Water Shield Orb when you gain a critical effect from your Healing Wave or Riptide spells, a 20% chance when you gain a critical effect from your Lesser Healing Wave spell, and a 10% chance when you gain a critical effect from your Chain Heal spell.",
  NULL,
  NULL
),

(16181, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting any Shaman healing spell by 23%.",
  "Reduces the pushback suffered from damaging attacks while casting any Shaman healing spell by 23%.",
  "Reduces the pushback suffered from damaging attacks while casting any Shaman healing spell by 23%.",
  NULL,
  NULL
),

(55198, @locale_en,
  "Increases the critical effect chance of your Healing Wave, Lesser Healing Wave and Chain Heal by 60%. Each critical heal reduces the chance by 20%. Lasts 20 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16176, @locale_en,
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from one of your healing spells.",
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from one of your healing spells.",
  "Reduces your target's physical damage taken by 3% for 15 sec after getting a critical effect from one of your healing spells.",
  NULL,
  NULL
),

(16187, @locale_en,
  "Increases the effect of your Mana Spring Totem by 7%, and increases the amount healed by your Healing Stream Totem by 15%.",
  "Increases the effect of your Mana Spring Totem by 7%, and increases the amount healed by your Healing Stream Totem by 15%.",
  "Increases the effect of your Mana Spring Totem by 7%, and increases the amount healed by your Healing Stream Totem by 15%.",
  NULL,
  NULL
),

(16194, @locale_en,
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%.",
  "Increases the critical effect chance of your healing and lightning spells by 1%."
),

(29206, @locale_en,
  "Increases the amount healed by your Healing Wave spell by 8%.",
  "Increases the amount healed by your Healing Wave spell by 8%.",
  "Increases the amount healed by your Healing Wave spell by 8%.",
  NULL,
  NULL
),

(16188, @locale_en,
  "When activated, your next Nature spell with a base casting time less than 10 sec. becomes an instant cast spell. Nature's Swiftness shares a cooldown with Elemental Mastery.",
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

(30881, @locale_en,
  "Whenever a damaging attack brings you below 30% health, your maximum health is increased by 3% for 10 sec and your threat level towards the attacker is reduced.  30 second cooldown.",
  "Whenever a damaging attack brings you below 30% health, your maximum health is increased by 3% for 10 sec and your threat level towards the attacker is reduced.  30 second cooldown.",
  "Whenever a damaging attack brings you below 30% health, your maximum health is increased by 3% for 10 sec and your threat level towards the attacker is reduced.  30 second cooldown.",
  "Whenever a damaging attack brings you below 30% health, your maximum health is increased by 3% for 10 sec and your threat level towards the attacker is reduced.  30 second cooldown.",
  "Whenever a damaging attack brings you below 30% health, your maximum health is increased by 3% for 10 sec and your threat level towards the attacker is reduced.  30 second cooldown."
),

(16190, @locale_en,
  "Summons a Mana Tide Totem with 10% of the caster's health at the feet of the caster for 12 sec that restores <!--sp55441:0-->6<!--sp55441-->% of total mana every 3 seconds to group members within 30 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51886, @locale_en,
  "Cleanse the spirit of a friendly target, removing 1 poison effect, 1 disease effect, and 1 curse effect.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51554, @locale_en,
  "Increases the critical effect chance of your spells by 2%, and increases the chance to apply the Earthliving heal over time effect on the target by 40% when they are at or under 35% total health.",
  "Increases the critical effect chance of your spells by 2%, and increases the chance to apply the Earthliving heal over time effect on the target by 40% when they are at or under 35% total health.",
  NULL,
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

(30867, @locale_en,
  "Increases your healing by an amount equal to 5% of your Intellect.",
  "Increases your healing by an amount equal to 5% of your Intellect.",
  "Increases your healing by an amount equal to 5% of your Intellect.",
  NULL,
  NULL
),

(51556, @locale_en,
  "When you critically heal with your Healing Wave, Lesser Healing Wave or Riptide you summon an Ancestral spirit to aid you, instantly healing the lowest percentage health friendly party or raid target within 40 yards for 10% of the amount healed.",
  "When you critically heal with your Healing Wave, Lesser Healing Wave or Riptide you summon an Ancestral spirit to aid you, instantly healing the lowest percentage health friendly party or raid target within 40 yards for 10% of the amount healed.",
  "When you critically heal with your Healing Wave, Lesser Healing Wave or Riptide you summon an Ancestral spirit to aid you, instantly healing the lowest percentage health friendly party or raid target within 40 yards for 10% of the amount healed.",
  NULL,
  NULL
),

(974, @locale_en,
  "Protects the target with an earthen shield, reducing casting or channeling time lost when damaged by 30%  and causing attacks to heal the shielded target for <!--sp63279:0-->150<!--sp63279-->.  This effect can only occur once every few seconds.  6 charges.  Lasts 10 min.  Earth Shield can only be placed on one target at a time and only one Elemental Shield can be active on a target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(51560, @locale_en,
  "Increases the amount of charges for your Earth Shield by 1, and increases the healing done by your Earth Shield by 5%.",
  "Increases the amount of charges for your Earth Shield by 1, and increases the healing done by your Earth Shield by 5%.",
  NULL,
  NULL,
  NULL
),

(51562, @locale_en,
  "When you cast Chain Heal or Riptide, you have a 20% chance to lower the cast time of your Healing Wave spell by 30% and increase the critical effect chance of your Lesser Healing Wave spell by 25%, until two such spells have been cast. In addition, your Healing Wave gains an additional 4% of your bonus healing effects and your Lesser Healing Wave gains an additional 2% of your bonus healing effects.",
  "When you cast Chain Heal or Riptide, you have a 20% chance to lower the cast time of your Healing Wave spell by 30% and increase the critical effect chance of your Lesser Healing Wave spell by 25%, until two such spells have been cast. In addition, your Healing Wave gains an additional 4% of your bonus healing effects and your Lesser Healing Wave gains an additional 2% of your bonus healing effects.",
  "When you cast Chain Heal or Riptide, you have a 20% chance to lower the cast time of your Healing Wave spell by 30% and increase the critical effect chance of your Lesser Healing Wave spell by 25%, until two such spells have been cast. In addition, your Healing Wave gains an additional 4% of your bonus healing effects and your Lesser Healing Wave gains an additional 2% of your bonus healing effects.",
  "When you cast Chain Heal or Riptide, you have a 20% chance to lower the cast time of your Healing Wave spell by 30% and increase the critical effect chance of your Lesser Healing Wave spell by 25%, until two such spells have been cast. In addition, your Healing Wave gains an additional 4% of your bonus healing effects and your Lesser Healing Wave gains an additional 2% of your bonus healing effects.",
  "When you cast Chain Heal or Riptide, you have a 20% chance to lower the cast time of your Healing Wave spell by 30% and increase the critical effect chance of your Lesser Healing Wave spell by 25%, until two such spells have been cast. In addition, your Healing Wave gains an additional 4% of your bonus healing effects and your Lesser Healing Wave gains an additional 2% of your bonus healing effects."
),

(61295, @locale_en,
  "Heals a friendly target for 639 to 691 and another 665 over 15 sec.  Your next Chain Heal cast on that primary target within 15 sec will consume the healing over time effect and increase the amount of the Chain Heal by 25%.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- mage
(11210, @locale_en,
  "Reduces the chance your helpful spells and damage over time effects will be dispelled by 15% and reduces the threat caused by your Arcane spells by 20%.",
  "Reduces the chance your helpful spells and damage over time effects will be dispelled by 15% and reduces the threat caused by your Arcane spells by 20%.",
  NULL,
  NULL,
  NULL
),

(11222, @locale_en,
  "Increases your chance to hit and reduces the mana cost of your Arcane spells by 1%.",
  "Increases your chance to hit and reduces the mana cost of your Arcane spells by 1%.",
  "Increases your chance to hit and reduces the mana cost of your Arcane spells by 1%.",
  NULL,
  NULL
),

(11237, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Arcane Missiles and Arcane Blast by 20%.",
  "Reduces the pushback suffered from damaging attacks while casting Arcane Missiles and Arcane Blast by 20%.",
  "Reduces the pushback suffered from damaging attacks while casting Arcane Missiles and Arcane Blast by 20%.",
  "Reduces the pushback suffered from damaging attacks while casting Arcane Missiles and Arcane Blast by 20%.",
  "Reduces the pushback suffered from damaging attacks while casting Arcane Missiles and Arcane Blast by 20%."
),

(28574, @locale_en,
  "Increases your armor by an amount equal to 50% of your Intellect.",
  "Increases your armor by an amount equal to 50% of your Intellect.",
  "Increases your armor by an amount equal to 50% of your Intellect.",
  NULL,
  NULL
),

(29441, @locale_en,
  "Increases all resistances by .5 per level and causes all spells you fully resist to restore 1% of your total mana.  1 sec cooldown.",
  "Increases all resistances by .5 per level and causes all spells you fully resist to restore 1% of your total mana.  1 sec cooldown.",
  NULL,
  NULL,
  NULL
),

(11213, @locale_en,
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%.",
  "Gives you a 2% chance of entering a Clearcasting state after any damage spell hits a target.  The Clearcasting state reduces the mana cost of your next damage spell by 100%."
),

(11247, @locale_en,
  "Increases the range of your Arcane spells by 3 yards and the effect of your Amplify Magic and Dampen Magic spells by 25%.",
  "Increases the range of your Arcane spells by 3 yards and the effect of your Amplify Magic and Dampen Magic spells by 25%.",
  NULL,
  NULL,
  NULL
),

(11242, @locale_en,
  "Increases the damage of your Arcane Explosion, Arcane Blast, Blast Wave, Fire Blast, Scorch, Fireball, Ice Lance and Cone of Cold spells by an additional 2%.",
  "Increases the damage of your Arcane Explosion, Arcane Blast, Blast Wave, Fire Blast, Scorch, Fireball, Ice Lance and Cone of Cold spells by an additional 2%.",
  "Increases the damage of your Arcane Explosion, Arcane Blast, Blast Wave, Fire Blast, Scorch, Fireball, Ice Lance and Cone of Cold spells by an additional 2%.",
  NULL,
  NULL
),

(44397, @locale_en,
  "Increases your total Spirit by 4%.",
  "Increases your total Spirit by 4%.",
  "Increases your total Spirit by 4%.",
  NULL,
  NULL
),

(54646, @locale_en,
  "Increases the target's chance to critically hit with spells by 3%.  When the target critically hits the caster's chance to critically hit with spells is increased by 3% for 10 sec.  Cannot be cast on self.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11252, @locale_en,
  "Decreases the mana lost per point of damage taken when Mana Shield is active by 17% and increases the resistances granted by Mage Armor by 25%.",
  "Decreases the mana lost per point of damage taken when Mana Shield is active by 17% and increases the resistances granted by Mage Armor by 25%.",
  NULL,
  NULL,
  NULL
),

(11255, @locale_en,
  "Your Counterspell also silences the target for 2 sec.",
  "Your Counterspell also silences the target for 2 sec.",
  NULL,
  NULL,
  NULL
),

(18462, @locale_en,
  "Allows 17% of your mana regeneration to continue while casting.",
  "Allows 17% of your mana regeneration to continue while casting.",
  "Allows 17% of your mana regeneration to continue while casting.",
  NULL,
  NULL
),

(29447, @locale_en,
  "Your Frostbolt, Fireball, Frostfire Bolt, Pyroblast, Arcane Missiles, Arcane Blast, and Arcane Barrage abilities deal 4% more damage to snared or slowed targets.",
  "Your Frostbolt, Fireball, Frostfire Bolt, Pyroblast, Arcane Missiles, Arcane Blast, and Arcane Barrage abilities deal 4% more damage to snared or slowed targets.",
  "Your Frostbolt, Fireball, Frostfire Bolt, Pyroblast, Arcane Missiles, Arcane Blast, and Arcane Barrage abilities deal 4% more damage to snared or slowed targets.",
  NULL,
  NULL
),

(31569, @locale_en,
  "Reduces the mana cost of Blink by 25% and for 4 sec after casting your chance to be hit by all attacks and spells is reduced by 15%.",
  "Reduces the mana cost of Blink by 25% and for 4 sec after casting your chance to be hit by all attacks and spells is reduced by 15%.",
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
  "Reduces all damage taken by 2% and reduces the fade time of your Invisibility spell by 1 sec.",
  "Reduces all damage taken by 2% and reduces the fade time of your Invisibility spell by 1 sec.",
  "Reduces all damage taken by 2% and reduces the fade time of your Invisibility spell by 1 sec.",
  NULL,
  NULL
),

(15058, @locale_en,
  "Increases the damage done by your spells and your critical strike chance by 1%.",
  "Increases the damage done by your spells and your critical strike chance by 1%.",
  "Increases the damage done by your spells and your critical strike chance by 1%.",
  NULL,
  NULL
),

(31571, @locale_en,
  "Increases the critical strike chance of your next damaging spell by 15% after gaining Clearcasting or Presence of Mind.",
  "Increases the critical strike chance of your next damaging spell by 15% after gaining Clearcasting or Presence of Mind.",
  NULL,
  NULL,
  NULL
),

(31579, @locale_en,
  "Increases the damage of your Arcane Missiles spell by an amount equal to 15% of your spell power and the damage of your Arcane Blast by 3% of your spell power.  In addition, increases the damage of all party and raid members within 100 yds by 1%.",
  "Increases the damage of your Arcane Missiles spell by an amount equal to 15% of your spell power and the damage of your Arcane Blast by 3% of your spell power.  In addition, increases the damage of all party and raid members within 100 yds by 1%.",
  "Increases the damage of your Arcane Missiles spell by an amount equal to 15% of your spell power and the damage of your Arcane Blast by 3% of your spell power.  In addition, increases the damage of all party and raid members within 100 yds by 1%.",
  NULL,
  NULL
),

(12042, @locale_en,
  "When activated, your spells deal 20% more damage while costing 20% more mana to cast.  This effect lasts 15 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(44394, @locale_en,
  "When your Mana Shield, Frost Ward, Fire Ward, or Ice Barrier absorbs damage your spell damage is increased by 5% of the amount absorbed for 10 sec.",
  "When your Mana Shield, Frost Ward, Fire Ward, or Ice Barrier absorbs damage your spell damage is increased by 5% of the amount absorbed for 10 sec.",
  "When your Mana Shield, Frost Ward, Fire Ward, or Ice Barrier absorbs damage your spell damage is increased by 5% of the amount absorbed for 10 sec.",
  NULL,
  NULL
),

(44378, @locale_en,
  "Reduces the cooldown of your Presence of Mind, Arcane Power and Invisibility spells by 15% and the cooldown of your Evocation spell by 1 min.",
  "Reduces the cooldown of your Presence of Mind, Arcane Power and Invisibility spells by 15% and the cooldown of your Evocation spell by 1 min.",
  NULL,
  NULL,
  NULL
),

(31584, @locale_en,
  "Increases spell power by 3% of your total Intellect.",
  "Increases spell power by 3% of your total Intellect.",
  "Increases spell power by 3% of your total Intellect.",
  "Increases spell power by 3% of your total Intellect.",
  "Increases spell power by 3% of your total Intellect."
),

(31589, @locale_en,
  "Reduces target's movement speed by 60%, increases the time between ranged attacks by 60% and increases casting time by 30%.  Lasts 15 sec.  Slow can only affect one target at a time.",
  NULL,
  NULL,
  NULL,
  NULL
),

(44404, @locale_en,
  "Gives your Arcane Blast a 8% chance, and your Arcane Barrage, Fireball, Frostbolt and Frostfire Bolt spells a 4% chance to reduce the channeled duration of the next Arcane Missiles spell by 2.5 secs, reduce the mana cost by 100%, and missiles will fire every .5 secs.",
  "Gives your Arcane Blast a 8% chance, and your Arcane Barrage, Fireball, Frostbolt and Frostfire Bolt spells a 4% chance to reduce the channeled duration of the next Arcane Missiles spell by 2.5 secs, reduce the mana cost by 100%, and missiles will fire every .5 secs.",
  "Gives your Arcane Blast a 8% chance, and your Arcane Barrage, Fireball, Frostbolt and Frostfire Bolt spells a 4% chance to reduce the channeled duration of the next Arcane Missiles spell by 2.5 secs, reduce the mana cost by 100%, and missiles will fire every .5 secs.",
  "Gives your Arcane Blast a 8% chance, and your Arcane Barrage, Fireball, Frostbolt and Frostfire Bolt spells a 4% chance to reduce the channeled duration of the next Arcane Missiles spell by 2.5 secs, reduce the mana cost by 100%, and missiles will fire every .5 secs.",
  "Gives your Arcane Blast a 8% chance, and your Arcane Barrage, Fireball, Frostbolt and Frostfire Bolt spells a 4% chance to reduce the channeled duration of the next Arcane Missiles spell by 2.5 secs, reduce the mana cost by 100%, and missiles will fire every .5 secs."
),

(44400, @locale_en,
  "Increases your spell haste by 2%.",
  "Increases your spell haste by 2%.",
  "Increases your spell haste by 2%.",
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

(44425, @locale_en,
  "Launches several missiles at the enemy target, causing 386 to 470 Arcane damage.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11078, @locale_en,
  "Reduces the cooldown of your Fire Blast spell by 1 sec.",
  "Reduces the cooldown of your Fire Blast spell by 1 sec.",
  NULL,
  NULL,
  NULL
),

(18459, @locale_en,
  "Increases the critical strike chance of your Fire Blast, Scorch, Arcane Blast and Cone of Cold spells by 2%.",
  "Increases the critical strike chance of your Fire Blast, Scorch, Arcane Blast and Cone of Cold spells by 2%.",
  "Increases the critical strike chance of your Fire Blast, Scorch, Arcane Blast and Cone of Cold spells by 2%.",
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

(11119, @locale_en,
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4 sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4 sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4 sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4 sec.",
  "Your critical strikes from Fire damage spells cause the target to burn for an additional 8% of your spell's damage over 4 sec."
),

(54747, @locale_en,
  "When Interrupted or Silenced you have a 50% chance to become immune to the next Interrupt or Silence mechanic.  Lasts 20 sec.",
  "When Interrupted or Silenced you have a 50% chance to become immune to the next Interrupt or Silence mechanic.  Lasts 20 sec.",
  NULL,
  NULL,
  NULL
),

(11108, @locale_en,
  "Increases the critical strike chance of your Flamestrike, Pyroblast, Blast Wave, Dragon's Breath, Living Bomb, Blizzard and Arcane Explosion spells by 2%.",
  "Increases the critical strike chance of your Flamestrike, Pyroblast, Blast Wave, Dragon's Breath, Living Bomb, Blizzard and Arcane Explosion spells by 2%.",
  "Increases the critical strike chance of your Flamestrike, Pyroblast, Blast Wave, Dragon's Breath, Living Bomb, Blizzard and Arcane Explosion spells by 2%.",
  NULL,
  NULL
),

(11100, @locale_en,
  "Increases the range of all Fire spells except Frostfire Bolt by 3 yards.",
  "Increases the range of all Fire spells except Frostfire Bolt by 3 yards.",
  NULL,
  NULL,
  NULL
),

(11103, @locale_en,
  "Gives your damaging spells a 4% chance to cause the next Fire Blast you cast to stun the target for 2 sec.",
  "Gives your damaging spells a 4% chance to cause the next Fire Blast you cast to stun the target for 2 sec.",
  "Gives your damaging spells a 4% chance to cause the next Fire Blast you cast to stun the target for 2 sec.",
  NULL,
  NULL
),

(11366, @locale_en,
  "Hurls an immense fiery boulder that causes 141 to 187 Fire damage and an additional 56 Fire damage over 12 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11083, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Fire spells by 35% and reduces the threat caused by your Fire spells by 10%.",
  "Reduces the pushback suffered from damaging attacks while casting Fire spells by 35% and reduces the threat caused by your Fire spells by 10%.",
  NULL,
  NULL,
  NULL
),

(11095, @locale_en,
  "Increases your chance to critically hit with Scorch, Fireball and Frostfire Bolt by an additional 1% and your damaging Scorch spells have a 33% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5% and lasts 30 sec.",
  "Increases your chance to critically hit with Scorch, Fireball and Frostfire Bolt by an additional 1% and your damaging Scorch spells have a 33% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5% and lasts 30 sec.",
  "Increases your chance to critically hit with Scorch, Fireball and Frostfire Bolt by an additional 1% and your damaging Scorch spells have a 33% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5% and lasts 30 sec.",
  NULL,
  NULL
),

(11094, @locale_en,
  "Causes your Fire Ward and Frost Ward spells to have a 15% chance to reflect the warded spell while active. In addition, your Molten Armor has a 50% chance to affect ranged and spell attacks.",
  "Causes your Fire Ward and Frost Ward spells to have a 15% chance to reflect the warded spell while active. In addition, your Molten Armor has a 50% chance to affect ranged and spell attacks.",
  NULL,
  NULL,
  NULL
),

(29074, @locale_en,
  "Your spell criticals will refund 10% of their base mana cost.",
  "Your spell criticals will refund 10% of their base mana cost.",
  "Your spell criticals will refund 10% of their base mana cost.",
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
  "A wave of flame radiates outward from the caster, damaging all enemies caught within the blast for 154 to 186 Fire damage, knocking them back and dazing them for 6 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31641, @locale_en,
  "Gives you a 5% chance when hit by a melee or ranged attack to increase your movement speed by 50% and dispel all movement impairing effects.  This effect lasts 8 sec.",
  "Gives you a 5% chance when hit by a melee or ranged attack to increase your movement speed by 50% and dispel all movement impairing effects.  This effect lasts 8 sec.",
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
  "Increases chance to critically hit by 1% and allows 17% of your mana regeneration to continue while casting.",
  "Increases chance to critically hit by 1% and allows 17% of your mana regeneration to continue while casting.",
  "Increases chance to critically hit by 1% and allows 17% of your mana regeneration to continue while casting.",
  NULL,
  NULL
),

(11129, @locale_en,
  "When activated, this spell increases your critical strike damage bonus with Fire damage spells by 50%, and causes each of your Fire damage spell hits to increase your critical strike chance with Fire damage spells by 10%.  This effect lasts until you have caused 3 non-periodic critical strikes with Fire spells.",
  NULL,
  NULL,
  NULL,
  NULL
),

(31679, @locale_en,
  "Increases damage of all spells against targets with less than 35% health by 6%.",
  "Increases damage of all spells against targets with less than 35% health by 6%.",
  NULL,
  NULL,
  NULL
),

(64353, @locale_en,
  "When below 35% health all damage taken is reduced by 10% and your Pyroblast spell's cast time is reduced by 1.75 secs while the cooldown is increased by 2.5 secs.  In addition, melee and ranged attacks made against you have a 5% chance to disarm your attacker's main hand and ranged weapons.",
  "When below 35% health all damage taken is reduced by 10% and your Pyroblast spell's cast time is reduced by 1.75 secs while the cooldown is increased by 2.5 secs.  In addition, melee and ranged attacks made against you have a 5% chance to disarm your attacker's main hand and ranged weapons.",
  NULL,
  NULL,
  NULL
),

(31656, @locale_en,
  "Increases the damage of your Fireball, Frostfire Bolt and Pyroblast spells by an amount equal to 5% of your spell power.  In addition, each time your Ignite talent causes damage, you have a 33% chance to regain 2% of your base mana.",
  "Increases the damage of your Fireball, Frostfire Bolt and Pyroblast spells by an amount equal to 5% of your spell power.  In addition, each time your Ignite talent causes damage, you have a 33% chance to regain 2% of your base mana.",
  "Increases the damage of your Fireball, Frostfire Bolt and Pyroblast spells by an amount equal to 5% of your spell power.  In addition, each time your Ignite talent causes damage, you have a 33% chance to regain 2% of your base mana.",
  NULL,
  NULL
),

(44442, @locale_en,
  "Your damaging Blast Wave and Dragon's Breath spells have a 50% chance to make your next Flamestrike spell instant cast and cost no mana.  Lasts 10 sec.",
  "Your damaging Blast Wave and Dragon's Breath spells have a 50% chance to make your next Flamestrike spell instant cast and cost no mana.  Lasts 10 sec.",
  NULL,
  NULL,
  NULL
),

(31661, @locale_en,
  "Targets in a cone in front of the caster take 370 to 430 Fire damage and are Disoriented for 5 sec.  Any direct damaging attack will revive targets.  Turns off your attack when used.",
  NULL,
  NULL,
  NULL,
  NULL
),

(44445, @locale_en,
  "Any time you score 2 non-periodic spell criticals in a row using Fireball, Fire Blast, Scorch, Living Bomb, or Frostfire Bolt, you have a 33% chance the next Pyroblast spell cast within 10 sec will be instant cast.",
  "Any time you score 2 non-periodic spell criticals in a row using Fireball, Fire Blast, Scorch, Living Bomb, or Frostfire Bolt, you have a 33% chance the next Pyroblast spell cast within 10 sec will be instant cast.",
  "Any time you score 2 non-periodic spell criticals in a row using Fireball, Fire Blast, Scorch, Living Bomb, or Frostfire Bolt, you have a 33% chance the next Pyroblast spell cast within 10 sec will be instant cast.",
  NULL,
  NULL
),

(44449, @locale_en,
  "Increases your spell critical damage bonus with all spells by 10% but your non-periodic spell criticals cost an additional 1% of the spell's cost.",
  "Increases your spell critical damage bonus with all spells by 10% but your non-periodic spell criticals cost an additional 1% of the spell's cost.",
  "Increases your spell critical damage bonus with all spells by 10% but your non-periodic spell criticals cost an additional 1% of the spell's cost.",
  "Increases your spell critical damage bonus with all spells by 10% but your non-periodic spell criticals cost an additional 1% of the spell's cost.",
  "Increases your spell critical damage bonus with all spells by 10% but your non-periodic spell criticals cost an additional 1% of the spell's cost."
),

(44457, @locale_en,
  "The target becomes a Living Bomb, taking 612 Fire damage over 12 sec.  After 12 sec or when the spell is dispelled, the target explodes dealing 306 Fire damage to all enemies within 10 yards.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11071, @locale_en,
  "Gives your Chill effects a 5% chance to freeze the target for 5 sec.",
  "Gives your Chill effects a 5% chance to freeze the target for 5 sec.",
  "Gives your Chill effects a 5% chance to freeze the target for 5 sec.",
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

(31670, @locale_en,
  "Reduces the cooldown of your Frost Nova, Cone of Cold, Ice Block and Icy Veins spells by 7%.",
  "Reduces the cooldown of your Frost Nova, Cone of Cold, Ice Block and Icy Veins spells by 7%.",
  "Reduces the cooldown of your Frost Nova, Cone of Cold, Ice Block and Icy Veins spells by 7%.",
  NULL,
  NULL
),

(11207, @locale_en,
  "Increases the critical strike damage bonus of your Frost spells by 33%.",
  "Increases the critical strike damage bonus of your Frost spells by 33%.",
  "Increases the critical strike damage bonus of your Frost spells by 33%.",
  NULL,
  NULL
),

(11189, @locale_en,
  "Increases the armor and resistances given by your Frost Armor and Ice Armor spells by 25%.  In addition, gives your Frost Ward and Fire Ward a 15% chance to negate the warded damage spell and restore mana equal to the damage caused.",
  "Increases the armor and resistances given by your Frost Armor and Ice Armor spells by 25%.  In addition, gives your Frost Ward and Fire Ward a 15% chance to negate the warded damage spell and restore mana equal to the damage caused.",
  NULL,
  NULL,
  NULL
),

(29438, @locale_en,
  "Reduces the mana cost and increases your chance to hit with spells by 1%.",
  "Reduces the mana cost and increases your chance to hit with spells by 1%.",
  "Reduces the mana cost and increases your chance to hit with spells by 1%.",
  NULL,
  NULL
),

(11175, @locale_en,
  "Increases the duration of your Chill effects by 1 sec, reduces the target's speed by an additional 4%, and reduces the target's healing received by 7%.",
  "Increases the duration of your Chill effects by 1 sec, reduces the target's speed by an additional 4%, and reduces the target's healing received by 7%.",
  "Increases the duration of your Chill effects by 1 sec, reduces the target's speed by an additional 4%, and reduces the target's healing received by 7%.",
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
  "Hastens your spellcasting, increasing spell casting speed by 20% and reduces the pushback suffered from damaging attacks while casting by 100%.  Lasts 20 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(11185, @locale_en,
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 25%.  Lasts 1.5 sec.",
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 25%.  Lasts 1.5 sec.",
  "Adds a chill effect to your Blizzard spell.  This effect lowers the target's movement speed by 25%.  Lasts 1.5 sec.",
  NULL,
  NULL
),

(16757, @locale_en,
  "Increases the range of your Frostbolt, Ice Lance, Deep Freeze and Blizzard spells and the radius of your Frost Nova and Cone of Cold spells by 10%.",
  "Increases the range of your Frostbolt, Ice Lance, Deep Freeze and Blizzard spells and the radius of your Frost Nova and Cone of Cold spells by 10%.",
  NULL,
  NULL,
  NULL
),

(11160, @locale_en,
  "Reduces the mana cost of all spells by 4% and reduces the threat caused by your Frost spells by 4%.",
  "Reduces the mana cost of all spells by 4% and reduces the threat caused by your Frost spells by 4%.",
  "Reduces the mana cost of all spells by 4% and reduces the threat caused by your Frost spells by 4%.",
  NULL,
  NULL
),

(11170, @locale_en,
  "Increases the critical strike chance of all your spells against frozen targets by 17%.",
  "Increases the critical strike chance of all your spells against frozen targets by 17%.",
  "Increases the critical strike chance of all your spells against frozen targets by 17%.",
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

(31667, @locale_en,
  "Reduces the damage taken from all spells by 2%.",
  "Reduces the damage taken from all spells by 2%.",
  "Reduces the damage taken from all spells by 2%.",
  NULL,
  NULL
),

(55091, @locale_en,
  "Reduces the cooldown of your Cold Snap, Ice Barrier and Summon Water Elemental spells by 10%.",
  "Reduces the cooldown of your Cold Snap, Ice Barrier and Summon Water Elemental spells by 10%.",
  NULL,
  NULL,
  NULL
),

(11180, @locale_en,
  "Increases your chance to critically hit with Frostbolt by an additional 1% and gives your Frost damage spells a 33% chance to apply the Winter's Chill effect, which increases the chance spells will critically hit the target by 1% for 15 sec.  Stacks up to 5 times.",
  "Increases your chance to critically hit with Frostbolt by an additional 1% and gives your Frost damage spells a 33% chance to apply the Winter's Chill effect, which increases the chance spells will critically hit the target by 1% for 15 sec.  Stacks up to 5 times.",
  "Increases your chance to critically hit with Frostbolt by an additional 1% and gives your Frost damage spells a 33% chance to apply the Winter's Chill effect, which increases the chance spells will critically hit the target by 1% for 15 sec.  Stacks up to 5 times.",
  NULL,
  NULL
),

(44745, @locale_en,
  "Gives your Ice Barrier spell a 50% chance to freeze all enemies within 10 yds for 8 sec when it is destroyed.",
  "Gives your Ice Barrier spell a 50% chance to freeze all enemies within 10 yds for 8 sec when it is destroyed.",
  NULL,
  NULL,
  NULL
),

(11426, @locale_en,
  "Instantly shields you, absorbing 438 damage.  Lasts 1 min.  While the shield holds, spellcasting will not be delayed by damage.",
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
  "Increases the damage of your Frostbolt spell by an amount equal to 5% of your spell power and reduces the cast time by 0.1 sec.",
  "Increases the damage of your Frostbolt spell by an amount equal to 5% of your spell power and reduces the cast time by 0.1 sec.",
  NULL,
  NULL,
  NULL
),

(44543, @locale_en,
  "Gives your Chill effects a 7% chance to grant you the Fingers of Frost effect, which treats your next 2 spells cast as if the target were Frozen.  Lasts 15 sec.",
  "Gives your Chill effects a 7% chance to grant you the Fingers of Frost effect, which treats your next 2 spells cast as if the target were Frozen.  Lasts 15 sec.",
  NULL,
  NULL,
  NULL
),

(44546, @locale_en,
  "Your Frost damage spells with chilling effects have a 5% chance to cause your next Fireball or Frostfire Bolt spell to be instant cast and cost no mana.",
  "Your Frost damage spells with chilling effects have a 5% chance to cause your next Fireball or Frostfire Bolt spell to be instant cast and cost no mana.",
  "Your Frost damage spells with chilling effects have a 5% chance to cause your next Fireball or Frostfire Bolt spell to be instant cast and cost no mana.",
  NULL,
  NULL
),

(31687, @locale_en,
  "Summon a Water Elemental to fight for the caster<!--sp70937:0--> for 45 sec<!--sp70937-->.",
  NULL,
  NULL,
  NULL,
  NULL
),

(44557, @locale_en,
  "Increases the duration of your Summon Water Elemental spell by 5 sec and your Frostbolt spell has a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec.  This effect cannot occur more often than once every 6 sec.",
  "Increases the duration of your Summon Water Elemental spell by 5 sec and your Frostbolt spell has a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec.  This effect cannot occur more often than once every 6 sec.",
  "Increases the duration of your Summon Water Elemental spell by 5 sec and your Frostbolt spell has a 33% chance to grant up to 10 party or raid members mana regeneration equal to 1% of their maximum mana per 5 sec for 15 sec.  This effect cannot occur more often than once every 6 sec.",
  NULL,
  NULL
),

(44566, @locale_en,
  "Increases the damage caused by your Frostbolt, Frostfire Bolt and Ice Lance spells by 1% and reduces the movement speed of all chilled targets by an additional 2%.",
  "Increases the damage caused by your Frostbolt, Frostfire Bolt and Ice Lance spells by 1% and reduces the movement speed of all chilled targets by an additional 2%.",
  "Increases the damage caused by your Frostbolt, Frostfire Bolt and Ice Lance spells by 1% and reduces the movement speed of all chilled targets by an additional 2%.",
  "Increases the damage caused by your Frostbolt, Frostfire Bolt and Ice Lance spells by 1% and reduces the movement speed of all chilled targets by an additional 2%.",
  "Increases the damage caused by your Frostbolt, Frostfire Bolt and Ice Lance spells by 1% and reduces the movement speed of all chilled targets by an additional 2%."
),

(44572, @locale_en,
  "Stuns the target for 5 sec.  Only usable on Frozen targets.  Deals 1469 to 1741 damage to targets permanently immune to stuns.",
  NULL,
  NULL,
  NULL,
  NULL
),

-- warlock
(18827, @locale_en,
  "Increases the damage done by your Curse of Agony by 5%.",
  "Increases the damage done by your Curse of Agony by 5%.",
  NULL,
  NULL,
  NULL
),

(18174, @locale_en,
  "Increases your chance to hit with spells by 1%, and reduces the mana cost of your Affliction spells by 2%.",
  "Increases your chance to hit with spells by 1%, and reduces the mana cost of your Affliction spells by 2%.",
  "Increases your chance to hit with spells by 1%, and reduces the mana cost of your Affliction spells by 2%.",
  NULL,
  NULL
),

(17810, @locale_en,
  "Increases the damage done by your Corruption by 2%, and increases the critical strike chance of your Seed of Corruption by 1%.",
  "Increases the damage done by your Corruption by 2%, and increases the critical strike chance of your Seed of Corruption by 1%.",
  "Increases the damage done by your Corruption by 2%, and increases the critical strike chance of your Seed of Corruption by 1%.",
  "Increases the damage done by your Corruption by 2%, and increases the critical strike chance of your Seed of Corruption by 1%.",
  "Increases the damage done by your Corruption by 2%, and increases the critical strike chance of your Seed of Corruption by 1%."
),

(18179, @locale_en,
  "Increases the amount of attack power reduced by your Curse of Weakness by 10%.",
  "Increases the amount of attack power reduced by your Curse of Weakness by 10%.",
  NULL,
  NULL,
  NULL
),

(18213, @locale_en,
  "Returns 7% of your maximum mana if the target is killed by you while you drain its soul.  In addition, your Affliction spells generate 10% less threat.",
  "Returns 7% of your maximum mana if the target is killed by you while you drain its soul.  In addition, your Affliction spells generate 10% less threat.",
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
  "Increases the amount drained by your Drain Life and Drain Soul spells by an additional 3% for each of your Affliction effects on the target, up to a maximum of 9% additional effect.",
  "Increases the amount drained by your Drain Life and Drain Soul spells by an additional 3% for each of your Affliction effects on the target, up to a maximum of 9% additional effect.",
  NULL,
  NULL,
  NULL
),

(53754, @locale_en,
  "Causes your Fear spell to inflict a Nightmare on the target when the fear effect ends. The Nightmare effect reduces the target's movement speed by 15% for 5 sec.",
  "Causes your Fear spell to inflict a Nightmare on the target when the fear effect ends. The Nightmare effect reduces the target's movement speed by 15% for 5 sec.",
  NULL,
  NULL,
  NULL
),

(17783, @locale_en,
  "Reduces the pushback suffered from damaging attacks  while casting Drain Life, Drain Mana, Drain Soul, Unstable Affliction, and Haunt by 23%.",
  "Reduces the pushback suffered from damaging attacks  while casting Drain Life, Drain Mana, Drain Soul, Unstable Affliction, and Haunt by 23%.",
  "Reduces the pushback suffered from damaging attacks  while casting Drain Life, Drain Mana, Drain Soul, Unstable Affliction, and Haunt by 23%.",
  NULL,
  NULL
),

(18288, @locale_en,
  "Reduces the global cooldown of your Curses by 0.5 sec.",
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
  "Increases the damage of your Corruption spell by an amount equal to 12% of your spell power.",
  "Increases the damage of your Corruption spell by an amount equal to 12% of your spell power.",
  "Increases the damage of your Corruption spell by an amount equal to 12% of your spell power.",
  NULL,
  NULL
),

(32385, @locale_en,
  "Your Shadow Bolt and Haunt spells apply the Shadow Embrace effect, increasing all shadow periodic damage dealt to the target by you by 1%, and reduces all periodic healing done to the target by 2%. Lasts for 12 sec. Stacks up to 3  times.",
  "Your Shadow Bolt and Haunt spells apply the Shadow Embrace effect, increasing all shadow periodic damage dealt to the target by you by 1%, and reduces all periodic healing done to the target by 2%. Lasts for 12 sec. Stacks up to 3  times.",
  "Your Shadow Bolt and Haunt spells apply the Shadow Embrace effect, increasing all shadow periodic damage dealt to the target by you by 1%, and reduces all periodic healing done to the target by 2%. Lasts for 12 sec. Stacks up to 3  times.",
  "Your Shadow Bolt and Haunt spells apply the Shadow Embrace effect, increasing all shadow periodic damage dealt to the target by you by 1%, and reduces all periodic healing done to the target by 2%. Lasts for 12 sec. Stacks up to 3  times.",
  "Your Shadow Bolt and Haunt spells apply the Shadow Embrace effect, increasing all shadow periodic damage dealt to the target by you by 1%, and reduces all periodic healing done to the target by 2%. Lasts for 12 sec. Stacks up to 3  times."
),

(63108, @locale_en,
  "When you deal damage with your Corruption spell, you are instantly healed for <!--sp56216:0-->40<!--sp56216-->% of the damage done. In addition, the damage done by your Corruption, Seed of Corruption and Unstable Affliction damage over time effects is increased by 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18223, @locale_en,
  "Reduces the target's movement speed by 30% for 12 sec.  Only one Curse per Warlock can be active on any one target.",
  NULL,
  NULL,
  NULL,
  NULL
),

(54037, @locale_en,
  "Your Felhunter regains 4% of its maximum mana each time it hits with its Shadow Bite ability and the cooldown on that ability is reduced by 2 sec.  In addition, increases the effect of your Felhunter's Fel Intelligence by 5%.",
  "Your Felhunter regains 4% of its maximum mana each time it hits with its Shadow Bite ability and the cooldown on that ability is reduced by 2 sec.  In addition, increases the effect of your Felhunter's Fel Intelligence by 5%.",
  NULL,
  NULL,
  NULL
),

(18271, @locale_en,
  "Increases the damage dealt or life drained by your Shadow spells and your Felhunter's Shadow Bite ability by 3%.",
  "Increases the damage dealt or life drained by your Shadow spells and your Felhunter's Shadow Bite ability by 3%.",
  "Increases the damage dealt or life drained by your Shadow spells and your Felhunter's Shadow Bite ability by 3%.",
  "Increases the damage dealt or life drained by your Shadow spells and your Felhunter's Shadow Bite ability by 3%.",
  "Increases the damage dealt or life drained by your Shadow spells and your Felhunter's Shadow Bite ability by 3%."
),

(47195, @locale_en,
  "When you deal damage with Corruption, you have 6% chance to increase your spell casting speed by 6% for 10 sec.",
  "When you deal damage with Corruption, you have 6% chance to increase your spell casting speed by 6% for 10 sec.",
  "When you deal damage with Corruption, you have 6% chance to increase your spell casting speed by 6% for 10 sec.",
  NULL,
  NULL
),

(30060, @locale_en,
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your helpful Affliction spells and damage over time effects will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your helpful Affliction spells and damage over time effects will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your helpful Affliction spells and damage over time effects will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your helpful Affliction spells and damage over time effects will be dispelled by an additional 6%.",
  "Increases the damage of Curse of Agony, Corruption and Seed of Corruption by 1% and reduces the chance your helpful Affliction spells and damage over time effects will be dispelled by an additional 6%."
),

(18220, @locale_en,
  "Drains 305 of your summoned demon's Mana, returning 100% to you.",
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
  "Increases your spell damage by 1%, and increases the periodic critical strike chance of your Corruption and Unstable Affliction spells by 3%.",
  "Increases your spell damage by 1%, and increases the periodic critical strike chance of your Corruption and Unstable Affliction spells by 3%.",
  "Increases your spell damage by 1%, and increases the periodic critical strike chance of your Corruption and Unstable Affliction spells by 3%.",
  NULL,
  NULL
),

(47198, @locale_en,
  "Increases the amount drained by your Drain Life by 10% while your health is at or below 20% health, and increases the damage done by your Shadow spells by 4% when your target is at or below 35% health.",
  "Increases the amount drained by your Drain Life by 10% while your health is at or below 20% health, and increases the damage done by your Shadow spells by 4% when your target is at or below 35% health.",
  "Increases the amount drained by your Drain Life by 10% while your health is at or below 20% health, and increases the damage done by your Shadow spells by 4% when your target is at or below 35% health.",
  NULL,
  NULL
),

(30108, @locale_en,
  "Shadow energy slowly destroys the target, causing 550 damage over 15 sec.  In addition, if the Unstable Affliction is dispelled it will cause 990 damage to the dispeller and silence them for 5 sec. Only one Unstable Affliction or Immolate per Warlock can be active on any one target.",
  NULL,
  NULL,
  NULL,
  NULL
),

(58435, @locale_en,
  "Grants the periodic damage from your Corruption and Unstable Affliction spells the ability to critically hit for 100% increased damage, and increases the critical strike damage bonus of your Haunt spell by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47201, @locale_en,
  "Your Corruption and Unstable Affliction spells gain an additional 1% of your bonus spell damage, and your Drain Life, Drain Soul, Shadow Bolt, and Haunt spells have a 20% chance to reset the duration of your Corruption spell on the target.",
  "Your Corruption and Unstable Affliction spells gain an additional 1% of your bonus spell damage, and your Drain Life, Drain Soul, Shadow Bolt, and Haunt spells have a 20% chance to reset the duration of your Corruption spell on the target.",
  "Your Corruption and Unstable Affliction spells gain an additional 1% of your bonus spell damage, and your Drain Life, Drain Soul, Shadow Bolt, and Haunt spells have a 20% chance to reset the duration of your Corruption spell on the target.",
  "Your Corruption and Unstable Affliction spells gain an additional 1% of your bonus spell damage, and your Drain Life, Drain Soul, Shadow Bolt, and Haunt spells have a 20% chance to reset the duration of your Corruption spell on the target.",
  "Your Corruption and Unstable Affliction spells gain an additional 1% of your bonus spell damage, and your Drain Life, Drain Soul, Shadow Bolt, and Haunt spells have a 20% chance to reset the duration of your Corruption spell on the target."
),

(48181, @locale_en,
  "You send a ghostly soul into the target, dealing 405 to 473 Shadow damage and increasing all damage done by your Shadow damage-over-time effects on the target by 20% for 12 sec. When the Haunt spell ends or is dispelled, the soul returns to you, healing you for 100% of the damage it did to the target.",
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
  "Increases your total Stamina by 4%.",
  "Increases your total Stamina by 4%.",
  "Increases your total Stamina by 4%.",
  NULL,
  NULL
),

(47230, @locale_en,
  "You have a 50% chance to heal your pet for 15% of the amount of spell damage done by you.",
  "You have a 50% chance to heal your pet for 15% of the amount of spell damage done by you.",
  NULL,
  NULL,
  NULL
),

(18703, @locale_en,
  "Increases the amount of Health transferred by your Health Funnel spell by 10% and reduces the health cost by 10%. In addition, your summoned Demon takes 15% less damage while under the effect of your Health Funnel.",
  "Increases the amount of Health transferred by your Health Funnel spell by 10% and reduces the health cost by 10%. In addition, your summoned Demon takes 15% less damage while under the effect of your Health Funnel.",
  NULL,
  NULL,
  NULL
),

(18705, @locale_en,
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%, and increases the attack power bonus on your Felguard's Demonic Frenzy effect by 1%.",
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%, and increases the attack power bonus on your Felguard's Demonic Frenzy effect by 1%.",
  "Increases the effectiveness of your Voidwalker's Torment, Consume Shadows, Sacrifice and Suffering spells by 10%, and increases the attack power bonus on your Felguard's Demonic Frenzy effect by 1%.",
  NULL,
  NULL
),

(18731, @locale_en,
  "Increases the Stamina and Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health and mana by 1%.",
  "Increases the Stamina and Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health and mana by 1%.",
  "Increases the Stamina and Intellect of your Imp, Voidwalker, Succubus, Felhunter and Felguard by 5% and increases your maximum health and mana by 1%.",
  NULL,
  NULL
),

(18754, @locale_en,
  "Reduces the cast time of your Succubus' Seduction by 22%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  "Reduces the cast time of your Succubus' Seduction by 22%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  "Reduces the cast time of your Succubus' Seduction by 22%, and increases the duration of your Succubus' Seduction and Lesser Invisibility spells by 10%.",
  NULL,
  NULL
),

(19028, @locale_en,
  "When active, 20% of all damage taken by the caster is taken by your Imp, Voidwalker, Succubus, Felhunter, Felguard, or enslaved demon instead.  That damage cannot be prevented. Lasts as long as the demon is active and controlled.",
  NULL,
  NULL,
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

(30143, @locale_en,
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
  "Increases the effectiveness of your Demon Armor and Fel Armor spells by 10%.",
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

(18709, @locale_en,
  "Reduces the casting time of your Imp, Voidwalker, Succubus, Felhunter and Fel Guard Summoning spells by 2 sec and the Mana cost by 20%.",
  "Reduces the casting time of your Imp, Voidwalker, Succubus, Felhunter and Fel Guard Summoning spells by 2 sec and the Mana cost by 20%.",
  NULL,
  NULL,
  NULL
),

(30326, @locale_en,
  "When you gain mana from Drain Mana or Life Tap spells, your summoned demon gains 100% of the mana you gain.",
  NULL,
  NULL,
  NULL,
  NULL
),

(18767, @locale_en,
  "Increases the combat ratings gained from your conjured Firestone and Spellstone by 150%.",
  "Increases the combat ratings gained from your conjured Firestone and Spellstone by 150%.",
  NULL,
  NULL,
  NULL
),

(23785, @locale_en,
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Increases your Fire damage by 1%, and increases the critical effect chance of your Fire spells by 1%.<br /><br />Voidwalker - Reduces Physical damage taken by 2%.<br /><br />Succubus - Increases your Shadow damage by 1%, and increases the critical effect chance of your Shadow spells by 1%.<br /><br />Felhunter - Reduces all spell damage taken by 2%.<br /><br />Felguard - Increases all damage done by 1%, and reduces all damage taken by 1%.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Increases your Fire damage by 1%, and increases the critical effect chance of your Fire spells by 1%.<br /><br />Voidwalker - Reduces Physical damage taken by 2%.<br /><br />Succubus - Increases your Shadow damage by 1%, and increases the critical effect chance of your Shadow spells by 1%.<br /><br />Felhunter - Reduces all spell damage taken by 2%.<br /><br />Felguard - Increases all damage done by 1%, and reduces all damage taken by 1%.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Increases your Fire damage by 1%, and increases the critical effect chance of your Fire spells by 1%.<br /><br />Voidwalker - Reduces Physical damage taken by 2%.<br /><br />Succubus - Increases your Shadow damage by 1%, and increases the critical effect chance of your Shadow spells by 1%.<br /><br />Felhunter - Reduces all spell damage taken by 2%.<br /><br />Felguard - Increases all damage done by 1%, and reduces all damage taken by 1%.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Increases your Fire damage by 1%, and increases the critical effect chance of your Fire spells by 1%.<br /><br />Voidwalker - Reduces Physical damage taken by 2%.<br /><br />Succubus - Increases your Shadow damage by 1%, and increases the critical effect chance of your Shadow spells by 1%.<br /><br />Felhunter - Reduces all spell damage taken by 2%.<br /><br />Felguard - Increases all damage done by 1%, and reduces all damage taken by 1%.",
  "Grants both the Warlock and the summoned demon an effect as long as that demon is active.<br /><br />Imp - Increases your Fire damage by 1%, and increases the critical effect chance of your Fire spells by 1%.<br /><br />Voidwalker - Reduces Physical damage taken by 2%.<br /><br />Succubus - Increases your Shadow damage by 1%, and increases the critical effect chance of your Shadow spells by 1%.<br /><br />Felhunter - Reduces all spell damage taken by 2%.<br /><br />Felguard - Increases all damage done by 1%, and reduces all damage taken by 1%."
),

(47245, @locale_en,
  "Increases the duration of your Immolate by 3 sec, and you have a 4% chance to gain the Molten Core effect when your Corruption deals damage. The Molten Core effect empowers your next 3 Incinerate or Soul Fire spells cast within 15 sec.<br /><br />Incinerate - Increases damage done by 6% and reduces cast time by 10%.<br /><br />Soul Fire - Increases damage done by 6% and increases critical strike chance by 5%.",
  "Increases the duration of your Immolate by 3 sec, and you have a 4% chance to gain the Molten Core effect when your Corruption deals damage. The Molten Core effect empowers your next 3 Incinerate or Soul Fire spells cast within 15 sec.<br /><br />Incinerate - Increases damage done by 6% and reduces cast time by 10%.<br /><br />Soul Fire - Increases damage done by 6% and increases critical strike chance by 5%.",
  "Increases the duration of your Immolate by 3 sec, and you have a 4% chance to gain the Molten Core effect when your Corruption deals damage. The Molten Core effect empowers your next 3 Incinerate or Soul Fire spells cast within 15 sec.<br /><br />Incinerate - Increases damage done by 6% and reduces cast time by 10%.<br /><br />Soul Fire - Increases damage done by 6% and increases critical strike chance by 5%.",
  NULL,
  NULL
),

(30319, @locale_en,
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  "Reduces the chance you'll be critically hit by melee and spells by 1% and reduces all damage your summoned demon takes by 5%.",
  NULL,
  NULL
),

(47193, @locale_en,
  "Grants the Warlock's summoned demon Empowerment.<br /><br />Imp - Increases the Imp's spell critical strike chance by 20% for 30 sec.<br /><br />Voidwalker - Increases the Voidwalker's health by 20%, and its threat generated from spells and attacks by 20% for 20 sec.<br /><br />Succubus - Instantly vanishes, causing the Succubus to go into an improved Invisibility state. The vanish effect removes all stuns, snares and movement impairing effects from the Succubus.<br /><br />Felhunter - Dispels all magical effects from the Felhunter.<br /><br />Felguard - Increases the Felguard's attack speed by 20% and breaks all stun, snare and movement impairing effects and makes your Felguard immune to them for 15 sec.",
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
  "Increases melee and spell critical strike chance for you and your summoned demon by 2%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 2%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 2%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 2%.",
  "Increases melee and spell critical strike chance for you and your summoned demon by 2%."
),

(63156, @locale_en,
  "When you Shadowbolt, Incinerate or Soul Fire a target that is at or below 35% health, the cast time of Soul Fire spell is reduced by 20% for 10 sec. Soul Fires cast under the effect of Decimation cost no shard.",
  "When you Shadowbolt, Incinerate or Soul Fire a target that is at or below 35% health, the cast time of Soul Fire spell is reduced by 20% for 10 sec. Soul Fires cast under the effect of Decimation cost no shard.",
  NULL,
  NULL,
  NULL
),

(54347, @locale_en,
  "Increases your summoned demon's critical strike chance equal to 10% of your critical strike chance.",
  "Increases your summoned demon's critical strike chance equal to 10% of your critical strike chance.",
  "Increases your summoned demon's critical strike chance equal to 10% of your critical strike chance.",
  NULL,
  NULL
),

(30146, @locale_en,
  "Summons a Felguard under the command of the Warlock.",
  NULL,
  NULL,
  NULL,
  NULL
),

(63117, @locale_en,
  "Reduces the cooldown of your Demonic Empowerment, Metamorphosis, and Fel Domination spells by 10%.",
  "Reduces the cooldown of your Demonic Empowerment, Metamorphosis, and Fel Domination spells by 10%.",
  "Reduces the cooldown of your Demonic Empowerment, Metamorphosis, and Fel Domination spells by 10%.",
  NULL,
  NULL
),

(47236, @locale_en,
  "Increases your spell damage by 2%, and your pet's criticals apply the Demonic Pact effect to your party or raid members. Demonic Pact increases spell power by 2% of your Spell Damage for 45 sec. This effect has a 20 sec cooldown. Does not work on Enslaved demons.",
  "Increases your spell damage by 2%, and your pet's criticals apply the Demonic Pact effect to your party or raid members. Demonic Pact increases spell power by 2% of your Spell Damage for 45 sec. This effect has a 20 sec cooldown. Does not work on Enslaved demons.",
  "Increases your spell damage by 2%, and your pet's criticals apply the Demonic Pact effect to your party or raid members. Demonic Pact increases spell power by 2% of your Spell Damage for 45 sec. This effect has a 20 sec cooldown. Does not work on Enslaved demons.",
  "Increases your spell damage by 2%, and your pet's criticals apply the Demonic Pact effect to your party or raid members. Demonic Pact increases spell power by 2% of your Spell Damage for 45 sec. This effect has a 20 sec cooldown. Does not work on Enslaved demons.",
  "Increases your spell damage by 2%, and your pet's criticals apply the Demonic Pact effect to your party or raid members. Demonic Pact increases spell power by 2% of your Spell Damage for 45 sec. This effect has a 20 sec cooldown. Does not work on Enslaved demons."
),

(59672, @locale_en,
  "You transform into a Demon for 30 sec.  This form increases your armor by 600%, damage by 20%, reduces the chance you'll be critically hit by melee attacks by 6% and reduces the duration of stun and snare effects by 50%.  You gain some unique demon abilities in addition to your normal abilities. 3 minute cooldown.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17793, @locale_en,
  "Increases the damage done by your Shadow Bolt spell by 2%, and your Shadow Bolt has a 20% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5%. Effect lasts 30 sec.",
  "Increases the damage done by your Shadow Bolt spell by 2%, and your Shadow Bolt has a 20% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5%. Effect lasts 30 sec.",
  "Increases the damage done by your Shadow Bolt spell by 2%, and your Shadow Bolt has a 20% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5%. Effect lasts 30 sec.",
  "Increases the damage done by your Shadow Bolt spell by 2%, and your Shadow Bolt has a 20% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5%. Effect lasts 30 sec.",
  "Increases the damage done by your Shadow Bolt spell by 2%, and your Shadow Bolt has a 20% chance to cause your target to be vulnerable to spell damage, increasing spell critical strike chance against that target by 5%. Effect lasts 30 sec."
),

(17788, @locale_en,
  "Reduces the casting time of your Shadow Bolt. Chaos Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt. Chaos Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt. Chaos Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt. Chaos Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec.",
  "Reduces the casting time of your Shadow Bolt. Chaos Bolt and Immolate spells by 0.1 sec and your Soul Fire spell by 0.4 sec."
),

(18119, @locale_en,
  "Increases the periodic damage done by your Immolate by 3%, and your Conflagrate has a 50% chance to daze the target for 5 sec.",
  "Increases the periodic damage done by your Immolate by 3%, and your Conflagrate has a 50% chance to daze the target for 5 sec.",
  NULL,
  NULL,
  NULL
),

(63349, @locale_en,
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  "Reduces all damage taken by 2%.",
  NULL,
  NULL
),

(17778, @locale_en,
  "Reduces the Mana cost of your Destruction spells by 4%.",
  "Reduces the Mana cost of your Destruction spells by 4%.",
  "Reduces the Mana cost of your Destruction spells by 4%.",
  NULL,
  NULL
),

(18126, @locale_en,
  "Reduces the cooldown of your Succubus' Lash of Pain spell by 3 sec. and reduces the casting time of your Imp's Firebolt spell by 0.25 sec.",
  "Reduces the cooldown of your Succubus' Lash of Pain spell by 3 sec. and reduces the casting time of your Imp's Firebolt spell by 0.25 sec.",
  NULL,
  NULL,
  NULL
),

(17877, @locale_en,
  "Instantly blasts the target for 87 to 99 Shadow damage.  If the target dies within 5 sec of Shadowburn, and yields experience or honor, the caster gains a Soul Shard.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17959, @locale_en,
  "Increases the critical strike damage bonus of your Destruction spells and your Imp's Firebolt spell by 20%.",
  "Increases the critical strike damage bonus of your Destruction spells and your Imp's Firebolt spell by 20%.",
  "Increases the critical strike damage bonus of your Destruction spells and your Imp's Firebolt spell by 20%.",
  "Increases the critical strike damage bonus of your Destruction spells and your Imp's Firebolt spell by 20%.",
  "Increases the critical strike damage bonus of your Destruction spells and your Imp's Firebolt spell by 20%."
),

(18135, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting or channeling any Destruction spell by 35%.",
  "Reduces the pushback suffered from damaging attacks while casting or channeling any Destruction spell by 35%.",
  NULL,
  NULL,
  NULL
),

(17917, @locale_en,
  "Increases the range of your Destruction spells by 10% and reduces threat caused by Destruction spells by 10%.",
  "Increases the range of your Destruction spells by 10% and reduces threat caused by Destruction spells by 10%.",
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

(34935, @locale_en,
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8 sec and will not occur more than once every 8 seconds.",
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8 sec and will not occur more than once every 8 seconds.",
  "Increases your critical strike chance with spells by an additional 1% and gives you a 8% chance when hit by a physical attack to reduce the cast time of your next Shadow Bolt or Incinerate spell by 100%.  This effect lasts 8 sec and will not occur more than once every 8 seconds.",
  NULL,
  NULL
),

(17815, @locale_en,
  "Increases the damage done by your Immolate spell by 10%.",
  "Increases the damage done by your Immolate spell by 10%.",
  "Increases the damage done by your Immolate spell by 10%.",
  NULL,
  NULL
),

(18130, @locale_en,
  "Increases the critical strike chance of your Destruction spells by 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30299, @locale_en,
  "After being hit with a spell, you have a 10% chance to gain Nether Protection, reducing all damage by that spell school by 30% for 8 sec.",
  "After being hit with a spell, you have a 10% chance to gain Nether Protection, reducing all damage by that spell school by 30% for 8 sec.",
  "After being hit with a spell, you have a 10% chance to gain Nether Protection, reducing all damage by that spell school by 30% for 8 sec.",
  NULL,
  NULL
),

(17954, @locale_en,
  "Increases the damage done by your Fire spells by 3% and reduces the cast time of your Incinerate spell by 0.05 sec.",
  "Increases the damage done by your Fire spells by 3% and reduces the cast time of your Incinerate spell by 0.05 sec.",
  "Increases the damage done by your Fire spells by 3% and reduces the cast time of your Incinerate spell by 0.05 sec.",
  "Increases the damage done by your Fire spells by 3% and reduces the cast time of your Incinerate spell by 0.05 sec.",
  "Increases the damage done by your Fire spells by 3% and reduces the cast time of your Incinerate spell by 0.05 sec."
),

(17962, @locale_en,
  "<!--sp56235:0-->Consumes<!--sp56235--> an Immolate or Shadowflame effect on the enemy target to instantly deal damage equal to 60% of your Immolate or Shadowflame, and causes an additional 40% damage over 6 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(30293, @locale_en,
  "Gives your Shadow Bolt, Shadowburn, Chaos Bolt, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  "Gives your Shadow Bolt, Shadowburn, Chaos Bolt, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  "Gives your Shadow Bolt, Shadowburn, Chaos Bolt, Soul Fire, Incinerate, Searing Pain and Conflagrate spells a 10% chance to return health equal to 20% of the damage caused.",
  NULL,
  NULL
),

(18096, @locale_en,
  "When you critically strike with Searing Pain or Conflagrate, your Fire and Shadow spell damage is increased by 2% for 10 sec.",
  "When you critically strike with Searing Pain or Conflagrate, your Fire and Shadow spell damage is increased by 2% for 10 sec.",
  "When you critically strike with Searing Pain or Conflagrate, your Fire and Shadow spell damage is increased by 2% for 10 sec.",
  NULL,
  NULL
),

(30288, @locale_en,
  "Your Shadow Bolt, Shadowburn, Chaos Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt, Shadowburn, Chaos Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt, Shadowburn, Chaos Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt, Shadowburn, Chaos Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects.",
  "Your Shadow Bolt, Shadowburn, Chaos Bolt and Incinerate spells gain an additional 4% of your bonus spell damage effects."
),

(54117, @locale_en,
  "Your Soul Leech effect also restores mana to you and your summoned demon equal to 1% of maximum mana, and has a 50% chance to grant up to 10 party or raid members mana regeneration equal to 1% of maximum mana per 5 sec. Lasts for 15 sec.",
  "Your Soul Leech effect also restores mana to you and your summoned demon equal to 1% of maximum mana, and has a 50% chance to grant up to 10 party or raid members mana regeneration equal to 1% of maximum mana per 5 sec. Lasts for 15 sec.",
  NULL,
  NULL,
  NULL
),

(47258, @locale_en,
  "When you cast Conflagrate, the cast time and global cooldown of your next three Destruction spells is reduced by 10%. Lasts 15 sec.",
  "When you cast Conflagrate, the cast time and global cooldown of your next three Destruction spells is reduced by 10%. Lasts 15 sec.",
  "When you cast Conflagrate, the cast time and global cooldown of your next three Destruction spells is reduced by 10%. Lasts 15 sec.",
  NULL,
  NULL
),

(30283, @locale_en,
  "Shadowfury is unleashed, causing 343 to 407 Shadow damage and stunning all enemies within 8 yds for 3 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(47220, @locale_en,
  "Increases the damage done by your Imp by 10%, and all critical hits done by your Imp have a 33% chance to increase your spell critical hit chance for your next spell by 100%. This effect lasts 8 sec.",
  "Increases the damage done by your Imp by 10%, and all critical hits done by your Imp have a 33% chance to increase your spell critical hit chance for your next spell by 100%. This effect lasts 8 sec.",
  "Increases the damage done by your Imp by 10%, and all critical hits done by your Imp have a 33% chance to increase your spell critical hit chance for your next spell by 100%. This effect lasts 8 sec.",
  NULL,
  NULL
),

(47266, @locale_en,
  "Increases the damage done by your Incinerate and Chaos Bolt spells to targets afflicted by your Immolate by 2%, and the critical strike chance of your Conflagrate spell is increased by 5%.",
  "Increases the damage done by your Incinerate and Chaos Bolt spells to targets afflicted by your Immolate by 2%, and the critical strike chance of your Conflagrate spell is increased by 5%.",
  "Increases the damage done by your Incinerate and Chaos Bolt spells to targets afflicted by your Immolate by 2%, and the critical strike chance of your Conflagrate spell is increased by 5%.",
  "Increases the damage done by your Incinerate and Chaos Bolt spells to targets afflicted by your Immolate by 2%, and the critical strike chance of your Conflagrate spell is increased by 5%.",
  "Increases the damage done by your Incinerate and Chaos Bolt spells to targets afflicted by your Immolate by 2%, and the critical strike chance of your Conflagrate spell is increased by 5%."
),

(50796, @locale_en,
  "Sends a bolt of chaotic fire at the enemy, dealing 837 to 1061 Fire damage. Chaos Bolt cannot be resisted, and pierces through all absorption effects.",
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

(57810, @locale_en,
  "Increases the damage and healing done by your periodic spell damage and healing effects by 1%.",
  "Increases the damage and healing done by your periodic spell damage and healing effects by 1%.",
  "Increases the damage and healing done by your periodic spell damage and healing effects by 1%.",
  "Increases the damage and healing done by your periodic spell damage and healing effects by 1%.",
  "Increases the damage and healing done by your periodic spell damage and healing effects by 1%."
),

(16845, @locale_en,
  "Reduces the Mana cost of your Moonfire, Starfire, Starfall, Wrath, Healing Touch, Nourish, Regrowth and Rejuvenation spells by 3%.",
  "Reduces the Mana cost of your Moonfire, Starfire, Starfall, Wrath, Healing Touch, Nourish, Regrowth and Rejuvenation spells by 3%.",
  "Reduces the Mana cost of your Moonfire, Starfire, Starfall, Wrath, Healing Touch, Nourish, Regrowth and Rejuvenation spells by 3%.",
  NULL,
  NULL
),

(35363, @locale_en,
  "Increases the critical strike chance of your Wrath, Starfire, Starfall, Nourish and Healing Touch spells by 2%.",
  "Increases the critical strike chance of your Wrath, Starfire, Starfall, Nourish and Healing Touch spells by 2%.",
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
  "Damage from your Thorns and Entangling Roots increased by 25% and damage done by your Treants increased by 5%. In addition, damage from your Treants and attacks done to you while you have Barkskin active have a 5% chance to daze the target for 3 sec.",
  "Damage from your Thorns and Entangling Roots increased by 25% and damage done by your Treants increased by 5%. In addition, damage from your Treants and attacks done to you while you have Barkskin active have a 5% chance to daze the target for 3 sec.",
  "Damage from your Thorns and Entangling Roots increased by 25% and damage done by your Treants increased by 5%. In addition, damage from your Treants and attacks done to you while you have Barkskin active have a 5% chance to daze the target for 3 sec.",
  NULL,
  NULL
),

(16880, @locale_en,
  "All non-periodic spell criticals have a 33% chance to grace you with a blessing of nature, increasing your spell casting speed by 20% for 3 sec.",
  "All non-periodic spell criticals have a 33% chance to grace you with a blessing of nature, increasing your spell casting speed by 20% for 3 sec.",
  "All non-periodic spell criticals have a 33% chance to grace you with a blessing of nature, increasing your spell casting speed by 20% for 3 sec.",
  NULL,
  NULL
),

(57865, @locale_en,
  "Increases the duration of your Moonfire and Rejuvenation spells by 3 sec, your Regrowth spell by 6 sec, and your Insect Swarm and Lifebloom spells by 2 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(16819, @locale_en,
  "Increases the range of your Balance spells and Faerie Fire (Feral) ability by 10%, and reduces the threat generated by your Balance spells by 15%.",
  "Increases the range of your Balance spells and Faerie Fire (Feral) ability by 10%, and reduces the threat generated by your Balance spells by 15%.",
  NULL,
  NULL,
  NULL
),

(16909, @locale_en,
  "Increases the critical strike damage bonus of your Starfire, Starfall, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Starfall, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Starfall, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Starfall, Moonfire, and Wrath spells by 20%.",
  "Increases the critical strike damage bonus of your Starfire, Starfall, Moonfire, and Wrath spells by 20%."
),

(16850, @locale_en,
  "Reduces the pushback suffered from damaging attacks while casting Starfire, Hibernate and Hurricane by 23% and increases your total spell haste by 1%.",
  "Reduces the pushback suffered from damaging attacks while casting Starfire, Hibernate and Hurricane by 23% and increases your total spell haste by 1%.",
  "Reduces the pushback suffered from damaging attacks while casting Starfire, Hibernate and Hurricane by 23% and increases your total spell haste by 1%.",
  NULL,
  NULL
),

(33589, @locale_en,
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect.",
  "Increases your spell power by 4% of your total Intellect.",
  NULL,
  NULL
),

(5570, @locale_en,
  "The enemy target is swarmed by insects, decreasing their chance to hit by 3% and causing 144 Nature damage over 12 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(57849, @locale_en,
  "Increases your damage done by your Wrath spell to targets afflicted by your Insect Swarm by 1%, and increases the critical strike chance of your Starfire spell by 1% on targets afflicted by your Moonfire spell.",
  "Increases your damage done by your Wrath spell to targets afflicted by your Insect Swarm by 1%, and increases the critical strike chance of your Starfire spell by 1% on targets afflicted by your Moonfire spell.",
  "Increases your damage done by your Wrath spell to targets afflicted by your Insect Swarm by 1%, and increases the critical strike chance of your Starfire spell by 1% on targets afflicted by your Moonfire spell.",
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

(16896, @locale_en,
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 3%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 3%.",
  "Increases the damage done by your Starfire, Moonfire and Wrath spells by 3%.",
  NULL,
  NULL
),

(33592, @locale_en,
  "Increases your chance to hit with all spells by 2% and reduces your damage taken from all spells by 3%.",
  "Increases your chance to hit with all spells by 2% and reduces your damage taken from all spells by 3%.",
  NULL,
  NULL,
  NULL
),

(24858, @locale_en,
  "Shapeshift into Moonkin Form.  While in this form the armor contribution from items is increased by 370%, damage taken while stunned is reduced by 15%, and all party and raid members within 100 yards have their spell critical chance increased by 5%.  Single target spell critical strikes in this form have a chance to instantly regenerate 2% of your total mana.  The Moonkin can not cast healing or resurrection spells while shapeshifted.<br /><br />The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48384, @locale_en,
  "Your Moonkin Aura also causes affected targets to gain 1% haste and you to gain 10% of your spirit as additional spell damage.",
  "Your Moonkin Aura also causes affected targets to gain 1% haste and you to gain 10% of your spirit as additional spell damage.",
  "Your Moonkin Aura also causes affected targets to gain 1% haste and you to gain 10% of your spirit as additional spell damage.",
  NULL,
  NULL
),

(33600, @locale_en,
  "Your Faerie Fire spell also increases the chance the target will be hit by spell attacks by 1%, and increases the critical strike chance of your damage spells by 1% on targets afflicted by Faerie Fire.",
  "Your Faerie Fire spell also increases the chance the target will be hit by spell attacks by 1%, and increases the critical strike chance of your damage spells by 1% on targets afflicted by Faerie Fire.",
  "Your Faerie Fire spell also increases the chance the target will be hit by spell attacks by 1%, and increases the critical strike chance of your damage spells by 1% on targets afflicted by Faerie Fire.",
  NULL,
  NULL
),

(48389, @locale_en,
  "Attacks done to you while in Moonkin form have a 5% chance to cause you to go into a Frenzy, increasing your damage by 10%, cause you to be immune to pushback while casting Balance spells and restore 2% base mana every 2 sec. Lasts 10 sec.",
  "Attacks done to you while in Moonkin form have a 5% chance to cause you to go into a Frenzy, increasing your damage by 10%, cause you to be immune to pushback while casting Balance spells and restore 2% base mana every 2 sec. Lasts 10 sec.",
  "Attacks done to you while in Moonkin form have a 5% chance to cause you to go into a Frenzy, increasing your damage by 10%, cause you to be immune to pushback while casting Balance spells and restore 2% base mana every 2 sec. Lasts 10 sec.",
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

(48516, @locale_en,
  "When you critically hit with Starfire, you have a 33% chance of increasing damage done by Wrath by 40%. When you critically hit with Wrath, you have a 20% chance of increasing your critical strike chance with Starfire by 40%. Each effect lasts 15 sec and each has a separate 30 sec cooldown.  Both effects cannot occur simultaneously.",
  "When you critically hit with Starfire, you have a 33% chance of increasing damage done by Wrath by 40%. When you critically hit with Wrath, you have a 20% chance of increasing your critical strike chance with Starfire by 40%. Each effect lasts 15 sec and each has a separate 30 sec cooldown.  Both effects cannot occur simultaneously.",
  "When you critically hit with Starfire, you have a 33% chance of increasing damage done by Wrath by 40%. When you critically hit with Wrath, you have a 20% chance of increasing your critical strike chance with Starfire by 40%. Each effect lasts 15 sec and each has a separate 30 sec cooldown.  Both effects cannot occur simultaneously.",
  NULL,
  NULL
),

(50516, @locale_en,
  "You summon a violent Typhoon that does 400 Nature damage when in contact with hostile targets, knocking them back and dazing them for 6 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33831, @locale_en,
  "Summons 3 treants to attack enemy targets for 30 sec.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48488, @locale_en,
  "Increases damage done by your Hurricane and Typhoon spells by 15%, and increases the range of your Cyclone spell by 2 yards.",
  "Increases damage done by your Hurricane and Typhoon spells by 15%, and increases the range of your Cyclone spell by 2 yards.",
  NULL,
  NULL,
  NULL
),

(48506, @locale_en,
  "Your Wrath and Starfire spells have a 100% chance to apply the Earth and Moon effect, which increases spell damage taken by 4% for 12 sec.  Also increases your spell damage by 2%.",
  "Your Wrath and Starfire spells have a 100% chance to apply the Earth and Moon effect, which increases spell damage taken by 4% for 12 sec.  Also increases your spell damage by 2%.",
  "Your Wrath and Starfire spells have a 100% chance to apply the Earth and Moon effect, which increases spell damage taken by 4% for 12 sec.  Also increases your spell damage by 2%.",
  NULL,
  NULL
),

(48505, @locale_en,
  "You summon a flurry of stars from the sky on all targets within 30 yards of the caster, each dealing 145 to 167 Arcane damage. Also causes 26 Arcane damage to all other enemies within 5 yards of the enemy target. Maximum 20 stars. Lasts 10 sec.  Shapeshifting into an animal form or mounting cancels the effect. Any effect which causes you to lose control of your character will suppress the starfall effect.",
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
  "Increases the damage done by your Swipe ability by 10% and reduces the chance enemies have to detect you while Prowling.",
  "Increases the damage done by your Swipe ability by 10% and reduces the chance enemies have to detect you while Prowling.",
  "Increases the damage done by your Swipe ability by 10% and reduces the chance enemies have to detect you while Prowling.",
  NULL,
  NULL
),

(16998, @locale_en,
  "Increases the damage caused by your Claw, Rake, Mangle (Cat), Mangle (Bear), and Maul abilities by 10%.",
  "Increases the damage caused by your Claw, Rake, Mangle (Cat), Mangle (Bear), and Maul abilities by 10%.",
  NULL,
  NULL,
  NULL
),

(16929, @locale_en,
  "Increases your Armor contribution from cloth and leather items by 4%.",
  "Increases your Armor contribution from cloth and leather items by 4%.",
  "Increases your Armor contribution from cloth and leather items by 4%.",
  NULL,
  NULL
),

(17002, @locale_en,
  "Increases your movement speed by 15% in Cat Form and increases your chance to dodge while in Cat Form, Bear Form and Dire Bear Form by 2%.",
  "Increases your movement speed by 15% in Cat Form and increases your chance to dodge while in Cat Form, Bear Form and Dire Bear Form by 2%.",
  NULL,
  NULL,
  NULL
),

(61336, @locale_en,
  "When activated, this ability temporarily grants you 30% of your maximum health for 20 sec while in Bear Form, Cat Form, or Dire Bear Form.  After the effect expires, the health is lost.",
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
  "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 50% of your level and 7% of any attack power on your equipped weapon.  In addition, your finishing moves have a 7% chance per combo point to make your next Nature spell with a base casting time less than 10 sec. become an instant cast spell.",
  "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 50% of your level and 7% of any attack power on your equipped weapon.  In addition, your finishing moves have a 7% chance per combo point to make your next Nature spell with a base casting time less than 10 sec. become an instant cast spell.",
  "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 50% of your level and 7% of any attack power on your equipped weapon.  In addition, your finishing moves have a 7% chance per combo point to make your next Nature spell with a base casting time less than 10 sec. become an instant cast spell.",
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

(48409, @locale_en,
  "Increases your expertise by 5, and you are refunded 40% of the energy cost of a finishing move if it fails to land.",
  "Increases your expertise by 5, and you are refunded 40% of the energy cost of a finishing move if it fails to land.",
  NULL,
  NULL,
  NULL
),

(16940, @locale_en,
  "Increases the stun duration of your Bash and Pounce abilities by 0.5 sec and decreases the cooldown of Bash by 15 sec.",
  "Increases the stun duration of your Bash and Pounce abilities by 0.5 sec and decreases the cooldown of Bash by 15 sec.",
  NULL,
  NULL,
  NULL
),

(49377, @locale_en,
  "Teaches Feral Charge (Bear) and Feral Charge (Cat).<br /><br />Feral Charge (Bear) - Causes you to charge an enemy, immobilizing and interrupting any spell being cast for 4 sec. This ability can be used in Bear Form and Dire Bear Form. 15 second cooldown.<br /><br />Feral Charge (Cat) - Causes you to leap behind an enemy, dazing them for 3 sec. 30 second cooldown.",
  NULL,
  NULL,
  NULL,
  NULL
),

(33872, @locale_en,
  "Increases your healing spells by up to 35% of your Agility, and increases healing done to you by 10% while in Cat form.",
  "Increases your healing spells by up to 35% of your Agility, and increases healing done to you by 10% while in Cat form.",
  NULL,
  NULL,
  NULL
),

(57878, @locale_en,
  "Increases your dodge while in Bear Form or Dire Bear Form by 2%, and you regenerate 1 rage every time you dodge while in Bear Form or Dire Bear Form.",
  "Increases your dodge while in Bear Form or Dire Bear Form by 2%, and you regenerate 1 rage every time you dodge while in Bear Form or Dire Bear Form.",
  "Increases your dodge while in Bear Form or Dire Bear Form by 2%, and you regenerate 1 rage every time you dodge while in Bear Form or Dire Bear Form.",
  NULL,
  NULL
),

(17003, @locale_en,
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 2% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 2% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 2% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 2% and while in Cat Form your attack power is increased by 2%.",
  "Increases your Intellect by 4%.  In addition, while in Bear or Dire Bear Form your Stamina is increased by 2% and while in Cat Form your attack power is increased by 2%."
),

(33853, @locale_en,
  "Increases all attributes by 2%, reduces the chance you'll be critically hit by melee attacks by 2%, and increases your armor contribution from cloth and leather items in Bear Form and Dire Bear Form by 11%.",
  "Increases all attributes by 2%, reduces the chance you'll be critically hit by melee attacks by 2%, and increases your armor contribution from cloth and leather items in Bear Form and Dire Bear Form by 11%.",
  "Increases all attributes by 2%, reduces the chance you'll be critically hit by melee attacks by 2%, and increases your armor contribution from cloth and leather items in Bear Form and Dire Bear Form by 11%.",
  NULL,
  NULL
),

(17007, @locale_en,
  "While in Cat, Bear or Dire Bear Form, the Leader of the Pack increases ranged and melee critical chance of all party and raid members within 100 yards by 5%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(34297, @locale_en,
  "Your Leader of the Pack ability also causes affected targets to heal themselves for 2% of their total health when they critically hit with a melee or ranged attack.  The healing effect cannot occur more than once every 6 sec.  In addition, you gain 4% of your maximum mana when you benefit from this heal.",
  "Your Leader of the Pack ability also causes affected targets to heal themselves for 2% of their total health when they critically hit with a melee or ranged attack.  The healing effect cannot occur more than once every 6 sec.  In addition, you gain 4% of your maximum mana when you benefit from this heal.",
  NULL,
  NULL,
  NULL
),

(33851, @locale_en,
  "Reduces the duration of fear effects by 10%, reduces all damage taken while stunned by 10% while in Cat Form.",
  "Reduces the duration of fear effects by 10%, reduces all damage taken while stunned by 10% while in Cat Form.",
  "Reduces the duration of fear effects by 10%, reduces all damage taken while stunned by 10% while in Cat Form.",
  NULL,
  NULL
),

(57873, @locale_en,
  "Increases your attack power by 2% and reduces the damage you take by 4%, while in Bear or Dire Bear Form.",
  "Increases your attack power by 2% and reduces the damage you take by 4%, while in Bear or Dire Bear Form.",
  "Increases your attack power by 2% and reduces the damage you take by 4%, while in Bear or Dire Bear Form.",
  NULL,
  NULL
),

(33859, @locale_en,
  "While in Cat Form increases your damage from melee critical strikes by 3% and reduces the damage taken from area of effect attacks by 10%.",
  "While in Cat Form increases your damage from melee critical strikes by 3% and reduces the damage taken from area of effect attacks by 10%.",
  "While in Cat Form increases your damage from melee critical strikes by 3% and reduces the damage taken from area of effect attacks by 10%.",
  NULL,
  NULL
),

(48483, @locale_en,
  "Your Shred, Maul, and Mangle attacks cause an Infected Wound in the target. The Infected Wound reduces the movement speed of the target by 16% and the attack speed by 6%. Lasts 12 sec.",
  "Your Shred, Maul, and Mangle attacks cause an Infected Wound in the target. The Infected Wound reduces the movement speed of the target by 16% and the attack speed by 6%. Lasts 12 sec.",
  "Your Shred, Maul, and Mangle attacks cause an Infected Wound in the target. The Infected Wound reduces the movement speed of the target by 16% and the attack speed by 6%. Lasts 12 sec.",
  NULL,
  NULL
),

(48492, @locale_en,
  "While using your Enrage ability in Bear Form or Dire Bear Form, your damage is increased by 5%, and your Tiger's Fury ability also instantly restores 20 energy.  In addition, the mana cost of Bear Form, Cat Form, and Dire Bear Form is reduced by 20%.",
  "While using your Enrage ability in Bear Form or Dire Bear Form, your damage is increased by 5%, and your Tiger's Fury ability also instantly restores 20 energy.  In addition, the mana cost of Bear Form, Cat Form, and Dire Bear Form is reduced by 20%.",
  "While using your Enrage ability in Bear Form or Dire Bear Form, your damage is increased by 5%, and your Tiger's Fury ability also instantly restores 20 energy.  In addition, the mana cost of Bear Form, Cat Form, and Dire Bear Form is reduced by 20%.",
  NULL,
  NULL
),

(33917, @locale_en,
  "Mangle the target, inflicting damage and causing the target to take additional damage from bleed effects for 1 min.  This ability can be used in Cat Form or Dire Bear Form.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48532, @locale_en,
  "Reduces the cooldown of your Mangle (Bear) ability by 0.5 sec., and reduces the energy cost of your Mangle (Cat) ability by 2.",
  "Reduces the cooldown of your Mangle (Bear) ability by 0.5 sec., and reduces the energy cost of your Mangle (Cat) ability by 2.",
  "Reduces the cooldown of your Mangle (Bear) ability by 0.5 sec., and reduces the energy cost of your Mangle (Cat) ability by 2.",
  NULL,
  NULL
),

(48432, @locale_en,
  "Increases damage done by your Maul and Shred attacks on bleeding targets by 4%, and increases the critical strike chance of your Ferocious Bite ability on bleeding targets by 5%.",
  "Increases damage done by your Maul and Shred attacks on bleeding targets by 4%, and increases the critical strike chance of your Ferocious Bite ability on bleeding targets by 5%.",
  "Increases damage done by your Maul and Shred attacks on bleeding targets by 4%, and increases the critical strike chance of your Ferocious Bite ability on bleeding targets by 5%.",
  "Increases damage done by your Maul and Shred attacks on bleeding targets by 4%, and increases the critical strike chance of your Ferocious Bite ability on bleeding targets by 5%.",
  "Increases damage done by your Maul and Shred attacks on bleeding targets by 4%, and increases the critical strike chance of your Ferocious Bite ability on bleeding targets by 5%."
),

(63503, @locale_en,
  "Grants the periodic damage from your Lacerate and Rip abilities the ability to critically hit.",
  NULL,
  NULL,
  NULL,
  NULL
),

(50334, @locale_en,
  "When activated, this ability causes your Mangle (Bear) ability to hit up to 3 targets and have no cooldown, and reduces the energy cost of all your Cat Form abilities by 50%.  Lasts 15 sec.  You cannot use Tiger's Fury while Berserk is active. <br /><br />Clears the effect of Fear and makes you immune to Fear for the duration.",
  NULL,
  NULL,
  NULL,
  NULL
),

(17050, @locale_en,
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 20%, and increases all of your total attributes by 1%.",
  "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 20%, and increases all of your total attributes by 1%.",
  NULL,
  NULL,
  NULL
),

(17063, @locale_en,
  "Reduces the pushback suffered from damaging attacks  while casting Healing Touch, Wrath, Entangling Roots, Cyclone, Nourish, Regrowth and Tranquility by 23%.",
  "Reduces the pushback suffered from damaging attacks  while casting Healing Touch, Wrath, Entangling Roots, Cyclone, Nourish, Regrowth and Tranquility by 23%.",
  "Reduces the pushback suffered from damaging attacks  while casting Healing Touch, Wrath, Entangling Roots, Cyclone, Nourish, Regrowth and Tranquility by 23%.",
  NULL,
  NULL
),

(17056, @locale_en,
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form, and you keep up to 20 of your Energy when you shapeshift into Cat Form, and increases your total Intellect while in Moonkin form by 2%.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form, and you keep up to 20 of your Energy when you shapeshift into Cat Form, and increases your total Intellect while in Moonkin form by 2%.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form, and you keep up to 20 of your Energy when you shapeshift into Cat Form, and increases your total Intellect while in Moonkin form by 2%.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form, and you keep up to 20 of your Energy when you shapeshift into Cat Form, and increases your total Intellect while in Moonkin form by 2%.",
  "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form, and you keep up to 20 of your Energy when you shapeshift into Cat Form, and increases your total Intellect while in Moonkin form by 2%."
),

(17069, @locale_en,
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%.",
  "Reduces the cast time of your Healing Touch spell by 0.1 sec and increases the damage you deal with physical attacks in all forms by 2%."
),

(17118, @locale_en,
  "Reduces the threat generated by your restoration spells by 10% and reduces the chance your helpful spells, Moonfire, and Insect Swarm will be dispelled by 10%.",
  "Reduces the threat generated by your restoration spells by 10% and reduces the chance your helpful spells, Moonfire, and Insect Swarm will be dispelled by 10%.",
  "Reduces the threat generated by your restoration spells by 10% and reduces the chance your helpful spells, Moonfire, and Insect Swarm will be dispelled by 10%.",
  NULL,
  NULL
),

(16833, @locale_en,
  "Reduces the mana cost of all shapeshifting by 10%.",
  "Reduces the mana cost of all shapeshifting by 10%.",
  "Reduces the mana cost of all shapeshifting by 10%.",
  NULL,
  NULL
),

(17106, @locale_en,
  "Allows 17% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  "Allows 17% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  "Allows 17% of your Mana regeneration to continue while casting and causes your Enrage ability to instantly generate 4 rage.",
  NULL,
  NULL
),

(16864, @locale_en,
  "Each of the Druid's damage, healing spells and auto attacks has a chance of causing the caster to enter a Clearcasting state.  The Clearcasting state reduces the Mana, Rage or Energy cost of your next damage, healing spell or offensive ability by 100%.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48411, @locale_en,
  "Grants an effect which lasts while the Druid is within the respective shapeshift form.<br /><br />Bear Form - Increases physical damage by 2%.<br /><br />Cat Form - Increases critical strike chance by 2%.<br /><br />Moonkin Form - Increases spell damage by 2%.<br /><br />Tree of Life Form - Increases healing by 2%.",
  "Grants an effect which lasts while the Druid is within the respective shapeshift form.<br /><br />Bear Form - Increases physical damage by 2%.<br /><br />Cat Form - Increases critical strike chance by 2%.<br /><br />Moonkin Form - Increases spell damage by 2%.<br /><br />Tree of Life Form - Increases healing by 2%.",
  NULL,
  NULL,
  NULL
),

(24968, @locale_en,
  "Reduces the mana cost of your Healing Touch, Nourish and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch, Nourish and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch, Nourish and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch, Nourish and Tranquility spells by 2%.",
  "Reduces the mana cost of your Healing Touch, Nourish and Tranquility spells by 2%."
),

(17111, @locale_en,
  "Increases the effect of your Rejuvenation spell by 5%.",
  "Increases the effect of your Rejuvenation spell by 5%.",
  "Increases the effect of your Rejuvenation spell by 5%.",
  NULL,
  NULL
),

(17116, @locale_en,
  "When activated, your next Nature spell with a base casting time less than 10 sec. becomes an instant cast spell.",
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
  "Reduces threat caused by Tranquility by 50%, and reduces the cooldown by 30%.",
  "Reduces threat caused by Tranquility by 50%, and reduces the cooldown by 30%.",
  NULL,
  NULL,
  NULL
),

(33879, @locale_en,
  "Your Healing Touch spell gains an additional 20% and your Nourish spell gains an additional 10% of your bonus healing effects.",
  "Your Healing Touch spell gains an additional 20% and your Nourish spell gains an additional 10% of your bonus healing effects.",
  NULL,
  NULL,
  NULL
),

(17074, @locale_en,
  "Increases the critical effect chance of your Regrowth and Nourish spells by 5%.",
  "Increases the critical effect chance of your Regrowth and Nourish spells by 5%.",
  "Increases the critical effect chance of your Regrowth and Nourish spells by 5%.",
  "Increases the critical effect chance of your Regrowth and Nourish spells by 5%.",
  "Increases the critical effect chance of your Regrowth and Nourish spells by 5%."
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
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8 sec.",
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8 sec.",
  "Your critical strike chance with all spells is increased by 1% and critical strikes against you give you the Natural Perfection effect reducing all damage taken by 2%.  Stacks up to 3 times.  Lasts 8 sec.",
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

(48496, @locale_en,
  "When you critically heal your target with Swiftmend, Regrowth, Nourish or Healing Touch spell you have a 33% chance to plant a Living Seed on the target for 30% of the amount healed. The Living Seed will bloom when the target is next attacked. Lasts 15 sec.",
  "When you critically heal your target with Swiftmend, Regrowth, Nourish or Healing Touch spell you have a 33% chance to plant a Living Seed on the target for 30% of the amount healed. The Living Seed will bloom when the target is next attacked. Lasts 15 sec.",
  "When you critically heal your target with Swiftmend, Regrowth, Nourish or Healing Touch spell you have a 33% chance to plant a Living Seed on the target for 30% of the amount healed. The Living Seed will bloom when the target is next attacked. Lasts 15 sec.",
  NULL,
  NULL
),

(48539, @locale_en,
  "Your Rejuvenation and Wild Growth spells have a 5% chance to restore 8 Energy, 4 Rage, 1% Mana or 16 Runic Power per tick.",
  "Your Rejuvenation and Wild Growth spells have a 5% chance to restore 8 Energy, 4 Rage, 1% Mana or 16 Runic Power per tick.",
  "Your Rejuvenation and Wild Growth spells have a 5% chance to restore 8 Energy, 4 Rage, 1% Mana or 16 Runic Power per tick.",
  NULL,
  NULL
),

(65139, @locale_en,
  "Reduces the mana cost of your healing over time spells by 20% and grants the ability to shapeshift into the Tree of Life. While in this form you increase healing received by 6% for all party and raid members within 100 yards, and you can only cast Restoration spells in addition to Innervate, Barkskin, Nature's Grasp and Thorns spells.<br /><br />The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.",
  NULL,
  NULL,
  NULL,
  NULL
),

(48535, @locale_en,
  "Increases your armor contribution from items while in Tree of Life Form by 67%, and increases your healing spell power by 5% of your spirit while in Tree of Life Form.",
  "Increases your armor contribution from items while in Tree of Life Form by 67%, and increases your healing spell power by 5% of your spirit while in Tree of Life Form.",
  "Increases your armor contribution from items while in Tree of Life Form by 67%, and increases your healing spell power by 5% of your spirit while in Tree of Life Form.",
  NULL,
  NULL
),

(63410, @locale_en,
  "Grants 80% additional armor contribution from cloth and leather items while in Travel Form or while not shapeshifted, increases the damage reduction granted by your Barkskin spell by 5% and reduces the chance your Barkskin is dispelled by 35%.",
  "Grants 80% additional armor contribution from cloth and leather items while in Travel Form or while not shapeshifted, increases the damage reduction granted by your Barkskin spell by 5% and reduces the chance your Barkskin is dispelled by 35%.",
  NULL,
  NULL,
  NULL
),

(51179, @locale_en,
  "Increases your total spell haste by 2% and reduces the base cooldown of your Lifebloom spell by 2%.",
  "Increases your total spell haste by 2% and reduces the base cooldown of your Lifebloom spell by 2%.",
  "Increases your total spell haste by 2% and reduces the base cooldown of your Lifebloom spell by 2%.",
  "Increases your total spell haste by 2% and reduces the base cooldown of your Lifebloom spell by 2%.",
  "Increases your total spell haste by 2% and reduces the base cooldown of your Lifebloom spell by 2%."
),

(48438, @locale_en,
  "Heals up to 5 friendly party or raid members within 15 yards of the target for 686 over 7 sec. The amount healed is applied quickly at first, and slows down as the Wild Growth reaches its full duration.",
  NULL,
  NULL,
  NULL,
  NULL
);

/************ ARROW DEPENDENCIES *************/
INSERT INTO `dependency`(`tree_id`, `tier_pos`, `talent_pos`, `alignment`, `justify`, `combined`, `range`, `dependency`) VALUES
(@deathknight_tree_1, 2, 0, "vertical", NULL, 0, 1, 1942),
(@deathknight_tree_1, 2, 1, "vertical", NULL, 0, 3, 1944),
(@deathknight_tree_2, 0, 0, "vertical", NULL, 0, 2, 2042),
(@deathknight_tree_2, 2, 0, "vertical", NULL, 0, 3, 2223),
(@deathknight_tree_3, 3, 3, "vertical", NULL, 0, 2, 1984),
(@deathknight_tree_3, 5, 1, "vertical", NULL, 0, 1, 2221),
(@deathknight_tree_3, 5, 3, "vertical", NULL, 0, 1, 2085),
(@deathknight_tree_3, 7, 1, "vertical", NULL, 0, 1, 2043),

(@druid_tree_1, 1, 1, "vertical", NULL, 0, 1, 789), -- done
(@druid_tree_1, 1, 1, "vertical", "right", 1, 1, 2240), -- done
(@druid_tree_1, 1, 1, "plain", "right", 0, 1, 2240), -- done
(@druid_tree_1, 4, 1, "horizontal", "right", 0, 0, 2239),-- done
(@druid_tree_1, 6, 1, "horizontal", "right", 0, 0, 1912), -- done
(@druid_tree_1, 6, 1, "vertical", "left", 1, 1, 1913), -- done
(@druid_tree_1, 6, 1, "plain", "left", 0, 1, 1913), -- done
(@druid_tree_1, 6, 1, "vertical", NULL, 0, 2, 1923), -- done
(@druid_tree_2, 2, 2, "vertical", "right", 1, 1, 1914), -- done
(@druid_tree_2, 2, 2, "plain", "right", 0, 1, 1914), -- done
(@druid_tree_2, 2, 2, "vertical", NULL, 0, 1, 801), -- done
(@druid_tree_2, 3, 1, "vertical", NULL, 0, 2, 808), -- done
(@druid_tree_2, 6, 1, "horizontal", "right", 0, 0, 1798), -- done
(@druid_tree_2, 6, 1, "vertical", "left", 1, 1, 2241), -- done
(@druid_tree_2, 6, 1, "plain", "left", 0, 1, 2241), -- done
(@druid_tree_2, 6, 1, "vertical", NULL, 0, 2, 1796), -- done
(@druid_tree_2, 8, 1, "horizontal", "right", 0, 0, 1920), -- done
(@druid_tree_2, 9, 1, "horizontal", "right", 0, 0, 2266), -- done
(@druid_tree_3, 1, 2, "vertical", NULL, 0, 1, 1915), -- done
(@druid_tree_3, 2, 0, "vertical", NULL, 0, 2, 831), -- done
(@druid_tree_3, 3, 2, "vertical", NULL, 0, 2, 825), -- done
(@druid_tree_3, 4, 1, "vertical", NULL, 0, 2, 844), -- done
(@druid_tree_3, 7, 1, "vertical", NULL, 0, 1, 1791), -- done
(@druid_tree_3, 8, 1, "horizontal", "right", 0, 0, 1930), -- done
(@druid_tree_3, 8, 1, "vertical", NULL, 0, 2, 1917), -- done

(@hunter_tree_1, 3, 2, "vertical", NULL, 0, 2, 1397),
(@hunter_tree_1, 4, 1, "vertical", NULL, 0, 2, 1386),
(@hunter_tree_1, 6, 0, "vertical", NULL, 0, 1, 2136),
(@hunter_tree_1, 6, 1, "vertical", NULL, 0, 2, 1803),
(@hunter_tree_1, 7, 2, "vertical", NULL, 0, 1, 2137),
(@hunter_tree_2, 1, 2, "vertical", NULL, 0, 1, 1345),
(@hunter_tree_2, 4, 1, "vertical", NULL, 0, 2, 1361),
(@hunter_tree_2, 4, 2, "vertical", NULL, 0, 2, 1821),
(@hunter_tree_2, 7, 1, "vertical", NULL, 0, 1, 1808),
(@hunter_tree_3, 2, 0, "vertical", NULL, 0, 2, 2228),
(@hunter_tree_3, 3, 2, "vertical", NULL, 0, 2, 1312),
(@hunter_tree_3, 4, 1, "vertical", NULL, 0, 2, 1325),
(@hunter_tree_3, 5, 0, "vertical", NULL, 0, 1, 1812),
(@hunter_tree_3, 6, 1, "vertical", NULL, 0, 1, 2141),
(@hunter_tree_3, 6, 2, "vertical", NULL, 0, 3, 2144),
(@hunter_tree_3, 8, 1, "vertical", NULL, 0, 2, 2145),

(@mage_tree_1, 4, 1,"vertical", NULL, 0, 1, 421),
(@mage_tree_1, 4, 1, "vertical", NULL, 1, 1, 1725),
(@mage_tree_1, 4, 1, "plain", "right", 0, 1, 1725),
(@mage_tree_1, 5, 1, "vertical", NULL, 0, 1, 87),
(@mage_tree_1, 6, 1, "vertical", NULL, 0, 1, 1843),
(@mage_tree_2, 2, 2, "vertical", NULL, 0, 2, 32),
(@mage_tree_2, 4, 3, "vertical", NULL, 0, 2, 36),
(@mage_tree_2, 6, 1, "vertical", NULL, 0, 2, 1735),
(@mage_tree_2, 8, 1, "horizontal", "left", 0, 0, 1849),
(@mage_tree_3, 4, 1, "vertical", NULL, 1, 1, 1737),
(@mage_tree_3, 4, 1, "plain", "left", 0, 1, 1737),
(@mage_tree_3, 4, 1, "vertical", NULL, 0, 2, 71),
(@mage_tree_3, 6, 1, "horizontal", "left", 0, 0, 2214),
(@mage_tree_3, 8, 1, "horizontal", "right", 0, 0, 1855),

(@paladin_tree_1, 2, 1, "vertical", NULL, 0, 2, 1433),
(@paladin_tree_1, 4, 1, "vertical", NULL, 0, 2, 1502),
(@paladin_tree_1, 6, 1, "vertical", NULL, 0, 3, 2193),
(@paladin_tree_2, 2, 0, "vertical", NULL, 0, 1, 2281),
(@paladin_tree_2, 4, 1, "vertical", NULL, 0, 2, 1430),
(@paladin_tree_2, 6, 1, "vertical", NULL, 0, 2, 1754),
(@paladin_tree_2, 8, 1, "vertical", NULL, 0, 1, 2204),
(@paladin_tree_3, 2, 1, "vertical", NULL, 0, 3, 1402),
(@paladin_tree_3, 6, 1, "vertical", NULL, 0, 1, 1759),

(@priest_tree_1, 2, 2, "vertical", NULL, 0, 2, 351),
(@priest_tree_1, 4, 1, "vertical", NULL, 0, 2, 322),
(@priest_tree_2, 1, 2, "vertical", NULL, 0, 2, 403),
(@priest_tree_2, 4, 1, "vertical", NULL, 0, 2, 1637),
(@priest_tree_3, 0, 0, "horizontal", "right", 0, 0, 2027),
(@priest_tree_3, 2, 0, "vertical", NULL, 0, 2, 541),
(@priest_tree_3, 4, 1, "horizontal", "right", 0, 0, 1638),
(@priest_tree_3, 4, 1, "vertical", NULL, 0, 2, 521),
(@priest_tree_3, 6, 1, "vertical", NULL, 1, 1, 1906),
(@priest_tree_3, 6, 1, "plain", "left", 0, 1, 1906),
(@priest_tree_3, 6, 1, "vertical", NULL, 0, 2, 1779),
(@priest_tree_3, 8, 1, "vertical", NULL, 0, 2, 1910),

(@rogue_tree_1, 0, 2, "vertical", NULL, 0, 2, 269),
(@rogue_tree_1, 4, 1, "vertical", NULL, 0, 1, 283),
(@rogue_tree_1, 6, 1, "vertical", NULL, 0, 2, 1719),
(@rogue_tree_2, 0, 2, "vertical", NULL, 0, 2, 182),
(@rogue_tree_2, 1, 1, "vertical", NULL, 0, 1, 301),
(@rogue_tree_2, 4, 1, "vertical", NULL, 0, 1, 1703),
(@rogue_tree_2, 6, 1, "vertical", NULL, 0, 2, 1709),
(@rogue_tree_3, 2, 2, "vertical", NULL, 1, 2, 681),
(@rogue_tree_3, 2, 2, "plain", "right", 0, 2, 681),
(@rogue_tree_3, 4, 1, "vertical", NULL, 0, 2, 381),
(@rogue_tree_3, 6, 1, "vertical", NULL, 0, 1, 1712),

(@shaman_tree_1, 2, 1, "vertical", NULL, 0, 2, 562),
(@shaman_tree_1, 2, 2, "vertical", NULL, 0, 3, 721),
(@shaman_tree_1, 4, 1, "vertical", NULL, 0, 2, 573),
(@shaman_tree_1, 6, 1, "vertical", NULL, 0, 1, 2049),
(@shaman_tree_2, 1, 1, "vertical", NULL, 0, 2, 602),
(@shaman_tree_2, 4, 1, "vertical", NULL, 0, 2, 1690),
(@shaman_tree_2, 6, 1, "vertical", NULL, 0, 1, 2249),
(@shaman_tree_2, 6, 1, "horizontal", "left", 0, 0, 1692),
(@shaman_tree_2, 6, 2, "vertical", NULL, 0, 1, 2054),
(@shaman_tree_3, 3, 1, "vertical", NULL, 0, 3, 590),
(@shaman_tree_3, 5, 2, "vertical", NULL, 0, 1, 2084),
(@shaman_tree_3, 8, 1, "horizontal", "right", 0, 0, 2059),

(@warlock_tree_1, 2, 2, "vertical", NULL, 0, 2, 1081),
(@warlock_tree_1, 4, 1, "vertical", NULL, 0, 1, 1042),
(@warlock_tree_1, 6, 1, "vertical", NULL, 0, 2, 1670),
(@warlock_tree_1, 8, 1, "horizontal", "right", 0, 0, 2245),
(@warlock_tree_2, 2, 1, "vertical", NULL, 0, 1, 1262),
(@warlock_tree_2, 2, 2, "vertical", NULL, 0, 1, 1227),
(@warlock_tree_2, 3, 1, "vertical", NULL, 1, 1, 1281),
(@warlock_tree_2, 3, 1, "plain", "left", 0, 1, 1281),
(@warlock_tree_2, 3, 1, "vertical", NULL, 0, 2, 1244),
(@warlock_tree_2, 5, 1, "vertical", NULL, 0, 1, 1880),
(@warlock_tree_2, 7, 1, "vertical", NULL, 1, 1, 1882),
(@warlock_tree_2, 7, 1, "plain", "left", 0, 1, 1882),
(@warlock_tree_3, 2, 2, "vertical", NULL, 0, 2, 981),
(@warlock_tree_3, 3, 0, "vertical", NULL, 0, 1, 1817),
(@warlock_tree_3, 4, 1, "vertical", NULL, 0, 2, 968),
(@warlock_tree_3, 6, 2, "vertical", NULL, 0, 1, 1889),
(@warlock_tree_3, 6, 1, "vertical", NULL, 1, 2, 1888),
(@warlock_tree_3, 6, 1, "plain", "left", 0, 2, 1888),

(@warrior_tree_1, 2, 2, "horizontal", "right", 0, 0, 121),
(@warrior_tree_1, 4, 1, "vertical", NULL, 0, 2, 135),
(@warrior_tree_1, 6, 1, "vertical", NULL, 0, 1, 1824),
(@warrior_tree_2, 4, 1, "vertical", NULL, 0, 2, 167),
(@warrior_tree_2, 6, 1, "vertical", NULL, 0, 2, 1659),
(@warrior_tree_2, 6, 1, "plain", "right", 0, 2, 1866),
(@warrior_tree_2, 6, 1, "vertical", NULL, 1, 2, 1866),
(@warrior_tree_3, 4, 1, "vertical", NULL, 0, 2, 148),
(@warrior_tree_3, 8, 1, "vertical", NULL, 0, 1, 1871);
