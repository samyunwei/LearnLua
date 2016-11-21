TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.c

include(deployment.pri)
qtcAddDeployment()


LIBS += -llua  -ldl


DESTDIR = ../bin/

OBJECTS_DIR = ../builds
MOC_DIR = ../builds
RCC_DIR = ../builds
UI_DIR = ../builds
UI_HEADERS_DIR = ../builds
UI_SOURCES_DIR = ../builds
