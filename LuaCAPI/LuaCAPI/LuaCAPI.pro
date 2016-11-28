#-------------------------------------------------
#
# Project created by QtCreator 2016-11-28T23:34:53
#
#-------------------------------------------------

QT       -= core gui

TARGET = LuaCAPI
TEMPLATE = lib

DEFINES += LUACAPI_LIBRARY

SOURCES += LuaCAPI.cpp

HEADERS += LuaCAPI.h

LIBS += -llua  -ldl


DESTDIR = ../bin/

OBJECTS_DIR = ../builds
MOC_DIR = ../builds
RCC_DIR = ../builds
UI_DIR = ../builds
UI_HEADERS_DIR = ../builds
UI_SOURCES_DIR = ../builds
