local Phases = {}

Phases = {
  initial = "initial",
  player_turn = "player_turn",
  cpu_turn = "cpu_turn",
  game_over = "game_over",
}

-- Phases.player_turn = require("state.highcard.states.player_turn")
-- Phases.cpu_turn = require("state.highcard.states.cpu_turn")
-- Phases.game_over = require("state.highcard.states.game_over")
--
-- Phases.initial = require("state.highcard.states.initial")
-- Phases.player_turn = require("state.highcard.states.player_turn")
-- Phases.cpu_turn = require("state.highcard.states.cpu_turn")
-- Phases.game_over = require("state.highcard.states.game_over")

return Phases
