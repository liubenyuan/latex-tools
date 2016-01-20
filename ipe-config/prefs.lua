----------------------------------------------------------------------
-- Ipe preference settings
----------------------------------------------------------------------
--[[

    This file is part of the extensible drawing editor Ipe.
    Copyright (C) 1993-2016  Otfried Cheong

    Ipe is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    As a special exception, you have permission to link Ipe with the
    CGAL library and distribute executables, as long as you follow the
    requirements of the Gnu General Public License in regard to all of
    the software in the executable aside from CGAL.

    Ipe is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with Ipe; if not, you can find it at
    "http://www.gnu.org/copyleft/gpl.html", or write to the Free
    Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

--]]

local home = os.getenv("HOME")

prefs = {}

-- List of stylesheets that are added to newly created docs.  Without
-- a full path, stylesheets are searched for in the standard style
-- directory.
prefs.styles = { "doctor_xe" }

-- Interval for autosaving in seconds
-- set to nil to disable autosaving
prefs.autosave_interval = 600 -- 10 minutes

-- Filename for autosaving
-- can contain '%s' for the filename of the current file
-- can use 'home' for the user's home directory
-- prefs.autosave_filename = home .. "/autosave.ipe"
if config.platform == "win" then
  prefs.autosave_filename = config.documents .. "\\%s.autosave"
else
  prefs.autosave_filename = home .. "/%s.autosave"
end

-- Should Ipe show the Developer menu
-- (only useful if you develop ipelets or want to customize Ipe)
prefs.developer = false

-- Enable continuous spell-checking in text fields by default?
-- (Currently only on OS X)
prefs.spell_check = true

-- External editor for editing text objects
-- must contain '%s' for the temporary filename
-- set this to nil to hide the "Editor" button on text dialogs
if os.getenv("EDITOR") then
  prefs.external_editor = os.getenv("EDITOR") .. " %s"
else
  -- prefs.external_editor = "pluma %s"
  -- prefs.external_editor = "emacsclient %s"
  prefs.external_editor = nil
end

-- The name of the temporary textfile where Ipe will store text to be
-- edited with an external editor.  If set to nil, the Lua function
-- os.tmpname() will be used to create a unique name.
if config.platform == "win" then
  prefs.editable_textfile = config.latexdir .. "/temp.txt"
else
  prefs.editable_textfile = nil
end

if config.platform == "apple" then
  prefs.delete_key = "\8"
else
  prefs.delete_key = "\127"
end

-- Where the tools should be put (left or right)
-- and which ones should be displayed on start-up
-- (left/right currently only used with Qt toolkit)
prefs.tools = {
  properties = "left",
  bookmarks = "right",
  notes = "right",
  layers = "left",
  hidden = { "bookmarks", "notes" }
}

-- Should LaTeX be run automatically every time text has changed?
prefs.auto_run_latex = true

-- Should the external editor be called automatically?
prefs.auto_external_editor = nil

-- Should closing the external editor immediately close the editing dialog?
prefs.editor_closes_dialog = nil

-- Minimum size of dialog window for creating/editing text objects
prefs.editor_size = { 0, 0 }

-- Size of main window at startup
prefs.window_size = { 1080, 600 }

-- Size of Latex error message window
prefs.latexlog_size = { 800, 600 }

-- Size of page sorter window
prefs.page_sorter_size = { 960, 600 }

-- Width of page thumbnails (height is computed automatically)
prefs.thumbnail_width = 200

-- Canvas customization:
prefs.canvas_style = {
  paper_color = { r = 1.0, g = 1.0, b = 1.0 },  -- white
  -- paper_color = { r = 1.0, g = 1.0, b = 0.5 }  -- classic Ipe 6 yellow
  -- color of the primary selection:
  primary_color = { r = 1.0, g = 0.0, b = 0.0 },
  -- color of the secondary selection:
  secondary_color = { r = 1.0, g = 0.0, b = 1.0 },
  -- classic grid uses dots instead of lines
  classic_grid = false,
  -- line width of grid lines
  -- if classic_grid is true, then thin_grid_lines is size of grid dots
  thin_grid_line = 0.1,
  thick_grid_line = 0.3,
  -- steps indicate multiples of grid distance where grid lines are drawn
  thin_step = 1, thick_step = 4,
  -- e.g. try this: thin_step = 2, thick_step = 5
}

-- Should the grid be visible when Ipe starts? (true or false)
prefs.grid_visible = true

-- Snap modes active when Ipe starts:
prefs.snap = { vertex = false,
	       ctrlpoints = false,
	       boundary = false,
	       intersection = false,
	       grid = true,
	       angle = false,
	       autoangle = false }

-- Initial grid size and angle
prefs.grid_size = 16     -- points
prefs.angle_size = 45    -- degrees

-- Resolution settings

-- When you select "normal size" in Ipe, this is the pixels
-- per inch you want to see.
prefs.normal_resolution = 72

-- Maximum distance in pixels selecting/snapping
prefs.select_distance = 36
prefs.snap_distance = 16
-- When transforming objects, if currently select object is further than
-- this distance, the closest object is selected instead
prefs.close_distance = 48

-- Zoom factors, minimal and maximal possible zoom
prefs.zoom_factor = 1.3
-- when zooming by scroll wheel or
-- by scroll gesture on OS X
if config.toolkit == "cocoa" then
  prefs.wheel_zoom_factor = 1.1
  prefs.wheel_other_factor = 1.3 -- used on some external mice
else
  prefs.wheel_zoom_factor = 1.3
end
prefs.min_zoom = 0.1
prefs.max_zoom = 100

-- Should newly created text be transformable by default?
prefs.text_transformable = false

-- If set to true, then whenever the user edits the title of a page,
-- the check box "section: use title" is checked automatically.
prefs.automatic_use_title = false

-- How to start browser to show Ipe manual:
-- (not used with Windows or Cocoa toolkit)

-- On Linux, there are various options depending on your Desktop:
-- Gnome 2: gnome-open
-- prefs.browser = "gnome-open %s"
-- Gnome 3: gvfs-open
prefs.browser = "gvfs-open %s"
-- KDE: kde-open
-- prefs.browser = "kde-open %s"
-- XFCE: exo-open
-- prefs.browser = "exo-open %s"
-- "sensible-browser" starts a new browser
-- (which is not nice, ideally we'd like a tab in an open browser window)
-- prefs.browser = "sensible-browser %s &"

-- How to start onscreen keyboard
if config.platform == "win" then
  prefs.keyboard = "tabtip.exe"
elseif config.platform == "apple" then
  prefs.keyboard = "open -a KeyboardViewer -n"
else
  -- On Linux, you could use: prefs.keyboard = "onboard &"
  prefs.keyboard = nil
end

-- Do not highlight current selection in "ink" drawing mode?
prefs.no_ink_highlight = false
-- Disable all snap modes in "ink" drawing mode?
prefs.no_ink_snap = false
-- Extended properties menu, perhaps useful for tablets:
prefs.tablet_menu = false

-- format string for the coordinates in the status bar
-- (x, unit, y, unit)
-- prefs.coordinates_format = "%g%s, %g%s"
prefs.coordinates_format = "(%7.3f%s, %7.3f%s)"

-- possible scale factors for coordinates output
-- must be integers. -5 means "5:1", +5 means "1:5"
prefs.scale_factors = { -100, -5, 10, 100, 1000, 10000 }

-- Default directory for "Save as" dialog, when
-- the current document does not have a filename
-- (or the filename is not absolute)
if config.platform == "win" then
  -- Another reasonable setting: config.desktop
  prefs.save_as_directory = config.documents
else
  -- If you use Ipe from the commandline, "." is the right value.
  -- Otherwise, you could use the home directory
  prefs.save_as_directory = "."
  -- prefs.save_as_directory = home
end

-- Pattern for lists of filenames
-- The separator is a semicolon on Windows, a colon otherwise
if config.platform == "win" then
  prefs.fsep = "\\"
  prefs.fname_pattern = "[^;]+"
  prefs.dir_pattern = "^(.+)\\[^\\]+"
  prefs.basename_pattern = "\\([^\\]+)$"
else
  prefs.fsep = "/"
  prefs.fname_pattern = "[^:]+"
  prefs.dir_pattern = "^(.+)/[^/]+"
  prefs.basename_pattern = "/([^/]+)$"
end

----------------------------------------------------------------------
