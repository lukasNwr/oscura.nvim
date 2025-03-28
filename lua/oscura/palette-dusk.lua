---@class Palette
return {
   -- Base colors
   bg = "#131419",             -- Main editor background (changed for dusk variant)
   fg = "#E6E6E6",             -- Default text color
   
   -- Editor UI
   line_nr = "#32333B",        -- Line number color
   active_line_nr = "#E6E6E6", -- Active line number color
   comment = "#46474F",        -- Comments
   selection = "#2C2C31",      -- Selection background
   selection_highlight = "#1A1A1F", -- Selection highlight background
   word_highlight = "#2C2C31", -- Word highlight background
   
   -- Syntax colors
   yellow = "#E6E7A3",         -- Light yellow for functions, etc.
   red = "#D84F68",            -- Red for errors and deleted content
   orange = "#F9B98C",         -- Peachy color for numbers and constants
   purple = "#9592A4",         -- Muted purple
   blue = "#479FFA",           -- Bright blue for links
   gray = "#9099A1",           -- Grayish for keywords
   teal = "#54C0A3",           -- Teal for attributes
   bracket = "#5C6974",        -- Dark gray for brackets
   
   -- UI elements
   dark_gray = "#2C2C31",      -- For input background
   black = "#000000",          -- Pure black
   
   -- Diff colors
   diff_add_bg = "#1A1A1F",    -- Background for added text in diffs
   diff_del_bg = "#2C1A1A",    -- Background for removed text in diffs
   
   -- Diagnostic colors
   warning = "#FFA16C",        -- Warning color
   error = "#FF5C5C",          -- Error color
   hint = "#4EBE96",           -- Hint color
   info = "#6A7782",           -- Info color
   
   -- Sidebar elements
   sidebar_bg = "#131419",     -- Sidebar background (changed for dusk variant)
   sidebar_fg = "#C1C1C1",     -- Sidebar text color
   sidebar_title = "#9592A4",  -- Sidebar title color
   
   -- List elements
   list_active = "#232323",    -- List active selection background
   list_inactive = "#232323",  -- List inactive selection background
   list_hover = "#1A1A1F",     -- List hover background
   
   -- Input elements
   input_bg = "#2C2C31",       -- Input background
   input_fg = "#E6E6E6",       -- Input text color
   
   -- Hover elements
   hover_bg = "#161616",       -- Hover widget background
   hover_border = "#282828",   -- Hover widget border
   
   -- Scrollbar
   scrollbar_bg = "#343434",   -- Scrollbar background (adjusted from #34343480)
   scrollbar_hover = "#343434", -- Scrollbar hover background
   
   -- Quick input
   quick_input_bg = "#2C2C31", -- Quick input background
   quick_input_fg = "#C1C1C1", -- Quick input text
   quick_input_focus = "#1A1A1F", -- Quick input focus background
   description_fg = "#C1C1C1", -- Description text color
   
   -- Bracket colors
   bracket_1 = "#5C6974",      -- Bracket pair color 1
   bracket_2 = "#6E678E",      -- Bracket pair color 2
   bracket_3 = "#6A7782",      -- Bracket pair color 3
   bracket_4 = "#6A7782",      -- Bracket pair color 4
   bracket_5 = "#6A7782",      -- Bracket pair color 5
   bracket_6 = "#6A7782",      -- Bracket pair color 6
   bracket_unexpected = "#6A7782", -- Unexpected bracket color
   
   -- Terminal colors
   terminal_black = "#131419", -- Changed for dusk variant
   terminal_red = "#D84F68",
   terminal_green = "#54C0A3",
   terminal_yellow = "#E6E7A3",
   terminal_blue = "#479FFA",
   terminal_magenta = "#9592A4",
   terminal_cyan = "#F9B98C",
   terminal_white = "#E6E6E6",
} 