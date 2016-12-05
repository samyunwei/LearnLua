#-------------------------------------------------
#
# Project created by QtCreator 2016-12-05T23:25:06
#
#-------------------------------------------------

QT       -= core gui

TARGET = luaXML
TEMPLATE = lib

DEFINES += LUAXML_LIBRARY

SOURCES += LuaXML.cpp

HEADERS += LuaXML.h


LIBS += -llua  -ldl -lexpat


DESTDIR = ../bin/

OBJECTS_DIR = ../builds
MOC_DIR = ../builds
RCC_DIR = ../builds
UI_DIR = ../builds
UI_HEADERS_DIR = ../builds
UI_SOURCES_DIR = ../builds
