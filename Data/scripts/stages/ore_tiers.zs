import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.zenstages.Stage;
import mods.zenstages.ZenStager;
import mods.orestages.OreStages;

import scripts.Stages.stages.one;
import scripts.Stages.stages.two;
import scripts.Stages.stages.three;
import scripts.Stages.stages.four;
import scripts.Stages.stages.five;
import scripts.Stages.stages.six;
import scripts.Stages.stages.seven;
import scripts.Stages.stages.eight;
import scripts.Stages.stages.disabled;

static replacementItemsForStage as IIngredient[][][string] = {
	
    one.stage : [
		[<minecraft:glowstone:0>, <minecraft:netherrack:0>]
	],
	four.stage : [
		[<minecraft:emerald_ore:0>]
    ],
	five.stage : [
		[<minecraft:diamond_ore:0>]
	],
	eight.stage: [
		[<twilightforest:uncrafting_table>]
	]

	disabled.stage : [
		[<techreborn:ore2:1>, <thermalfoundation:ore:1>],
		[<forestry:resources:2>, <thermalfoundation:ore:1>],
		[<mekanism:oreblock:2>, <thermalfoundation:ore:1>],
		[<galacticraftcore:basic_block_core:6>, <thermalfoundation:ore:1>],
		[<mysticalworld:copper_ore:0>, <thermalfoundation:ore:0>],
		[<mekanism:oreblock:1>, <thermalfoundation:ore:0>],
		[<techreborn:ore2:0>, <thermalfoundation:ore:0>],
		[<immersiveengineering:ore:0>, <thermalfoundation:ore:0>],
		[<galacticraftcore:basic_block_core:5>, <thermalfoundation:ore:0>],
		[<forestry:resources:1>, <thermalfoundation:ore:0>],
		[<immersiveengineering:ore:4>, <thermalfoundation:ore:5>],
		[<mysticalworld:silver_ore:0>, <thermalfoundation:ore:2>],
		[<techreborn:ore:13>, <thermalfoundation:ore:2>],
		[<immersiveengineering:ore:3>, <thermalfoundation:ore:2>],
		[<immersiveengineering:ore:2>, <thermalfoundation:ore:3>],
		[<extraplanets:ore_lead:0>, <thermalfoundation:ore:3>],
		[<techreborn:ore:12>, <thermalfoundation:ore:3>],
		[<galacticraftcore:basic_block_core:7>, <thermalfoundation:ore:4>]
	]
};




/*
	Init method to perform the logic for the script.
*/
function init() {
	addOreReplacements(replacementItemsForStage, false);
}

function addOreReplacements(replacementItemsForStage as IIngredient[][][string], isNonDefaulting as bool) {
	for stageName, itemReplacementPairs in replacementItemsForStage {
		var stage as Stage = ZenStager.getStage(stageName);

		for itemReplacementPair in itemReplacementPairs {
			var length as int = itemReplacementPair.length;

			if (length == 1) {
				stage.addOreReplacement(itemReplacementPair[0], isNonDefaulting);
			} else if (length == 2) {
				stage.addOreReplacement(itemReplacementPair[0], itemReplacementPair[1].items[0], isNonDefaulting);
			}
		}
	}
}
