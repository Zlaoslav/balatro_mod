--- STEAMODDED HEADER
--- MOD_NAME: KONTORA JOKERS
--- MOD_ID: KONTORAJOKERS
--- MOD_AUTHOR: [Matt]
--- MOD_DESCRIPTION: chat mode
--- PREFIX: xmpl


SMODS.Atlas{
  key = 'jokers',
  path = 'jokers.png',
  px = 71,
  py = 95
}

SMODS.Joker{
   key = 'joker2',
   loc_txt = {
     name = 'daniel',
     text = {
      'When {C:attention}blind{} is selected',
      'give you {C:purple}The World{}',
    }
  },
  atlas = 'jokers',
  rarity = 2,
  cost = 4,
  blueprint_compat = true,
  pos = {x = 0, y = 0},
  config = {extra = {
    Xmult = 1
  }
  },
  loc_vars = function(self,info_queue,center)
    return {vars = {center.ability.extra.Xmult}}
  end,
  calculate = function(self,card,context)
    if context.joker_main then
      return {
        card = card,
        Xmult_mod = card.ability.extra.Xmult,
        colour = G.C.MULT
      }
    end

    if context.setting_blind then
      local new_card = create_card('tarot', G.consumeables, nil,nil,nil,nil,'c_world')
      new_card:add_to_deck()
      G.consumeables:emplace(new_card)
   end
  end
}

SMODS.Joker{
   key = 'joker3',
   loc_txt = {
     name = 'matt',
     text = {
      'Gives {C:red}-4 Mult{} and after',
      'give {X:mult,C:white}x2{}'
    }
  },
  atlas = 'jokers',
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  pos = {x = 1, y = 0},
  config = {extra = {
    Xmult = 2,
    Mult = 4
   }
   },
  loc_vars = function(self,info_queue,center)
    return {vars = {center.ability.extra.Xmult}}
  end,
  calculate = function(self,card,context)
    if context.joker_main then
      return {
        card = cards,
        mult_mod = 0-card.ability.extra.Mult,
        Xmult_mod = card.ability.extra.Xmult,
        message = 'X' .. card.ability.extra.Xmult,
        colour = G.C.MULT
      }
    end
  end
}



