package fancy.table.util;

import fancy.Grid;
import fancy.Table;
import fancy.table.KeyEvent;
import fancy.table.RangeEvent;
import fancy.table.ResizeEvent;
import fancy.table.ScrollEvent;

typedef FancyTableOptions = {
  ?fixedTop: Int,
  ?fixedLeft: Int,
  ?fallbackCell: CellContent,
  ?classes: FancyTableClassOptions,
  ?hSize: Int -> Int -> CellDimension,
  ?initialScrollX: HorizontalScrollPosition,
  ?initialScrollY: VerticalScrollPosition,
  ?selectionEnabled: Bool,
  ?rangeSelectionEnabled: Bool,
  ?selection: { minRow: Int, minCol: Int, maxRow: Int, maxCol: Int },
  ?active: { row: Int, col: Int },
  ?focusOnHover: Bool,
  ?alwaysFocused: Bool,

  ?onScroll: ScrollEvent -> Void,
  ?onResize: ResizeEvent -> Void,
  ?onFocus: Table -> Void,
  ?onBlur: Table -> Void,
  ?onKey: KeyEvent -> Void,
  ?onClick: CellEvent -> Void,
  ?onDoubleClick: CellEvent -> Void,
  ?onRangeChange: RangeEvent -> Void
};
