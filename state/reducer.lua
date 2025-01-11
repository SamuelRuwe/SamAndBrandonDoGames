local M = {}
local standard_deck = require("poker.deck").deckgen

local function handle_draw_card(state)
  if state.game_state == nil then
    return state
  end
  if #state.game_state.deck.deck_cards == 0 then
    return state
  end
  local drawn_card = table.remove(state.game_state.deck.deck_cards)
  table.insert(state.game_state.hand.cards, drawn_card)
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = state.game_state.deck.deck_cards,
      },
      hand = {
        cards = state.game_state.hand.cards,
      },
    },
  }
end

local function handle_new_game(state)
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = standard_deck(),
      },
      hand = {
        cards = {},
      },
    },
  }
end

local function handle_grab_card(state, action)
  if state.game_state == nil then
    return state
  end
  state.game_state.hand.cards[action.value.cardIndex].isStationary = false
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = state.game_state.deck.deck_cards,
      },
      hand = {
        cards = state.game_state.hand.cards,
      },
    },
  }
end

local function handle_release_card(state, action)
  if state.game_state == nil then
    return state
  end
  local cardIndex = action.value.cardIndex
  local trackIndex = action.value.trackIndex
  state.game_state.hand.cards[cardIndex].isStationary = true
  local tempTable = {}

  if trackIndex <= cardIndex then --card shifted to left, move cards inbetween right
    for i, card in ipairs(state.game_state.hand.cards) do
      if i == cardIndex then
        tempTable[trackIndex] = card
      elseif i < trackIndex or i > cardIndex then
        tempTable[i] = card
      elseif i >= trackIndex and i < cardIndex then
        tempTable[i + 1] = card
      else
        tempTable[i] = card
      end
    end
  elseif trackIndex > cardIndex then --card shifted right, move cards inbetween left
    for i, card in ipairs(state.game_state.hand.cards) do
      if i == cardIndex then
        tempTable[trackIndex] = card
      elseif i > trackIndex or i < cardIndex then
        tempTable[i] = card
      elseif i > cardIndex and i <= trackIndex then
        tempTable[i - 1] = card
      else
        tempTable[i] = card
      end
    end
  else
    tempTable = state.game_state.hand.cards
  end
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = state.game_state.deck.deck_cards,
      },
      hand = {
        cards = tempTable,
      },
    },
  }
end

---@param state poker.state.Core
---@param action poker.state.ACTION
---@return poker.state.Core
function M.reduce(state, action)
  if action == nil then
    return state
  end
  if action.type == "[GAME] NEW_GAME" then
    return handle_new_game(state)
  elseif action.type == "[DECK] DRAW_CARD" then
    return handle_draw_card(state)
  elseif action.type == "[HAND] GRAB_CARD" then
    return handle_grab_card(state, action)
  elseif action.type == "[HAND] RELEASE_CARD" then
    return handle_release_card(state, action)
  end
  return state
end

return M
