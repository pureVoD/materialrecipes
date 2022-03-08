// Package Importation
import crafttweaker.item.IItemStack;
import mods.mekanism.crusher;
import mods.mekanism.enrichment;
import mods.immersiveengineering.ArcFurnace;
import mods.appliedenergistics2.Grinder;
import mods.thermalexpansion.Pulverizer;
import mods.thermalexpansion.RedstoneFurnace;
import mods.integrateddynamics.Squeezer;
import mods.integrateddynamics.MechanicalSqueezer;
import mods.enderio.SagMill;
import mods.enderio.AlloySmelter;
import mods.tconstruct.Casting;
import mods.thermalexpansion.InductionSmelter;
import crafttweaker.liquid.ILiquidStack;
import mods.tconstruct.Melting;
import mods.thermalexpansion.Factorizer;

function materialAddition(ore as IItemStack, nugget as IItemStack, ingot as IItemStack, block as IItemStack, dust as IItemStack, molten as ILiquidStack) {
    // Minecraft Recipes
    recipes.addShaped(block, [[ingot, ingot, ingot],[ingot, ingot, ingot],[ingot, ingot, ingot]]);
    recipes.addShapeless(nugget*9, [ingot]);
    recipes.addShaped(ingot, [[nugget, nugget, nugget],[nugget, nugget, nugget],[nugget, nugget, nugget]]);
    recipes.addShapeless(ingot*9, [block]);
    furnace.addRecipe(ingot, ore);
    furnace.addRecipe(ingot, dust);

    // Mods Recipes
    recipes.addShapeless(ingot, [ore, <thermalfoundation:material:1024>]); // Thermal Expansion
    recipes.addShapeless(ingot, [dust, <thermalfoundation:material:1024>]); // Thermal Expansion
    recipes.addShapeless(ingot*2, [ore, <thermalfoundation:material:1027>, <thermalfoundation:material:1024>]); // Thermal Expansion

    recipes.addShapeless(dust, [ingot, <immersiveengineering:tool>]); // Immersive Engineering
    recipes.addShapeless(dust, [ore, <immersiveengineering:tool>]); // Immersive Engineering
    recipes.addShapeless(dust*2, [ore, <thermalfoundation:material:1027>]); // Thermal Expansion
    recipes.addShapeless(dust, [ingot, <thermalfoundation:material:1027>]); // Thermal Expansion
    
    RedstoneFurnace.addRecipe(ingot, ore, 2000); // Thermal Expansion
    RedstoneFurnace.addRecipe(ingot, dust, 1500); // Thermal Expansion

    AlloySmelter.addRecipe(ingot, [ore]); // EnderIO
    AlloySmelter.addRecipe(ingot, [dust]); // EnderIO

    SagMill.addRecipe([dust], [100], ingot); // EnderIO
    SagMill.addRecipe([dust*2, dust, dust], [100, 25, 5], ore); // EnderIO

    Grinder.addRecipe(dust*2, ore, 5, dust, 0.9); // AppliedEnergistics2
    Grinder.addRecipe(dust, ingot, 4); // AppliedEnergistics2

    crusher.addRecipe(ingot, dust); // Mekanism

    enrichment.addRecipe(ore, dust*2); // Mekanism

    Pulverizer.addRecipe(dust, ingot, 3000); // Themral Expansion
    Pulverizer.addRecipe(dust*2, ore, 3000); // Thermal Expansion

    InductionSmelter.addRecipe(ingot, <minecraft:sand>, dust, 1000); // Thermal Expansion
    InductionSmelter.addRecipe(ingot, <minecraft:sand>, ore, 4000); // Thermal Expansion
    InductionSmelter.addRecipe(ingot*3, <thermalfoundation:material:865>, ore, 4000); // Thermal Expansion

    Factorizer.addRecipeCombine(nugget*9, ingot); // Thermal Expansion
    Factorizer.addRecipeCombine(ingot*9, block); // Thermal Expansion
    Factorizer.addRecipeSplit(block, ingot*9); // Thermal Expansion
    Factorizer.addRecipeSplit(ingot, nugget*9); // Thermal Expansion

    mods.actuallyadditions.Crusher.addRecipe(dust*2, ore);  // Actually Additions
    mods.actuallyadditions.Crusher.addRecipe(dust, ingot); // Actually Additions

    Squeezer.addRecipe(ore, dust*2, 1, dust, 0.15, dust, 0.05); // Integrated Dynamics
    MechanicalSqueezer.addRecipe(ore, dust*2, 1, dust, 0.35, dust, 0.15);  // Integrated Dynamics

    mods.immersiveengineering.Crusher.addRecipe(dust*2, ore, 2048); // ImmersiveEngineering
    mods.immersiveengineering.Crusher.addRecipe(dust, ingot, 2048); // ImmersiveEngineering

    ArcFurnace.addRecipe(ingot*2, ore, <immersiveengineering:material:7>, 100, 512); // ImmersiveEngineering
    ArcFurnace.addRecipe(ingot, dust, <immersiveengineering:material:7>, 50, 512); // Immersive Engineering
    
    Casting.addTableRecipe(nugget, <tconstruct:cast_custom:1>, molten, (144 / 9), false, (100 / 9)); // Tinker's Construct
    Casting.addTableRecipe(ingot, <tconstruct:cast_custom>, molten, 144, false, 100); // Tinker's Construct
    Casting.addBasinRecipe(block, null, molten, (144 * 9), false, (100 * 9)); // Tinker's Construct

    Melting.addRecipe(molten * 288, ore, 150); // Tinker's Construct 
    Melting.addRecipe(molten * 144, ingot, 121); // Tinker's Construct 
    Melting.addRecipe(molten * 1296, block, 242); // Tinker's Construct
}