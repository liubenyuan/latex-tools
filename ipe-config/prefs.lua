----------------------------------------------------------------------
-- Ipe preference settings
----------------------------------------------------------------------
--[[

    This file is part of the extensible drawing editor Ipe.
    Copyright (C) 1993-2014  Otfried Cheong

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
prefs.styles = { "doctor" }

-- Interval for autosaving in seconds
-- set to nil to disable autosaving
prefs.autosave_interval = 600 -- 10 minutes

-- Filename for autosaving
-- can contain '%s' for the filename of the current file
-- can use 'home' for the user's home directory
-- prefs.autosave_filename = home .. "/autosave.ipe"
if config.platform == "win" then
  prefs.autosave_filename = "C:%s.autosave"
else
  prefs.autosave_filename = home .. "/%s.autosave"
end

-- External editor for editing text objects
-- must contain '%s' for the temporary filename
-- set this to nil to hide the "Editor" button on text dialogs
-- by default this is disabled on Windows as a
-- DOS window will pop up when calling the editor
if os.getenv("EDITOR") then
  prefs.external_editor = os.getenv("EDITOR") .. " %s"
elseif config.platform == "unix" then
  prefs.external_editor = "pluma %s"
  -- prefs.external_editor = "emacsclient %s"
else
  prefs.external_editor = nil
end

if config.platform == "apple" then
  prefs.delete_key = "\8"
else
  prefs.delete_key = "\127"
end

-- Where the tools should be put: Left or right?
prefs.docks = {
  properties = "left",
  bookmarks = "right",
  notes = "right",
  layers = "left",
}

-- Which docks should be hidden when Ipe starts?
prefs.hide_docks = {
  "bookmarks", "notes"
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
prefs.window_size = { 1000, 600 }

-- Size of page sorter window
prefs.page_sorter_size = { 960, 600 }

-- Width of page thumbnails (height is computed automatically)
prefs.thumbnail_width = 300

-- Canvas customization:
prefs.canvas_style = {
  paper_color = { r = 1.0, g = 1.0, b = 1.0 },  -- white
  -- paper_color = { r = 1.0, g = 1.0, b = 0.5 }  -- classic Ipe 6 yellow
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
	       boundary = false,
	       intersection = false,
	       grid = true,
	       angle = false,
	       autoangle = false }

-- Initial grid size and angle
prefs.grid_size = 16     -- points
prefs.angle_size = 45    -- degrees

-- Maximum distance in pixels selecting/snapping
prefs.select_distance = 36
prefs.snap_distance = 16
-- When transforming objects, if currently select object is further than
-- this distance, the closest object is selected instead
prefs.close_distance = 48

-- Zoom factors, minimal and maximal possible zoom
prefs.zoom_factor = 1.3
prefs.wheel_zoom_factor = 1.3  -- used when zooming by scroll wheel
prefs.min_zoom = 0.1
prefs.max_zoom = 100

-- Should newly created text be transformable by default?
prefs.text_transformable = false

-- If set to true, then whenever the user edits the title of a page,
-- the check box "section: use title" is checked automatically.
prefs.automatic_use_title = false

-- How to start browser to show Ipe manual
if config.platform == "apple" then
  prefs.browser = "open %s"
else
  -- 'sensible-browser' and 'gnome-open' both work on Linux
  -- prefs.browser = "sensible-browser %s &"
  prefs.browser = "gnome-open %s"
end

-- How to start onscreen keyboard
-- prefs.keyboard = "onboard &"
prefs.keyboard = nil

-- tablet mode (true or false)
-- If tablet_mode is true, then the current selection is not highlighted
-- when in "ink" drawing mode.
-- All snap modes are disabled when "ink" drawing mode is started.
prefs.tablet_mode = false
-- Extended properties menu, perhaps useful for tablets:
prefs.tablet_menu = false

-- format string for the coordinates in the status bar
-- (x, unit, y, unit)
-- prefs.coordinates_format = "%g%s, %g%s"
prefs.coordinates_format = "[%7.3f%s, %7.3f%s]"

-- possible scale factors for coordinates output
-- must be integers. -5 means "5:1", +5 means "1:5"
prefs.scale_factors = { -100, -5, 10, 100, 1000, 10000 }

-- Auto-exporting when document is being saved
-- if auto_export_only_if_exists is true, then the file will only
-- be auto-exported if a file with the target name already exists
prefs.auto_export_xml_to_eps = false
prefs.auto_export_xml_to_pdf = false
prefs.auto_export_eps_to_pdf = false
prefs.auto_export_pdf_to_eps = false
prefs.auto_export_only_if_exists = true

-- Default directory for "Save as" dialog, when
-- the current document does not have a filename
-- (or the filename is not absolute)
-- If you use Ipe from the commandline, "." is the right value.
prefs.save_as_directory = "."
-- Otherwise, you could use the home directory, or Documents:
-- prefs.save_as_directory = home
-- prefs.save_as_directory = home .. "/Documents"

----------------------------------------------------------------------
