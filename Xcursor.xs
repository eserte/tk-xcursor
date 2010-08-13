/*
  Copyright (c) 2010 Slaven Rezic. All rights reserved.
  This program is free software; you can redistribute it and/or
  modify it under the same terms as Perl itself.
*/

#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include <X11/Xlib.h>
#include <X11/Xcursor/Xcursor.h>

#include "tkGlue.def"

#include "pTk/tkPort.h"
#include "pTk/tkInt.h"
#include "tkGlue.h"
#include "tkGlue.m"
#include "pTk/tkVMacro.h"

DECLARE_VTABLES;

MODULE = Tk::Xcursor	PACKAGE = Tk::Xcursor

PROTOTYPES: DISABLE

Cursor
LoadCursor(win, file)
INPUT:
    Tk_Window win;
    const char *file;
CODE:
    RETVAL = XcursorFilenameLoadCursor(Tk_Display(win), file);
OUTPUT:
    RETVAL

int
Define(Cursor self, Tk_Window win)
CODE:
    RETVAL = XDefineCursor(Tk_Display(win), Tk_WindowId(win), self);
OUTPUT:
    RETVAL

