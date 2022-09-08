QT += core gui
# QT += gui for QImage

TARGET = 3DPrintPlanner

TEMPLATE = app

HEADERS += \
    $$PWD/*.h \
    $$files($$PWD/GLKLib/*.h, true) \
    $$files($$PWD/QMeshLib/*.h, true) \
    $$files($$PWD/QMeshLib/*.hh, true) \
    $$files($$PWD/Utils/*.h, true) \

SOURCES +=  \
    $$files($$PWD/*.cpp, false) \
    $$files($$PWD/GLKLib/*.cpp, true) \
    $$files($$PWD/QMeshLib/*.cpp, true) \
    $$files($$PWD/QMeshLib/*.cc, true) \
    $$files($$PWD/Utils/*.cpp, true) \

INCLUDEPATH += $$PWD \  # for root category
               $$PWD/QMeshLib/ \
               $$PWD/eigen/ \
               $$PWD/GLLib/include \

LIBS += $$PWD/GLLib/lib/glut32.lib \
        $$PWD/GLLib/lib/glew32.lib \

#LIBS += -fopenmp

CONFIG -= app_bundle

CONFIG += console c++11 c++14
#QMAKE_CXXFLAGS+=/openmp

CONFIG+=debug_and_release
CONFIG(Debug, Debug|Release){DESTDIR = $$PWD/Build/debug}
CONFIG(Release, Debug|Release){DESTDIR = $$PWD/Build/release}
message(DESTDIR: ($$DESTDIR))
