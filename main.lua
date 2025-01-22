--- STEAMODDED HEADER
--- MOD_NAME: Jimbo Records
--- MOD_ID: JIMBORECORDS
--- MOD_AUTHOR: [TherkLe]
--- MOD_DESCRIPTION: Extra jokers based off of various albums and music artists.
--- BADGE_COLOR: daa54e
--- PREFIX: jmrcrd

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
