using dots.Dom;

using thx.Arrays;
using thx.Maps;

import fancy.Table;
import fancy.table.util.CellContent;
import fancy.table.util.RowData;
import fancy.table.Coords;

class Main {
  static function main() {
    var elNested = js.Browser.document.querySelector(".table-container-nested"),
        elFlat = js.Browser.document.querySelector(".table-container-flat");

    var cards = [{
      name : "Quarantine Field",
      color : "White",
      type : "Enchantment",
      rarity : "Mythic",
      multiverseId : "402001",
      cmc : 2,
      draftval : 5,
      tcgprice : 2.52
    }, {
      name : "Hero of Goma Fada",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401913",
      cmc : 5,
      draftval : 3.5,
      tcgprice : 0.25
    }, {
      name : "Felidar Sovereign",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401878",
      cmc : 6,
      draftval : 4,
      tcgprice : 0.56
    }, {
      name : "Part the Waterveil",
      color : "Blue",
      type : "Sorcery",
      rarity : "Mythic",
      multiverseId : "401982",
      cmc : 6,
      draftval : 2.0,
      tcgprice : 1.29
    }, {
      name : "Guardian of Tazeem",
      color : "Blue",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401906",
      cmc : 5,
      draftval : 4.5,
      tcgprice : 0.25
    }, {
      name : "Quarantine Field",
      color : "White",
      type : "Enchantment",
      rarity : "Mythic",
      multiverseId : "402001",
      cmc : 2,
      draftval : 5,
      tcgprice : 2.52
    }, {
      name : "Hero of Goma Fada",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401913",
      cmc : 5,
      draftval : 3.5,
      tcgprice : 0.25
    }, {
      name : "Felidar Sovereign",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401878",
      cmc : 6,
      draftval : 4,
      tcgprice : 0.56
    }, {
      name : "Part the Waterveil",
      color : "Blue",
      type : "Sorcery",
      rarity : "Mythic",
      multiverseId : "401982",
      cmc : 6,
      draftval : 2.0,
      tcgprice : 1.29
    }, {
      name : "Guardian of Tazeem",
      color : "Blue",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401906",
      cmc : 5,
      draftval : 4.5,
      tcgprice : 0.25
    }, {
      name : "Quarantine Field",
      color : "White",
      type : "Enchantment",
      rarity : "Mythic",
      multiverseId : "402001",
      cmc : 2,
      draftval : 5,
      tcgprice : 2.52
    }, {
      name : "Hero of Goma Fada",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401913",
      cmc : 5,
      draftval : 3.5,
      tcgprice : 0.25
    }, {
      name : "Felidar Sovereign",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401878",
      cmc : 6,
      draftval : 4,
      tcgprice : 0.56
    }, {
      name : "Part the Waterveil",
      color : "Blue",
      type : "Sorcery",
      rarity : "Mythic",
      multiverseId : "401982",
      cmc : 6,
      draftval : 2.0,
      tcgprice : 1.29
    }, {
      name : "Guardian of Tazeem",
      color : "Blue",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401906",
      cmc : 5,
      draftval : 4.5,
      tcgprice : 0.25
    }, {
      name : "Quarantine Field",
      color : "White",
      type : "Enchantment",
      rarity : "Mythic",
      multiverseId : "402001",
      cmc : 2,
      draftval : 5,
      tcgprice : 2.52
    }, {
      name : "Hero of Goma Fada",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401913",
      cmc : 5,
      draftval : 3.5,
      tcgprice : 0.25
    }, {
      name : "Felidar Sovereign",
      color : "White",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401878",
      cmc : 6,
      draftval : 4,
      tcgprice : 0.56
    }, {
      name : "Part the Waterveil",
      color : "Blue",
      type : "Sorcery",
      rarity : "Mythic",
      multiverseId : "401982",
      cmc : 6,
      draftval : 2.0,
      tcgprice : 1.29
    }, {
      name : "Guardian of Tazeem",
      color : "Blue",
      type : "Creature",
      rarity : "Rare",
      multiverseId : "401906",
      cmc : 5,
      draftval : 4.5,
      tcgprice : 0.25
    }];

    function foldHeader(text: String) {
      return function (ft: Table, row: Int, col: Int) {
        var cell = Dom.create("div.ft-cell-content", text);
        cell.on("click", function () {
          ft.toggleRow(row);
        });
        return cell;
      }
    }

    function cardsToRowData(cards : Array<Card>, groupBy : Array<Card -> String>) : Array<RowData> {
      return cards.groupByAppend(groupBy[0], new Map()).tuples()
        .map(function (tuple) : RowData {
          var restOfGroupBys = groupBy.rest();

          // if there are no more groupBys, we're rendering actual cards
          return restOfGroupBys.length == 0 ? {
            values : tuple.right.map(function (card): Array<CellContent> {
              return [
                function (_, _, _) {
                  return Dom.create("div.ft-cell-content", [
                    Dom.create("span", card.name),
                    Dom.create("a", [
                      "href" => 'http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=${card.multiverseId}'
                    ], [
                      Dom.create("i.fa.fa-external-link-square")
                    ])
                  ]);
                },
                card.cmc, card.draftval, card.tcgprice
              ];
            }).flatten(),
            data : []
          } : {
            values : [foldHeader(tuple.left)],
            data : cardsToRowData(tuple.right, restOfGroupBys)
          };
        });
    }

    function toRowData(cards : Array<Card>) : Array<RowData> {
      return ([{
        values : ["Cards", "CMC", "Draft Value", "Price"]
      }] : Array<RowData>).concat(cardsToRowData(cards, [
        function (card) return card.color,
        function (card) return card.rarity,
        function (card) return card.type,
        function (card) return card.name
      ]));
    }

    function toFlatData(cards : Array<Card>) : Array<Array<CellContent>> {
      return [[
        CellContent.fromString("Cards"),
        CellContent.fromString("CMC"),
        CellContent.fromString("Color"),
        CellContent.fromString("Type"),
        CellContent.fromString("Rarity"),
        CellContent.fromString("Draft Value"),
        CellContent.fromString("Price"),
      ]].concat(cards.map(function(card) {
        return [
          CellContent.fromString(card.name),
          CellContent.fromInt(card.cmc),
          CellContent.fromString(card.color),
          CellContent.fromString(card.type),
          CellContent.fromString(card.rarity),
          CellContent.fromFloat(card.draftval),
          CellContent.fromFloat(card.tcgprice),
        ];
      }));
    }

    new Table(elNested, Nested(toRowData(cards)), {
      fixedTop: 1,
      fixedLeft: 1,
      onFocus: function() trace("focus table #1"),
      onBlur: function() trace("blur table #1"),
      focusOnHover: false,
      rangeSelectionEnabled: false
    });

    var flat = toFlatData(cards);

    new Table(elFlat, Tabular(flat), {
      fixedTop: 1,
      fixedLeft: 1,
      selection: {
        minRow: 1,
        minCol: 1,
        maxRow: 2,
        maxCol: 3
      },
      onFocus: function() trace("focus table #2"),
      onBlur: function() trace("blur table #2"),
      onKey: function(key: String, shift: Bool, coords: Coords) {
        var item = flat[coords.row][coords.col];
        trace('received $key, $shift at ${coords.toString()}');
        // trace(item);
        return switch item {
          case RawValue(v):
            switch key {
              case "Backspace":
                Some(flat[coords.row][coords.col] = RawValue(v.substring(0, v.length-1)));
              case other if(other.length == 1):
                Some(flat[coords.row][coords.col] = RawValue(v+other));
              case _:
                None;
            }
          case _: None;
        };
      },
      onDoubleClick: function(coords: Coords) {
        trace('dbl click at ${coords.toString()}');
        return None;
      }
    });
  }
}

typedef Card = {
  name : String,
  color : String,
  type : String,
  rarity : String,
  multiverseId : String,
  cmc : Int,
  draftval : Float,
  tcgprice : Float
};
