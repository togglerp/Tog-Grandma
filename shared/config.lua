Config = {}

Config.Ped = vector4(576.2, 2790.12, 42.21, 5.23) -- Location of Ped

Config.PedModel = "a_f_m_ktown_02" -- Grandma Ped Model, Models: https://docs.fivem.net/docs/game-references/ped-models/

Config.MiniGame = "Thermite" -- none | Circle | Maze | Var | Thermite | Scrambler (Dependency PS-UI)

Config.MiniGameArgs = {
  ["Circle"] = {4, 30},
  ["Maze"] = {20},
  ["Var"] = {5, 6},
  ["Thermite"] = {10, 5, 3},
  ["Scrambler"] = {"numeric", 30, 0}
}

Config.TalkTime = 5000 -- 5000 = 5 Seconds, change it to what you wish, in miliseconds

Config.TakeMoney = 'cash' -- Pay by CASH or BANK

Config.Cost = 8720 -- Price for Grandma to Revive / Help Player

Config.RefundIfFullHealth = false  -- If player is full health, refund? (True / False)

Config.GiveBanage = true -- If true, grandma will give a bandage after successfully healing player

-- Messages
Config.GiveBandageToPlayer = "Grandma has given you a bandage!"

Config.GrandmaLabel = "Speak to Grandma"

Config.DontHaveEnough = "You don\'t have enough money!"

Config.PartialRefund = "Grandma has issued you a Partial Refund!"

Config.ProgBarMsg = "Grandma is helping you"

Config.FullHealth = "You don't need grandmas help, here is your money back."

-- If Config.Minigame is not "none"

Config.MessageIfMiniGame = "Complete this minigame to gain access!"

Config.MessageIfFailedMiniGame = "Oh no! You failed the minigame, try again."

-- DONT TOUCH THIS
QBCore = exports['qb-core']:GetCoreObject()
