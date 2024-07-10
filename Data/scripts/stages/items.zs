#priority -10
import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;

import scripts.Stages.stages.one;
import scripts.Stages.stages.two;
import scripts.Stages.stages.three;
import scripts.Stages.stages.four;
import scripts.Stages.stages.five;
import scripts.Stages.stages.six;
import scripts.Stages.stages.seven;
import scripts.Stages.stages.eight;
import scripts.Stages.stages.disabled;

static stagedItems as IIngredient[][string] = {
	two.stage: [
		<divinerpg:netherite_ingot>,
		<divinerpg:netherite_nugget>,
		<divinerpg:netherite_block>,
		<divinerpg:netherite_ore>,
		<mysticalagriculture:mystical_fertilizer>
	],
	eight.stage: [
		<twilightforest:uncrafting_table>
	]
	disabled.stage: [
		<tp:wub_ore>,
		<tp:nether_wub_ore>,
		<tp:wub_ingot>,
		<tp:wub_gem>
	]
};



function init() {
	var modId as string = stagedItems.entrySet[0].value[0].items[0].definition.owner;

	var modStage as string = scripts.Stages.modid.containsMod(modId);
	var doOverride as bool = modStage != "";

	for stageName, items in stagedItems {
		if (doOverride && stageName != modStage) {
			ZenStager.addModItemOverrides(modId, items);
		}

		ZenStager.getStage(stageName).addIngredients(items);
	}
}
