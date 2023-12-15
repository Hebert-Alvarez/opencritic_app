import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opencritic_app/models/hall_of_fame_response.dart';

class GameProvider extends ChangeNotifier {
  bool _callApi = true;
  final _baseUrl = 'opencritic-api.p.rapidapi.com';
  //Primera apiKey: agotada
  //final _apiKey = '34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741';
  final _apiKey = '5f80892a14mshcdb46be08cb0d1ap15641fjsnedf48b5476a0';

  Map<String, dynamic> mapOfMaps = {};

  //setup local
  Map<String, dynamic> map1 = {
    "Baldur's Gate 3": {
      "id": "9136",
      "firstReleaseDate": "2023-08-03T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/9136/o/MPo6LRsJ.jpg",
          "sm": "game/9136/dFqN1tTL.jpg"
        },
        "square": {
          "og": "game/9136/o/ZLeSAfy9.jpg",
          "xs": "game/9136/czlP9j2U.jpg",
          "sm": "game/9136/C2wxkx4H.jpg",
          "lg": "game/9136/DUGVdGuo.jpg"
        },
        "masthead": {
          "og": "game/9136/o/raDLAVpW.jpg",
          "xs": "game/9136/v8hP2Zgz.jpg",
          "sm": "game/9136/ZqiiNeMh.jpg",
          "md": "game/9136/s4iRc1r9.jpg",
          "lg": "game/9136/htOVCRiF.jpg",
          "xl": "game/9136/fSYYsAEj.jpg"
        },
        "banner": {
          "og": "game/9136/o/wKeeGyFm.jpg",
          "sm": "game/9136/jyllbygC.jpg"
        },
        "screenshots": [
          {
            "_id": "62f46bcec25b595e6c50ac4a",
            "og": "game/9136/o/HCHipBxf.jpg",
            "sm": "game/9136/bGzg1OPC.jpg"
          },
          {
            "_id": "62f46bcec25b595e6c50ac4b",
            "og": "game/9136/o/CuqUu41h.jpg",
            "sm": "game/9136/I4gIxSqz.jpg"
          },
          {
            "_id": "62f46bcec25b595e6c50ac4c",
            "og": "game/9136/o/6VvOfkVh.jpg",
            "sm": "game/9136/0LOv7bMQ.jpg"
          }
        ]
      },
      "topCriticScore": 95.92553191489361,
      "hasLootBoxes": false,
      "percentRecommended": 99.24242424242425,
      "numReviews": 139,
      "numTopCriticReviews": 101,
      "medianScore": 99,
      "topCriticScore": 95.92553191489361,
      "percentile": 100,
      "tier": "Mighty",
      "name": "Baldur's Gate 3",
      "screenshots": [
        {
          "_id": "5e67d5176649190f9f65ecdc",
          "fullRes":
              "//c.opencritic.com/images/games/9136/uGvOIrXRL76DVqculXm5riQ1fucoLeFLbdeJsx6Qx3uh4UUe.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/uGvOIrXRL76DVqculXm5riQ1fucoLeFLbdeJsx6Qx3uh4UUe_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ecdd",
          "fullRes":
              "//c.opencritic.com/images/games/9136/gKa9EX9KkZbVCFwcPvPmxaDoRyTD8VcJIjZOsJ5kSyr2Dg6f.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/gKa9EX9KkZbVCFwcPvPmxaDoRyTD8VcJIjZOsJ5kSyr2Dg6f_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ecde",
          "fullRes":
              "//c.opencritic.com/images/games/9136/iNrWNOEkTdWiJKSOJsPu5MOwLoPnTL6UyXWx4HAPQQIOKZft.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/iNrWNOEkTdWiJKSOJsPu5MOwLoPnTL6UyXWx4HAPQQIOKZft_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ecdf",
          "fullRes":
              "//c.opencritic.com/images/games/9136/8hMvD4RrGOvC0Oo8q5xydWjetI03EGCRqtIuCfede95c2VJR.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/8hMvD4RrGOvC0Oo8q5xydWjetI03EGCRqtIuCfede95c2VJR_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ece0",
          "fullRes":
              "//c.opencritic.com/images/games/9136/gahUUrIBMrNKRlYHiKpRMRwWcw3wrJxQy8HI9ONyospQLlcW.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/gahUUrIBMrNKRlYHiKpRMRwWcw3wrJxQy8HI9ONyospQLlcW_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ece1",
          "fullRes":
              "//c.opencritic.com/images/games/9136/fSIwRJueWRDktAUjYAanrI0gxeA78Ujv4PnjNLDvwZr2BsVT.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/fSIwRJueWRDktAUjYAanrI0gxeA78Ujv4PnjNLDvwZr2BsVT_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ece2",
          "fullRes":
              "//c.opencritic.com/images/games/9136/iYFM883LkkdYgdpmIaVW12sypaFNPPNK29JQQwEQSd1GDOFw.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/iYFM883LkkdYgdpmIaVW12sypaFNPPNK29JQQwEQSd1GDOFw_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ece3",
          "fullRes":
              "//c.opencritic.com/images/games/9136/FaQ3kQjTYL2ykh3EL9bXFxuSdEAcuixQs6RqJ95qRoIopb5I.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/FaQ3kQjTYL2ykh3EL9bXFxuSdEAcuixQs6RqJ95qRoIopb5I_th.jpg"
        },
        {
          "_id": "5e67d5176649190f9f65ece4",
          "fullRes":
              "//c.opencritic.com/images/games/9136/8imJjLAEef7DUZKi4QUoruHThOzbcIzxpHbXifi6aEmRhihC.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/9136/8imJjLAEef7DUZKi4QUoruHThOzbcIzxpHbXifi6aEmRhihC_th.jpg"
        }
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "title": "Baldur's Gate 3 Opening Cinematic",
          "videoId": "jNY7AEQ59-8",
          "channelId": "UCQ-AAXSt0M5Gx0-A9UGut8g",
          "description":
              "Gather your party and return to the Forgotten Realms in a tale of fellowship and betrayal, sacrifice and survival, and the lure of absolute power. Forged with the ...",
          "externalUrl": "https://www.youtube.com/watch?v=jNY7AEQ59-8",
          "channelTitle": "Larian Studios",
          "publishedDate": "2020-02-27T00:00:00.000Z"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "title": "Baldur’s Gate 3 World Gameplay Reveal Announcement",
          "videoId": "maijYOOO-pE",
          "channelId": "UCQ-AAXSt0M5Gx0-A9UGut8g",
          "description":
              "Gather your party: https://baldursgate3.game/ We've been working, growing, driving towards this moment for the past few years. It's nearly here. The World ...",
          "externalUrl": "https://www.youtube.com/watch?v=maijYOOO-pE",
          "channelTitle": "Larian Studios",
          "publishedDate": "2020-02-18T00:00:00.000Z"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "title": "Baldur's Gate 3 - Official Announcement Trailer",
          "videoId": "OcP0WdH7rTs",
          "channelId": "UCQ-AAXSt0M5Gx0-A9UGut8g",
          "description":
              "Gather your party: http://baldursgate3.game Developed by Larian Studios - the creators of Divinity: Original Sin 2, BG3 is the official next adventure in the ...",
          "externalUrl": "https://www.youtube.com/watch?v=OcP0WdH7rTs",
          "channelTitle": "Larian Studios",
          "publishedDate": "2019-06-06T00:00:00.000Z"
        }
      ],
      "Companies": [
        {"name": "Larian Studios", "type": "DEVELOPER"}
      ],
      "Platforms": [
        {
          "name": "PC",
          "shortName": "PC",
          "id": 27,
          "displayRelease": "",
          "releaseDate": "2023-08-03T00:00:00.000Z"
        },
        {
          "id": 3,
          "name": "PlayStation 5",
          "shortName": "PS5",
          "imageSrc": "https://c.opencritic.com/images/platforms/ps5.png",
          "releaseDate": "2023-09-06T00:00:00.000Z"
        }
      ],
      "Genres": [
        {"id": 76, "name": "Adventure"},
        {"id": 77, "name": "RPG"}
      ],
      "id": 9136,
      "firstReleaseDate": "2023-08-03T00:00:00.000Z",
      "createdAt": "2020-03-10T17:56:45.119Z",
      "updatedAt": "2023-12-07T01:44:21.437Z",
      "bannerScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/9136/aIBSUxu8kDqWSFfwWK5bv3e1xvIRBIdJd13ssWG7dmMB7z4j.jpg"
      },
      "description":
          "Gather your party, and return to the Forgotten Realms in a tale of fellowship and betrayal, sacrifice and survival, and the lure of absolute power. \n\nMysterious abilities are awakening inside you, drawn from a Mind Flayer parasite planted in your brain. Resist, and turn darkness against itself. Or embrace corruption, and become ultimate evil.  \n\nFrom the creators of Divinity: Original Sin 2 comes a next-generation RPG, set in the world of Dungeons and Dragons.  \n\nChoose from a wide selection of D&D races and classes, or play as an origin character with a hand-crafted background. Adventure, loot, battle and romance as you journey through the Forgotten Realms and beyond. Play alone, and select your companions carefully, or as a party of up to four in multiplayer.\n\n\nAN EXPANSIVE ORIGINAL STORY\n\nAbducted, infected, lost. You are turning into a monster, but as the corruption inside you grows, so does your power. That power may help you to survive, but there will be a price to pay, and more than any ability, the bonds of trust that you build within your party could be your greatest strength. Caught in a conflict between devils, deities, and sinister otherworldly forces, you will determine the fate of the Forgotten Realms together.\n\nForged with the new Divinity 4.0 engine, Baldur’s Gate 3 gives you unprecedented freedom to explore, experiment, and interact with a world that reacts to your choices. A grand, cinematic narrative brings you closer to your characters than ever before, as you venture through our biggest world yet.\n\n\nNO ADVENTURE WILL BE THE SAME \n\nThe Forgotten Realms are a vast, detailed and diverse  world, and there are secrets to be discovered all around you -- verticality is a vital part of exploration. Sneak, dip, shove, climb, and jump as you journey from the depths of the Underdark to the glittering rooftops of the Upper City. How you survive, and the mark you leave on the world, is up to you.\n\n\nOnline multiplayer for up to four players allows you to combine your forces in combat, and split your party to follow your own quests and agendas. Concoct the perfect plan together… or introduce an element of chaos when your friends least expect it.\n\n\nOrigin Characters offer a hand-crafted experience, each with their own unique traits, agenda, and outlook on the world. Their stories intersect with the entire narrative, and your choices will determine whether those stories end in redemption, salvation, domination, or many other outcomes.  \n\n\nEvolved turn-based combat, based on the D&D 5e ruleset. Team-based initiative, advantage & disadvantage, and roll modifiers join combat cameras, expanded environmental interactions, and a new fluidity in combat that rewards strategy and foresight. \n\n\nDefine the future of the Forgotten Realms through your choices, and the roll of the dice. No matter who you play, or what you roll, the world and its inhabitants will react to your story. \n\n\nPlayer-initiated turn-based mode allows you to pause the world around you at any time even outside of combat. Whether you see an opportunity for a tactical advantage before combat begins, want to pull off a heist with pin-point precision, or need to escape a fiendish trap. Split your party, prepare ambushes, sneak in the darkness -- create your own luck!",
      "firstReviewDate": "2023-07-01T00:00:00.000Z",
      "latestReviewDate": "2023-12-06T00:00:00.000Z",
      "squareScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/9136/0KCcKRiLXSZpQ79AhbZzy5fyyfISmMEpA6mkmHGhLvf3Qfy8.jpg",
        "thumbnail":
            "//c.opencritic.com/images/games/9136/0KCcKRiLXSZpQ79AhbZzy5fyyfISmMEpA6mkmHGhLvf3Qfy8_th.jpg"
      },
      "verticalLogoScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/9136/vsSSUTbqX6cuwoCky4fSZTFCriKVCE2AIH5vR2d5VTHFG6xR.jpg",
        "thumbnail":
            "//c.opencritic.com/images/games/9136/vsSSUTbqX6cuwoCky4fSZTFCriKVCE2AIH5vR2d5VTHFG6xR_th.jpg"
      },
      "mastheadScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/9136/jeYeUpzgduYnsxsEighVut3FTruFZlxe0Wvn3YgPU4bNWkqN.jpg"
      },
      "imageMigrationComplete": true,
      "tenthReviewDate": "2020-12-24T00:00:00.000Z",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "criticalReviewDate": "2023-08-07T11:55:31.199Z",
      "url": "https://opencritic.com/game/9136/baldurs-gate-3"
    }
  };
  Map<String, dynamic> map2 = {
    'The Legend of Zelda: Tears of the Kingdom': {
      "id": "14343",
      "firstReleaseDate": "2023-05-12T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/14343/o/swtw3peI.jpg",
          "sm": "game/14343/Tfahlmf0.jpg"
        },
        "square": {
          "og": "game/14343/o/8sWU9p1p.jpg",
          "xs": "game/14343/rXIMdXx1.jpg",
          "sm": "game/14343/UK1B7XYW.jpg",
          "lg": "game/14343/rQKFPQ6G.jpg"
        },
        "masthead": {
          "og": "game/14343/o/EHSrjqA7.jpg",
          "xs": "game/14343/XnXqGjk0.jpg",
          "sm": "game/14343/y8bTcT8e.jpg",
          "md": "game/14343/YtcEheIm.jpg",
          "lg": "game/14343/4qJ9tDGm.jpg",
          "xl": "game/14343/5f92uzHj.jpg"
        },
        "banner": {
          "og": "game/14343/o/f5AsxHjY.jpg",
          "sm": "game/14343/ZpFE5hYe.jpg"
        },
        "screenshots": [
          {
            "_id": "63f8c30769b2982676e676b8",
            "og": "game/undefined/o/zG2LIJZs.jpg",
            "sm": "game/undefined/iwgb6qfi.jpg"
          },
          {
            "_id": "63f8c30769b2982676e676b9",
            "og": "game/undefined/o/yXMS4qQa.jpg",
            "sm": "game/undefined/bu6DMfBe.jpg"
          },
          {
            "_id": "63f8c30769b2982676e676ba",
            "og": "game/undefined/o/cPGCiK0N.jpg",
            "sm": "game/undefined/cGtgfdhm.jpg"
          }
        ]
      },
      "topCriticScore": 95.88586956521739,
      "mainChannel": {
        "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
        "channelTitle": "Nintendo of America",
        "description":
            "Welcome to the official Nintendo YouTube channel where you'll find all the latest videos, news and content from Nintendo ...",
        "title": "Nintendo of America",
        "image":
            "https://yt3.ggpht.com/ytc/AL5GRJXQ_ZwqS4HKyKWBfrsKocRrtsqfQG_0fTTphtlzVw=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCGIY_O-8vW4rfX98KlMkvRg"
      },
      "Rating": {"value": "E10+"},
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 97.24137931034483,
      "numReviews": 153,
      "numTopCriticReviews": 102,
      "medianScore": 100,
      "topCriticScore": 95.88586956521739,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 32,
          "name": "Nintendo Switch",
          "shortName": "Switch",
          "imageSrc": "https://c.opencritic.com/images/platforms/switch.png",
          "releaseDate": "2023-05-12T00:00:00.000Z",
          "displayRelease": "2023-05-12"
        }
      ],
      "Genres": [
        {"id": 27, "name": "Action"},
        {"id": 76, "name": "Adventure"}
      ],
      "Companies": [
        {"name": "Nintendo", "type": "DEVELOPER"},
        {"name": "Nintendo", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-04-13T00:00:00.000Z",
          "title":
              "The Legend of Zelda: Tears of the Kingdom – Official Trailer #3",
          "videoId": "uHGShqcAHlQ",
          "externalUrl": "https://www.youtube.com/watch?v=uHGShqcAHlQ",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "Watch the final pre-launch trailer for The Legend of Zelda: Tears of the Kingdom, coming May 12th, only on Nintendo Switch."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-02-08T00:00:00.000Z",
          "title":
              "The Legend of Zelda: Tears of the Kingdom – Official Trailer #2",
          "videoId": "fYZuiFDQwQw",
          "externalUrl": "https://www.youtube.com/watch?v=fYZuiFDQwQw",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "An epic adventure across the land and skies of Hyrule awaits in The Legend of Zelda™: Tears of the Kingdom for Nintendo Switch ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-09-13T00:00:00.000Z",
          "title":
              "The Legend of Zelda: Tears of the Kingdom – Official Trailer #1",
          "videoId": "2SNF4M_v7wc",
          "externalUrl": "https://www.youtube.com/watch?v=2SNF4M_v7wc",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "The title for the sequel to The Legend of Zelda: Breath of the Wild has been revealed! The Legend of Zelda: Tears of the Kingdom ..."
        }
      ],
      "name": "The Legend of Zelda: Tears of the Kingdom",
      "description":
          "An epic adventure across the land and skies of Hyrule awaits in The Legend of Zelda: Tears of the Kingdom for Nintendo Switch. The adventure is yours to create in a world fuelled by your imagination.\n\nIn this sequel to The Legend of Zelda: Breath of the Wild, you'll decide your own path through the sprawling landscapes of Hyrule and the mysterious islands floating in the vast skies above.\n\nCan you harness the power of Link's new abilities to fight back against the malevolent forces that threaten the kingdom?",
      "id": 14343,
      "firstReleaseDate": "2023-05-12T00:00:00.000Z",
      "createdAt": "2023-02-24T14:00:39.325Z",
      "updatedAt": "2023-11-27T16:16:19.597Z",
      "embargoDate": "2023-05-11T12:01:34.000Z",
      "firstReviewDate": "2023-04-26T00:00:00.000Z",
      "latestReviewDate": "2023-11-25T00:00:00.000Z",
      "criticalReviewDate": "2023-05-11T12:02:24.361Z",
      "url":
          "https://opencritic.com/game/14343/the-legend-of-zelda-tears-of-the-kingdom"
    }
  };
  Map<String, dynamic> map3 = {
    "Asgard's Wrath 2": {
      "id": "15979",
      "firstReleaseDate": "2023-12-15T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/15979/o/rjFXdbRZ.jpg",
          "sm": "game/15979/VzWi3ar0.jpg"
        },
        "square": {
          "og": "game/15979/o/ZFOLLppL.jpg",
          "xs": "game/15979/ZM8qPSEx.jpg",
          "sm": "game/15979/EA5xyGBJ.jpg",
          "lg": "game/15979/LC9X8elI.jpg"
        },
        "masthead": {
          "og": "game/15979/o/5H9g440e.jpg",
          "xs": "game/15979/Id12Vs8r.jpg",
          "sm": "game/15979/hk3UkaTp.jpg",
          "md": "game/15979/fSy3jJ93.jpg",
          "lg": "game/15979/2yaHEy80.jpg",
          "xl": "game/15979/u81bZb0z.jpg"
        },
        "banner": {
          "og": "game/15979/o/vUxORrW5.jpg",
          "sm": "game/15979/eZWCj9Pp.jpg"
        },
        "screenshots": []
      },
      "topCriticScore": 93.33333333333333,
      "mainChannel": {
        "channelId": "UC766vkQw0Mz3VtXX5XvXxGQ",
        "channelTitle": "Meta Quest ",
        "description":
            "Introducing Meta Quest 3. Get ready to expand your world.",
        "title": "Meta Quest ",
        "image":
            "https://yt3.ggpht.com/YBfJogznqSlTlacjocZgfFJEQFGJeb4k1M7mmFy2ox-WeUlGI-BsHVVRxBEbvm9XfEHwE0eMew=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UC766vkQw0Mz3VtXX5XvXxGQ"
      },
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 100,
      "numReviews": 7,
      "numTopCriticReviews": 6,
      "medianScore": 90,
      "topCriticScore": 93.33333333333333,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 29,
          "name": "Meta Quest",
          "shortName": "Quest",
          "imageSrc": "https://c.opencritic.com/images/platforms/oculus.png",
          "releaseDate": "2023-12-15T00:00:00.000Z"
        }
      ],
      "Genres": [
        {"id": 27, "name": "Action"},
        {"id": 77, "name": "RPG"}
      ],
      "Companies": [
        {"name": "Sanzaru Games, Inc.", "type": "DEVELOPER"},
        {"name": "Oculus Studios", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-12-08T00:00:00.000Z",
          "title": "Asgard’s Wrath 2 | Launch Trailer | Meta Quest 2 + 3 + Pro",
          "videoId": "3SYJeM_LaZ0",
          "externalUrl": "https://www.youtube.com/watch?v=3SYJeM_LaZ0",
          "channelTitle": "Meta Quest ",
          "channelId": "UC766vkQw0Mz3VtXX5XvXxGQ",
          "description":
              "Fight back against Loki's chaos in Asgard's Wrath 2, available December 15th. Asgard's Wrath 2 is an immersive, visceral VR ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-11-21T00:00:00.000Z",
          "title":
              "Asgard’s Wrath 2 | Cinematic Trailer - Guardian | Meta Quest 2 + 3 + Pro",
          "videoId": "mlXDrw0-KmM",
          "externalUrl": "https://www.youtube.com/watch?v=mlXDrw0-KmM",
          "channelTitle": "Meta Quest ",
          "channelId": "UC766vkQw0Mz3VtXX5XvXxGQ",
          "description":
              "The fate of reality lies in your hands. Get #AsgardsWrath2 free when you buy Meta Quest 3 for a limited time. Available December ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-11-20T00:00:00.000Z",
          "title":
              "Asgard’s Wrath 2 | Cinematic Trailer - Cyrene | Meta Quest 2 + 3 + Pro",
          "videoId": "aOlpD0MbaN4",
          "externalUrl": "https://www.youtube.com/watch?v=aOlpD0MbaN4",
          "channelTitle": "Meta Quest ",
          "channelId": "UC766vkQw0Mz3VtXX5XvXxGQ",
          "description":
              "You are no mere mortal. Get #AsgardsWrath2 free when you buy Meta Quest 3 for a limited time. Available December 15."
        }
      ],
      "name": "Asgard's Wrath 2",
      "description":
          "After promising you untold power, the trickster god Loki has betrayed you.\nWhile you remain trapped in his prison, he wreaks havoc - tearing the universe asunder.\n\nSuddenly battle is thrust upon you, and you find yourself whisked away to the eerie landscape known only as The Inbetween. Here the mysterious Weavers reveal that you alone can save the fabric of reality from Loki’s destruction.\n\nThe threads of fate carry you to the realms of Egypt and beyond. Here you must gain followers, uncover mysteries, battle monsters, and master the skills of the gods. Help the gods of Ancient Egypt defeat their enemies and in turn, they will help you defeat yours.\n\nYour redemption is far from certain. But this great evil must be stopped.\n\nLoki must know your wrath.",
      "id": 15979,
      "firstReleaseDate": "2023-12-15T00:00:00.000Z",
      "createdAt": "2023-12-14T14:44:28.562Z",
      "updatedAt": "2023-12-14T17:15:22.305Z",
      "firstReviewDate": "2023-12-14T00:00:00.000Z",
      "latestReviewDate": "2023-12-14T00:00:00.000Z",
      "url": "https://opencritic.com/game/15979/asgards-wrath-2"
    }
  };
  Map<String, dynamic> map4 = {
    'Against The Storm': {
      "id": "13940",
      "firstReleaseDate": "2023-12-08T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/13940/o/wXeN9FjS.jpg",
          "sm": "game/13940/u5834b03.jpg"
        },
        "square": {
          "og": "game/13940/o/QeTvUrXU.jpg",
          "xs": "game/13940/Cp8Ey2dt.jpg",
          "sm": "game/13940/9LQphM0V.jpg",
          "lg": "game/13940/olcpv5UF.jpg"
        },
        "masthead": {
          "og": "game/13940/o/AfunmfST.jpg",
          "xs": "game/13940/KB8cLpjS.jpg",
          "sm": "game/13940/fmAtkWUE.jpg",
          "md": "game/13940/eoDB1s5A.jpg",
          "lg": "game/13940/n9hX9sNv.jpg",
          "xl": "game/13940/l4sJziWW.jpg"
        },
        "banner": {
          "og": "game/13940/o/SnVBWDad.jpg",
          "sm": "game/13940/Vr0QyJVV.jpg"
        },
        "screenshots": [
          {
            "_id": "636373abe5182b53ef20e5b1",
            "og": "game/13940/o/ASDvbKGB.jpg",
            "sm": "game/13940/e2JAfvfl.jpg"
          },
          {
            "_id": "636373abe5182b53ef20e5b2",
            "og": "game/13940/o/60UWCZym.jpg",
            "sm": "game/13940/rgg47HLZ.jpg"
          },
          {
            "_id": "636373abe5182b53ef20e5b3",
            "og": "game/13940/o/fQvz0U87.jpg",
            "sm": "game/13940/EFNQQqA8.jpg"
          }
        ]
      },
      "topCriticScore": 92.33333333333333,
      "mainChannel": {
        "channelId": "UCOchKaC3FN2G-odtv4DiVlA",
        "channelTitle": "Hooded Horse",
        "description":
            "We're a Dallas, Texas based publisher of strategy, simulation, and role-playing games, including Manor Lords, Old World, Terra ...",
        "title": "Hooded Horse",
        "image":
            "https://yt3.ggpht.com/9zvpUWDwDd5akp-OuFE-czzkad1fNAPaHkZQfQqDxphqtUpWUKyBI5B0gDzU_FBtGPlsoSI7LQ=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCOchKaC3FN2G-odtv4DiVlA"
      },
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 88.88888888888889,
      "numReviews": 11,
      "numTopCriticReviews": 8,
      "medianScore": 90,
      "topCriticScore": 92.33333333333333,
      "percentile": 100,
      "tier": "Mighty",
      "Platforms": [
        {
          "id": 27,
          "name": "PC",
          "shortName": "PC",
          "imageSrc": "https://c.opencritic.com/images/platforms/pc.png",
          "releaseDate": "2023-12-08T00:00:00.000Z"
        }
      ],
      "Genres": [
        {"id": 87, "name": "Strategy"}
      ],
      "Companies": [
        {"name": "Eremite Games", "type": "DEVELOPER"},
        {"name": "Hooded Horse", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-11-20T00:00:00.000Z",
          "title":
              "Against the Storm - 1.0 Release Date Trailer | Dark Fantasy/Roguelite City Builder",
          "videoId": "P_etWv_PW3M",
          "externalUrl": "https://www.youtube.com/watch?v=P_etWv_PW3M",
          "channelTitle": "Hooded Horse",
          "channelId": "UCOchKaC3FN2G-odtv4DiVlA",
          "description":
              "Against the Storm is leaving Early Access and the 1.0 version is coming to Steam, GOG, Epic Games Store, and PC Game Pass ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-04-13T00:00:00.000Z",
          "title":
              "Against the Storm - Sentinels of the Forest Update Trailer - Dark Fantasy/Roguelite City Builder",
          "videoId": "Rf9xqem1n0U",
          "externalUrl": "https://www.youtube.com/watch?v=Rf9xqem1n0U",
          "channelTitle": "Hooded Horse",
          "channelId": "UCOchKaC3FN2G-odtv4DiVlA",
          "description":
              "Sentinels of the Forest adds a new species to your population - FOXES. Lead these foxes among the other 4 species to reclaim ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-03-08T00:00:00.000Z",
          "title":
              "Against the Storm - Changing World Trailer | Dark Fantasy/Roguelite City Builder",
          "videoId": "CBEJJXu8eJQ",
          "externalUrl": "https://www.youtube.com/watch?v=CBEJJXu8eJQ",
          "channelTitle": "Hooded Horse",
          "channelId": "UCOchKaC3FN2G-odtv4DiVlA",
          "description":
              "As the Queen's Viceroy, lead humans, beavers, lizards, and harpies to reclaim the wilderness and secure a future for civilization's ..."
        }
      ],
      "name": "Against The Storm",
      "description":
          "You are the Viceroy – a leader charged by the Scorched Queen to reclaim the wilderness and discover lost riches for the Smoldering City, civilization’s last bastion against the Blightstorm that destroyed the old world. Unlike most survival city builders where your focus is on a single city, in Against the Storm you must build a vast, prosperous network of settlements populated by diverse fantasy races, each with their own specializations and needs. \n\nBut the wilderness holds many hidden dangers, and never-ending storms will batter your population into submission. If your settlements should fall, then the expedition may end – but not the game. Against the Storm is a roguelite city builder, meaning you will carry forward the resources, upgrades, and experience of your past expeditions each time you set off for a new journey into the wild. \n\nBeavers and lizards stand alongside humans and harpies in the struggle to survive. Utilize each group’s strengths as you balance varying needs, from housing and culinary preferences to taste in luxuries and recreation. Manufacture raincoats, brew ale, and bake pies to boost morale in the face of the oppressive hostility of the forest.\n\nExperience core city builder gameplay enhanced by roguelite replayability. Build new settlements and collect valuable meta-progression resources to upgrade the Smoldering City. Recurring Blightstorms pose an inevitable threat to settlements, but they also reshape the world and open new opportunities for growth.\n\nWith hundreds of gameplay modifiers and 5 distinct biomes, every city location presents unique challenges for even the most resourceful Viceroy. Adjust your strategy to changing weather conditions and experiment with settlement “builds” — rosters of building blueprints and perks that can help your society thrive or bring it to ruins. Mix and match ingredients to take advantage of the resources at hand. You never know what wares the Trader will bring next year, and the forest hold treasures, resources… and ancient threats. \n\n\n\n\n\nLaying the foundations for a new city is one of the most exciting moments in a city builder game. In Against the Storm, you’ll have the opportunity to repeatedly create new settlements, while still interacting and trading with previously established cities in a growing world.",
      "id": 13940,
      "firstReleaseDate": "2023-12-08T00:00:00.000Z",
      "createdAt": "2022-11-02T17:43:52.098Z",
      "updatedAt": "2023-12-14T17:10:10.551Z",
      "firstReviewDate": "2022-10-30T00:00:00.000Z",
      "latestReviewDate": "2023-12-14T00:00:00.000Z",
      "url": "https://opencritic.com/game/13940/against-the-storm"
    }
  };
  Map<String, dynamic> map5 = {
    'Videoverse': {
      "id": "15333",
      "firstReleaseDate": "2023-08-07T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/15333/o/bYmv2con.jpg",
          "sm": "game/15333/BOIrj7pr.jpg"
        },
        "square": {
          "og": "game/15333/o/ha9gzpQ0.jpg",
          "xs": "game/15333/u9ZMbAXm.jpg",
          "sm": "game/15333/BhqNISKs.jpg",
          "lg": "game/15333/HmGpgTFP.jpg"
        },
        "masthead": {
          "og": "game/15333/o/MKo2Xth1.jpg",
          "xs": "game/15333/WxflvazP.jpg",
          "sm": "game/15333/XKsdhHN5.jpg",
          "md": "game/15333/kXFPyhRX.jpg",
          "lg": "game/15333/ZETxqorz.jpg",
          "xl": "game/15333/3PLNUhtm.jpg"
        },
        "banner": {
          "og": "game/15333/o/MdsZqHjc.jpg",
          "sm": "game/15333/H0g9WLZl.jpg"
        },
        "screenshots": [
          {
            "_id": "64d4b51ae77bbd7d6c77dae2",
            "og": "game/15333/o/t5TOoPKa.jpg",
            "sm": "game/15333/a9RmRm9y.jpg"
          },
          {
            "_id": "64d4b51ae77bbd7d6c77dae3",
            "og": "game/15333/o/tXTi5YhH.jpg",
            "sm": "game/15333/sBTsJfPm.jpg"
          },
          {
            "_id": "64d4b51ae77bbd7d6c77dae4",
            "og": "game/15333/o/Fq9gZzIc.jpg",
            "sm": "game/15333/DhpbLYmW.jpg"
          }
        ]
      },
      "topCriticScore": 92.25,
      "mainChannel": {
        "channelId": "UCSnk-AdyKSHLEeTrYAMH0PQ",
        "channelTitle": "Kinmoku",
        "description":
            "Games by Kinmoku - Made the game One Night Stand. Now working on VIDEOVERSE. Long time artist and animator, too! :)",
        "title": "Kinmoku",
        "image":
            "https://yt3.ggpht.com/tAaQl8U4zYl4aGmwJT1Oajf7SDxT_FPi0mzh2tZygto0TskdyyZ_lmCLTMrmFSM6JycLWamioA=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCSnk-AdyKSHLEeTrYAMH0PQ"
      },
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 87.5,
      "numReviews": 10,
      "numTopCriticReviews": 6,
      "medianScore": 90,
      "topCriticScore": 92.25,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 27,
          "name": "PC",
          "shortName": "PC",
          "imageSrc": "https://c.opencritic.com/images/platforms/pc.png",
          "releaseDate": "2023-08-07T00:00:00.000Z"
        }
      ],
      "Genres": [
        {"id": 76, "name": "Adventure"}
      ],
      "Companies": [
        {"name": "Kinmoku", "type": "DEVELOPER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-07-07T00:00:00.000Z",
          "title": "VIDEOVERSE – Release Date Announcement Trailer",
          "videoId": "L3k_0_KQcDQ",
          "externalUrl": "https://www.youtube.com/watch?v=L3k_0_KQcDQ",
          "channelTitle": "Kinmoku",
          "channelId": "UCSnk-AdyKSHLEeTrYAMH0PQ",
          "description":
              "VIDEOVERSE, a narrative adventure game about love and friendship in the early internet, will release on Monday 7th August ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-12-23T00:00:00.000Z",
          "title": "VIDEOVERSE – First Gameplay Trailer",
          "videoId": "x_tWIzjPdok",
          "externalUrl": "https://www.youtube.com/watch?v=x_tWIzjPdok",
          "channelTitle": "Kinmoku",
          "channelId": "UCSnk-AdyKSHLEeTrYAMH0PQ",
          "description":
              "Get a first look at the gameplay of VIDEOVERSE – Coming 2023! ---------------------- Take a trip back to the days of the early internet ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-08-17T00:00:00.000Z",
          "title": "VIDEOVERSE - Teaser Trailer",
          "videoId": "HVeXrnP_-P8",
          "externalUrl": "https://www.youtube.com/watch?v=HVeXrnP_-P8",
          "channelTitle": "Kinmoku",
          "channelId": "UCSnk-AdyKSHLEeTrYAMH0PQ",
          "description":
              "A short teaser for my next game, VIDEOVERSE, which is coming soon to PC, Mac and Linux! Take a trip back to the days of the ..."
        }
      ],
      "name": "Videoverse",
      "description":
          "Relive the days of past social gaming networks in VIDEOVERSE, a decision-based narrative adventure focusing on character development, friendship and love, from the developer behind One Night Stand.\n\nAs Emmett, a young video game fan and aspiring artist, dive into this fictional video game era, where the Kinmoku Shark gaming system and its online social network, Videoverse, were still popular. Strengthen Emmett’s friendships, share fan art and browse the lively gaming communities. Make decisions that will change how Emmett grows, his approach to Videoverse and, ultimately, the final outcome!\n\nWill your actions help Videoverse thrive, or will you get caught up in teenage drama, video game fandoms and corporate conspiracies?\n\nRELIVE THE DAYS OF RETRO GAMING\n\nVIDEOVERSE is inspired by Miiverse, MSN messenger, early internet forums and 00’s technology. The chill soundscape of the Kinmoku Shark, composed by Clark Aboud (Slay the Spire, Kind Words), will uncover memories of your favourite retro gaming consoles.\n\nBROWSE VIDEOVERSE\n\nMeet a huge cast of characters, unlock multiple side stories, enjoy the pixel doodles, and seek out the truth behind the troubled social gaming network! Personalise your Videoverse experience by choosing your avatar, personal quote and favourite theme.\n\nJOIN FEUDAL FANTASY FANS\n\nAccompany Emmett as he plays the Kinmoku’s Shark’s most popular JRPG, Feudal Fantasy. Swap theories and discover tips from other FF fans in its exclusive Videoverse community…and find out whether or not Hanzo will be able to stop the evil Nobunaga!\n\nVIDEOVERSE contains several accessibility options:\n\nClear Font\n\nClosed Captions\n\nColourblind Friendly Themes\n\nContent Warnings\n\nSelf-Voicing\n\nSound, Music and Voice Volumes\n\nTip Button",
      "id": 15333,
      "firstReleaseDate": "2023-08-07T00:00:00.000Z",
      "createdAt": "2023-08-08T12:38:20.288Z",
      "updatedAt": "2023-10-11T12:02:26.813Z",
      "firstReviewDate": "2023-08-07T00:00:00.000Z",
      "latestReviewDate": "2023-10-11T00:00:00.000Z",
      "url": "https://opencritic.com/game/15333/videoverse"
    }
  };
  Map<String, dynamic> map6 = {
    'Resident Evil 4 (2023)': {
      "id": "14200",
      "firstReleaseDate": "2023-03-24T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/14200/o/re17RGe6.jpg",
          "sm": "game/14200/W34oCoSk.jpg"
        },
        "square": {
          "og": "game/14200/o/WcxMexKD.jpg",
          "xs": "game/14200/kAIFdGi3.jpg",
          "sm": "game/14200/ZfeXYpLF.jpg",
          "lg": "game/14200/YyQ2ZdaX.jpg"
        },
        "masthead": {
          "og": "game/14200/o/AVzJmm05.jpg",
          "xs": "game/14200/ENBLVVWk.jpg",
          "sm": "game/14200/2IsTeZvI.jpg",
          "md": "game/14200/hEvOSB7V.jpg",
          "lg": "game/14200/ONd3f95Q.jpg",
          "xl": "game/14200/XzhvXPpt.jpg"
        },
        "banner": {
          "og": "game/14200/o/QCvVSNYz.jpg",
          "sm": "game/14200/wRP2JUnj.jpg"
        },
        "logo": {"og": "game/14200/o/bs865czM.jpg"},
        "screenshots": [
          {
            "_id": "63c701e669b2982676e60da9",
            "og": "game/14200/o/oHTkIraf.jpg",
            "sm": "game/14200/cHrclGSx.jpg"
          },
          {
            "_id": "63c701e669b2982676e60daa",
            "og": "game/14200/o/ucmhM3ZZ.jpg",
            "sm": "game/14200/bQ0HUqic.jpg"
          },
          {
            "_id": "63c701e669b2982676e60dab",
            "og": "game/14200/o/AcuEJmKD.jpg",
            "sm": "game/14200/NE1fgnFD.jpg"
          }
        ]
      },
      "topCriticScore": 92.10810810810811,
      "mainChannel": {
        "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
        "channelTitle": "Resident Evil",
        "description":
            "ESRB Rating: Mature with Blood and Gore, Intense Violence, Nudity, Strong Language and Suggestive Themes - May contain ...",
        "title": "Resident Evil",
        "image":
            "https://yt3.ggpht.com/TCONkav05qWFlR5s5eQ1UFCtSfUuvLaY8YkdyBWAOqdttq6iwxPliJBPeKG30pVufIanQeyj4A=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCS2iGSouOopNHXFBcWtBQiA"
      },
      "Rating": {"value": "M"},
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 97.88359788359789,
      "numReviews": 197,
      "numTopCriticReviews": 124,
      "medianScore": 95,
      "topCriticScore": 92.10810810810811,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "name": "Resident Evil 4 (2023)",
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-03-09T00:00:00.000Z",
          "title": "Resident Evil 4 - Short Trailer 3",
          "videoId": "CcTmjZf-DvA",
          "externalUrl": "https://www.youtube.com/watch?v=CcTmjZf-DvA",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. Survival horror reimagined for 2023. https://www.residentevil.com/re4/ #capcom #residentevil ...",
          "expectedName": "Resident Evil 4 (2023 Remake) — undefined"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-03-09T00:00:00.000Z",
          "title": "Resident Evil 4 - Short Trailer 2",
          "videoId": "Thj6Rs9sQrQ",
          "externalUrl": "https://www.youtube.com/watch?v=Thj6Rs9sQrQ",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. Survival horror reimagined for 2023. https://www.residentevil.com/re4/ #capcom #residentevil ...",
          "expectedName": "Resident Evil 4 (2023 Remake) — undefined"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-03-09T00:00:00.000Z",
          "title": "Resident Evil 4 - Short Trailer 1",
          "videoId": "17lHF8U_du8",
          "externalUrl": "https://www.youtube.com/watch?v=17lHF8U_du8",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. Survival horror reimagined for 2023. https://www.residentevil.com/re4/ #capcom #residentevil ...",
          "expectedName": "Resident Evil 4 (2023 Remake) — undefined"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-02-23T00:00:00.000Z",
          "title": "Resident Evil 4 - 3rd Trailer",
          "videoId": "Id2EaldBaWw",
          "externalUrl": "https://www.youtube.com/watch?v=Id2EaldBaWw",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. Survival horror reimagined for 2023. https://www.residentevil.com/re4/ #capcom #residentevil ...",
          "specialName": "Third Trailer",
          "expectedName": "Resident Evil 4 (2023 Remake) — Third Trailer"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-10-20T00:00:00.000Z",
          "title": "Resident Evil 4 - 2nd Trailer",
          "videoId": "cMzJv0LOJYo",
          "externalUrl": "https://www.youtube.com/watch?v=cMzJv0LOJYo",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. See how Resident Evil 4 is evolving ahead of its release on March 24th, 2023.",
          "specialName": "Second Trailer",
          "expectedName": "Resident Evil 4 (2023 Remake) — Second Trailer"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-06-02T00:00:00.000Z",
          "title": "Resident Evil 4 - Announcement Trailer",
          "videoId": "rcFarJACzx0",
          "externalUrl": "https://www.youtube.com/watch?v=rcFarJACzx0",
          "channelTitle": "Resident Evil",
          "channelId": "UCS2iGSouOopNHXFBcWtBQiA",
          "description":
              "Survival is just the beginning. Survival horror reimagined for 2023. https://www.residentevil.com/re4/ #Capcom #ResidentEvil ...",
          "specialName": "Announcement Trailer",
          "expectedName": "Resident Evil 4 (2023 Remake) — Announcement Trailer"
        }
      ],
      "Companies": [
        {"name": "Capcom", "type": "PUBLISHER"}
      ],
      "Platforms": [
        {
          "name": "PC",
          "shortName": "PC",
          "id": 27,
          "displayRelease": "",
          "releaseDate": "2023-03-24T00:00:00.000Z"
        },
        {
          "id": 2,
          "name": "Xbox Series X/S",
          "shortName": "XBXS",
          "imageSrc": "https://c.opencritic.com/images/platforms/xbxs.png",
          "releaseDate": "2023-03-24T00:00:00.000Z"
        },
        {
          "id": 3,
          "name": "PlayStation 5",
          "shortName": "PS5",
          "imageSrc": "https://c.opencritic.com/images/platforms/ps5.png",
          "releaseDate": "2023-03-24T00:00:00.000Z"
        },
        {
          "id": 6,
          "name": "PlayStation 4",
          "shortName": "PS4",
          "imageSrc": "https://c.opencritic.com/images/platforms/ps4.png",
          "releaseDate": "2023-03-24T00:00:00.000Z"
        }
      ],
      "Genres": [
        {"id": 95, "name": "Horror"},
        {"id": 27, "name": "Action"}
      ],
      "id": 14200,
      "firstReleaseDate": "2023-03-24T00:00:00.000Z",
      "createdAt": "2023-01-17T20:06:42.729Z",
      "updatedAt": "2023-11-06T04:02:10.806Z",
      "description":
          "Survival is just the beginning.\n\nSix years have passed since the biological disaster in Raccoon City.\n\nAgent Leon S. Kennedy, one of the survivors of the incident, has been sent to rescue the president's kidnapped daughter.\n\nHe tracks her to a secluded European village, where there is something terribly wrong with the locals.\n\nAnd the curtain rises on this story of daring rescue and grueling horror where life and death, terror and catharsis intersect.\n\nFeaturing modernized gameplay, a reimagined storyline, and vividly detailed graphics,\n\nResident Evil 4 marks the rebirth of an industry juggernaut.\n\nRelive the nightmare that revolutionized survival horror.",
      "embargoDate": "2023-03-17T07:03:38.000Z",
      "firstReviewDate": "2023-03-16T00:00:00.000Z",
      "latestReviewDate": "2023-06-30T00:00:00.000Z",
      "criticalReviewDate": "2023-03-17T07:02:40.504Z",
      "url": "https://opencritic.com/game/14200/resident-evil-4-2023-"
    }
  };
  Map<String, dynamic> map7 = {
    'Street Fighter 6': {
      "id": "14352",
      "firstReleaseDate": "2023-06-01T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/14352/o/I6r5WokV.jpg",
          "sm": "game/14352/jWLMNzHH.jpg"
        },
        "square": {
          "og": "game/14352/o/YB2Nhgsg.jpg",
          "xs": "game/14352/2U9knuvb.jpg",
          "sm": "game/14352/cgXYr6vN.jpg",
          "lg": "game/14352/9YykjWRl.jpg"
        },
        "masthead": {
          "og": "game/14352/o/JTozTcQH.jpg",
          "xs": "game/14352/tpSbzkWx.jpg",
          "sm": "game/14352/2dAnhU39.jpg",
          "md": "game/14352/q5uFGaxK.jpg",
          "lg": "game/14352/APO7zJMP.jpg",
          "xl": "game/14352/g89qeK3z.jpg"
        },
        "banner": {
          "og": "game/14352/o/4YJVEi7j.jpg",
          "sm": "game/14352/uYD5ArpC.jpg"
        },
        "screenshots": [
          {
            "_id": "63f9906069b2982676e67954",
            "og": "game/14352/o/rnesWLbL.jpg",
            "sm": "game/14352/Galcupzu.jpg"
          },
          {
            "_id": "63f9906069b2982676e67955",
            "og": "game/14352/o/9jQlc0tz.jpg",
            "sm": "game/14352/dYN3khu3.jpg"
          },
          {
            "_id": "63f9906069b2982676e67956",
            "og": "game/14352/o/tdfjXcUq.jpg",
            "sm": "game/14352/cEzldaQm.jpg"
          }
        ]
      },
      "topCriticScore": 91.54545454545455,
      "mainChannel": {
        "channelId": "UCVg9nCmmfIyP4QcGOnZZ9Qg",
        "channelTitle": "Street Fighter",
        "description":
            "Welcome to the Official Street Fighter YouTube channel. ESRB Rating: TEEN with Alcohol Reference, Crude Humor, Language, ...",
        "title": "Street Fighter",
        "image":
            "https://yt3.ggpht.com/H6m7O7lYIdR2vW3323znJ5Yl5BWyB_h4Xpo8S_9voxSFFb33t8YSmQTo8B-r8u63YPvk_vLrWVc=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCVg9nCmmfIyP4QcGOnZZ9Qg"
      },
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 98.75,
      "numReviews": 169,
      "numTopCriticReviews": 111,
      "medianScore": 90,
      "topCriticScore": 91.54545454545455,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "name": "Street Fighter 6",
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-05-25T00:00:00.000Z",
          "title": "Street Fighter 6 - Launch Trailer",
          "videoId": "4EnsDg6DCTE",
          "externalUrl": "https://www.youtube.com/watch?v=4EnsDg6DCTE",
          "channelTitle": "Street Fighter",
          "channelId": "UCVg9nCmmfIyP4QcGOnZZ9Qg",
          "description":
              "\"Fighting is an art. And this is our masterpiece.\" Street Fighter 6 brings in a new era for the iconic series complete with a diverse ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-05-24T00:00:00.000Z",
          "title": "Street Fighter 6 - Your Story Trailer",
          "videoId": "HPEDfsHQL4k",
          "externalUrl": "https://www.youtube.com/watch?v=HPEDfsHQL4k",
          "channelTitle": "Street Fighter",
          "channelId": "UCVg9nCmmfIyP4QcGOnZZ9Qg",
          "description":
              "Stories don't write themselves. Legends do. Step into World Tour with your avatar to meet the legendary characters who will ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-04-20T00:00:00.000Z",
          "title":
              "Street Fighter 6 - World Tour Gameplay & Avatar Battle Trailer",
          "videoId": "lfTvetStEsc",
          "externalUrl": "https://www.youtube.com/watch?v=lfTvetStEsc",
          "channelTitle": "Street Fighter",
          "channelId": "UCVg9nCmmfIyP4QcGOnZZ9Qg",
          "description":
              "Bring your customized avatar from World Tour into the Battle Hub for the chaos that is Avatar Battles. Fight other players online ..."
        }
      ],
      "Companies": [
        {"name": "CAPCOM", "type": "DEVELOPER"}
      ],
      "Platforms": [
        {
          "name": "PC",
          "shortName": "PC",
          "id": 27,
          "releaseDate": "2023-06-02T00:00:00.000Z",
          "displayRelease": "2023-06-02"
        },
        {
          "id": 2,
          "name": "Xbox Series X/S",
          "shortName": "XBXS",
          "imageSrc": "https://c.opencritic.com/images/platforms/xbxs.png",
          "releaseDate": "2023-06-01T00:00:00.000Z",
          "displayRelease": "2023-06-01"
        },
        {
          "id": 3,
          "name": "PlayStation 5",
          "shortName": "PS5",
          "imageSrc": "https://c.opencritic.com/images/platforms/ps5.png",
          "releaseDate": "2023-06-01T00:00:00.000Z",
          "displayRelease": "2023-06-01"
        },
        {
          "id": 6,
          "name": "PlayStation 4",
          "shortName": "PS4",
          "imageSrc": "https://c.opencritic.com/images/platforms/ps4.png",
          "releaseDate": "2023-06-01T00:00:00.000Z",
          "displayRelease": "2023-06-01"
        }
      ],
      "Genres": [
        {"id": 27, "name": "Action"},
        {"id": 6, "name": "Fighting"}
      ],
      "id": 14352,
      "firstReleaseDate": "2023-06-01T00:00:00.000Z",
      "createdAt": "2023-02-24T19:19:47.692Z",
      "updatedAt": "2023-11-14T12:35:28.536Z",
      "description":
          "Here comes Capcom’s newest challenger! Street Fighter™ 6 launches worldwide on June 2nd, 2023 and represents the next evolution of the series. \n\nPowered by Capcom’s proprietary RE ENGINE, the Street Fighter 6 experience spans across three distinct game modes featuring World Tour, Fighting Ground and Battle Hub. \n\nDiverse Roster of 18 Fighters\nPlay legendary masters and new fan favorites like Ryu, Chun-Li, Luke, Jamie, Kimberly and more in this latest edition with each character featuring striking new redesigns and exhilarating cinematic specials.\n\nDominate the Fighting Ground\nStreet Fighter 6 offers a highly evolved combat system with three control types - Classic, Modern and Dynamic - allowing you to quickly play to your skill level. \nThe new Real Time Commentary Feature adds all the hype of a competitive match as well as easy-to-understand explanations about your gameplay.\nThe Drive Gauge is a new system to manage your resources. Use it wisely in order to claim victory.\n\nExplore the Streets in World Tour\nDiscover the meaning of strength in World Tour, an immersive, single-player story mode. Take your avatar and explore Metro City and beyond. Meet Masters who will take you under their wing and teach you their style and techniques.\n\nSeek Rivals in the Battle Hub\nThe Battle Hub represents a core mode of Street Fighter 6 where players can gather and communicate, and become stronger together. Use the avatar you create in World Tour to check out cabinets on the Battle Hub floor and play against other players, or head over to the Game Center to enjoy some of Capcom's classic arcade games.\n\nYour path to becoming a World Warrior starts here.",
      "firstReviewDate": "2023-05-29T00:00:00.000Z",
      "latestReviewDate": "2023-08-29T00:00:00.000Z",
      "criticalReviewDate": "2023-05-30T07:07:59.686Z",
      "url": "https://opencritic.com/game/14352/street-fighter-6"
    }
  };
  Map<String, dynamic> map8 = {
    'Super Mario Bros. Wonder': {
      "id": "15123",
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/undefined/o/Mh0RuxrM.jpg",
          "sm": "game/undefined/yJxY9Zik.jpg"
        },
        "square": {
          "og": "game/undefined/o/yEEa0oBb.jpg",
          "xs": "game/undefined/SGuVwrQt.jpg",
          "sm": "game/undefined/M6UU271y.jpg",
          "lg": "game/undefined/oqJ97toZ.jpg"
        },
        "masthead": {
          "og": "game/undefined/o/DiYLhXlz.jpg",
          "xs": "game/undefined/KpdNIqNz.jpg",
          "sm": "game/undefined/0btoOAH0.jpg",
          "md": "game/undefined/yIos765x.jpg",
          "lg": "game/undefined/sFxzzJ5X.jpg",
          "xl": "game/undefined/6NtoJrfw.jpg"
        },
        "banner": {
          "og": "game/15123/o/pYQdJSpc.jpg",
          "sm": "game/15123/JsVEa0TK.jpg"
        },
        "screenshots": [
          {
            "_id": "649351f08e4ece2a2964cc33",
            "og": "game/undefined/o/DsCnYNaP.jpg",
            "sm": "game/undefined/xJhBH7tg.jpg"
          },
          {
            "_id": "649351f08e4ece2a2964cc34",
            "og": "game/undefined/o/m7vPsLsv.jpg",
            "sm": "game/undefined/YAns8N05.jpg"
          },
          {
            "_id": "649351f08e4ece2a2964cc35",
            "og": "game/undefined/o/PwgmDYAc.jpg",
            "sm": "game/undefined/xYLpS0EV.jpg"
          }
        ]
      },
      "topCriticScore": 91.0448717948718,
      "mainChannel": {
        "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
        "channelTitle": "Nintendo of America",
        "description":
            "Welcome to the official Nintendo YouTube channel where you'll find all the latest videos, news and content from Nintendo ...",
        "title": "Nintendo of America",
        "image":
            "https://yt3.ggpht.com/ytc/AGIKgqOvOm0B-pb88oiILgVKOLk7A67R25GkRNzJNTykmw=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCGIY_O-8vW4rfX98KlMkvRg"
      },
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 98.31932773109243,
      "numReviews": 120,
      "numTopCriticReviews": 81,
      "medianScore": 90,
      "topCriticScore": 91.0448717948718,
      "percentile": 100,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 32,
          "name": "Nintendo Switch",
          "shortName": "Switch",
          "imageSrc": "https://c.opencritic.com/images/platforms/switch.png",
          "releaseDate": "2023-10-20T00:00:00.000Z",
          "displayRelease": "2023-10-20"
        }
      ],
      "Genres": [
        {"id": 27, "name": "Action"},
        {"id": 82, "name": "Platformer"}
      ],
      "Companies": [
        {"name": "Nintendo", "type": "DEVELOPER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-09-22T00:00:00.000Z",
          "title":
              "Super Mario Bros. Wonder – Overview Trailer – Nintendo Switch",
          "videoId": "ljx3QQ4uApg",
          "externalUrl": "https://www.youtube.com/watch?v=ljx3QQ4uApg",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "Welcome to the Flower Kingdom! Learn all about Mario's latest 2D side-scrolling adventure, including worlds, playable characters, ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-08-31T00:00:00.000Z",
          "title": "Super Mario Bros. Wonder Direct 8.31.2023",
          "videoId": "G0m_uNaSres",
          "externalUrl": "https://www.youtube.com/watch?v=G0m_uNaSres",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "Check out the Super Mario Bros. Wonder Direct, featuring roughly 15 minutes of information about Super Mario Bros. Wonder!"
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-06-21T00:00:00.000Z",
          "title": "Super Mario Bros. Wonder - Nintendo Direct 6.21.2023",
          "videoId": "JStAYvbeSHc",
          "externalUrl": "https://www.youtube.com/watch?v=JStAYvbeSHc",
          "channelTitle": "Nintendo of America",
          "channelId": "UCGIY_O-8vW4rfX98KlMkvRg",
          "description":
              "Super Mario Bros. Wonder is releasing for Nintendo Switch on October 20, 2023. Pre-order today: ..."
        }
      ],
      "name": "Super Mario Bros. Wonder",
      "description":
          "Step into a world of wonder in Super Mario Bros. Wonder for Nintendo Switch!\n\nClassic Mario side-scrolling gameplay is turned on its head with the addition of Wonder Flowers! These game-changing items trigger spectacular moments you have to see to believe. Witness pipes coming alive, wreak havoc as a giant spiky ball, and see even more unexpected events called Wonder Effects.\n\nPick from heroic Super Mario characters and Power-Ups.\n\nChoose from familiar characters including Mario, Luigi, Peach, Daisy, Yoshi and Toad. Transform into Elephant Mario to use your trunk to trounce enemies with a surprising new Power-Up!\n\nShare the wonder with friends and Mario fans.\n\nTeam up with up to three friends locally and gather around one Nintendo Switch console to experience the game-bending Wonder Effects together as you tackle courses as a team, and help each other on your way to the goal.",
      "id": 15123,
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "createdAt": "2023-06-21T19:39:28.264Z",
      "updatedAt": "2023-12-11T12:19:46.297Z",
      "embargoDate": "2023-10-18T13:02:31.000Z",
      "firstReviewDate": "2023-10-18T00:00:00.000Z",
      "latestReviewDate": "2023-12-11T00:00:00.000Z",
      "criticalReviewDate": "2023-10-18T13:03:15.570Z",
      "url": "https://opencritic.com/game/15123/super-mario-bros-wonder"
    }
  };
  Map<String, dynamic> map9 = {
    'Turbo Overkill': {
      "id": "13051",
      "firstReleaseDate": "2023-07-18T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/13051/o/cil3gzcd.jpg",
          "sm": "game/13051/QSR6ai9s.jpg"
        },
        "square": {
          "og": "game/13051/o/1emSorKV.jpg",
          "xs": "game/13051/xBDXeT3c.jpg",
          "sm": "game/13051/nDLhvd8z.jpg",
          "lg": "game/13051/bweDHAgi.jpg"
        },
        "masthead": {
          "og": "game/13051/o/D7OuAzH9.jpg",
          "xs": "game/13051/qqqHW3Yb.jpg",
          "sm": "game/13051/a1I3tF2W.jpg",
          "md": "game/13051/j2thpuVl.jpg",
          "lg": "game/13051/mdyCgIA0.jpg",
          "xl": "game/13051/v8EA1b3V.jpg"
        },
        "banner": {
          "og": "game/13051/o/sXrrVSeW.jpg",
          "sm": "game/13051/elNe2Loy.jpg"
        },
        "screenshots": [
          {
            "_id": "62f43cde25b2505411fc704b",
            "og": "game/13051/o/D2oIUvyw.jpg",
            "sm": "game/13051/bsGTM1z9.jpg"
          },
          {
            "_id": "62f43cde25b2505411fc704c",
            "og": "game/13051/o/qJ2rH8jY.jpg",
            "sm": "game/13051/49UnqRe8.jpg"
          },
          {
            "_id": "62f43cde25b2505411fc704d",
            "og": "game/13051/o/heEagVyT.jpg",
            "sm": "game/13051/NxP98sTb.jpg"
          }
        ]
      },
      "topCriticScore": 90.55555555555556,
      "mainChannel": {
        "channelId": "UCCKe3ITPoQc_f0Ftbg-dpBg",
        "channelTitle": "Apogee Entertainment",
        "description":
            "Welcome to Apogee Entertainment, the original Indie publisher! Join our growing community and help us celebrate a new chapter ...",
        "title": "Apogee Entertainment",
        "image":
            "https://yt3.ggpht.com/NrYd0OBM9Ve76Q_4E-B67Y7EDRUISNaYG7snM-QqXGcCp7BPat5vrxUWnCxMBHCYfQkqRBrbHQ=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCCKe3ITPoQc_f0Ftbg-dpBg"
      },
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "hasLootBoxes": false,
      "percentRecommended": 100,
      "numReviews": 14,
      "numTopCriticReviews": 10,
      "medianScore": 90,
      "topCriticScore": 90.55555555555556,
      "percentile": 99,
      "tier": "Mighty",
      "Platforms": [
        {
          "id": 27,
          "name": "PC",
          "shortName": "PC",
          "imageSrc": "https://c.opencritic.com/images/platforms/pc.png",
          "releaseDate": "2023-07-18T00:00:00.000Z",
          "displayRelease": "2023-07-18"
        }
      ],
      "Genres": [
        {"id": 27, "name": "Action"},
        {"id": 79, "name": "First-Person Shooter"}
      ],
      "Companies": [
        {"name": "Trigger Happy Interactive", "type": "DEVELOPER"},
        {"name": "Apogee Entertainment", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-08-11T00:00:00.000Z",
          "title": "Turbo Overkill | Launch Trailer",
          "videoId": "c6NH-TDClDA",
          "externalUrl": "https://www.youtube.com/watch?v=c6NH-TDClDA",
          "channelTitle": "Apogee Entertainment",
          "channelId": "UCCKe3ITPoQc_f0Ftbg-dpBg",
          "description":
              "Turbo Overkill, Available on PC Now! ▻ http://TurboOverkill.com The critically acclaimed hyper-fast-paced cyberpunk boomer ..."
        }
      ],
      "screenshots": [
        {
          "_id": "626908549c56fa49d0224b7c",
          "fullRes":
              "//c.opencritic.com/images/games/13051/jsSJbBN9qmOWIcNhvvSyLBAkTvdtk2RLiJz9aC23MnCZIpmR.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/13051/jsSJbBN9qmOWIcNhvvSyLBAkTvdtk2RLiJz9aC23MnCZIpmR_th.jpg"
        },
        {
          "_id": "626908549c56fa49d0224b7d",
          "fullRes":
              "//c.opencritic.com/images/games/13051/Qu8oQ8Gfi6qyd4wktRNWA32oRd56TVMCpYpgca5jLzI8UcBQ.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/13051/Qu8oQ8Gfi6qyd4wktRNWA32oRd56TVMCpYpgca5jLzI8UcBQ_th.jpg"
        },
        {
          "_id": "626908549c56fa49d0224b7e",
          "fullRes":
              "//c.opencritic.com/images/games/13051/cfVQsTWjZ2h6I3T5k3IxioZ9Q7DUsEWref17K5v7fEWJWPBA.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/13051/cfVQsTWjZ2h6I3T5k3IxioZ9Q7DUsEWref17K5v7fEWJWPBA_th.jpg"
        },
        {
          "_id": "626908549c56fa49d0224b7f",
          "fullRes":
              "//c.opencritic.com/images/games/13051/xlos08Rs5kESaNBvIPUKaEFwCGBtaeqCTQ1fLHoKfKcu5lp1.jpg",
          "thumbnail":
              "//c.opencritic.com/images/games/13051/xlos08Rs5kESaNBvIPUKaEFwCGBtaeqCTQ1fLHoKfKcu5lp1_th.jpg"
        }
      ],
      "name": "Turbo Overkill",
      "description":
          "HALF-METAL, HALF-HUMAN, HALF-CRAZY\nHeavily inspired by some of the all-time greats like Doom, Duke Nukem and Quake, with stunning cyberpunk visuals, Turbo Overkill is the most savage FPS ever released by Apogee. You play as half-metal, half-human, half-crazy Johnny Turbo, augmented with hidden arm rockets and a chainsaw that extends from your lower leg allowing you to kick-slice enemies wide open.\n\nIn this Blade Runner-meets-DOOM hellscape, Johnny returns to his hometown of Paradise and finds its entire population possessed by Syn, a rogue AI, and its army of augmented minions. Desperate for enough money to outrun his past mistakes, Johnny takes on the impossible job of destroying the greatest AI ever created. Rival bounty hunters want to claim the prize first. Nothing is easy in paradise.\n\n\nHERO TIME, WALL-RUNNING, DASHING AND GRAPPLING HOOKS, OH MY\nTurbo Overkill takes over-the-top to never-before-reached heights. Activate Hero Time(™), a new form of slow motion with a twist. Build incredible speed by wall-running and dashing. Slide on your chainsaw leg, eviscerating foes and opening up bosses for critical damage, and go car-surfing on the hoods of flying cars. Blast away with the Twin Magnums, which lock-on and instagib several foes, the Boomer Shotgun and its attached grenade launcher, or the Telefragger sniper rifle, which teleports Johnny inside an enemy before they explode from within. The FPS genre is about to get wild and fun again.\n\nRace through two dozen stages packed with secrets, bonus arena stages, and white-knuckle combat puzzles. Find game-changing collectibles to unlock punishing modifiers like triple-monster-speed and insta-kill. Combine all of Johnny’s weapons and powers to outsmart, outgun and outrun the corrupted legions.\n\n\nTL;DR:\no Kill a boss, get its augment (special power)\no Play Spider-Man with your grappling hook\no One-up Duke Nukem with your chainsaw kick\no Kills = cash. Use cash to install augments, upgrade your weapons, and add new abilities in your talent tree\no Be a ghost runner while wall running\no Attack from above riding the hood of your flying car like a kung-furious badass\no Mini-rockets built into your robotic arm? ✔\no This. List. Will. Grow. Wishlist the game to see it happen\n\n\n",
      "bannerScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/13051/ja81n1sYoPgWi5xUwjwMHgi7GYbMDykUZzmXC4tkNJUpOL8K.jpg"
      },
      "id": 13051,
      "firstReleaseDate": "2023-07-18T00:00:00.000Z",
      "createdAt": "2022-04-21T17:00:35.250Z",
      "updatedAt": "2023-10-28T07:44:23.506Z",
      "firstReviewDate": "2022-05-12T00:00:00.000Z",
      "latestReviewDate": "2023-09-25T00:00:00.000Z",
      "verticalLogoScreenshot": {
        "fullRes":
            "//c.opencritic.com/images/games/13051/2TMYXwh4jxwgZFB73bdsuMKMb4EjZfA5MFsRXZ4JdqxZ1xKj.jpg",
        "thumbnail":
            "//c.opencritic.com/images/games/13051/2TMYXwh4jxwgZFB73bdsuMKMb4EjZfA5MFsRXZ4JdqxZ1xKj_th.jpg"
      },
      "imageMigrationComplete": true,
      "url": "https://opencritic.com/game/13051/turbo-overkill"
    }
  };
  Map<String, dynamic> map10 = {
    "Marvel's Spider-Man 2": {
      "id": "15052",
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/15052/o/Zf058C1z.jpg",
          "sm": "game/15052/XRs9viXK.jpg"
        },
        "square": {
          "og": "game/15052/o/5GiR9J0s.jpg",
          "xs": "game/15052/M8RkflPK.jpg",
          "sm": "game/15052/w6oVj5SU.jpg",
          "lg": "game/15052/t68ly6aw.jpg"
        },
        "masthead": {
          "og": "game/15052/o/7RoL7xhh.jpg",
          "xs": "game/15052/63Wwy5iY.jpg",
          "sm": "game/15052/IHQS3v5l.jpg",
          "md": "game/15052/BiwCytwu.jpg",
          "lg": "game/15052/nEecfJyM.jpg",
          "xl": "game/15052/2hRLgW6h.jpg"
        },
        "banner": {
          "og": "game/15052/o/mG17xlR9.jpg",
          "sm": "game/15052/O1A8Wvng.jpg"
        },
        "logo": {"og": "game/15052/o/536PRiMB.jpg"},
        "screenshots": [
          {
            "_id": "648c728b8e4ece2a2964bd0e",
            "og": "game/15052/o/mSngQogD.jpg",
            "sm": "game/15052/XrC5quoU.jpg"
          },
          {
            "_id": "648c728b8e4ece2a2964bd0f",
            "og": "game/15052/o/e8i3BoNo.jpg",
            "sm": "game/15052/Xq7IjQu8.jpg"
          },
          {
            "_id": "648c728b8e4ece2a2964bd10",
            "og": "game/15052/o/B1S14WNq.jpg",
            "sm": "game/15052/lbhOZ7pI.jpg"
          }
        ]
      },
      "topCriticScore": 90.39690721649484,
      "mainChannel": {
        "channelId": "UC-2Y8dQb0S6DtpxNgAKoJKA",
        "channelTitle": "PlayStation",
        "description":
            "Welcome to the official home of PlayStation on YouTube. Here you'll find the latest videos about your favorite PlayStation products ...",
        "title": "PlayStation",
        "image":
            "https://yt3.ggpht.com/ytc/APkrFKYwa4VQ6OCG5azfDsCW-Wb3heKeci5gHsHNH7kzuDE=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UC-2Y8dQb0S6DtpxNgAKoJKA"
      },
      "Rating": {"value": "T"},
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 98.06451612903226,
      "numReviews": 160,
      "numTopCriticReviews": 105,
      "medianScore": 90,
      "topCriticScore": 90.39690721649484,
      "percentile": 99,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "name": "Marvel's Spider-Man 2",
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-10-15T00:00:00.000Z",
          "title": "Marvel's Spider-Man 2 - Launch Trailer I PS5 Games",
          "videoId": "9fVYKsEmuRo",
          "externalUrl": "https://www.youtube.com/watch?v=9fVYKsEmuRo",
          "channelTitle": "PlayStation",
          "channelId": "UC-2Y8dQb0S6DtpxNgAKoJKA",
          "description":
              "https://www.playstation.com/en-us/games/marvels-spider-man-2/ Spider-Men, Peter Parker and Miles Morales, return for an ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-10-03T00:00:00.000Z",
          "title":
              "Marvel's Spider-Man 2 - Be Greater. Together. Trailer I PS5 Games",
          "videoId": "nq1M_Wc4FIc",
          "externalUrl": "https://www.youtube.com/watch?v=nq1M_Wc4FIc",
          "channelTitle": "PlayStation",
          "channelId": "UC-2Y8dQb0S6DtpxNgAKoJKA",
          "description":
              "https://www.playstation.com/en-us/games/marvels-spider-man-2 Spider-Men, Peter Parker and Miles Morales, return for an ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-09-14T00:00:00.000Z",
          "title":
              "Marvel's Spider-Man 2 - Expanded Marvel's New York | PS5 Games",
          "videoId": "grZigSpVDno",
          "externalUrl": "https://www.youtube.com/watch?v=grZigSpVDno",
          "channelTitle": "PlayStation",
          "channelId": "UC-2Y8dQb0S6DtpxNgAKoJKA",
          "description":
              "Marvel's Spider-Man 2 Senior Creative Director Bryan Intihar narrates a first look at the newly expanded Marvel's New York and ..."
        }
      ],
      "Companies": [
        {"name": "Sony Interactive Entertainment", "type": "PUBLISHER"}
      ],
      "Platforms": [
        {
          "id": 3,
          "name": "PlayStation 5",
          "shortName": "PS5",
          "releaseDate": "2023-10-20T00:00:00.000Z",
          "displayRelease": ""
        }
      ],
      "Genres": [
        {"id": 77, "name": "RPG"},
        {"id": 27, "name": "Action"}
      ],
      "id": 15052,
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "createdAt": "2023-06-08T20:12:16.869Z",
      "updatedAt": "2023-12-12T04:32:17.236Z",
      "description":
          "Spider-Men Peter Parker and Miles Morales face the ultimate test of strength inside and outside the mask as they fight to save the city, each other and the ones they love, from the monstrous Venom and the dangerous new symbiote threat.\n\nExplore an expansive Marvel’s New York with faster web-swinging and the all-new Web Wings, quickly switching between Peter and Miles  to experience different stories, epic new abilities and high-tech gear.\n\nWield Peter’s symbiote abilities and Miles’ explosive bio-electric powers in battle against new and iconic Marvel Super Villains – including an original take on a symbiote-infused Venom, the ruthless Kraven the Hunter, the volatile Lizard, and more from the Marvel Rogues’ Gallery.\n\nFeel the true power of Spider-Man in your hands!\n- Haptic feedback: experience the full force of Peter’s and Miles’ new abilities at your fingertips with responsive vibrations.\n- Adaptive triggers: master acrobatic moves, execute thrilling combos, and discover the breathtaking excitement of web-swinging traversal.\n\nLive the Super-Hero life!\n- Tempest 3D AudioTech: pinpoint the sounds of webs, bio-electric powers, bustling traffic, responsive New Yorkers, and dangerous enemy attacks.*\n- Stunning visuals: explore beautifully vibrant new environments and locations, including Brooklyn and Queens, Coney Island, and more.\n",
      "firstReviewDate": "2023-10-16T00:00:00.000Z",
      "latestReviewDate": "2023-12-12T00:00:00.000Z",
      "embargoDate": "2023-10-16T14:03:20.000Z",
      "criticalReviewDate": "2023-10-16T14:01:00.901Z",
      "url": "https://opencritic.com/game/15052/marvels-spider-man-2"
    }
  };
  Map<String, dynamic> map11 = {
    'Slay the Princess': {
      "id": "15687",
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/15687/o/g8DBaVXx.jpg",
          "sm": "game/15687/Fog3UIU5.jpg"
        },
        "square": {
          "og": "game/15687/o/8d6bDbWw.jpg",
          "xs": "game/15687/CNSmbsHD.jpg",
          "sm": "game/15687/rVSTi1x5.jpg",
          "lg": "game/15687/6j3ugQKo.jpg"
        },
        "masthead": {
          "og": "game/15687/o/bXkrOrqH.jpg",
          "xs": "game/15687/ifnntyyS.jpg",
          "sm": "game/15687/h9W2S3dV.jpg",
          "md": "game/15687/EUynq01W.jpg",
          "lg": "game/15687/b3XU1h7L.jpg",
          "xl": "game/15687/1rok4qDS.jpg"
        },
        "banner": {
          "og": "game/15687/o/moJVvb3Q.jpg",
          "sm": "game/15687/PXpRYLqp.jpg"
        },
        "screenshots": [
          {
            "_id": "65361c81be51a4185a37f1ae",
            "og": "game/15687/o/XhZwUHju.jpg",
            "sm": "game/15687/NYaYroDs.jpg"
          },
          {
            "_id": "65361c81be51a4185a37f1af",
            "og": "game/15687/o/oVDhubbf.jpg",
            "sm": "game/15687/U78AZZ98.jpg"
          },
          {
            "_id": "65361c81be51a4185a37f1b0",
            "og": "game/15687/o/EyjdLJgI.jpg",
            "sm": "game/15687/sBZJikKP.jpg"
          }
        ]
      },
      "topCriticScore": "90.28571428571429",
      "mainChannel": {
        "channelId": "UC6bbk3AuxgkmTlIqmTgv2mQ",
        "channelTitle": "Black Tabby Games",
        "description":
            "Abby Howard and Tony Howard Arias making spooky video games. The first episode of Scarlet Hollow, our choice-driven horror ...",
        "title": "Black Tabby Games",
        "image":
            "https://yt3.ggpht.com/ytc/APkrFKZyFbS_XtpZXkopXNjGFxHytFfzVc_Y7s_ZBb4Q=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UC6bbk3AuxgkmTlIqmTgv2mQ"
      },
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 93.33333333333333,
      "numReviews": 15,
      "numTopCriticReviews": 7,
      "medianScore": 91,
      "topCriticScore": 90.28571428571429,
      "percentile": 99,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 27,
          "name": "PC",
          "shortName": "PC",
          "imageSrc": "https://c.opencritic.com/images/platforms/pc.png",
          "releaseDate": "2023-10-20T00:00:00.000Z",
          "displayRelease": "2023-10-20"
        }
      ],
      "Genres": [
        {"id": 76, "name": "Adventure"},
        {"id": 92, "name": "Interactive Story"}
      ],
      "Companies": [
        {"name": " Black Tabby Games", "type": "DEVELOPER"},
        {"name": " Black Tabby Games", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-07-25T00:00:00.000Z",
          "title": "Slay the Princess Trailer",
          "videoId": "RByDoYQpFa8",
          "externalUrl": "https://www.youtube.com/watch?v=RByDoYQpFa8",
          "channelTitle": "Black Tabby Games",
          "channelId": "UC6bbk3AuxgkmTlIqmTgv2mQ",
          "description":
              "There's a path in the woods, and at the end of that path is a cabin. And in the basement of that cabin is a Princess. You're here to ..."
        }
      ],
      "name": "Slay the Princess",
      "description":
          "You're on a path in the woods, and at the end of that path is a cabin. And in the basement of that cabin is a Princess. \n\nYou're here to slay her. If you don't, it will be the end of the world.\n\nShe will do everything in her power to stop you. She'll charm, and she'll lie, and she'll promise you the world, and if you let her, she'll kill you a dozen times over. You can't let that happen. Don't forget, the fate of the world rests on your shoulders.\n\nYou're not going to listen to him, are you? We're supposed to save princesses, not slay them...\n\nFeatures\n\n Fully voice-acted by the impeccable Jonathan Sims and Nichole Goodnight.\n\n Hand-penciled art - every background and sprite is drawn traditionally with pencil and paper by Ignatz-winning graphic novelist Abby Howard.\n\n A princess. She's very bad and you have to get rid of her for all our sakes.\n\n No, the Princess isn't a cosmic horror. She's just an ordinary human Princess, and you can definitely slay her as long as you put your mind to it.\n\n Don't even think about trying to romance her. It won't end well for you.\n\n Hopefully you won't die. But if you do, you'll die a lot. Be careful and stay focused on the task at hand!\n\n Time loops No time loops. Don't be ridiculous. Time is a strictly linear concept and it certainly doesn't \"loop,\" whatever that's supposed to mean.\n\n A branching narrative where what you say and what you believe determines both who you are and how the story unfolds.\n\n A new roleplaying experience from the creators of Scarlet Hollow.Slay the Princess is a choice-driven psychological horror visual novel/dating sim with dramatic branching, light RPG elements, and hand-penciled art.",
      "id": "15687",
      "firstReleaseDate": "2023-10-20T00:00:00.000Z",
      "createdAt": "2023-10-19T15:07:38.135Z",
      "updatedAt": "2023-12-07T12:49:03.062Z",
      "firstReviewDate": "2023-10-19T00:00:00.000Z",
      "latestReviewDate": "2023-12-07T00:00:00.000Z",
      "url": "https://opencritic.com/game/15687/slay-the-princess"
    }
  };
  Map<String, dynamic> map12 = {
    'Jack Jeanne': {
      "id": "15043",
      "firstReleaseDate": "2023-06-15T00:00:00.000Z",
      "tier": "Mighty",
      "images": {
        "box": {
          "og": "game/15043/o/6sz2fz9J.jpg",
          "sm": "game/15043/cFInbsCj.jpg"
        },
        "square": {
          "og": "game/15043/o/2b13Z3Yn.jpg",
          "xs": "game/15043/HgWaiN3K.jpg",
          "sm": "game/15043/zXK4zpmv.jpg",
          "lg": "game/15043/WTkTGfym.jpg"
        },
        "masthead": {
          "og": "game/15043/o/RdWWPmND.jpg",
          "xs": "game/15043/DFJAWmTY.jpg",
          "sm": "game/15043/rVLVrdP7.jpg",
          "md": "game/15043/GAcstJPw.jpg",
          "lg": "game/15043/NUMJlXq6.jpg",
          "xl": "game/15043/unD2V23A.jpg"
        },
        "banner": {
          "og": "game/15043/o/3VjqWBoC.jpg",
          "sm": "game/15043/7v6FX6Lg.jpg"
        },
        "screenshots": [
          {
            "_id": "648186ce18fb750a5c14f5d2",
            "og": "game/15043/o/RnrDRGcq.jpg",
            "sm": "game/15043/K1EelaRo.jpg"
          },
          {
            "_id": "648186ce18fb750a5c14f5d3",
            "og": "game/15043/o/cYRJwMyt.jpg",
            "sm": "game/15043/lwiy7VAr.jpg"
          },
          {
            "_id": "648186ce18fb750a5c14f5d4",
            "og": "game/15043/o/2bStlCYq.jpg",
            "sm": "game/15043/eX19rR3g.jpg"
          }
        ]
      },
      "topCriticScore": 90.2,
      "mainChannel": {
        "channelId": "UCBfJnGBmryH7Eo49UlKMStg",
        "channelTitle": "Aksys Games Official",
        "description":
            "Founded in 2006 in Torrance, California, Aksys Games Localization, Inc. is a localization studio and visionary video game ...",
        "title": "Aksys Games Official",
        "image":
            "https://yt3.ggpht.com/ytc/AGIKgqPvXGqpjBA20i6w9xGZ4wPJETQlzEQzKor20bVV3Q=s88-c-k-c0xffffffff-no-rj-mo",
        "externalUrl":
            "https://www.youtube.com/channel/UCBfJnGBmryH7Eo49UlKMStg"
      },
      "Rating": {"value": "T"},
      "imageMigrationComplete": false,
      "hasLootBoxes": false,
      "percentRecommended": 100,
      "numReviews": 11,
      "numTopCriticReviews": 6,
      "medianScore": 90,
      "topCriticScore": 90.2,
      "percentile": 99,
      "tier": "Mighty",
      "biggestDiscountDollars": 0,
      "biggestDiscountPercentage": 0,
      "Platforms": [
        {
          "id": 32,
          "name": "Nintendo Switch",
          "shortName": "Switch",
          "imageSrc": "https://c.opencritic.com/images/platforms/switch.png",
          "releaseDate": "2023-06-15T00:00:00.000Z",
          "displayRelease": "2023-06-15"
        }
      ],
      "Genres": [
        {"id": 98, "name": "Music"},
        {"id": 76, "name": "Adventure"},
        {"id": 92, "name": "Interactive Story"}
      ],
      "Companies": [
        {"name": "Broccoli", "type": "DEVELOPER"},
        {"name": "Aksys Games", "type": "PUBLISHER"}
      ],
      "trailers": [
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2023-06-07T00:00:00.000Z",
          "title": "Jack Jeanne - Official Launch Trailer",
          "videoId": "kRW9WE6N-y4",
          "externalUrl": "https://www.youtube.com/watch?v=kRW9WE6N-y4",
          "channelTitle": "Aksys Games Official",
          "channelId": "UCBfJnGBmryH7Eo49UlKMStg",
          "description":
              "For more information on Jack Jeanne - www.aksysgames.com/jackjeanne Jack Jeanne releases for the Nintendo Switch on June ..."
        },
        {
          "isOpenCritic": false,
          "isSpecial": "NO",
          "publishedDate": "2022-03-31T00:00:00.000Z",
          "title": "Jack Jeanne - Announcement Trailer",
          "videoId": "YZWeKZRCPAg",
          "externalUrl": "https://www.youtube.com/watch?v=YZWeKZRCPAg",
          "channelTitle": "Aksys Games Official",
          "channelId": "UCBfJnGBmryH7Eo49UlKMStg",
          "description":
              "Kisa is about to give up her dream of being an actor when she is given the chance to go to the prestigious All Boys Drama School ..."
        }
      ],
      "name": "Jack Jeanne",
      "description":
          "Kisa is about to abandon her dream of becoming an actor when she is given the opportunity to enroll at the prestigious Univeil Drama School. She is granted admission with two conditions: be chosen as the lead in the final performance and hide her identity as a girl! Competition at the school is fierce and the rivalry is real!\n\nWill Kisa be able to forge powerful bonds with her all-male classmates while competing against them for key roles?\n\nWill she be cast in the lead role in the final performance at the end of the year all while keeping her secret?\n\n",
      "id": 15043,
      "firstReleaseDate": "2023-06-15T00:00:00.000Z",
      "createdAt": "2023-06-06T22:22:44.820Z",
      "updatedAt": "2023-09-06T01:37:45.541Z",
      "firstReviewDate": "2023-06-01T00:00:00.000Z",
      "latestReviewDate": "2023-07-26T00:00:00.000Z",
      "url": "https://opencritic.com/game/15043/jack-jeanne"
    }
  };

  GameProvider() {
    getHallOfFame();
  }

  getHallOfFame() async {
    if (_callApi) {
      print('fetch started');
      var url = Uri.https(_baseUrl, '/game/hall-of-fame');

      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': _baseUrl,
          'x-rapidapi-key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        List<Map<String, dynamic>> listOfMaps =
            List<Map<String, dynamic>>.from(decodedData);

        mapOfMaps = {};

        for (int i = 0; i < listOfMaps.length; i++) {
          var hallOfFameResponse = HallOfFameResponse.fromJson(listOfMaps[i]);
          mapOfMaps[hallOfFameResponse.name] = {
            'id': hallOfFameResponse.id,
            'firstReleaseDate': hallOfFameResponse.getFormattedDate(),
            'tier': listOfMaps[i]['tier'],
            'images': {
              'box': {
                'og': hallOfFameResponse.images.box.og,
                'sm': hallOfFameResponse.images.box.sm,
              },
              'banner': {
                'og': hallOfFameResponse.images.banner.og,
                'sm': hallOfFameResponse.images.banner.sm,
              },
            },
            'topCriticScore': hallOfFameResponse.topCriticScore,
          };

          var gameUrl = Uri.https(_baseUrl, '/game/${hallOfFameResponse.id}');
          final gameResponse = await http.get(
            gameUrl,
            headers: {
              'x-rapidapi-host': _baseUrl,
              'x-rapidapi-key': _apiKey,
            },
          );

          if (gameResponse.statusCode == 200) {
            var gameData = json.decode(gameResponse.body);
            mapOfMaps[hallOfFameResponse.name].addAll(gameData);
          }
        }
      }
    } else {
      print('not fetched');
      print('getting local data');
      mapOfMaps.addAll(map1);
      mapOfMaps.addAll(map2);
      mapOfMaps.addAll(map3);
      mapOfMaps.addAll(map4);
      mapOfMaps.addAll(map5);
      mapOfMaps.addAll(map6);
      mapOfMaps.addAll(map7);
      mapOfMaps.addAll(map8);
      mapOfMaps.addAll(map9);
      mapOfMaps.addAll(map10);
      mapOfMaps.addAll(map11);
      mapOfMaps.addAll(map12);
    }
    notifyListeners();
  }
}
