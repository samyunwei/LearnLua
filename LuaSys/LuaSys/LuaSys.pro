TEMPLATE = lib
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp

include(deployment.pri)
qtcAddDeployment()


LIBS += -llua -ldl -lpthread



DESTDIR = ../bin/

OBJECTS_DIR = ../builds
MOC_DIR = ../builds
RCC_DIR = ../builds
UI_DIR = ../builds
UI_HEADERS_DIR = ../builds
UI_SOURCES_DIR = ../builds
