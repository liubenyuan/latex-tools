----------------------------------------------------------------------
-- Ipe preference settings
----------------------------------------------------------------------
--[[

    This file is part of the extensible drawing editor Ipe.
    Copyright (C) 1993-2010  Otfried Cheong

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
-- can use config.home for the user's home directory
-- prefs.autosave_filename = config.home .. "/autosave.ipe"
prefs.autosave_filename = config.home .. "/%s.autosave"

-- External editor for editing text objects
-- must contain '%s' for the temporary filename
-- set this to nil to hide the "Editor" button on text dialogs
-- by default this is disabled on Windows as a
-- DOS window will pop up when calling the editor
if os.getenv("EDITOR") then
  prefs.external_editor = os.getenv("EDITOR") .. " %s"
elseif config.platform ~= "win" then
  prefs.external_editor = "gedit %s"
  -- prefs.external_editor = "emacsclient %s"
end

-- Should the external editor be called automatically?
prefs.auto_external_editor = nil

-- Size of dialog window for creating/editing text objects
prefs.editor_size = { 600, 400 }

-- Size of main window at startup
prefs.window_size = { 800, 600 }

-- Canvas customization:
prefs.paper_color = { r = 1.0, g = 1.0, b = 1.0 }  -- white
-- prefs.paper_color = { r = 1.0, g = 1.0, b = 0.5 }  -- classic Ipe 6 yellow
-- classic grid uses dots instead of lines
prefs.classic_grid = false
-- line width of grid lines
-- if classic_grid is true, then thin_grid_lines is size of grid dots
prefs.thin_grid_line = 0.1
prefs.thick_grid_line = 0.3

-- Should the grid be visible when Ipe starts? (true or false)
prefs.grid_visible = true

-- Initial grid size and angle
prefs.grid_size = 16     -- points
prefs.angle_size = 45    -- degrees

-- Maximum distance in pixels selecting/snapping
prefs.select_distance = 36
prefs.snap_distance = 16

-- Minimal and maximal possible zoom
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
-- prefs.save_as_directory = config.home
-- prefs.save_as_directory = config.home .. "/Documents"

----------------------------------------------------------------------
