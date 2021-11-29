QT += core
QT -= gui

TARGET = test
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \
    main.c \
    getop.c \
    stack.c \
    getch.c

HEADERS += \
    calc.h

