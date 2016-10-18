/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Napakalaki;

/**
 *
 * @author jaimefrias
 */
public class Monster {

	private String name;
	private int combatLevel;
	private BadConsequence bc;
	private Prize prize;

	Monster(String name, int level, BadConsequence bc, Prize prize) {
		this.name = name;
		combatLevel = level;
		this.bc = bc;
		this.prize = prize;
	}
	// Constructor de copia

	public Monster(Monster monstruo) {
		this.name = monstruo.name;
		this.combatLevel = monstruo.combatLevel;
		this.bc = monstruo.bc;
		this.prize = monstruo.prize;
	}

	String getName() {
		return name;
	}

	int getCombatLevel() {
		return combatLevel;
	}

	BadConsequence getBadConsequence() {
		return bc;
	}

	Prize getPrize() {
		return prize;
	}

	boolean onlyLoseLevels() {
		return bc.onlyLoseLevels();
	}
        
        boolean winLevelsFrom(int lvl) {
                return prize.winLevelsFrom(lvl);
        }
        
        boolean loseTreasure(TreasureKind treasure, boolean visible) {
                return bc.loseTreasure(treasure, visible);
        }

	@Override
	public String toString() {
		return "Name = " + name + " combatLevel = " + Integer.toString(combatLevel);
	}
}