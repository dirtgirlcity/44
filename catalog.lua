local Item = require('item')

local levels = {
  {
    level = 1,
    menuItems = {
      Item({
        name = "item",
        desc = "1",
        price = 1
      }),
      Item({
        name = "item",
        desc = "2",
        price = 2
      }),
      Item({
        name = "item",
        desc = "3",
        price = 3
      })
    },
    recipeItems = {
      Item({
        name = "item",
        desc = "1"
      }),
      Item({
        name = "item",
        desc = "4"
      })
    },
    rewardItems = {
      Item({
        name = "item",
        desc = "0"
      })
    },
    text = "adds 2 5"
  },
  {
    level = 2,
    menuItems = {
      Item({
        name = "item",
        desc = "a",
        price = 5
      }),
      Item({
        name = "item",
        desc = "b",
        price = 5
      }),
      Item({
        name = "item",
        desc = "c",
        price = 5
      })
    },
    recipeItems = {
      Item({
        name = "item",
        desc = "b"
      }),
      Item({
        name = "item",
        desc = "a"
      }),
      Item({
        name = "item",
        desc = "d"
      })
    },
    rewardItems = {
      Item({
        name = "item",
        desc = "11"
      })
    },
    text = "my name"
  },
  {
    level = "none",
    introTextPage1 = [[
    You are an accomplished (though unrecognized) wizard of tremendous
    potioneering and alchemical skills. On the eve of your fortieth
    birthday, you submerge, suddenly and deeply, into the bloodthirsty
    howls of an an eye-poppingly vivid mid-life crisis. Your desperation
    is as acute as it is unexpected. You have not planned for this moment.
    You thought yourself a mature and level-headed adult.
                                           ~
    You had committed yourself to a lonesome life of study, unfettered by
    the superficialities that are forged, inevitably, alongside human
    bonding. You have not met your own gaze in a mirror long enough to
    blink in recent or distant memory. Without a penny or friend to your
    name, you turn to your dusty library in search of a solution to your
    problems.]],
    introTextPage2 = [[
    After many hours, you have come across the solution. Many have
    sought the grail, the fountain of eternal youth. You have not made
    your life decisions, though, without an abundance of confidence
    bordering on arrogance. To turn away, forever, from the support and
    camaraderie of others takes a strong heart and a firm mind. You have
    everything you need to decide that this is worth the pain, the risk,
    and the trials you are about to put yourself through.
                                           ~
    You don't have everything you need to create the potion, but you have
    some of the preliminary materials in your store room. Whatever you
    don't possess already, you can't afford -- unless!]],
    introTextPage3 = [[
    You bury yourself deeply in the tiny but thoughful collection of
    titles that is the product of decades of intense commitment to the
    most unknown arts of your craft. You emerge, perhaps hours later, with
    the spell that will extract some of your own life force, and transform
    it into the gold you will need to purchase ingredients worthy of that
    one, most ultimate prize.]],
    winText = "You Win! You quaff deeply from the drought, brewed in the flames \n"
    .. "of your own ambition. Your bones harden, you skin smooths, and you heart \n"
    .. "leaps with new vitality. To yourself, you whisper-shout the exultations of \n"
    .. "eternal youth.",
    loseText = "You Lose! Your life spent, your ruined experiments spread \n"
    .. "bleakly on the floor, you weep tears that disappear into the pools of \n"
    .. "unidentifiable liquid spreading across the floor of your moldy basement \n"
    .. "storeroom. No one will find your body."
  }
}

return levels
