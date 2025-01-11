--- STEAMODDED HEADER
--- MOD_NAME: Jimbo Records
--- MOD_ID: JIMBORECORDS
--- MOD_AUTHOR: [TherkLe]
--- MOD_DESCRIPTION: Extra jokers based off of various albums and music artists.
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
	px = 71,
	py = 95
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
				local card = SMODS.add_card {
					set = 'Joker',
					area = G.jokers,
					legendary = false,
					rarity = 'jmrcrd_album',
					skip_materialize = false
				}

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
	default_weight = 0.5,
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
	rarity = 1,
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
			'{C:green}are given a {C:red}Red Seal{}',
			'{C:money}$#1#{C:green} per {C:attention}face card{C:green} scored{}',
		}
	},
	config = { extra = { money = 6 }},
	atlas = 'Records',
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, 
    eternal_compat = true, 
    perishable_compat = true,
	pos = {x = 4, y = 0},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money }}
	end,
	
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
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_face() then
				local bonus = card.ability.extra.money
				if bonus > 0 then
				  return {
					dollars = bonus,
					card = context.other_card,
					play_sound("jmrcrd_bumpin")
				  }
				end
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
	pos = {x = 2, y = 1},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if pseudorandom('and') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
	key = 'darkside',
	loc_txt = {
		name = 'Dark Side',
		text = {
			'All played cards become ',
			'{C:attention}Wild Cards{} if no face cards',
			'are played.'
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
					v:set_ability(G.P_CENTERS.m_wild,nil,true)
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
					colour = G.C.MULT,
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
			'{X:mult,C:white}X#1#{} Mult if played hand',
			'contains the {C:hearts}Queen of Hearts{}'
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