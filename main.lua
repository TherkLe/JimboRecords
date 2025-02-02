--- STEAMODDED HEADER
--- MOD_NAME: Jimbo Records
--- MOD_ID: JIMBORECORDS
--- MOD_AUTHOR: [TherkLe]
--- MOD_DESCRIPTION: Extra jokers based off of various albums and music artists.
--- BADGE_COLOR: daa54e
--- PREFIX: jmrcrd
--- VERSION: 1.2.1

SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true
    }
end
SMODS.Atlas{
    key = 'Records', --atlas key
    path = 'Records.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Atlas{
	key = 'Enhancements',
	path = 'Enhancements.png',
	px = 71,
	py = 95
}
SMODS.Atlas{
	key = 'Consumables',
	path = 'tarot.png',
	px = 65,
	py = 95
}
SMODS.Atlas{
	key = 'modicon',
	path = 'rcrdicon.png',
	px = 34,
	py = 34
}
SMODS.Sound{
	key = 'bumpin',
	path = 'bumpin.ogg'
}
SMODS.Consumable{
	key = 'turntable',
	set = 'Tarot',
	loc_txt = {
		name = 'Turntable',
		text = {
			'Gives a random',
			'{C:424240}Album{C:attention} Joker{}',
			'{C:inactive}(must have space){}'
		}
	},
	atlas = "Consumables",
	cost = 12,
	use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
				if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
					local card = SMODS.add_card {
						set = 'Joker',
						area = G.jokers,
						legendary = false,
						rarity = 'jmrcrd_album',
						skip_materialize = false
					}
				end
				return true
            end
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Consumable{
	key = 'record',
	set = 'Tarot',
	loc_txt = {
		name = 'Record',
		text = {
			'Gives a random',
			'{C:daa54e}Classic{C:attention} Joker{}',
			'{C:inactive}(must have space){}'
		}
	},
	atlas = "Consumables",
	cost = 30,
	hidden = true,
	pos = {x = 1, y = 0},
	soul_set = 'Tarot',
	can_repeat_soul = true,
	use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
				if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
					local card = SMODS.add_card {
						set = 'Joker',
						area = G.jokers,
						legendary = false,
						rarity = 'jmrcrd_classic',
						skip_materialize = false
					}
				end
				return true
            end
        }))
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Rarity{
	key = 'album',
	loc_txt = {
		name = 'Album'
	},
	badge_colour = HEX('424240'),
	default_weight = 0.075,
	pools = {["Joker"] = true}
}

SMODS.Rarity{
	key = 'classic',
	loc_txt = {
		name = 'Classic'
	},
	badge_colour = HEX('daa54e'),
	default_weight = 0,
	pools = {["Joker"] = true}
}
SMODS.Joker{
	key = 'jimbgor',
	loc_txt = {
		name = 'JIMBGOR',
		text = {
			'{X:mult,C:white}X#1#{} Mult If',
			'played hand only contains', 
			'the {C:hearts}Hearts{} suit'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 0, y = 0},
	config = {extra = {
		Xmult = 3
	}
	},
	loc_vars = function(self,info_queue,center)
		return{vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if next(context.poker_hands["Flush"]) then
				local hearts = true
				for _, v in ipairs(context.scoring_hand) do
  					hearts = hearts and v:is_suit('Hearts')
  					if not hearts then break end
				end
				if hearts == true then
					return {
                    	Xmult_mod = card.ability.extra.Xmult,
                    	message = 'X' .. card.ability.extra.Xmult,
                   		colour = G.C.MULT
                    }
				end
			end
		end		
	end
}
SMODS.Joker{
	key = 'jimbokopia',
	loc_txt = {
		name = 'JIMBOKOPIA',
		text = {
			'{X:mult,C:white}X#1#{} Mult If',
			'played hand only contains', 
			'the {C:spades}Spades{} suit'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 2, y = 0},
	config = {extra = {
		Xmult = 3
	}
	},
	loc_vars = function(self,info_queue,center)
		return{vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if next(context.poker_hands["Flush"]) then
				local spades = true
				for _, v in ipairs(context.scoring_hand) do
  					spades = spades and v:is_suit('Spades')
  					if not spades then break end
				end
				if spades == true then
					return {
                   		Xmult_mod = card.ability.extra.Xmult,
                    	message = 'X' .. card.ability.extra.Xmult,
                    	colour = G.C.MULT
                    }
				end
			end
		end		
	end
}
SMODS.Joker{
	key = 'flowerboy',
	loc_txt = {
		name = 'Flower Jimbo',
		text = {
			'{X:mult,C:white}X#1#{} Mult If',
			'played hand only contains', 
			'the {C:diamonds}Diamonds{} suit'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 1, y = 0},
	config = {extra = {
		Xmult = 3
	}
	},
	loc_vars = function(self,info_queue,center)
		return{vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if next(context.poker_hands["Flush"]) then
				local diamonds = true
				for _, v in ipairs(context.scoring_hand) do
  					diamonds = diamonds and v:is_suit('Diamonds')
  					if not diamonds then break end
				end
				if diamonds == true then
					return {
                    	Xmult_mod = card.ability.extra.Xmult,
                    	message = 'X' .. card.ability.extra.Xmult,
                    	colour = G.C.MULT
                    }
				end
			end
		end		
	end
}
SMODS.Joker{
	key = 'cjiygl',
	loc_txt = {
		name = 'Call Jimbo If You Get Lost',
		text = {
			'{X:mult,C:white}X#1#{} Mult If',
			'played hand only contains', 
			'the {C:clubs}Clubs{} suit'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 3, y = 0},
	config = {extra = {
		Xmult = 3
	}
	},
	loc_vars = function(self,info_queue,center)
		return{vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if next(context.poker_hands["Flush"]) then
				local clubs = true
				for _, v in ipairs(context.scoring_hand) do
  					clubs = clubs and v:is_suit('Clubs')
  					if not clubs then break end
				end
				if clubs == true then
					return {
                    	Xmult_mod = card.ability.extra.Xmult,
                   		message = 'X' .. card.ability.extra.Xmult,
                    	colour = G.C.MULT
                    }
				end
			end
		end		
	end
}
SMODS.Joker{
	key = 'weezer',
	loc_txt = {
		name = 'literally just weezer',
		text = {
			'All played {C:attention}face{} cards',
			'recieve a {C:blue}Blue Seal{} when scored.'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 0, y = 1},
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint then
			local faces = {}
			for k, v in ipairs(context.scoring_hand) do
				if v:is_face() then
					faces[#faces + 1] = v
					v:set_seal('Blue', true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					}))
				end
			end
			if #faces > 0 then
				return {
					message = 'Blue!',
					colour = G.C.CHIPS,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'tcd',
	loc_txt = {
		name = 'The College Dropout',
		text = {
			'Gains {C:mult}+#2# Mult',
			'every time a card is',
			'{C:attention}sold{}.',
			'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
		}
	},
	config = { extra = { mult = 0, mult_gain = 2 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 1, y = 1},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		  return {
			mult_mod = card.ability.extra.mult,
			message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
		  }
		end

		if context.selling_card and not context.blueprint then	
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      	return {
        	message = 'Upgraded!',
        	colour = G.C.CHIPS,
        	card = card
      	}
   		end
	end	
}
SMODS.Joker{
	key = 'brat',
	loc_txt = {
		name = 'joker',
		text = {
			'{C:green}all played {C:attention}face{C:green} cards',
			'{C:green}are given a {C:red}Red Seal{}'
		}
	},
	atlas = 'Records',
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 4, y = 0},
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint then
			local faces = {}
			for k, v in ipairs(context.scoring_hand) do
				if v:is_face() then
					faces[#faces + 1] = v
					v:set_seal('Red', true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					}))
				end
			end
			if #faces > 0 then
				return {
					message = 'Bumpin that!',
					colour = G.C.MULT,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'and',
	loc_txt = {
		name = 'Good and Evil',
		text = {
			'{C:green}#2# in #3#{} chance that', 
			'played {C:clubs}Club{} cards give {X:mult,C:white}X#1#{} mult',
			'{C:green}#2# in #3#{} chance that', 
			'played {C:hearts}Heart{} cards give {X:mult,C:white}X#1#{} mult',
		}
	},
	config = {extra = {Xmult = 1.5, odds = 2}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 2, y = 1},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if pseudorandom('and') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if context.other_card:is_suit('Clubs') then
					return{
						Xmult_mod = card.ability.extra.Xmult,
						message = 'X' .. card.ability.extra.Xmult,
						colour = G.C.MULT,
					}
				end
			else
		  		if context.other_card:is_suit('Hearts') then
					return{
						Xmult_mod = card.ability.extra.Xmult,
						message = 'X' .. card.ability.extra.Xmult,
						colour = G.C.MULT,
					}
				end
			end
		end
	end
}
SMODS.Joker{
	key = 'darkside',
	loc_txt = {
		name = 'Dark Side',
		text = {
			'All played {C:attention}Non-face{} cards become ',
			'{C:attention}Wild Cards{}'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 3, y = 1},
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint then
			local faces = {}
			for k, v in ipairs(context.scoring_hand) do
				if not v:is_face() then
					faces[#faces + 1] = v
					v:set_ability(G.P_CENTERS.m_wild, nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					}))
				end
			end
			if #faces > 0 then
				return {
					message = 'Wild!',
					colour = G.C.CHIPS,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'roan',
	loc_txt = {
		name = 'Midwest Royalty',
		text = {
			'{X:mult,C:white}X#1#{} Mult every time',
			'a {C:hearts}Queen of Hearts{} is scored.'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 4, y = 1},
	config = {extra = {Xmult = 1.5}},
	loc_vars = function(self,info_queue,center)
		return{vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
				if context.other_card:get_id() == 12 then
					return {
						Xmult_mod = card.ability.extra.Xmult,
                    	message = 'X' .. card.ability.extra.Xmult,
                    	colour = G.C.MULT,
					}
				end
			end
		end
	end
}


------------------------------------------------------------------------
-----------------------CLASSICS START HERE------------------------------
------------------------------------------------------------------------

 
SMODS.Joker{
	key = 'abbey',
	loc_txt = {
		name = 'Abbey Road',
		text = {
			'{X:mult,C:white}X#1#{} Mult if played hand',
			'is exactly 4 {C:attention}Kings.{}'
		}
	},
	config = {extra = {Xmult = 4}},
	atlas = 'Records',
	rarity = 'jmrcrd_classic',
	cost = 25,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 0, y = 3},
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Xmult} }
	end,
	calculate = function(self, card, context)
		if context.joker_main and #G.play.cards == 4 then
			local kings = true
			for _, v in ipairs(context.scoring_hand) do
  				kings = kings and v:get_id() == 13
  				if not kings then break end
			end
			if kings == true then
				return {
					Xmult_mod = card.ability.extra.Xmult,
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'mbdtf',
	loc_txt = {
		name = 'Twisted Fantasy',
		text = {
			'Played {C:clubs}Club{} cards',
			'Become {C:attention}Glass Cards.'
		}
	},
	atlas = 'Records',
	rarity = 'jmrcrd_classic',
	cost = 25,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 1, y = 3},
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint then
			local club = true
			for _, v in ipairs(context.scoring_hand) do
			 	club = club and v:is_suit('Clubs')
				 if not club then break end
			end
			if club == true then
				for k, v in ipairs(context.scoring_hand) do
					v:set_ability(G.P_CENTERS.m_glass, nil, true)
					G.E_MANAGER:add_event(Event({
					func = function()
						v:juice_up()
						return true
					end
					}))
				end
				return {
					message = 'Glass!',
					colour = G.C.MULT,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'thriller',
	loc_txt = {
		name = 'Thriller',
		text = {
			'{C:rare}Rare{} Jokers',
			'give {C:money}$#1#{}.'
		}
	},
	config = {extra = {dollars = 10}},
	atlas = 'Records',
	rarity = 'jmrcrd_classic',
	cost = 25,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 2, y = 3},
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.dollars} }
	end,
	calculate = function(self, card, context)
		if context.other_joker and context.other_joker.config.center.rarity == 3 and context.other_joker.ability.set == "Joker" then
		  G.E_MANAGER:add_event(Event({
			func = function()
			  context.other_joker:juice_up(0.5, 0.5)
			  return true
			end
		  })) 
		  return {
			ease_dollars(card.ability.extra.dollars),
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = '$'..card.ability.extra.dollars, colour = G.C.GOLD})
		  }
		end
	  end
}
SMODS.Joker{
	key = 'blond',
	loc_txt = {
		name = 'Blond(e)',
		text = {
			'If first discard is a {C:attention}Two Pair,{}',
			'gains {X:mult,C:white}X#2#{} mult and cards are destroyed',
			'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
		}
	},
	config = { extra = { Xmult = 1, Xmult_gain = 1 } },
	atlas = 'Records',
	rarity = 'jmrcrd_classic',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 3, y = 3},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = 'X' .. card.ability.extra.Xmult,
				   colour = G.C.MULT
			 }
		end
		if context.pre_discard then
			if G.GAME.current_round.discards_used <= 0 and not context.hook then
				local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
				if text == 'Two Pair' then
					card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
					return {
						message = 'X' .. card.ability.extra.Xmult,
						colour = G.C.MULT
					}
				end
			end
		end
		if context.discard then
			if G.GAME.current_round.discards_used <= 0 and not context.hook then
				local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
				if text == 'Two Pair' then
					return {
						card = self,
						remove = true
					}
				end
			end
		end
	end
}
SMODS.Joker{
	key = 'kida',
	loc_txt = {
		name = 'KID  A',
		text = {
			'Played {C:attention}Wild Face Cards{} give',
			'{X:mult,C:white}X#1#{} Mult when scored.'
		}
	},
	config = { extra = { Xmult = 2,} },
	atlas = 'Records',
	rarity = 'jmrcrd_classic',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 4, y = 3},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult} }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 then
				if SMODS.has_enhancement(context.other_card, "m_wild") then
					return {
                    	Xmult_mod = card.ability.extra.Xmult,
                    	message = 'X' .. card.ability.extra.Xmult,
                   		colour = G.C.MULT
                    }
				end
			end
		end
	end
}
---------------------------------------------------------------------------------------------------------------------

SMODS.Joker{
	key = 'villain',
	loc_txt = {
		name = 'The Villain',
		text = {
			'{C:green}#2# in #3#{} chance that', 
			'played {C:spades}Spade{} cards give {X:mult,C:white}X#1#{} mult',
			'{C:green}#2# in #3#{} chance that', 
			'played {C:diamonds}Diamond{} cards give {X:mult,C:white}X#1#{} mult',
		}
	},
	config = {extra = {Xmult = 1.5, odds = 2}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 0, y = 2},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if pseudorandom('villain') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if context.other_card:is_suit('Spades') then
					return{
						Xmult_mod = card.ability.extra.Xmult,
						message = 'X' .. card.ability.extra.Xmult,
						colour = G.C.MULT,
					}
				end
			else
		  		if context.other_card:is_suit('Diamonds') then
					return{
						Xmult_mod = card.ability.extra.Xmult,
						message = 'X' .. card.ability.extra.Xmult,
						colour = G.C.MULT,
					}
				end
			end
		end
	end
}
SMODS.Joker{
	key = 'stank',
	loc_txt = {
		name = 'Jimbkonia',
		text = {
			'Gains {C:chips}+#2#{} Chips',
			'for each {C:spades}Spade{C:attention} card',
			'{C:attention}scored{}.',
			'{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
		}
	},
	config = { extra = { chips = 0, chip_gain = 5 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 1, y = 2},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		  return {
			chip_mod = card.ability.extra.chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
		  }
		end

		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Spades') and not context.blueprint then	
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      			return {
        			message = 'Upgraded!',
        			colour = G.C.CHIPS,
        			card = card
      			}
			end
   		end
	end	
}
SMODS.Joker{
	key = 'starboy',
	loc_txt = {
		name = 'Starjoker',
		text = {
			'Gains {C:mult}+#2#{} Mult',
			'for each {C:hearts}Heart{C:attention} card',
			'{C:attention}scored{}.',
			'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
		}
	},
	config = { extra = { mult = 0, mult_gain = 5 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 2, y = 2},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		  return {
			mult_mod = card.ability.extra.mult,
			message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
		  }
		end

		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Hearts') and not context.blueprint then	
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      			return {
        			message = 'Upgraded!',
        			colour = G.C.MULT,
        			card = card
      			}
			end
   		end
	end	
}
SMODS.Joker{
	key = 'nwts',
	loc_txt = {
		name = 'Never the Same',
		text = {
			'Gains {C:chips}+#2#{} Chips',
			'for each {C:clubs}Club{C:attention} card',
			'{C:attention}scored{}.',
			'{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
		}
	},
	config = { extra = { chips = 0, chip_gain = 5 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 3, y = 2},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		  return {
			chip_mod = card.ability.extra.chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
		  }
		end

		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Clubs') and not context.blueprint then	
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      			return {
        			message = 'Upgraded!',
        			colour = G.C.CHIPS,
        			card = card
      			}
			end
   		end
	end	
}
SMODS.Joker{
	key = 'orange',
	loc_txt = {
		name = 'Orange Static',
		text = {
			'Gains {C:mult}+#2#{} Mult',
			'for each {C:diamonds}Diamond{C:attention} card',
			'{C:attention}scored{}.',
			'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
		}
	},
	config = { extra = { mult = 0, mult_gain = 5 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 4, y = 2},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		  return {
			mult_mod = card.ability.extra.mult,
			message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
		  }
		end

		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Diamonds') and not context.blueprint then	
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      			return {
        			message = 'Upgraded!',
        			colour = G.C.MULT,
        			card = card
      			}
			end
   		end
	end	
}
SMODS.Joker{
	key = 'damn',
	loc_txt = {
		name = 'JOKER.',
		text = {
			'Retriggers all cards if',
			'played hand is a',
			'{C:attention}Straight{}.',
		}
	},
	config = { extra = { repetitions = 1 } },
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 5, y = 0},
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if next(context.poker_hands["Straight"]) then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'jokaz',
	loc_txt = {
		name = 'Joker Days',
		text = {
			'Played cards with the',
			'{V:1}#2#{} suit give',
			'{C:mult}+#1#{} mult.',
			'Suit changes every round'
		}
	},
	config = {extra = {mult = 8}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	pos = {x = 6 , y = 0},
	loc_vars = function(self, info_queue, card)
		return { vars = { 
		  card.ability.extra.mult, 
		  localize(G.GAME.current_round.jokaz_card.suit, 'suits_singular'), 
		  colours = {G.C.SUITS[G.GAME.current_round.jokaz_card.suit]} 
		}}
	  end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit(G.GAME.current_round.jokaz_card.suit) then
				return {
					mult_mod = card.ability.extra.mult,
					message = '+' .. card.ability.extra.mult,
        			colour = G.C.MULT,
					card = card
				}
			end
		end
	end
}

local igo = Game.init_game_object
function Game:init_game_object()
  local ret = igo(self)
  ret.current_round.jokaz_card = { suit = 'Spades' } 
  return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
  -- The suit changes every round, so we use reset_game_globals to choose a suit.
  G.GAME.current_round.jokaz_card = { suit = 'Spades' }
  local valid_jokaz_cards = {}
  for _, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) then -- Abstracted enhancement check for jokers being able to give cards additional enhancements
        valid_jokaz_cards[#valid_jokaz_cards+1] = v
    end
  end
  if valid_jokaz_cards[1] then 
      local jokaz_card = pseudorandom_element(valid_jokaz_cards, pseudoseed('2cas'..G.GAME.round_resets.ante))
      G.GAME.current_round.jokaz_card.suit = jokaz_card.base.suit
  end
end

SMODS.Joker{
	key = 'badjokeday',
	loc_txt = {
		name = 'Bad Humor Day',
		text = {
			'{C:attention}Jokers{} have a',
			'{C:green}#1# in #2# chance{} to retrigger.'
		}
	},
	config = {extra = {odds = 8, repetitions = 1}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 7 , y = 0},
	loc_vars = function(self, info_queue, card)
		return { vars = { 
			(G.GAME.probabilities.normal or 1), 
			card.ability.extra.odds
		}}
	  end,
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker then
			if pseudorandom('badjokeday') < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					message = localize('k_again_ex'),
					repetitions = 1,
					card = card
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'liar',
	loc_txt = {
		name = 'The Liar',
		text = {
			'After every {C:attention}5{} rounds,',
			'this joker gains {X:mult,C:white}X#2#{} mult.',
			'{C:green}#3# in #4#{} chance joker',
			'is {C:attention}destroyed{} at',
			'end of round.',
			'{C:inactive}Currently {X:mult,C:white}X#1#{C:inactive} mult,',
			'{C:attention}#5#{C:inactive}/5 rounds completed.'
		}
	},
	config = {extra = {
		Xmult = 1, 
		Xmult_gain = 1, 
		odds = 10,
		roundslied = 0
	}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 8 , y = 0},
	loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.Xmult, card.ability.extra.Xmult_gain, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.roundslied
		}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
            	colour = G.C.MULT
			}
		end

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			card.ability.extra.roundslied = card.ability.extra.roundslied + 1
			if card.ability.extra.roundslied >= 5 then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
				card.ability.extra.roundslied = 0
				return {
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
			if pseudorandom('liar') < G.GAME.probabilities.normal / card.ability.extra.odds then
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
				  func = function()
					play_sound('tarot1')
					card.T.r = -0.2
					card:juice_up(0.3, 0.4)
					card.states.drag.is = true
					card.children.center.pinch.x = true
					-- This part destroys the card.
					G.E_MANAGER:add_event(Event({
					  trigger = 'after',
					  delay = 0.3,
					  blockable = false,
					  func = function()
						G.jokers:remove_card(card)
						card:remove()
						card = nil
						return true;
					  end
					}))
					return true
				  end
				}))
				return {
				  message = 'Deleted!'
				}
			  else
				return {
				  message = 'Delayed!'
				}
			end
		end
	end
}
SMODS.Joker{
	key = 'lowend',
	loc_txt = {
		name = 'The Low End',
		text = {
			'Played {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{}, and {C:attention}5s{}',
			'give {C:mult}+#1#{} mult.',
			'Played {C:hearts}Heart{} versions',
			'of those ranks have',
			'a {C:green}#2# in #3#{} chance to give another {C:mult}+#1#{} mult.'
		}
	},
	config = {extra = {
		mult = 9,
		odds = 2
	}},
	atlas = 'Records',
	rarity = 'jmrcrd_album',
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	pos = {x = 9 , y = 0},
	loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds
		}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5 then
				local ret = { mult = card.ability.extra.mult }
				if context.other_card:is_suit('Hearts') and pseudorandom('lowend') < G.GAME.probabilities.normal / card.ability.extra.odds then
  					ret.extra = { mult = card.ability.extra.mult }
				end
				return ret
			end
		end
	end
}